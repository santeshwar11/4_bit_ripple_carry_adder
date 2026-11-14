`timescale 1ns / 1ps

// Self-checking testbench: tries every combination of
// a (16 values) x b (16 values) x cin (2 values) = 512 cases.
module tb_ripple_adder_4bit;

    reg  [3:0] a, b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;

    ripple_adder_4bit uut (
        .a(a), .b(b), .cin(cin),
        .sum(sum), .cout(cout)
    );

    integer i;
    integer errors;
    reg [4:0] expected;   // {carry, sum}

    initial begin
        errors = 0;

        for (i = 0; i < 512; i = i + 1) begin
            {a, b, cin} = i[8:0];
            #1;
            expected = a + b + cin;

            if ({cout, sum} !== expected) begin
                $display("ERROR: a=%0d b=%0d cin=%b -> got %0d, expected %0d",
                         a, b, cin, {cout, sum}, expected);
                errors = errors + 1;
            end
        end

        if (errors == 0)
            $display("PASS: all 512 combinations are correct.");
        else
            $display("FAIL: %0d error(s) found.", errors);

        $finish;
    end

endmodule