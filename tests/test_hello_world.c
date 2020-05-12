/*
** EPITECH PROJECT, 2020
** EPI_helloworld_2019
** File description:
** test_hello_world.c
*/

#include <criterion/criterion.h>
#include <criterion/redirect.h>

#include "hello_world.h"

Test(hello_world, call, .init = cr_redirect_stdout) {
    hello_world();
    fflush(stdout);

    cr_assert_stdout_eq_str("Hello, World!\n");
}
