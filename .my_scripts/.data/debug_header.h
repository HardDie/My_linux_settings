#ifndef _DEBUG_H_
#define _DEBUG_H_

#include <stdarg.h>
#include <unistd.h>

/* DEBUG */
static int _i = 0;
static int _in = 1;
enum {_ERR=31,_ENT=32,_EXT=35,_C_OPT};
static const char* name(int i) {
	switch(i) { case _ERR: return "ERR";
	            case _ENT: return "ENT";
	            case _EXT: return "EXT"; }
	return "NaN";
}

//#define STDOUT

static void _p(const char*ff,...) {
	__intptr_t f=(__intptr_t)ff;
#ifndef STDOUT
	FILE*F=fopen("/dev/console","a");
#else
	FILE*F=stdout;
#endif
	if(F) {
		va_list a;
		va_start(a,ff);
		if(f<_C_OPT) {
			fprintf(F,"\x1B[%ldm%s\x1B[0m:", (long int)f, name(f));
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

static void _i_p(int m) {
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

#define _pwi(_f,...) do{_i_p((__intptr_t)_f);_p((char*)_f,##__VA_ARGS__);}while(0)
#define _p_i()if(_in)_p(" %1s[%s():%d]{%d} - %s%1s","\x1B[33m",__FUNCTION__,__LINE__,getpid(),__FILE__,"\x1B[0m");_p("\n")
#define DPRINT(_fl,_f,...)do{if(_fl){_pwi((char*)_f,##__VA_ARGS__);_p_i();if(!_i)_p("\n");}}while(0)
/* DEBUG */

#endif
