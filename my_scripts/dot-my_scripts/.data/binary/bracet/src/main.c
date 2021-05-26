#include <stdio.h>

const char* FirstOpenAngle = "<span background='%s' foreground='%s'></span>"; 
const char* FirstSpace = "<span background='%s' foreground='%s' font_family='FontAwesome'>%s</span>";
const char* FirstCloseAngle = "<span background='%s' foreground='%s'></span>";
const char* SecondSpace = "<span background='%s' foreground='%s'>%s</span>";
const char* SecondCloseAngle = "<span background='%s' foreground='%s'></span>";

int main(__attribute__((unused)) int argc, char** argv) {
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
	return 0;
}
