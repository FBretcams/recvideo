#/bin/bash
#/bin/bash

fecha=$(TZ=":America/Mexico_City" date +%F);
#echo $fecha;
hora_anterior=$(TZ=":America/Mexico_City" date --date='-30 minutes' +%H_%M)"_0";
#echo $hora_anterior
hora=$(TZ=":America/Mexico_City" date +%H_%M)"_0";
#echo $hora;
hora_actual=$(TZ=":America/Mexico_City" date +%R);
#echo $hora_actual;
cam="1_"
#echo $cam
cam_name="cam000"$cam
file_name=$cam_name""$hora
ip="10.7.206.15"
#echo $ip
grabacion="_"$cam_name"_"$hora_anterior;
#echo $grabacion

if [ -d "/home/ubuntu/recvideo/public/$cam_name/video_history/$fecha/" ]; then
    #echo $hora_actual
    pkill -f $grabacion;
         #ffmpeg -rtsp_transport tcp -i rtsp://10.7.206.15/media/video3 -acodec copy -vcodec copy /home/breton/Documentos/prueba2.jpg
    nohup ffmpeg -rtsp_transport tcp -i rtsp://$ip/media/video2 -ss 00:00:00 -t 00:30:00 -vframes 1 /home/ubuntu/recvideo/public/$cam_name/video_history/$fecha/$file_name.jpg &
    
    nohup ffmpeg -rtsp_transport tcp -i rtsp://$ip/media/video2 -ss 00:00:00 -t 00:30:00 -acodec copy -vcodec copy /home/ubuntu/recvideo/public/$cam_name/video_history/$fecha/$file_name.mp4
    
    #NODE_ENV=production CAM_NUMBER=$cam node /home/ubuntu/apistreamcams/jobs/new_record_day.js > record_day_cam$cam.log
    
else
    mkdir -p "/home/ubuntu/recvideo/public/$cam_name/video_history/$fecha";
    pkill -f $grabacion;

    nohup ffmpeg -rtsp_transport tcp -i rtsp://$ip/media/video2 -ss 00:00:00 -t 00:30:00 -vframes 1 /home/ubuntu/recvideo/public/$cam_name/video_history/$fecha/$file_name.jpg &
    
    nohup ffmpeg -rtsp_transport tcp -i rtsp://$ip/media/video2 -ss 00:00:00 -t 00:30:00 -acodec copy -vcodec copy /home/ubuntu/recvideo/public/$cam_name/video_history/$fecha/$file_name.mp4
    
    #NODE_ENV=production CAM_NUMBER=$cam node /home/ubuntu/apistreamcams/jobs/new_record_day.js > record_day_cam$cam.log
fi

#UNV : rtsp://$ip/media/video3 quivo
#HL : rtsp://admin:ENGTK2010@$ip/h264/ch1/sub/av_stream