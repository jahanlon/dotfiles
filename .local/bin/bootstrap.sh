apps=(
  "terraform"
  "gh"
  "nvim"
  "vlc"
  "firefox"
)

sudo dnf install -y dnf-plugins-core
sudo dnf config-manager addrepo --from-repofile=https://rpm.releases.hashicorp.com/fedora/hashicorp.repo

#Install AWS CLI
pushd $HOME/Downloads
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

cat << EOF > $HOME/.aws/credentials
[default]
aws_access_key_id=
aws_secret_access_key=
EOF

sudo dnf update -y
sudo dnf install -y "${apps[@]}"
