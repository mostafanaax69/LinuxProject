# System Health Check and Monitor

## Explaining the code line by line:
Every line is well commented and documented , but here is a wider documentation : 


- Logging :
  In order to log all of the messages in a proper way , i have created a new log in the script and saved its location in the `log_file` variable.
    ```bash
        log() {
        echo "$(date +"%Y-%m-%d %H:%M:%S") $1" >> "$log_file"
          }
  This function is responsible for logging the sent line into the log_file variable which we defined before , in a well orginaized manner and  timestamped logs of each health check included.
  In the script, you'll find several instances of `log $line` after specific commands. It is a call for the function log which redirects the standard output of a command to a file without overwriting the file's existing content ( because of using the " >> " operator)

  
  



