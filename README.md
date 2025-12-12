# Chat Server

A high-performance, Spacebar-compatible chat server implementation written in Rust.

[![Build Status][build-shield]][build-url]
[![License](https://img.shields.io/badge/license-AGPL--3.0-blue.svg)](LICENSE.md)
[![Rust](https://img.shields.io/badge/rust-1.70%2B-orange.svg)](https://www.rust-lang.org/)

## About

**chat-server** is a work-in-progress implementation of a Spacebar-compatible server built entirely in Rust. This project aims to provide a fast, reliable, and scalable chat infrastructure with modern features and excellent performance.

### Features

This repository contains partial implementations of:

- **HTTP API Server** - RESTful API for client interactions
- **HTTP CDN Server** - Content delivery for media and assets
- **WebSocket Gateway** - Real-time bidirectional communication
- **Database Models** - PostgreSQL-backed data persistence

### Tech Stack

- **Language**: Rust
- **Database**: PostgreSQL with SQLx
- **WebSocket**: tokio-tungstenite
- **Framework**: Axum (async web framework)

## Getting Started

### Prerequisites

Whether you are using Docker or not, you will need to have the following installed:

- [Rust](https://www.rust-lang.org/tools/install) (1.70 or higher)
- [git](https://git-scm.com/downloads)
- [`sqlx-cli`](https://crates.io/crates/sqlx-cli) - Install with `cargo install sqlx-cli`

**Windows Users**: Ensure you have a bash shell available for pre-commit hooks. Install either:
- [Git Bash](https://git-scm.com/downloads), or
- [Windows Subsystem for Linux 2](https://learn.microsoft.com/en-us/windows/wsl/install)

### Setup Options

#### Option 1: Non-Docker Setup

1. **Install PostgreSQL**  
   Install and host a [PostgreSQL database](https://www.postgresql.org/download/)

2. **Create Database**  
   Create a new database and a user with full access to that database

3. **Configure Settings**  
   Copy `symfonia-example.toml` to `symfonia.toml` and configure the settings:
   ```bash
   cp symfonia-example.toml symfonia.toml
   ```

4. **Run Migrations**  
   ```bash
   cargo sqlx migrate run
   ```

5. **Start the Server**  
   ```bash
   cargo run
   ```

#### Option 2: Docker Setup

1. **Configure Environment**  
   Copy `compose-example.env` to `.env` and fill in the values:
   ```bash
   cp compose-example.env .env
   ```

2. **Adjust Ports** (optional)  
   Modify `compose.yaml` if you need to change default ports

3. **Configure Settings**  
   Copy `symfonia-example.toml` to `symfonia.toml`:
   ```bash
   cp symfonia-example.toml symfonia.toml
   ```
   
   > **Important**: 
   > - Database values in `symfonia.toml` must match your `.env` file
   > - Set `[general.database].host` to `"db"` in `symfonia.toml`

4. **Start Services**  
   ```bash
   docker compose up --build
   ```

5. **Development Workflow**  
   - Restart after code changes: `docker compose up --build`
   - Reset to clean state: `docker compose down -v`

## Usage

Once the server is running, it will expose the following services:

- **API Server**: RESTful endpoints for client operations
- **WebSocket Gateway**: Real-time communication endpoint
- **CDN Server**: Media and asset delivery

Check `symfonia.toml` for specific port configurations and service endpoints.

## Contributing

Contributions are welcome! This is a work-in-progress project, and there's plenty to do:

- Implement missing API endpoints
- Improve WebSocket gateway functionality
- Add comprehensive tests
- Optimize database queries
- Improve documentation

Feel free to open issues or submit pull requests.

## License

This project is licensed under the AGPL-3.0 License - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgments

- Built with [Rust](https://www.rust-lang.org/) for performance and safety
- Compatible with [Spacebar](https://github.com/spacebarchat) protocol
- Uses [SQLx](https://github.com/launchbadge/sqlx) for compile-time verified queries
- WebSocket implementation powered by [tokio-tungstenite](https://github.com/snapview/tokio-tungstenite)

---

**Status**: Work in Progress 🚧

This project is under active development. Features and APIs may change.

[build-shield]: https://img.shields.io/github/actions/workflow/status/Alkamal01/chat-server/rust.yml?style=flat
[build-url]: https://github.com/Alkamal01/chat-server/blob/main/.github/workflows/rust.yml
