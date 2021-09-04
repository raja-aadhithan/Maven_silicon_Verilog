module sr(input s,r,output q,qb);
nor(q,s,qb);
nor(qb,r,q);
endmodule