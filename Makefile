IMAGE_NAME = elixir:latest
CONTAINER_NAME = elixir
SOURCE = /home/israel/Projects/Elixir/src
TARGET = /var/elixir/src

iex:
	docker run -it --rm elixir

shell:
	docker run -it --rm --name $(CONTAINER_NAME) -v $(SOURCE):$(TARGET) -w $(TARGET) $(IMAGE_NAME) /bin/bash