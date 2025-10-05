# Server Stats Script

A simple Bash script to monitor basic server performance metrics on Linux systems.

## Features

- CPU usage
- Memory usage (used, free, and percentage)
- Disk usage (used, free, and percentage)
- Top 5 processes by CPU usage
- Top 5 processes by memory usage

## Requirements

- Linux-based operating system
- Basic command-line tools (`top`, `ps`, `df`, `free`, `awk`)

## Usage

1. Make the script executable:

```bash
chmod +x server-stats.sh
./server-stats.sh
````

==========================================
       SERVER STATISTICS
==========================================

1. CPU Usage:
Usage: 12.5%

2. Memory Usage:
Total: 8G
Used: 4.5G
Free: 3.5G
Used Percentage: 56.25%

3. Disk Usage:
Total: 100G, Used: 60G, Free: 40G, Usage: 60%

4. Top 5 processes by CPU:
PID   COMMAND   %CPU
1234  apache2   15.0
2345  java      12.0
...

5. Top 5 processes by Memory:
PID   COMMAND   %MEM
1234  java      20.0
2345  postgres  15.0
...

==========================================
           END OF STATISTICS
==========================================
