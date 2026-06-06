# Server Stats

A Bash-based system monitoring script that provides key server health metrics.

## Features

* Total CPU Usage
* Total Memory Usage (Used/Free with Percentage)
* Total Disk Usage (Used/Free with Percentage)
* Top 5 Processes by CPU Usage
* Top 5 Processes by Memory Usage

## Prerequisites

* Linux Operating System
* Bash Shell
* Standard Linux utilities:

  * `top`
  * `free`
  * `df`
  * `ps`
  * `awk`

## Installation

Using Vagrant VM

Make the script executable:

```bash
chmod +x server-stats.sh
```

## Usage

Run all statistics:

```bash
./server-stats.sh
```

Or, if command-line options are supported:

```bash
./server-stats.sh cpu
./server-stats.sh memory
./server-stats.sh disk
./server-stats.sh top-cpu
./server-stats.sh top-memory
./server-stats.sh all
```

## Sample Output

```text
Total CPU Usage:
6.2%

Total Memory:
Used Memory : 47 MB (4.78%)
Free Memory : 874 MB (89.52%)

Disk Usage:
Used Disk : 5.2 GB (28%)
Free Disk : 14.3 GB (72%)

Top 5 Processes by CPU Usage:
PID     COMMAND         %CPU
1023    java            25.0
2045    python          15.0

Top 5 Processes by Memory Usage:
PID     COMMAND         %MEM
1234    java            15.2
5678    postgres         8.1
```

## Project Structure

```text
.
├── server-stats.sh
└── README.md
```

## Learning Objectives

This project demonstrates:

* Bash scripting fundamentals
* Functions
* Command substitution
* Text processing using awk
* System monitoring commands
* Linux process management

## Author

Ravindranath Singh
