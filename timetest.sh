#!/bin/sh

while true

do

	if [ ! -d "/test/$(date +'%Y_%m_%d-%H')" ]

	then

		mkdir -p "/test/$(date +'%Y_%m_%d-%H')"
		cd -P "/test/$(date +'%Y_%m_%d-%H')"
		echo "Ordner erstellt."

	else

		mkdir "/test/$(date +'%Y_%m_%d-%H')/$(date +'%Y_%m_%d-%M')"
		cd "/test/$(date +'%Y_%m_%d-%H')/$(date +'%Y_%m_%d-%M')"

		avconv -rtsp_transport tcp -i rtsp://172.16.20.14/media/video1 -s 800x640 -vsync 1 -r 1 -an -y 'IMG_%04d.jpg' &

		TASK_PID=$!
		sleep 60
		kill $TASK_PID

		cd /

fi

done
