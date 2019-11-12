#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/types.h>
#include<fcntl.h>
#include<sys/stat.h>
int main(int argc,char * argv[])
{
int fd,fd1;
size_t size;
ssize_t size1;
char buf[100];
if(argc <3)
{
printf("Usage:<a.out> filename filename\n");
}
else
{
fd=open(argv[1],O_RDONLY);
size=read(fd,buf,15);
}
fd1=open(argv[2],O_WRONLY);
size1=write(fd1,buf,size);
close(fd);
close(fd1);
}
