#include<stdio.h>
#include<stdlib.h>
#include<dirent.h>
#include<sys/types.h>
int main(int argc,char ** argv)
{
DIR * dp;
struct dirent * dentry;
if(argc !=2)
{
printf("Usgae: ./a.out dirname");
exit(1);
}
if(!(dp=opendir(argv[1])))
{
printf("Open directory error!!\n");
exit(2);
}
while(1)
{
dentry=readdir(dp);
if(!dentry)
break;
printf("%s\n",dentry->d_name);
}
return 0;
}
