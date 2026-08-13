/**
 * @file perft_tests.h
 * 
 * Perft correctness and performance test harness, runs natively on calculator
 */

#ifndef MINTI_TEST_PERFT_TESTS_H
#define MINTI_TEST_PERFT_TESTS_H

#include <stdint.h>

/**
 * @brief Runs perft on fixed tests, uses gfx to print correctness and nps
 */
uint8_t run_perft_tests(void);

#endif
