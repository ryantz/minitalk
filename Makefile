# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ryatan <ryatan@student.42singapore.sg>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/02/09 08:56:45 by ryatan            #+#    #+#              #
#    Updated: 2026/03/12 19:02:50 by ryatan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CLIENT_NAME = client
SERVER_NAME = server
COMPILER = cc
INCLUDES = -Iincludes -Ilibft -Ift_printf
CFLAGS = -Wall -Wextra -Werror

OBJ_DIR = obj
SRC_DIR = src
CLIENT_DIR = client
SERVER_DIR = server

SRC_CLIENT = $(SRC_DIR)/$(CLIENT_DIR)/client_main.c

SRC_SERVER = $(SRC_DIR)/$(SERVER_DIR)/server_main.c 

# pattern substitution
# $(patsubst WHAT_TO_MATCH,WHAT_TO_REPLACE_IT_WITH,WHERE_TO_LOOK)
OBJ_CLIENT = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC_CLIENT))
OBJ_SERVER = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC_SERVER))

LIBFT_DIR = libft
PRINTF_DIR = ft_printf

LIBFT = $(LIBFT_DIR)/libft.a
PRINTF = $(PRINTF_DIR)/libftprintf.a

$(CLIENT_NAME): $(OBJ_CLIENT) $(LIBFT) $(PRINTF)
	$(COMPILER) $(CFLAGS) $(OBJ_CLIENT) $(LIBFT) $(PRINTF) -o $(CLIENT_NAME)

$(SERVER_NAME): $(OBJ_SERVER) $(LIBFT) $(PRINTF)
	$(COMPILER) $(CFLAGS) $(OBJ_SERVER) $(LIBFT) $(PRINTF) -o $(SERVER_NAME)

$(LIBFT):
	$(MAKE) -C $(LIBFT_DIR)

$(PRINTF):
	$(MAKE) -C $(PRINTF_DIR)

$(OBJ_DIR): 
	mkdir -p $(OBJ_DIR)

#To build any object file inside obj/,
#compile the matching source file inside src/,
#and create the needed subfolder first.
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	@mkdir -p $(dir $@)
	$(COMPILER) $(CFLAGS) $(INCLUDES) -c $< -o $@

all: $(CLIENT_NAME) $(SERVER_NAME)

clean:
	rm -rf $(OBJ_DIR)
	$(MAKE) -C $(LIBFT_DIR) clean
	$(MAKE) -C $(PRINTF_DIR) clean

fclean: clean
	rm -rf $(NAME)
	$(MAKE) -C $(LIBFT_DIR) fclean
	$(MAKE) -C $(PRINTF_DIR) fclean

re: fclean all

.PHONY: all clean fclean re
