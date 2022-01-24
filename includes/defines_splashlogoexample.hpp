class RscPicture {
	access = 0;
	idc = -1;
	style = 0x30;
	colorBackground[] = { 0, 0, 0, 0 };
	colorText = { 1, 1, 1, 1 };
	font = "PuristaLight";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
	// IGNORE EVERYTHING ABOVE THIS UNLESS YOU KNOW WHAT YOU'RE DOING
	x = 0; // Where on the x-axis for the screen we're putting this
	y = 0; // Where on the y-axis for the screen we're putting this
	w = 0.2; // Between 0 and 1, it's a percentage of the user's screen width
	h = 0.15; // Between 0 and 1, it's a percentage of the user's screen height
}