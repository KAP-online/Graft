#include <ncurses.h>
#include <stdlib.h>

#include "graft.h"
#include "terminal.h"
#include "editor.h"

struct editorConfig E;

int main()
{
	atexit(disableRawMode);
	initscr();
	enableRawMode();
	getmaxyx(stdscr, E.screenrows, E.screencols);

	editorRefreshScreen();
	while(1)
	{
		editorProcessKeypress();
		editorRefreshScreen();
	}

	return 0;
}
