
//For debugging/development
//#define DEBUG_SHELL


#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <errno.h>
#include <fcntl.h>
####include <signal.h>
####include <string.h>
####include <sys/ioctl.h>
####include <sys/wait.h>
####include <unistd.h>
####include <getopt.h>
####include <termios.h>
#include "busybox.h"
#include "cmdedit.h"

#ifdef CONFIG_LOCALE_SUPPORT
#include <locale.h>
#endif
