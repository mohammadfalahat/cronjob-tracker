## Track how cronjobs are going with Grafana 

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
* * * * * /usr/bin/cron_metrics
to
* * * * * /usr/bin/cron_metrics > /tmp/cron_$$.log 2>&1; /usr/bin/cron_tracker $? $$ < /tmp/cron_$$.log
```
