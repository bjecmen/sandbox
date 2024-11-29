#!/bin/bash

file_SRHV=`du -s /home/aplikace/srhv2livehot/ |awk '{print $1}'`

retezec=`ssh -l oracle faldus1 cat $1 | grep "srhv2live" | awk  '{if (FNR==1) print $1 }'`

case $retezec in 

"workingDirectory=/home/srhv2live")

     while [ $file_SRHV -ne 4 ]; do

   scp -p  /home/aplikace/srhv2livehot/*.*x oracle@faldus1:/home/srhv2live/
   scp -p  /home/aplikace/srhv2livehot/*.*x oracle@faldus2:/home/srhv2live/


  scp -p  /home/aplikace/srhv2livehot/*.rdf oracle@faldus1:/home/srhv2liverdf/
  scp -p  /home/aplikace/srhv2livehot/*.rdf oracle@faldus2:/home/srhv2liverdf/

      rm /home/aplikace/srhv2livehot/*
	
 file_SRHV=`du -s /home/aplikace/srhv2livehot/ |awk '{print $1}'`
 done  
    ;;     

"workingDirectory=/home/srhv2live2")
    
      while [ $file_SRHV -ne 4 ]; do
   scp -p /home/aplikace/srhv2livehot/*.*x oracle@faldus1:/home/srhv2live2/
    scp -p /home/aplikace/srhv2livehot/*.*x oracle@faldus2:/home/srhv2live2/
  

  scp -p  /home/aplikace/srhv2livehot/*.rdf oracle@faldus1:/home/srhv2liverdf/
  scp -p /home/aplikace/srhv2livehot/*.rdf oracle@faldus2:/home/srhv2liverdf/

     rm /home/aplikace/srhv2livehot/*


 file_SRHV=`du -s /home/aplikace/srhv2livehot/ |awk '{print $1}'`
 done
  
    ;;

esac
