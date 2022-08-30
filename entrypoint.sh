#!/bin/sh
set -e

KUSTOMIZE_VER=${INPUT_KUSTOMIZE_VER}
TARGET_DIR=${INPUT_TARGET_DIR}
echo "Kustomize version: $KUSTOMIZE_VER"
echo "Target directory: $TARGET_DIR"

wget -qO- https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VER}/kustomize_v${KUSTOMIZE_VER}_linux_amd64.tar.gz | tar xvz -C /usr/bin
chmod u+x /usr/bin/kustomize

echo "::set-output name=build_output::"
touch kusteval.yaml
/usr/bin/kustomize build ${TARGET_DIR} > kusteval.yaml
cat kusteval.yaml
echo

echo "::set-output name=eval_output::"
kubeval --strict kusteval.yaml




