# Startup Scripts

This directory contains three types of startup scripts that run at different stages:

## Script Types

### 1. `pre-install.sh` (Build Time - Before Dependencies)
- **When**: Runs during Docker build, BEFORE installing Python/R/dependencies
- **Purpose**: Configure system-level settings that affect package installation
- **Examples**: 
  - Add custom apt repositories
  - Install build dependencies
  - Configure GPG keys
- **Failure Behavior**: Build aborts if script fails
- **Location**: Executed directly in Dockerfile RUN command

### 2. `post-install.sh` (Build Time - After Dependencies)
- **When**: Runs during Docker build, AFTER installing Python and R dependencies
- **Purpose**: Install packages that need dependencies to be installed first, or handle dependency conflicts
- **Examples**:
  - Install packages with specific dependency requirements (e.g., pyradiomics requires numpy)
  - Install packages that need to be installed in a specific order
  - Post-installation configuration
- **Failure Behavior**: Build aborts if script fails
- **Location**: Executed directly in Dockerfile RUN command after Python and R library installation

### 3. `pre-startup.sh` (Container Startup - Before Services)
- **When**: Runs during container startup (`docker-compose up`), AFTER dependencies are installed but BEFORE services start
- **Purpose**: Operations that need dependencies but must complete before container is considered "ready"
- **Examples**:
  - Pre-download models or large files
  - Run database migrations
  - Validate configuration
  - Pre-compile code
- **Failure Behavior**: Container startup aborts if script fails
- **Location**: Executed via Dockerfile entrypoint before start-services.sh

## File Structure

```
environment/startup/
├── pre-install.sh      # Runs before dependencies (build time)
├── post-install.sh     # Runs after dependencies (build time)
└── pre-startup.sh      # Runs before services (container startup)
```

## Usage

1. **Create your script**: Edit the appropriate `.sh` file (e.g., `post-install.sh`)
2. **Make it executable**: Scripts are automatically made executable by the Dockerfile
3. **Add your logic**: Place your startup operations in the script
4. **Handle errors**: Scripts use `set -e`, so any command failure will abort the process

## Notes

- All scripts are **OPTIONAL** - if they don't exist or are empty, the system will skip them
- Scripts use `set -e` to abort on errors
- Scripts run in order: `pre-install.sh` (build) → install dependencies → `post-install.sh` (build) → `pre-startup.sh` (startup)
