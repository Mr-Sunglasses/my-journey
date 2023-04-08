FROM rust:latest

WORKDIR /my_journey

COPY . /my_journey

RUN cargo install mdbook

EXPOSE 3000

CMD [ "mdbook", "serve", "--open" ]