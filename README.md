# linux-disk-monitoring
inux Disk Usage Monitoring Automation

Project Overview

This project provides a lightweight Linux disk monitoring solution using Bash scripting. It checks root filesystem disk utilization, compares it against a predefined threshold, and displays an appropriate health status.

The script helps Linux administrators and DevOps engineers perform basic disk-capacity checks and identify when utilization requires attention.

1. Business Problem

Linux servers can experience operational issues when their filesystems become full.

High disk utilization may cause:

Application failures due to insufficient disk space

Database write failures

Logging interruptions

Backup and deployment failures

Service degradation or downtime

Manual disk checking is repetitive and difficult to standardize across multiple servers.

Solution: Automate disk-utilization checks using a simple, reusable Bash script.

2. Technologies Used

Technology

Purpose

Linux

Target operating system

Bash

Automation scripting

df

Filesystem usage information

awk

Extract disk utilization

Git

Version control

GitHub

Source code hosting

3. Project Structure

linux-disk-monitoring/
├── README.md
└── disk-monitor.sh

4. Features

Automatically checks the root filesystem (/)

Extracts disk utilization as a percentage

Uses a configurable utilization threshold

Displays a warning when the threshold is reached

Returns an exit status suitable for integration with other scripts

Requires no additional Python packages or third-party monitoring software

5. How the Script Works

The script initializes a disk utilization threshold of 80%.

It executes df -P / to check root filesystem utilization.

The awk command extracts the utilization percentage.

Bash compares the current utilization with the configured threshold.

The script displays either a warning or a healthy status.

It exits with a status code indicating the monitoring result.

Monitoring Logic

START
  |
  v
Check Root Filesystem Usage
  |
  v
Extract Disk Usage Percentage
  |
  v
Is Disk Usage >= 80%?
  |
  +---- YES ----> WARNING
  |                  |
  |                Exit 1
  |
  +---- NO -----> OK
                     |
                   Exit 0

6. Installation and Execution

Prerequisites

Linux environment such as Ubuntu or RHEL

Bash shell

Standard df and awk utilities

Permission to execute scripts

Step 1: Clone Repository

git clone https://github.com/anujkhatri2910-web/linux-disk-monitoring.git

Step 2: Navigate to Project Directory

cd linux-disk-monitoring

Step 3: Provide Execute Permission

chmod +x disk-monitor.sh

Step 4: Run the Monitoring Script

./disk-monitor.sh

Alternatively:

bash disk-monitor.sh

7. Example Output

Scenario 1: Healthy Disk Utilization

================================
Linux Disk Usage Monitoring
================================
Disk usage: 35%
Threshold: 80%
OK: Disk usage is within the threshold.

Scenario 2: Disk Threshold Reached

================================
Linux Disk Usage Monitoring
================================
Disk usage: 85%
Threshold: 80%
WARNING: Disk usage has reached the threshold!

These are illustrative outputs. Actual disk utilization depends on the server.

8. Configuration

The default threshold is:

THRESHOLD=80

To change the threshold to 90%, update the variable:

THRESHOLD=90

The script currently checks the root filesystem only. Other mount points would require modification to the filesystem selection logic.

9. Testing and Validation

Test Bash Syntax

bash -n disk-monitor.sh

Successful syntax validation normally produces no output.

Test Monitoring Execution

bash disk-monitor.sh

Validate Exit Status

Immediately after running the script:

echo $?

Expected exit statuses:

Exit Code

Meaning

0

Disk usage below threshold

1

Disk usage reached or exceeded threshold

Test the Warning Condition

Temporarily change THRESHOLD=80 to THRESHOLD=1, provided current disk utilization is at least 1%.

Run the script and verify that the warning is printed. Restore the original threshold after testing.

10. Operational Use Cases

This solution can serve as a starting point for:

Linux server health checks

Basic capacity monitoring

System administration automation

AWS EC2 Linux server monitoring

Scheduled maintenance checks

Integration with larger monitoring workflows

The current implementation runs on demand. Scheduled execution, centralized alerting, and monitoring integrations are potential extensions rather than existing features.

11. Future Enhancements

Monitor multiple mounted filesystems

Add timestamped log generation

Configure email or Slack notifications

Schedule execution using Cron

Integrate with AWS Systems Manager

Export metrics for Prometheus

Add configurable warning and critical thresholds

Improve error handling and automated testing

12. Skills Demonstrated

This project demonstrates foundational experience with:

Linux system administration

Bash variables and conditional statements

Filesystem utilization checks

Command-line text processing

Linux process exit codes

Git version control

Operational automation

Conclusion

This project demonstrates how a repetitive Linux administration task can be automated using Bash scripting.

It also provides a foundation for developing more advanced server monitoring, alerting, and operational automation solutions.


<img width="915" height="355" alt="image" src="https://github.com/user-attachments/assets/44d47bb9-08bd-497a-8b45-a088919e8c3a" />
