

# Global period constraint
create_clock -name clk -period 3.9062 [get_ports clk]
# LOC constraints
set_property LOC d7hack [get_ports clk]
