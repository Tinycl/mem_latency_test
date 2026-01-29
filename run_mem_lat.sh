#set -x
#gcc mem_lat.c -g -o mem_lat -O0
#objdump -D -S mem_lat > mem_lat.s

gcc mem_lat.c -o mem_lat -O0 

work=./mem_lat
buffer_size=1
stride=256

for i in `seq 1 21`; do
	taskset -ac 0 $work -b $buffer_size -s $stride
	buffer_size=$(($buffer_size*2))
done
