# Docker Env & Secrets

This repo is for explore this topic, environments var and secrets

### Build Arguments vs. Secrets

**Build Arguments (`ARG`):**
- Used to pass variables at build-time.
- Values are not persisted in the final image but can be seen in the build history.
- Suitable for non-sensitive information like application version, build configuration, etc.

**Secrets:**
- Used to securely pass sensitive information (e.g., passwords, API keys) to the container.
- Managed and encrypted by Docker or orchestration tools.
- Not stored in the final image or in the build history.
- Should be used for any data that should remain confidential.

### Steps to Create Secrets in GitHub

1. **Create Environment Variables in GitHub Actions:**

   - Go to your GitHub repository.
   - Click on `Settings` > `Secrets` and Variables > `Actions`.
   - Add the following **variables**:
     - `APP_VERSION`
     - `BUILD_ENV`

   - Add the following **secrets**:
     - `DB_PASSWORD`
     - `API_KEY`

