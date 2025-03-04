
# Compiler and flags
CC		=	cc
CFLAGS	= 	-Wall -Werror -Wextra

# Name and directories
NAME	= 	hello
ODIR	=	obj/

# Source Files
SRCS	= 	main.c

# Object Files
OBJS	=	$(SRCS:%.c=$(ODIR)%.o)

# Targets

all: $(NAME)

clean:
	rm -rf $(OBJS) $(ODIR)

fclean: clean
	rm -f $(NAME)

re: fclean all

r: all clean
	clear
	./$(NAME)

v: all clean
	clear
	valgrind --leak-check=full --trace-children=yes \
		--track-fds=all --track-origins=yes ./$(NAME)

# Compile Program
$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(NAME)

# Compile Source Files
$(ODIR)%.o: %.c
	mkdir -p $(ODIR)
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: all clean fclean re
