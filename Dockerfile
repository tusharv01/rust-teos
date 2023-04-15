FROM rust:latest



\
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain stable

ENV PATH="/root/.cargo/bin:${PATH}"

WORKDIR /usr/src/teos

COPY requirements.txt .


COPY . .

RUN cargo build --release --all

ENTRYPOINT ["./docker/entrypoint.sh"]
CMD ["teos"]
