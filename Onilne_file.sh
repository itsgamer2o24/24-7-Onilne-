import os
import random
import time
import subprocess

# List of packages to install
packages = [
    'htop', 'git', 'vim', 'tree', 'nmap'
]

def run_command(command):
    """Run a shell command and return the output."""
    print(f"Running command: {command}")
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    print(result.stdout)
    if result.stderr:
        print(result.stderr)

def install_package(package):
    """Install a package."""
    run_command(f"sudo apt-get install -y {package}")

def remove_package(package):
    """Remove a package."""
    run_command(f"sudo apt-get remove -y {package}")

def check_neofetch():
    """Check system info using neofetch."""
    run_command("neofetch")

def random_sleep():
    """Sleep for a random amount of time."""
    sleep_time = random.randint(1, 10)
    print(f"Sleeping for {sleep_time} seconds...")
    time.sleep(sleep_time)

def main():
    while True:
        action = random.choice(['install', 'remove', 'neofetch'])
        
        if action == 'install':
            package = random.choice(packages)
            print(f"Attempting to install {package}...")
            install_package(package)
        
        elif action == 'remove':
            package = random.choice(packages)
            print(f"Attempting to remove {package}...")
            remove_package(package)
        
        elif action == 'neofetch':
            print("Checking system info...")
            check_neofetch()
        
        # Random sleep to simulate user activity
        random_sleep()

if __name__ == "__main__":
    main()
