PROJECT_NAME=GameOfLife
BUILD_DIR=build
DOCS_DIR=docs
SOURCE_DIR=src
TEST_DIR=test
TARGET=${BUILD_DIR}/${PROJECT_NAME}
SRCS = $(shell find ${SOURCE_DIR} -name '.ccls-cache' -type d -prune -o -type f -name '*.cc' -print | sed -e 's/ /\\ /g')
HEADERS = $(shell find ${SOURCE_DIR} -name '.ccls-cache' -type d -prune -o -type f -name '*.h' -print)

CXX = g++
CXXFLAGS = -g -Wall -Werror -fsanitize=bounds
MAKEFLAGS += --no-print-directory


all:
	@make clean
	@make build
	@make run


.PHONY: build
build: ${SRCS} ${HEADERS}
	@${CXX} ${CXXFLAGS} ${SRCS} -o ${TARGET}

run: ${TARGET}
	@./${TARGET}

.PHONY: clean
clean:
	@rm -rf ${TARGET}

.PHONY: docs
docs:
	@echo No documentation yet in ${DOCS_DIR} folder

.PHONY: test
test:
	@echo No tests yet in ${TEST_DIR} folder
