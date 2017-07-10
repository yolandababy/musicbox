# unzip play log
for f in data/raw/*_play.log.tar.gz
do
 echo "Processing $f"
 tar -xvzf $f 
done

mv *_play.log data/play/

cp data/raw/*_play.log.gz data/play/ 
gunzip data/play/*.gz

# append file_name to each row (will be used for date)
cd data/play/
for f in *.log
do
 echo "Processing $f"
 awk -v var="$f" '{print $0,"\t",var}' $f > ${f}.fn
done
