module unpacked_array_initial;

/*
Array assignment patterns (1) have the advantage that they can be used to create assignment pattern expressions of selfdetermined type by prefixing the pattern with a type name. Furthermore, items in an assignment pattern can be replcated using syntax such as '{ n{element}  }, and can be defaulted using the default: syntax. However, every element item in an array assignment pattern must be of the same type as the element type of the target array. By contrast, unpacked array concatenations (2) forbid replication, defaulting and explicit typing, but they offer the additional flexibility of composing an array value from an arbitrary mix of elements and arrays.
*/

//basic
int n1[1:2] = {0,1}; //unpacked array
int n11[1:2] = '{default:1}; // unpacked array using default
int n2[1:2] = '{0,1}; // unpacked array
int n3[1:2] = {2{1}}; // unpacked array
int n4[1:2] = '{2{1}}; // unpacked array
int n5[1:2][1:3] = '{{0,1,2},{0,1,2}}; // unpacked array

//repeate
int n6[1:2][1:6] = '{2{'{3{4,5}}}}; //right -> {2{'{4,4,4}}} -> {{4,4,4,},{4,4,4}}
//  int n6[1:2][1:6] = '{2{{3{4,5}}}}; //illegal, {3{4}} without ', is a packed array
//  int n6[1:2][1:3] = '{2{'{3{4,5}}}}; //illegal,  need 3, but given 6 -> 4,5,4,5,4,5

initial begin
  $display("bit of n1 %d", $bits(n1[1]));
  $display("bit of n11 %d", $bits(n11[1]));
  $display("bit of n2 %d", $bits(n2[1]));
  $display("bit of n3 %d", $bits(n3[1]));
  $display("bit of n4 %d", $bits(n4[1]));
  $display("bit of n5 %d", $bits(n5[1][1]));
  $display("bit of n6 %d", $bits(n6[2][6]));
end

endmodule
