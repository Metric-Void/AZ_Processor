`define REG_NUM     32
`define REG_ADDR_W  5
`define RegAddrBus  4:0

`define CPU_IRQ_CH  8
`define ALU_OP_W    4
`define AluOpBus    3:0
`define ALU_OP_NOP  ALU_OP_W'h0
`define ALU_OP_AND  ALU_OP_W'h1
`define ALU_OP_OR   ALU_OP_W'h2
`define ALU_OP_XOR  ALU_OP_W'h3
`define ALU_OP_ADDS ALU_OP_W'h4
`define ALU_OP_ADDU ALU_OP_W'h5
`define ALU_OP_SUBS ALU_OP_W'h6
`define ALI_OP_SUBU ALU_OP_W'h7
`define ALU_OP_SHRL ALU_OP_W'h8
`define ALU_OP_SHLL ALU_OP_W'h9

`define MEM_OP_W    2
`define MemOpBus    1:0
`define MEM_OP_NOP  2'h0
`define MEM_OP_LDW  2'h1
`define MEM_OP_STW  2'h2

`define CTRL_OP_W   2
`define CtrlOpBus   1:0
`define CTRL_OP_NOP     2'h0
`define CTRL_OP_WRCR    2'h1
`define CTRL_OP_EXRT    2'h2

`define CPU_EXE_MODE_W  1
`define CpuExeModeBus   0:0
`define CPU_KERNEL_MODE 1'b0
`define CPU_USER_MODE   1'b1

`define CREG_ADDR_STATUS        5'h0
`define CREG_ADDR_PRE_STATUS    5'h1
`define CREG_ADDR_PC            5'h2
`define CREG_ADDR_EPC           5'h3
`define CREG_ADDR_EXP_VECTOR    5'h4
`define CREG_ADDR_CAUSE         5'h5
`define CREG_ADDR_INT_MASK      5'h6
`define CREG_ADDR_IRQ           5'h7
`define CREG_ADDR_ROM_SIZE      5'h1d
`define CREG_ADDR_SPM_SIZE      5'h1e
`define CREG_ADDR_CPU_INFO      5'h1f

`define CregExeModeLoc          0
`define CregIntEnableLoc        1
`define CregExpCodeLoc          2:0
`define CregDlyFlagLoc          3

`define BusIfStateBus           1:0
`define BUS_IF_STATE_IDLE       2'h0
`define BUS_IF_STATE_REQ        2'h1
`define BUS_IF_STATE_ACCESS     2'h2
`define BUS_IF_STATE_STALL      2'h3

`define RESET_VECTOR            30'h0
`define ShAmountBus             4:0
`define ShAmountLoc             4:0
`define RELEASE_YEAR            8`d48
`define RELEASE_MONTH           8`d9
`define RELEASE_VERSION         8'd1
`define RELEASE_REVISION        8'd0