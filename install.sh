#!/usr/bin/env sh
######## SET
FDATE=$(/bin/date '+%Y/%m/%d')
GIT=$(which git)
LN=$(which ln)
LS=$(which ls)
######## SCRIPTS
hash git && {
    ${GIT} clone --recursive --depth 1 https://github.com/dtulyakov/.vim.git ~/.vim
    ${GIT} clone --depth 1 https://github.com/dtulyakov/dotfiles.git ~/dotfiles
    for dfiles in $(${LS} --ignore-backups --ignore="*sh" --ignore="*md" --ignore="tmp" ~/dotfiles); do
      ${LN} -fs ~/dotfiles/${dfiles} ~/.${dfiles}
    done
} || {
    echo "нужен git"
    exit 1
}
echo ""
echo "для установки zsh"
echo "sudo git clone --recursive --depth 1 https://github.com/dtulyakov/zsh.git /etc/zsh"
#EOF

