#!/bin/bash
set -x

kubectl --namespace kube-system create sa tiller

kubectl create clusterrolebinding tiller \
    --clusterrole cluster-admin \
    --serviceaccount=kube-system:tiller

helm init --service-account tiller --history-max 10 --wait