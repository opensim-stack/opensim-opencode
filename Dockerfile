# syntax=docker/dockerfile:1

FROM openeuler/opencode:latest

WORKDIR /workspace

RUN mkdir -p \
    /workspace \
    /root/.config/opencode \
    /root/.local/share/opencode \
    /root/.local/state/opencode \
    /root/.cache/opencode

COPY docker/entrypoint.sh /usr/local/bin/opensim-opencode-entrypoint.sh
RUN chmod +x /usr/local/bin/opensim-opencode-entrypoint.sh

EXPOSE 8998/tcp

ENTRYPOINT ["/usr/local/bin/opensim-opencode-entrypoint.sh"]