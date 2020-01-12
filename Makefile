# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: estina <estina@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/11 15:13:19 by estina            #+#    #+#              #
#    Updated: 2020/01/12 20:47:03 by estina           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

all: $(NAME)

$(NAME):
	-@nasm -f macho64 ft_strcpy.s
	-@nasm -f macho64 ft_strlen.s
	-@nasm -f macho64 ft_strcmp.s
	-@nasm -f macho64 ft_write.s
	-@nasm -f macho64 ft_read.s
	-@nasm -f macho64 ft_strdup.s
	-@nasm -f macho64 ft_list_push_front.s
	-@nasm -f macho64 ft_list_size.s
	-@ar rcs $(NAME) *.o

clean:
	-@rm -rf ft_strcpy.o ft_strlen.o ft_strcmp.o \
	ft_write.o ft_read.o ft_strdup.o ft_list_push_front.o ft_list_size.o

fclean: clean
	-@rm -rf $(NAME)

re:	fclean all

test: re
	-@rm -rf test
	-@gcc -fno-builtin main.c $(NAME) -o test
	-@./test

.PHONY: all, clean, $(NAME), fclean, re, test