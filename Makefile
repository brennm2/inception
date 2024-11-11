# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bde-souz <bde-souz@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/08 17:45:47 by bde-souz          #+#    #+#              #
#    Updated: 2024/11/11 18:28:58 by bde-souz         ###   ########.fr        #
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
	@docker network rm $(docker network ls -q) 2>/dev/null
	@docker system prune -a
	@rm -rf /home/bde-souz/data

re: clean compose