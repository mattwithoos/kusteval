FROM garethr/kubeval

RUN apk update \
    && apk upgrade \
    && apk --no-cache add curl bash

COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["run"]