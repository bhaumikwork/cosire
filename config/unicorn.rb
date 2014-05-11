# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/var/www/cosire"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/var/www/cosire/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/var/www/cosire/log/unicorn.log"
stdout_path "/var/www/cosire/log/unicorn.log"

# Unicorn socket
listen "/tmp/unicorn.[app name].sock"
listen "/tmp/unicorn.cosire.sock"

# Number of processes
# worker_processes 4
worker_processes 1

# Time-out
timeout 30
