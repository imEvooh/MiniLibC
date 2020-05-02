##
## EPITECH PROJECT, 2020
## Makefile
## File description:
## Makefile
##

NAME	=	libasm.so

SRC		=	src/strlen.asm		\
			src/strchr.asm		\
			src/strcmp.asm		\
			src/strcasecmp.asm	\
			src/memset.asm		\
			src/memcpy.asm		\
			src/memmove.asm		\
			src/rindex.asm		\
			src/strpbrk.asm		\
			src/strcspn.asm		\
			src/strstr.asm		\
			src/strncmp.asm

ASM 	=	nasm

ASMFLAG =	-f elf64

LD		=	ld

RM		=	rm -f

OBJS	=	$(SRC:.asm=.o)

%.o		:	%.asm
			$(ASM) $(ASMFLAG) $< -o $@

all: $(NAME)

$(NAME): $(OBJS)
	$(LD) -fPIC -shared -o $(NAME) $(OBJS)

clean:
	$(RM) $(OBJS)

fclean:	clean
	$(RM) $(NAME)

re:	fclean all

.PHONY:	all clean fclean re
