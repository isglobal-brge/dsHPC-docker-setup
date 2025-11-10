#!/bin/bash
# Pre-install startup script
# This script runs BEFORE installing dependencies (Python, R, etc.) during Docker build
# Use this for operations that need to happen before dependency installation
# Examples: 
#   - Adding custom apt repositories
#   - Installing build dependencies
#   - Configuring system settings that affect package installation
#
# If this script fails, the Docker build will abort
#
# This script is OPTIONAL - if it doesn't exist or is empty, the build will continue normally
