FROM ghcr.io/astral-sh/uv:0.6.6@sha256:031ddbc79275e351a43cbb66f64d8cd314cc78c3878898f4ab4f147b092e8e2d
ENV USER=template-container-python
ENV GROUPNAME=$USER
ENV UID=999
ENV GID=999
WORKDIR /opt/${USER}
RUN addgroup \
    --gid "$GID" \
    "$GROUPNAME" \
    && adduser \
    --disabled-password \
    --gecos "" \
    --home "$(pwd)" \
    --ingroup "$GROUPNAME" \
    --no-create-home \
    --uid "$UID" \
    $USER
COPY init.sh init.sh
COPY main.py main.py
COPY pyproject.toml pyproject.toml
ENTRYPOINT ["/init"]
LABEL org.opencontainers.image.authors="MattKobayashi <matthew@kobayashi.au>"
