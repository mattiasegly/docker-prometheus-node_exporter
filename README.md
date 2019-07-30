# rpi-prometheus-node_exporter
Raspberry Pi Docker Container for Prometheus Node Exporter

Multiarch build using balena's Raspberry Pi image and docker's official Debian image.<BR>
Running with tag :latest should work on all Raspberry Pi models and standard 64-bit hardware.

Run with:<BR>
docker run -d \\\
--network="host" \\\
--pid="host" \\\
--mount type=bind,src=/,dst=/host,readonly,bind-propagation=rslave \\\
mattiasegly/rpi-prometheus-node_exporter:latest

I know nothing about code, so assume that everything here sets the world on fire.<BR>
Use at your own peril.
