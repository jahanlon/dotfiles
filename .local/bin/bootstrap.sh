apps=(
  "terraform"
  "gh"
  "nvim"
  "vlc"
  "firefox"
  "curl"
)

sudo dnf install -y dnf-plugins-core
sudo dnf config-manager addrepo --from-repofile=https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
sudo dnf update -y
sudo dnf install -y "${apps[@]}"

## Starship terminal ##
if [[ ! -f /usr/local/sbin/starship ]]; then
  curl -sS https://starship.rs/install.sh | sh
fi
## Setup AWS CLI ##

pushd $HOME/Downloads
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
popd


if [[ ! -f $HOME/.aws/credentials ]]; then
  cat << EOF > $HOME/.aws/credentials
  [default]
  aws_access_key_id=
  aws_secret_access_key=
  EOF
fi

if [[ ! -f $HOME/.aws/config ]]; then
  cat << EOF > $HOME/.aws/config
  [default]
  region=eu-west-2
  output=json
  EOF
fi

###########################
if ! grep -qi defaultyes /etc/dnf/dnf.conf; then
  echo "defaultyes=True" >> /etc/dnf/dnf.conf
fi


