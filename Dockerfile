FROM registry.gitlab.com/gitlab-org/terraform-images/releases/1.5:latest

RUN apk add --no-cache bash curl

RUN mkdir -p /usr/local/bin/

ADD https://github.com/tests-always-included/mo/archive/refs/tags/3.0.2.tar.gz /tmp/mo.tar.gz

RUN tar -xzf /tmp/mo.tar.gz -C /tmp/ && \
  mv /tmp/mo-3.0.2/mo /usr/local/bin/ && \
  rm -rf /tmp/*

ENV TEMPLATE_SOURCE_DIR=variables

COPY src/bin/run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

ENTRYPOINT [ "/usr/local/bin/run.sh" ]