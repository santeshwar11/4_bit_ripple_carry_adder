`timescale 1ns / 1ps

// ---------------------------------------------------------------
// 1-bit full adder used inside the ripple carry adder.
// (Self-contained, so this file compiles on its own.)
// ---------------------------------------------------------------
module rca_full_adder (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule


// ---------------------------------------------------------------
// 4-bit ripple carry adder.
// Four full adders chained together: the carry out of each stage
// is the carry in of the next stage.
// ---------------------------------------------------------------
module ripple_adder_4bit (
    input  [3:0] a,
    input  [3:0] b,
    input        cin,
    output [3:0] sum,
    output       cout
);
    wire c1, c2, c3;   // carries between the stages

    rca_full_adder fa0 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c1));
    rca_full_adder fa1 (.a(a[1]), .b(b[1]), .cin(c1),  .sum(sum[1]), .cout(c2));
    rca_full_adder fa2 (.a(a[2]), .b(b[2]), .cin(c2),  .sum(sum[2]), .cout(c3));
    rca_full_adder fa3 (.a(a[3]), .b(b[3]), .cin(c3),  .sum(sum[3]), .cout(cout));
endmodule