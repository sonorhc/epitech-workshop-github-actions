##
## EPITECH PROJECT, 2020
## EPI_helloworld_2019
## File description:
## Makefile
##

NAME				=		a.out
TEST_NAME			=		tests/unit_tests
TEST_NAME_SH		=		tests/functional_tests.sh

CC					=		gcc
RM					=		rm -rf

MAIN_SRC			=		src/main.c

PROJ_SRC			=		src/hello_world.c			\

TEST_SRC			=		tests/test_hello_world.c	\

CFLAGS				+=		-I src
CFLAGS				+=		-W -Wall -Wextra -Werror

MAIN_OBJ			=		$(MAIN_SRC:%.c=%.o)

PROJ_OBJ			=		$(PROJ_SRC:%.c=%.o)

TEST_OBJ			=		$(TEST_SRC:%.c=%.o)

TEST_COV			=		$(PROJ_SRC:%.c=%.gcda)	\
							$(PROJ_SRC:%.c=%.gcno)	\
							$(TEST_SRC:%.c=%.gcda)	\
							$(TEST_SRC:%.c=%.gcno)	\

$(NAME):			$(MAIN_OBJ) $(PROJ_OBJ)
					$(CC) $(MAIN_OBJ) $(PROJ_OBJ) -o $(NAME) $(LDLIBS)

all:				$(NAME)

clean:
					$(RM) $(MAIN_OBJ) $(PROJ_OBJ) $(TEST_OBJ) $(TEST_COV)

fclean:				clean
					$(RM) $(NAME)
					$(RM) $(TEST_NAME)

re:					fclean all

$(TEST_NAME):		CFLAGS += -fprofile-arcs -ftest-coverage
$(TEST_NAME):		LDLIBS += -lgcov -lcriterion
$(TEST_NAME):		$(PROJ_OBJ) $(TEST_OBJ)
					$(CC) $(PROJ_OBJ) $(TEST_OBJ) -o $(TEST_NAME) $(LDLIBS)

tests_run:			$(TEST_NAME)
					./$(TEST_NAME)

tests_sh:			re
					sh $(TEST_NAME_SH) $(NAME)

.PHONY:				all clean fclean re	tests_run tests_sh	\
