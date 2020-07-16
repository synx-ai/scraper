FROM python:3.6-slim

MAINTAINER Synx <engineering@synx.co>

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="Synx Scrapping Worker" \
      org.label-schema.description="Default stack for scrapping." \
      org.label-schema.url="https://synx.ai" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/synx-ai/galois" \
      org.label-schema.vendor="Synx" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"

EXPOSE 6800

RUN pip install --upgrade --no-cache-dir pip setuptools

RUN set -ex; \
    pip install --no-cache-dir \
        parse
        pyOpenSSL
        scrapy
        scrapyd

COPY provisioning/jobcrawler/ /opt/jobcrawler
COPY config/scrapyd.conf /etc/scrapyd/

WORKDIR /opt/jobcrawler

ENV PYTHONUNBUFFERED=0

CMD ["scrapyd"]
