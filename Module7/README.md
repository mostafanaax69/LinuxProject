# LinuxProject

## Table of Contents of Module7
- [Module 7: Final Exercise](#module-7-final-exercise)
  - [Report System Health Check and Performance Monitoring Bash Script](#exercise-report-system-health-check-and-performance-monitoring-bash-script)





### Task : Report System Health Check and Performance Monitoring Bash [Script](./Sys_HealthCeheck_Monitor)
- Checked essential services (SSH, HTTP, HTTPS, and MySQL database services) and reported their status.
- Monitored disk usage, identified partitions with usage over a set threshold (e.g., 80%).
- Checked for read-only file systems.
- Monitored CPU and memory usage for each running process, flagged values exceeding normal operating parameters.
- Analyzed system logs for signs of errors or warnings.
- Listed all current user failed SSH login sessions and checked for any unauthorized access attempts.
- Scanned for open ports and reported any unexpected open ports.
- Formatted the output in a clear, readable manner.
- Included timestamped logs of each health check.
- Optionally, emailed the report to a specified system administrator.
- Implemented robust error handling within the script.
- Logged each action performed by the script for later analysis.
- Ensured the script runs efficiently with minimal system impact.
- Optimized the script to run periodically (e.g., as a cron job) or on-demand.




### Prerequisites
Before running the script, make sure you have the following installed:

- mail linux package
  `sudo apt-get install mailutils` 
- netstat linux package
  `sudo apt-get install netstat`


### Running the Script
1. if you want to run the first script which is basiaclly a loop that runs every day at 02:00🕝
   ```bash
   git clone https://github.com/mostafanaax69/LinuxProject/tree/main/Module7)
   sudo ./Syscheck_background.sh &

- You can view the logs using the following command :
  ```bash
  sudo cat /var/log/system_check.log

2. if you want to register the script as cron job that would run every day at 02:00🕝 ( Or any desired time )
   - Open your crontab configuration with the following command:
   ```bash
      crontab -e
   - Add an entry to run the script at your desired frequency. For example, to run the script every day at 2 AM, add the following line:
   ```bash
      0 2 * * * /path/to/your/Syscheck_periodic.sh
   - Adjust the timing based on your preferences. The format is: minute hour day month day_of_week command.
   ```bash
     git clone https://github.com/mostafanaax69/LinuxProject/tree/main/Module7)
     sudo ./Syscheck_periodic.sh &
   




 

