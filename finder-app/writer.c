#include <stdio.h>
#include <syslog.h>
#include <errno.h>
#include <string.h>

int main(int argc, char *argv[]) {

    openlog("writer", LOG_PID, LOG_USER);

    if (argc != 3) {
        syslog(LOG_ERR, "Invalid number of arguments: %d. Usage: writer <writefile> <writestr>", argc);
        closelog();
        return 1;
    }

    char *writefile = argv[1];
    char *writestr = argv[2];

    FILE *f = fopen(writefile, "w");

    if (f == NULL) {
        syslog(LOG_ERR, "Could not open file %s: %s", writefile, strerror(errno));
        closelog();
    return 1;
    }

    int ret = fprintf(f, "%s", writestr);
    if (ret < 0) {
        syslog(LOG_ERR, "Could not write to file %s: %s", writefile, strerror(errno));
        fclose(f);
        closelog();
        return 1;
    }

    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);

    fclose(f);
    closelog();
    
    return 0;
}
