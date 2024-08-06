docker run -p 3000:3000 \
  -e APP_VERSION=1.0.0 \
  -e BUILD_ENV=development \
  -v $(pwd)/secrets/db_password:/run/secrets/db_password \
  -v $(pwd)/secrets/api_key:/run/secrets/api_key \
  simple-web-server
