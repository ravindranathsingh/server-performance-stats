# Server Stats

A Bash-based system monitoring script that provides key server health metrics.

## Project URL

* [https://github.com/ravindranathsingh/server-performance-stats.git](https://roadmap.sh/projects/server-stats)

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
./color.sh
./server-stats.sh cpu
./server-stats.sh memory
./server-stats.sh disk
./server-stats.sh top-cpu
./server-stats.sh top-memory
./server-stats.sh all
```

## Sample Output

```text
vagrant@linuxVm:/vagrant/scripts$ ./server-stats.sh 
+++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++ Server Stats ++++++++++++++++++++++
+++++++++++++++++++++++++++++++++++++++++++++++++++++
1. CPU Usage
2. Memory Usage
3. Disk Usage
4. Top Process By CPU Usage
5. Top Process by Memory Usage
6. All Stats
Choose an option:6
++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++ Total CPU Usage +++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++

CPU Usage is:100%

+++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++ Total Memory Usage ++++++++++++++++++
+++++++++++++++++++++++++++++++++++++++++++++++++++++

Total Memory     : 3.82 GB
Used Memory      : 0.19 GB (4.86%)
Free Memory      : 2.16 GB (56.53%)
Available Memory : 3.37 GB (88.14%)

+++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++ Total Disk Usage ++++++++++++++++++
+++++++++++++++++++++++++++++++++++++++++++++++++++++

Total Disk  :  39G
Used Disk   :  2.1G(6%)
Free Disk   :  37G(94%)

+++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++ Top 5 process by CPU Usage +++++++++++++++
+++++++++++++++++++++++++++++++++++++++++++++++++++++

    PID COMMAND         %CPU
  17059 systemd          0.4
      1 systemd          0.2
  17145 bash             0.2
  17164 server-stats.sh  0.2
   4718 kworker/0:0-eve  0.1

+++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++ Top 5 process by Memory Usage ++++++++++
+++++++++++++++++++++++++++++++++++++++++++++++++++++

    PID COMMAND         %MEM
   5384 snapd            0.8
  15132 multipathd       0.6
  15148 unattended-upgr  0.5
  15770 packagekitd      0.5
  15125 networkd-dispat  0.4

## Project Structure

```text
vagrant@linuxVm:/vagrant/scripts$ tree
.
├── color.sh
└── server-stats.sh

0 directories, 2 files
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
