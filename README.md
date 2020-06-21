# Structure and Interpretation of Computer Programs

[![github action status](https://github.com/hexlet-boilerplates/sicp-racket/workflows/Racket%20CI/badge.svg)](https://github.com/hexlet-boilerplates/sicp-racket/actions)

This repository contains my solutions of exercises from the book. Almost of solutions has exploration and comments on russian language.

[Official SICP website](https://mitpress.mit.edu/sicp) · [Read online](http://sarabander.github.io/sicp/)

![Book cover](./image/cover.jpg)

## Table of contents

- [Chapter 1. Building Abstractions with Procedures](./sicp/chapter_1)
  - [1.1 The Elements of Programming](./sicp/chapter_1/1_the_elements_of_programming)
  - [1.2 Procedures and the Processes They Generate](./sicp/chapter_1/2_procedures_and_the_processes_they_generate)
  - [1.3 Formulating Abstractions with Higher-Order Procedures](./sicp/chapter_1/3_formulating_abstractionswith_higher-order_procedures)

## Sicp Racket Boilerplate

### Requirements

* Racket
* Rackunit (`raco pkg install rackunit`)
* [SICP Support for DrRacket](https://docs.racket-lang.org/sicp-manual/index.html) (`raco pkg install sicp`)
* Make

### Using

1. Copy content of this repo (not clone!) to your repository
2. Write code (look `sicp/chapter1/02.rkt`)
3. Run tests `make test`
4. Run linter `make lint`
