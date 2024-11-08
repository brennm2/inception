# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bde-souz <bde-souz@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/08 17:45:47 by bde-souz          #+#    #+#              #
#    Updated: 2024/11/08 18:25:49 by bde-souz         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER_COMPOSE = ./srcs/docker-compose.yaml
VOLUMES=$$(docker volume ls -q)

compose:
	@mkdir -p ./data
	@chmod -R 777 data/

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
	@rm -rf ./data/

re: clean compose