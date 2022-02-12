#!/bin/bash


cat >~/.bashrc <<EOL
alias k='kubectl'
alias kd='k describe'
alias kdp='k describe pod'
alias kdd='k describe deploy'
alias kds='k describe svc'
alias kg='k get'
alias kgp='k get pod'
alias kgpn='k get pod --all-namespaces'
alias kgd='k get deploy'
alias kgs='k get secrets'
alias kgn='k get no'
alias kgnn='k get no --all-namespaces'
alias ke='k edit'
alias ka='k apply -f'
alias kc='k create'
alias kcf='k create  -f'
alias kdl='k delete --force'
alias kdlf='k delete --force --grace-period=0'
alias kl='k logs'
alias kcv='k config view'
alias kgc='k config get-contexts'
alias kcc='k config current-context'
alias ksn='k config set-context  --current  --namespace' 
alias kuc='k config use-context'
alias ksc='k config set-context'
export do="--dry-run=client -oyaml"
EOL

source ~/.bashrc;

cat << EOV >> ~/.vimrc
set ts=2 sts=2 sw=2 expandtab ruler
set backspace=indent,eol,start
EOV

clear;


echo "%evt.time,%container.id,%container.name,%user.name,%user.uid,%proc.pid" >>lol.txt
echo "PodSecurityPolicy,ImagePolicyWebhook" >>lol.txt
echo "kc clusterrole psp-mount --verb=use --resource=podsecuritypolicies --resource-name=psp-mount -n" >>lol.txt
echo "kc clusterrolebinding psp-mount-binding --clusterrole=psp-mount --group=system:serviceaccounts:ns -n" >>lol.txt
echo "kc rolebinding read-view-binding --clusterrole=view --serviceaccount=omni:read -n=omni">>lol.txt

clear;


wget https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/policy/example-psp.yaml -O psp.yaml;
wget https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/audit/audit-policy.yaml -O audit-policy.yaml;
wget https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/pods/security/hello-apparmor.yaml -O apparmor.yaml;
wget https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/pods/security/seccomp/ga/audit-pod.yaml -O seccom.yaml;

clear;
