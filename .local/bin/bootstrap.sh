apps=(
  "terraform"
  "gh"
  "nvim"
  "vlc"
  "firefox"
  "curl"
)

cd $HOME
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager addrepo --from-repofile=https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
sudo dnf update -y
sudo dnf install -y "${apps[@]}"

## Starship terminal ##
if [[ ! -f /usr/local/sbin/starship ]]; then
  sudo curl -sS https://starship.rs/install.sh | sh -s -- -y
fi
## Setup AWS CLI ##

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf ./aws*

cat << EOF >> $HOME/.aws/credentials
  [default]
  aws_access_key_id=
  aws_secret_access_key=
EOF

cat << EOF >> $HOME/.aws/config
  [default]
  region=eu-west-2
  output=json
EOF

## DNF ##
if ! grep -qi defaultyes /etc/dnf/dnf.conf; then
  sudo echo "defaultyes=True" >> /etc/dnf/dnf.conf
fi

## Git config ##
cat << EOF >> $HOME/.gitconfig
  [user]
  name = Jeri Hanlon
  email = 5843970+jahanlon@users.noreply.github.com
EOF
