set :stage, :production

# Replace 127.0.0.1 with your server's IP address!
server '158.69.205.58', user: 'deploy', roles: %w{web app}
