
## About

This is a WIP implementation of a Spacebar compatible Server in Rust!

This repository contains:
A partial implementation of:

- [HTTP API Server](/src/api)
- [HTTP CDN Server](/src/cdn)
- [WebSocket Gateway Server](/src/gateway)
- [Database Models](/src/database)

## Local Development/Test Environment

Whether you are using Docker or not, you will need to have the following installed:

- [Rust](https://www.rust-lang.org/tools/install)
- [git](https://git-scm.com/downloads)
- [`sqlx-cli`](https://crates.io/crates/sqlx-cli)

If your development environment is hosted on a Windows machine, please additionally make sure that
you have a bash shell available to execute pre-commit hooks. This can be done by installing
[Git Bash](https://git-scm.com/downloads) or
[Windows Subsystem for Linux 2](https://learn.microsoft.com/en-us/windows/wsl/install) and, additionally,
configuring your IDE correctly.

See the instructions below for guidance on how to run the project.

### Non-Docker

1. Install and host a [PostgreSQL database](https://www.postgresql.org/download/)
2. Create a new database, and a user that has full access to that database
3. Copy the `symfonia-example.toml` file in the root of the project to `symfonia.toml` and configure the settings to your liking.
4. Install the sqlx CLI with `cargo install sqlx-cli`
5. Run `cargo sqlx migrate run` from within the project directory to run the migrations
6. Run the project with `cargo run`.

### Docker

1. Copy the `compose-example.env` file to `.env` in the root of the compose project and fill in the values
   to your liking.
2. Adjust ports in `compose.yml` if needed.
3. Copy the `symfonia-example.toml` file in the root of the project to `symfonia.toml` and configure the settings to your liking.
> The values for `[general.database]` must match the values in your `.env` file.
>
> You must set `[general.database].host` to `"db"` inside `symfonia.toml`.
4. Run `docker compose up --build`.

Code changes will require you to restart the container with `docker compose up --build`. If you want
to reset to a fully clean state, run `docker compose down -v`.

[Discord]: https://dcbadge.limes.pink/api/server/m3FpcapGDD?style=flat
[Discord-invite]: https://discord.com/invite/m3FpcapGDD
[build-shield]: https://img.shields.io/github/actions/workflow/status/polyphony-chat/symfonia/rust.yml?style=flat
[build-url]: https://github.com/polyphony-chat/symfonia/blob/main/.github/workflows/rust.yml
