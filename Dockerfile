ARG HELM_VERSION=3.8.0
FROM mozilla/sops:v3-alpine AS sops

FROM alpine/helm:$HELM_VERSION
ARG KUBECTL_VERSION=v1.24.1
RUN apk --no-cache add vim make
ENV EDITOR vim
COPY --from=sops /usr/local/bin/sops /usr/local/bin/sops
ADD https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl /usr/local/bin/kubectl
RUN chmod 755 /usr/local/bin/kubectl
ENTRYPOINT [""]
CMD ["/bin/sh"]
