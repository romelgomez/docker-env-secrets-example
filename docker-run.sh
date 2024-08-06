export DB_PASSWORD=safe_password
export API_KEY=free_venezuela

docker run -p 3000:3000 -e PORT=3000 -e DB_PASSWORD=$DB_PASSWORD -e API_KEY=$API_KEY simple-web-server
