# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bde-souz <bde-souz@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/08 17:45:47 by bde-souz          #+#    #+#              #
#    Updated: 2024/11/11 11:27:29 by bde-souz         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER_COMPOSE = ./srcs/docker-compose.yaml
VOLUMES=$$(docker volume ls -q)

compose:
	@mkdir -p /home/bde-souz/data

	@docker compose -f ${DOCKER_COMPOSE} up -d --build
down:
	@docker compose -f ${DOCKER_COMPOSE} down

stop: down
	@docker compose -f ${DOCKER_COMPOSE} stop
	

clean: down
	@docker volume rm ${VOLUMES}


clean_all: down
	@docker volume rm ${VOLUMES}
	@docker system prune -a
	@rm -rf /home/bde-souz/data

re: clean compose