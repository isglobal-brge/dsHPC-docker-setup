#!/bin/bash
# Pre-startup script
# This script runs AFTER all dependencies are installed but BEFORE the container is considered "up"
# Use this for operations that need dependencies (Python, R, etc.) but must complete before services start
# Examples:
#   - Pre-downloading models or large files
#   - Running database migrations
#   - Validating configuration
#   - Pre-compiling code
#
# If this script fails, the container startup will abort
#
# This script is OPTIONAL - if it doesn't exist or is empty, startup will continue normally
