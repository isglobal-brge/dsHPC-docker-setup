#!/bin/bash
# Post-install startup script
# This script runs AFTER all Python and R dependencies are installed during Docker build
# Use this for operations that need dependencies to be installed first
# Examples:
#   - Installing packages that have dependency conflicts
#   - Installing packages that need to be installed in a specific order
#   - Post-installation configuration
#
# If this script fails, the Docker build will abort
#
# This script is OPTIONAL - if it doesn't exist or is empty, the build will continue normally
