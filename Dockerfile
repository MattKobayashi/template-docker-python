FROM ghcr.io/astral-sh/uv:0.6.6@sha256:031ddbc79275e351a43cbb66f64d8cd314cc78c3878898f4ab4f147b092e8e2d
WORKDIR /opt/template-docker-python
USER template-docker-python
COPY main.py main.py
COPY pyproject.toml pyproject.toml
RUN uv run main.py
