#!/usr/bin/env bash

[[ -f /usr/local/kubebuilder/bin/kubebuilder ]] && exit 0

version=2.3.1 # latest stable version
arch=amd64
kubernetes_version=v1.19.7

# download the release
curl -L -O "https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${version}/kubebuilder_${version}_linux_${arch}.tar.gz"

# extract the archive
tar -zxvf kubebuilder_${version}_linux_${arch}.tar.gz
mv kubebuilder_${version}_linux_${arch} kubebuilder && sudo mv kubebuilder /usr/local/


curl -L -O "https://dl.k8s.io/${kubernetes_version}/kubernetes-server-linux-amd64.tar.gz"
tar -zxvf kubernetes-server-linux-amd64.tar.gz
mv kubernetes/server/bin/kube-apiserver /usr/local/kubebuilder/bin/

# update your PATH to include /usr/local/kubebuilder/bin
export PATH=$PATH:/usr/local/kubebuilder/bin
