#include<stdio.h>
#include<time.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/stat.h>
int main(int argc,char * argv[])
{
struct stat statv;
if(lstat(argv[1],&statv)== -1)
{
printf("FILE ATTRIBUTES ERROR!!");
}
else
{
printf("FILE ATTRIBUTES OF THE FILE:%s \n",argv[1]);
long int size=statv.st_size;
printf("Size of the file is:%ld \n",size);
printf("File permission mode:%d \n",statv.st_mode & (S_IRWXU|S_IRWXG|S_IRWXO));
printf("a.time:%s \n",ctime(&statv.st_atime));
printf("m.time:%s \n",ctime(&statv.st_mtime));
printf("c.time:%s \n",ctime(&statv.st_ctime));
printf("links:%d \n",statv.st_nlink);
}
return 0;
}
