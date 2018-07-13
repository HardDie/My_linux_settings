#ifndef _MY_DEBUG_HEADER_
#define _MY_DEBUG_HEADER_

/**
 * Global information
 */

#define D_ARGS const char* func, int line, const char* file
#define D_INFO __FUNCTION__, __LINE__, __FILE__

#define L_ALL (L_ERROR | L_WARN | L_INFO | L_DEBUG | L_STRACE | L_EXTRA)
typedef enum {
	L_RAW = 0,      /**< Level: raw print */
	L_ERROR = 8,    /**< Level: error */
	L_WARN  = 16,   /**< Level: warrning */
	L_INFO  = 32,   /**< Level: info */
	L_DEBUG = 64,   /**< Level: debug */
	L_STRACE = 128, /**< Level: stack trace */
	L_EXTRA = 256,  /**< Level: print extra information */

	S_TR_ENT = L_STRACE | 1,  /**< Stack trace enter */
	S_TR_EXT = L_STRACE | 2,  /**< Stack trace out */
	S_TR_ERR = L_STRACE | 3,  /**< Stack trace error out */
} debug_level_t;

/**
 * Init for main file
 */

#ifdef __D_INIT__
#include <stdio.h>
#include <stdarg.h>
#include <unistd.h>
#include <time.h>
#include <sys/time.h>

#define ANSI_COLOR_RESET   "\x1B[0m"
#define ANSI_COLOR_RED     "\x1B[31m"
#define ANSI_COLOR_GREEN   "\x1B[32m"
#define ANSI_COLOR_YELLOW  "\x1b[33m"
#define ANSI_COLOR_MAGENTA "\x1B[35m"
#define ANSI_COLOR_CYAN    "\x1B[36m"

#define D_PASS_ARGS func, line, file

static void print_information(D_ARGS);
static void print_indent(const int opt);
static const char* get_prefix(const int opt);

__attribute__((unused)) static int  debug_level = L_ALL;

__attribute__((unused))
void dtrace(D_ARGS, const int opt, const char* format, ...) {
	__attribute__((unused)) static char debug_file[256] = "/dev/console";
	__attribute__((unused)) static int  debug_enable = 1;

	if (debug_file[0] == 0 || !debug_enable) {
		return;
	}
	if (opt != L_RAW) { // Skip if L_RAW
		if (!(opt & debug_level)) {
			return;
		}
		print_indent(opt);
	}

	FILE* F = fopen(debug_file, "a");
	if (F) {
		if (opt != L_RAW) { // Skip if L_RAW
			fprintf(F, "%s", get_prefix(opt));
		}
		va_list a;
		va_start(a, format);
		vfprintf(F, format, a);
		fflush(F);
		va_end(a);
		fclose(F);
	}
	if (opt != L_RAW) { // Skip if L_RAW
		print_information(D_PASS_ARGS);
	}
}
__attribute__((unused))
static inline void print_information(D_ARGS) {
	if (debug_level & L_EXTRA) {
		struct timeval t;
		char time[32];
		gettimeofday(&t, NULL);
		strftime(time, sizeof(time), "%H:%M:%S", localtime(&t.tv_sec));
		dtrace(D_INFO, L_RAW, " %1s[%s():%d]{%d}(%s) - %s%1s", ANSI_COLOR_YELLOW,
		       func, line, getpid(), time, file, ANSI_COLOR_RESET);
	}
	dtrace(D_INFO, L_RAW, "\n");
}
__attribute__((unused))
static inline void print_indent(const int opt) {
	static int indent = 0;
	int i;
	if (!(debug_level & L_STRACE)) { // If stack trace disable, not print indent
		return;
	}
	if(opt == S_TR_EXT || opt == S_TR_ERR) {
		if(indent > 0) {
			indent--;
		}
	}
	for(i = 0; i < indent; i++) {
		dtrace(D_INFO, L_RAW, ANSI_COLOR_CYAN "|  " ANSI_COLOR_RESET);
	}
	if(opt == S_TR_ENT) {
		indent++;
	}
}
__attribute__((unused))
static inline const char* get_prefix(const int opt) {
	if (opt==S_TR_ENT) return ANSI_COLOR_GREEN   "ENT"     ANSI_COLOR_RESET;
	if (opt==S_TR_EXT) return ANSI_COLOR_MAGENTA "EXT"     ANSI_COLOR_RESET;
	if (opt==S_TR_ERR) return ANSI_COLOR_RED     "ERR"     ANSI_COLOR_RESET;
	if (opt==L_DEBUG)  return                    "DEBUG: ";
	if (opt==L_INFO)   return                    "INFO: ";
	if (opt==L_WARN)   return ANSI_COLOR_YELLOW  "WARN: "  ANSI_COLOR_RESET;
	if (opt==L_ERROR)  return ANSI_COLOR_RED     "ERROR: " ANSI_COLOR_RESET;
	return"NaN";
}

/**
 * Header for additional files
 */

#else // __D_INIT__
extern void dtrace(D_ARGS, const int opt, const char* format, ...);
#endif // __D_INIT__

#endif // _MY_DEBUG_HEADER_
