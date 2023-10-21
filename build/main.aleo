// The 'hackathon_homedao.aleo' program.
program hackathon_homedao.aleo;

function hello:
    input r0 as u32.public;
    input r1 as u32.private;
    add r0 r1 into r2;
    output r2 as u32.private;
