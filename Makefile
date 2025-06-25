CC = gcc
CFLAGS = -Wall -Wextra -Werror -std=c99 -g
LDFLAGS = -lncurses

# Makefile colors
GREEN := \033[0;32m
RESET := \033[0m

SRCS := $(wildcard src/*.c)
OBJS := $(patsubst src/%.c,obj/%.o,$(SRCS))

all: graft

graft: $(OBJS)
	@printf "$(GREEN)LD   graft$(RESET)\n"
	@$(CC) $(OBJS) -o graft $(LDFLAGS)

obj:
	@mkdir -p obj

obj/%.o: src/%.c | obj
	@printf "$(GREEN)CC   $<$(RESET)\n"
	@$(CC) $(CFLAGS) -c $< -o $@

clean:
	@printf "$(GREEN)CLEAN$(RESET)\n"
	@rm -rf obj graft

help:
	@printf "$(GREEN)Usage: make [target]$(RESET)\n"
	@printf "$(GREEN)Targets:\n$(RESET)"
	@printf "$(GREEN)  all     - Build the project$(RESET)\n"
	@printf "$(GREEN)  clean   - Remove object files and executable$(RESET)\n"
	@printf "$(GREEN)  help    - Display this help message$(RESET)\n"

.PHONY: clean all help
