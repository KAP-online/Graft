#include <ncurses.h>
#include "terminal.h"

void enableRawMode() {
	raw();
	noecho();
	keypad(stdscr, TRUE);
}

void disableRawMode() {
	endwin();
}
