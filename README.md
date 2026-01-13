# STM32F407G Bare-Metal Task Scheduler

This repository contains an end-to-end bare-metal firmware implementation on the STM32F407G microcontroller, developed completely from scratch without HAL, CMSIS, RTOS, or IDE-generated code.

## Project Overview
The goal of this project was to deeply understand:
- MCU boot sequence
- Memory layout and linker behavior
- Deterministic task execution without an RTOS
- Low-level debugging and firmware bring-up

## Key Features
- Custom linker script defining FLASH and SRAM regions
- Manual startup code and vector table
- Cooperative task scheduler implemented using SysTick
- Register-level peripheral control
- Makefile-based ARM GCC build system
- OpenOCD + GDB debugging
- Semihosting and custom syscalls support

## Toolchain & Debugging
- arm-none-eabi-gcc (GCC for ARM)
- GNU Make
- OpenOCD
- GDB
- MINGW64 environment
- Telnet and PuTTY for target interaction

## Target Hardware
- STM32F407G (ARM Cortex-M4)

## Why Bare-Metal?
This project focuses on understanding firmware execution at the lowest level, providing full control over memory, timing, and hardware behavior—skills critical for safety-critical and resource-constrained embedded systems.
