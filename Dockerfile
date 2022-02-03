FROM mozilla/sops:v3-alpine AS sops

FROM alpine/helm:3.8.0

RUN apk --no-cache add vim make
ENV EDITOR vim
COPY --from=sops /usr/local/bin/sops /usr/local/bin/sops
ENTRYPOINT [""]
CMD ["/bin/sh"]
