#ifndef _MY_DEBUG_HEADER_
#define _MY_DEBUG_HEADER_

#include <stdio.h>
#include <stdarg.h>
#include <unistd.h>
#include <time.h>
#include <sys/time.h>

/* DEBUG */
#ifndef I_EXT
int _i = 0;
#else
extern int _i;
#endif

static int _in = 1;
enum {_ERR=31,_ENT=32,_EXT=35,_C_OPT};
static const char* _n(int i) {
	if(i==_ERR)return"ERR";
	if(i==_EXT)return"EXT";
	if(i==_ENT)return"ENT";
	return"NaN";
}

//#define STDOUT

static inline void _p(const char*ff,...) {
	long int f=(__intptr_t)ff;
#ifndef STDOUT
	FILE*F=fopen("/dev/console","a");
#else
	FILE*F=stdout;
#endif
	if(F) {
		va_list a;
		va_start(a,ff);
		if(f<_C_OPT) {
			fprintf(F,"\x1B[%ldm%s\x1B[0m:", f, _n(f));
			ff=va_arg(a,char*);
		}
		vfprintf(F,ff,a);
		va_end(a);
		fflush(F);
#ifndef STDOUT
		fclose(F);
#endif
	}
}

static inline void _i_p(int m) {
	int i;
	if(m==_EXT||m==_ERR) {
		if(_i>0) {
			_i--;
		}
	}
	for(i=0;i<_i;i++) {
		_p("%s|  %s","\x1B[36m","\x1B[0m");
	}
	if(m==_ENT) {
		_i++;
	}
}

static inline void _p_i(const char* func, int line, int pid, const char* file) {
	if (_in) {
		struct timeval t;
		char time[32];
		gettimeofday(&t, NULL);
		strftime(time, sizeof(time), "%H:%M:%S", localtime(&t.tv_sec));
		_p(" %1s[%s():%d]{%d}(%s) - %s%1s","\x1B[33m",func,line,pid,time,file,"\x1B[0m");
	}
	_p("\n");
}

#define _pwi(_f,...) do{_i_p((__intptr_t)_f);_p((char*)_f,##__VA_ARGS__);}while(0)
#define DPRINT(_fl,_f,...)do{if(_fl){_pwi((char*)_f,##__VA_ARGS__);_p_i(__FUNCTION__, __LINE__, getpid(), __FILE__);if(!_i)_p("\n");}}while(0)
/* DEBUG */

#endif // _MY_DEBUG_HEADER_
