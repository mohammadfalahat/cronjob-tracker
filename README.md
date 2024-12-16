## Track how cronjob fails and success runs

This script should save errors in `/var/log/cron.error.log` and success runs in `/var/log/cron.success.log`

1. install cronjob tracker
2. add additive to your cronjob commands


# Install cron_tracker
```
sudo wget https://github.com/mohammadfalahat/cronjob-tracker/raw/refs/heads/main/cron_tracker.sh
sudo chmod +x cron_tracker.sh
sudo mv cron_tracker.sh /usr/bin/cron_tracker
```

# Update Cronjob tasks
you have to add this code to end of each cronjob command: 
```
> /tmp/cron_$$.log 2>&1; /usr/bin/cron_tracker $? $$ < /tmp/cron_$$.log
```
```
# for example turn:
* * * * * root /usr/bin/cron_metrics
to
* * * * * root /usr/bin/cron_metrics > /tmp/cron_$$.log 2>&1; /usr/bin/cron_tracker $? $$ < /tmp/cron_$$.log
```
