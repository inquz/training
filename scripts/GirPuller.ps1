chcp 65001
#gh auth login

$user=git config --global user.name
$email=git config --global user.email

if(-not $user -or -not $email){
    Write-Host "Ошибка авторизации"
}else{
    Write-Host "Успешный вход, пользователь: $user. $email."
}
cd "C:\Users\mkartv\CLionProjects\training1"
if(!(Test-Path -Path ".git")){
    Write-Host "Это не репозиторий гит"
    exit 1
}
$currentBranch = git rev-parse --abbrev-ref HEAD
Write-Host "$currentBranch"
git branch -m v1
git checkout -b v2
git add .gitignore
git commit -m "add gitignore"
git push origin v1
git push origin v2

gh repo set-default-branch v2
git branch -a
git checkout v2
git add .
git commit -m "Documentation addition v2"
git push origin v2