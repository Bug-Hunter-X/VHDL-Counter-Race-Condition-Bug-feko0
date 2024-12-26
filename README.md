# VHDL Counter Race Condition

This repository demonstrates a potential race condition in a simple VHDL counter. The counter is designed to increment on each rising clock edge, resetting to 0 when the reset signal is high.  However, if the reset and clock signals are not properly synchronized, the counter may exhibit unpredictable behavior.

## Bug Description
The race condition arises because the `if rst = '1'` condition and the `rising_edge(clk)` condition are evaluated concurrently. If the `rst` signal changes very close to a rising edge of `clk`, the order of evaluation might be unpredictable, leading to the counter not resetting properly or incrementing unexpectedly.

## Solution
The solution involves using a synchronous reset, ensuring that the reset signal only affects the counter's state on a clock edge. This eliminates the race condition and guarantees predictable counter behavior.
