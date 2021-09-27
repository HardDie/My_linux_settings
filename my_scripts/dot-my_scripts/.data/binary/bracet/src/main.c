#include <stdio.h>

void single(char**);
void two(char**);

const char* FirstOpenAngle = "<span background='%s' foreground='%s'></span>"; 
const char* FirstSpace = "<span background='%s' foreground='%s' font_family='FontAwesome'>%s</span>";
const char* FirstCloseAngle = "<span background='%s' foreground='%s'></span>";
const char* SecondSpace = "<span background='%s' foreground='%s'>%s</span>";
const char* SecondCloseAngle = "<span background='%s' foreground='%s'></span>";

void single(char** argv) {
	const char* backgroundColor = "#2f343f";
	const char* iconColor = "#000000";

	char* icon = argv[1];
	char* value = argv[2];

	char* firstColor = argv[3];
	char* secondColor = argv[4];
	char* textColor = argv[5];

	printf(FirstOpenAngle, firstColor, backgroundColor);
	printf(FirstSpace, firstColor, iconColor, icon);
	printf(FirstCloseAngle, secondColor, firstColor);
	printf(SecondSpace, secondColor, textColor, value);
	printf(SecondCloseAngle, backgroundColor, secondColor);
}

void two(char** argv) {
	const char* backgroundColor = "#2f343f";
	const char* iconColor = "#000000";

	char* icon1 = argv[1];
	char* value1 = argv[2];
	char* icon2 = argv[3];
	char* value2 = argv[4];

	char* firstColor = argv[5];
	char* secondColor = argv[6];
	char* textColor = argv[7];

	printf(FirstOpenAngle, firstColor, backgroundColor);
	printf(FirstSpace, firstColor, iconColor, icon1);
	printf(FirstCloseAngle, secondColor, firstColor);
	printf(SecondSpace, secondColor, textColor, value1);
	printf(SecondCloseAngle, firstColor, secondColor);
	printf(FirstSpace, firstColor, iconColor, icon2);
	printf(FirstCloseAngle, secondColor, firstColor);
	printf(SecondSpace, secondColor, textColor, value2);
	printf(SecondCloseAngle, backgroundColor, secondColor);
}

int main(__attribute__((unused)) int argc, char** argv) {
	if (argc == 6) {
		single(argv);
	}
	if (argc == 8) {
		two(argv);
	}
	return 0;
}
