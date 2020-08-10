FROM mozilla/sops:v3-alpine AS sops

FROM alpine/helm:2.16.1

RUN apk --no-cache add vim
ENV EDITOR vim
COPY --from=sops /usr/local/bin/sops /usr/local/bin/sops
ENTRYPOINT [""]
CMD ["/bin/sh"]
