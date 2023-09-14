# Use a base image of your choice
FROM ubuntu:20.04

# Copy the shell script into the container
COPY setup_ssh.sh /usr/local/bin/setup_ssh.sh

# Make the shell script executable
RUN chmod +x /usr/local/bin/setup_ssh.sh

# Expose the SSH port
EXPOSE 22

# Start the SSH service by executing the script
CMD ["/usr/local/bin/setup_ssh.sh"]

