#include <string.h>
#include <sys/klog.h>
#include <stdio.h>
#include <syslog.h>
void openlog(const char *ident, int option, int facility);
void syslog(int priority, const char *format, ...);
int main (int argc , char **argv){

	if (argc == 3){
		FILE *ofile;
		ofile=fopen(argv[1],"w");
		fprintf(ofile, "%s",argv[2]);
		fclose(ofile);
		openlog(NULL,0,LOG_USER);
		syslog(LOG_DEBUG,"writing %s to %s",argv[2],argv[1]);
		
	}else{
		printf("ERROR: Invalid Number of Arguments.\nTotal number of arguments should be 2.\nThe order of the arguments should be:\n1)File Directory Path.\n2)String to be searched in the specified path.\n");
		openlog(NULL,0,LOG_USER);
		syslog(LOG_ERR,"invalid number of arguments : %d",argc);
	}
	return 0;
}
