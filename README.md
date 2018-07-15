# WP Bash Localhost

> A collection of bash scripts to administer localhost environment for WordPress site develop with Docker.

## Requirements

- Docker
- Docker Compose
- A `.env` containing specific enviroment variables. Find these two repositories, [WP Locker](https://github.com/tfirdaus/wp-locker) and [WP Chimp](https://github.com/wp-chimp/wp-chimp), for an example.

## Usage

| Command | Description |
| --- | --- |
| `start.sh` | Starting the localhost with WordPress, the theme, and the plugins installed |
| `start.sh --https` | Starting the localhost to load with HTTPS; also install WordPress, theme, and plugins if it's not done so |
| `up.sh` | Build/rebuild the Docker image and spinning the localhost |
| `up.sh -d` | Spinning up the localhost in the background |
| `down.sh` | Shutting-down the container |
| `destroy.sh` | Shutting-down the container and remove everything |
| `ssl-cert.sh` | Generate a self-signed SSL cert; requires OpenSSL |
| `ssh.sh` | Sign-in to the running WordPress container |
| `ssh.sh --root` | Sign-in to the running WordPress container as a `root` |
| `replace-url.sh <new-url>` | Change the current site URL with the `new-url` passed in the argument |
| `mysql-export.sh` | Export the WordPress database. It may also create a new directory called `/dump` if it does not exist to store the SQL file |
| `mysql-import.sh <file>` | Import a WordPress database. The file parameter is required |
| `install.sh <file>` | Install WordPress, and Plugins and Themes specified in the `.env` |
| `init-apache.sh` | Script to override entrypoint in WordPress `php*-apache` Docker images |
| `exec.sh` | A wrapper script to run arbitrary shell script in a running WordPress Docker container |