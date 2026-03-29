module Exercise3 (
    input clk,
    input nReset,
    input [3:0] a,
    input [15:0] b,
    input [15:0] c,
    output [15:0] out
);

logic [7:0] alpha_out;
logic [7:0] beta_out;

Mystery1 alpha (
    .a(a[1:0]),
    .b(b[7:0]),
    .c(c[7:0]),
    .d(alpha_out)
);

Mystery1 beta (
    .a(a[3:2]),
    .b(b[15:8]),
    .c(c[15:8]),
    .d(beta_out)
);

Mystery2 gamma (
    .clk(clk),
    .nReset(nReset),
    .a_in(alpha_out),
    .b_in(beta_out),
    .out(out)
);

endmodule


//The reason for those approaches is those exercises have different input size and behaviors
//  for exercise 1, the input size isn't really big so we can go over all of them to test the correctness.
//  The advantage is we can be really confident in the correctness, while disadvantage is we can only test exhausitively if size is small enough.

//  for exercise 2, we have so many cycles, it would take too long to test exhausitively. so we put some possible values.
//  advantage: it checked reset and state evolution, without taking too much space/time. disadvantage: does not cover everything.

//  for exercise 3, we did random testing, still because exhausitive is too expensive.
//  advantage: we cna test different combination and might see unforseeable mistakes. disadvantage: might not reach all edge cases we want to test.