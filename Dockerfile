FROM python:3.12-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        gcc \
        libffi-dev \
        python3-dev \
        pkg-config \
        && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN python -m pip install --upgrade pip setuptools wheel
RUN pip install --no-cache-dir Pillow pyzmq qrcode

RUN python -m pip install --user .

ENV PATH="/root/.local/bin:$PATH"
CMD ["a2ln"]
ENV PYTHONUNBUFFERED=1

