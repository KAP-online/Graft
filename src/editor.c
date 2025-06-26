#include "editor.h"
#include <ncurses.h>
#include <stdlib.h>

void editorRefreshScreen() {
	clear();
	refresh();
}

int editorProcessKeypress() {
	int ch = getch();
	if (ch == ('q' & 0x1f)) {
		exit(0);
	}
	return 0;
}
