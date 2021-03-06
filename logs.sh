#!/bin/bash

# Usage: logs [options] [SERVICE...]
#
# Options:
# --no-color          Produce monochrome output.
# -f, --follow        Follow log output
# -t, --timestamps    Show timestamps
# --tail="all"        Number of lines to show from the end of the logs for each container.

# Display logs of
docker-compose logs "$@"
