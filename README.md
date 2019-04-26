# docker-rpi-prometheus-node_exporter
Raspberry Pi Docker Container for Prometheus Node Exporter<BR>
Work in progress, trying to create simple Prometheus Node Exporter container.

Run with:<BR>
docker run -d \\\
--network="host" \\\
--pid="host" \\\
--mount type=bind,src=/,dst=/host,readonly,bind-propagation=rslave \\\
mattiasegly/rpi-prometheus-node_exporter

I know nothing about code, so assume that everything here sets the world on fire.<BR>
Use at your own peril.
