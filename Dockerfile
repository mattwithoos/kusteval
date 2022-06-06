FROM garethr/kubeval as kustomize
ENV KUSTOMIZE_VER 3.1.0
ENV TARGET_DIR .k8s/overlays/qa

RUN apk update \
    && apk upgrade \
    && apk --no-cache add curl
RUN curl -L https://github.com/kubernetes-sigs/kustomize/releases/download/v${KUSTOMIZE_VER}/kustomize_${KUSTOMIZE_VER}_linux_amd64  -o /usr/bin/kustomize \
    && chmod u+x /usr/bin/kustomize

ENTRYPOINT kustomize build /kust/${TARGET_DIR} | kubeval
