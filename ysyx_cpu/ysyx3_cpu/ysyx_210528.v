

`define YSYX210528_RstEnable       1'b1
`define YSYX210528_RstDisable      1'b0

`define YSYX210528_ZeroWord        64'h0000_0000_0000_0000

`define YSYX210528_WriteEnable     1'b1
`define YSYX210528_WriteDisable    1'b0

`define YSYX210528_ReadEnable      1'b1
`define YSYX210528_ReadDisable     1'b0

`define YSYX210528_InstValid       1'b0
`define YSYX210528_InstInvalid     1'b1

`define YSYX210528_ChipEnable      1'b1
`define YSYX210528_ChipDisable     1'b0

`define YSYX210528_FlushEnable     1'b1
`define YSYX210528_FlushDisable    1'b0

`define YSYX210528_Stop            1'b1
`define YSYX210528_NoStop          1'b0

`define YSYX210528_ADDR_START   64'h0000_0000_3000_0000

//*************** defines about inst bus ***************
`define YSYX210528_InstAddrBus     63:0
`define YSYX210528_InstBus         31:0

//*************** defines about data bus ***************
`define YSYX210528_DataAddrBus     63:0
`define YSYX210528_DataBus         63:0


//*************** defines about regfile ***************
`define YSYX210528_RegAddrBus      4 :0
`define YSYX210528_RegBus          63:0
                                                         
//*************** defines about instructions ***************

// Integer Computational Instructions
`define YSYX210528_INST_ADDI      8'b0000_0001
`define YSYX210528_INST_SLTI      8'b0000_0010
`define YSYX210528_INST_SLTIU     8'b0000_0100
`define YSYX210528_INST_XORI      8'b0000_1000
`define YSYX210528_INST_ORI       8'b0001_0000
`define YSYX210528_INST_ANDI      8'b0010_0000
`define YSYX210528_INST_SLLI      8'b0100_0000
`define YSYX210528_INST_SRLI      8'b1000_0000
`define YSYX210528_INST_SRAI      8'b0000_0011

`define YSYX210528_INST_ADD       8'b0000_1100
`define YSYX210528_INST_SUB       8'b0011_0000
`define YSYX210528_INST_SLL       8'b1100_0000
`define YSYX210528_INST_SLT       8'b0000_0101
`define YSYX210528_INST_SLTU      8'b0000_1010
`define YSYX210528_INST_XOR       8'b0101_0000
`define YSYX210528_INST_SRL       8'b1010_0000      
`define YSYX210528_INST_SRA       8'b0001_0001
`define YSYX210528_INST_OR        8'b0010_0010
`define YSYX210528_INST_AND       8'b0100_0100

`define YSYX210528_INST_LUI       8'b1000_1000
`define YSYX210528_INST_AUIPC     8'b1000_0001

`define YSYX210528_INST_ADDIW     8'b0001_1000
`define YSYX210528_INST_SLLIW     8'b0000_1001
`define YSYX210528_INST_SRLIW     8'b1001_0000
`define YSYX210528_INST_SRAIW     8'b0000_0110

`define YSYX210528_INST_ADDW     8'b0110_0000
`define YSYX210528_INST_SUBW     8'b0010_0001
`define YSYX210528_INST_SLLW     8'b0001_0010
`define YSYX210528_INST_SRLW     8'b1000_0100
`define YSYX210528_INST_SRAW     8'b0100_1000


// Control Transfer Instructions
`define YSYX210528_INST_JAL       8'b0100_0010
`define YSYX210528_INST_JALR      8'b0010_0100

`define YSYX210528_INST_BEQ       8'b0000_0001
`define YSYX210528_INST_BNE       8'b0000_0010
`define YSYX210528_INST_BLT       8'b0000_0100
`define YSYX210528_INST_BGE       8'b0000_1000
`define YSYX210528_INST_BLTU      8'b0001_0000
`define YSYX210528_INST_BGEU      8'b0010_0000

// CSR Instructions
`define YSYX210528_INST_CSRRW     8'b0100_0000
`define YSYX210528_INST_CSRRS     8'b1000_0000
`define YSYX210528_INST_CSRRC     8'b0000_0001
`define YSYX210528_INST_CSRRWI    8'b0000_0010
`define YSYX210528_INST_CSRRSI    8'b0000_0100
`define YSYX210528_INST_CSRRCI    8'b0000_1000

// Priviledge Instructions
`define YSYX210528_INST_ECALL     8'b0001_0000
`define YSYX210528_INST_MRET      8'b0010_0000


//*************** defines about opcode ***************
// Integer Computational Instructions
`define YSYX210528_INT_REG_IMM    5'b00100
`define YSYX210528_INT_REG_IMM_W  5'b00110

`define YSYX210528_INT_REG_REG    5'b01100
`define YSYX210528_INT_REG_REG_W  5'b01110
`define YSYX210528_INT_LUI        5'b01101
`define YSYX210528_INT_AUIPC      5'b00101
// Control Transfer Instructions
`define YSYX210528_JUMP_JAL       5'b11011
`define YSYX210528_JUMP_JALR      5'b11001
`define YSYX210528_BRANCH         5'b11000

// Load and Store Instructions
`define YSYX210528_LOAD           5'b00000
`define YSYX210528_STORE          5'b01000

// CSR Instructions
`define YSYX210528_SYSTEM         5'b11100


//*************** defines about funct3 ***************
`define YSYX210528_LB_SEL         3'b000
`define YSYX210528_LH_SEL         3'b001
`define YSYX210528_LW_SEL         3'b010
`define YSYX210528_LBU_SEL        3'b100
`define YSYX210528_LHU_SEL        3'b101
`define YSYX210528_LWU_SEL        3'b110
`define YSYX210528_LD_SEL         3'b011

`define YSYX210528_SB_SEL         3'b000
`define YSYX210528_SH_SEL         3'b001
`define YSYX210528_SW_SEL         3'b010
`define YSYX210528_SD_SEL         3'b011


//********** defines about mem mapped address **********
`define YSYX210528_MTIMECMP_ADDR  64'h0000_0000_0200_4000
`define YSYX210528_MTIME_ADDR     64'h0000_0000_0200_BFF8

`define YSYX210528_UART_ADDR_START     64'h0000_0000_1000_0000
`define YSYX210528_UART_ADDR_END       64'h0000_0000_1000_0FFF

`define YSYX210528_SPI_CTRL_START      64'h0000_0000_1000_1000
`define YSYX210528_SPI_CTRL_END        64'h0000_0000_1000_1FFF

`define YSYX210528_FLASH_ADDR_START    64'h0000_0000_3000_0000
`define YSYX210528_FLASH_ADDR_END      64'h0000_0000_3FFF_FFFF


//*************** defines about AXI4 ***************
// axi burst types
`define YSYX210528_AXI_BURST_TYPE_FIXED               2'b00
`define YSYX210528_AXI_BURST_TYPE_INCR                2'b01
`define YSYX210528_AXI_BURST_TYPE_WRAP                2'b10

// axi burst size
`define YSYX210528_AXI_SIZE_BYTES_1                   3'b000
`define YSYX210528_AXI_SIZE_BYTES_2                   3'b001
`define YSYX210528_AXI_SIZE_BYTES_4                   3'b010
`define YSYX210528_AXI_SIZE_BYTES_8                   3'b011
`define YSYX210528_AXI_SIZE_BYTES_16                  3'b100
`define YSYX210528_AXI_SIZE_BYTES_32                  3'b101
`define YSYX210528_AXI_SIZE_BYTES_64                  3'b110
`define YSYX210528_AXI_SIZE_BYTES_128                 3'b111

//axi signals bus 
`define YSYX210528_AXI_AxID_BUS                       3:0
`define YSYX210528_AXI_AxADDR_BUS                     63:0
`define YSYX210528_AXI_AxLEN_BUS                      7:0
`define YSYX210528_AXI_AxSIZE_BUS                     2:0
`define YSYX210528_AXI_AxBURST_BUS                    1:0
`define YSYX210528_AXI_AxCACHE_BUS                    3:0  
`define YSYX210528_AXI_AxPROT_BUS                     2:0
`define YSYX210528_AXI_AxQOS_BUS                      3:0
`define YSYX210528_AXI_AxREGION_BUS                   3:0

`define YSYX210528_AXI_xID_BUS                        3:0
`define YSYX210528_AXI_xDATA_BUS                      63:0
`define YSYX210528_AXI_WSTRB_BUS                      7:0
`define YSYX210528_AXI_xRESP_BUS                      1:0



module ysyx_210528_axi_splt #(
    parameter AW = 64,
    parameter DW = 64,
    parameter ID_W = 4,
    parameter SPLT_NUM = 3,
    parameter SPLT_PTR_W = 2

)(

    input wire [SPLT_NUM-1:0]     w_splt_indic,
    input wire [SPLT_NUM-1:0]     r_splt_indic,
    //----------- AXI Interface Signals To Or From Master ----------
    // write address channel 
    input  wire [ID_W-1:0]        m_aw_id,
    input  wire [AW-1  :0]        m_aw_addr,
    input  wire [7:0]             m_aw_len,
    input  wire [2:0]             m_aw_size,
    input  wire [1:0]             m_aw_burst,
    input  wire [3:0]             m_aw_cache,
    input  wire [2:0]             m_aw_prot,
    input  wire [3:0]             m_aw_qos,
    input  wire                   m_aw_valid,
    output wire                   m_aw_ready,
                                  
                                   
    // write data channel   
    input  wire [DW-1  :0]        m_w_data,
    input  wire [DW/8-1:0]        m_w_strb,
    input  wire                   m_w_last,
    input  wire                   m_w_valid,
    output wire                   m_w_ready,
                          
    // write response channel 
    output wire [ID_W-1:0]        m_b_id,
    output wire [1:0]             m_b_resp,
    output wire                   m_b_valid,
    input  wire                   m_b_ready,
                                  
    // read address channel  
    input wire [ID_W-1:0]         m_ar_id,
    input wire [AW-1  :0]         m_ar_addr,
    input wire [7:0]              m_ar_len,
    input wire [2:0]              m_ar_size,
    input wire [1:0]              m_ar_burst,
    input wire [3:0]              m_ar_cache,
    input wire [2:0]              m_ar_prot,
    input wire [3:0]              m_ar_qos,
    input wire                    m_ar_valid,
    output  wire                  m_ar_ready,

    // read data channel  
    output wire [ID_W-1:0]        m_r_id,
    output wire [DW-1  :0]        m_r_data,
    output wire [1:0]             m_r_resp,
    output wire                   m_r_last,
    output wire                   m_r_valid,
    input wire                    m_r_ready,

    //----------- AXI Interface Signals To Or From Slave ----------
    // write address channel 
    output  wire [ID_W*SPLT_NUM-1:0]   s_aw_id_bus,
    output  wire [AW*SPLT_NUM-1  :0]   s_aw_addr_bus,
    output  wire [8*SPLT_NUM-1   :0]   s_aw_len_bus,
    output  wire [3*SPLT_NUM-1   :0]   s_aw_size_bus,
    output  wire [2*SPLT_NUM-1   :0]   s_aw_burst_bus,
    output  wire [4*SPLT_NUM-1   :0]   s_aw_cache_bus,
    output  wire [3*SPLT_NUM-1   :0]   s_aw_prot_bus,
    output  wire [4*SPLT_NUM-1   :0]   s_aw_qos_bus,
    output  wire [1*SPLT_NUM-1   :0]   s_aw_valid_bus,
    input   wire [1*SPLT_NUM-1   :0]   s_aw_ready_bus,
                                       
                                       
    // write data channel              
    output  wire [DW*SPLT_NUM-1  :0]   s_w_data_bus,
    output  wire [(DW/8)*SPLT_NUM-1:0] s_w_strb_bus,
    output  wire [1*SPLT_NUM-1   :0]   s_w_last_bus,
    output  wire [1*SPLT_NUM-1   :0]   s_w_valid_bus,
    input   wire [1*SPLT_NUM-1   :0]   s_w_ready_bus,
                                    
    // write response channel 
    input   wire [ID_W*SPLT_NUM-1:0]   s_b_id_bus,
    input   wire [2*SPLT_NUM-1   :0]   s_b_resp_bus,
    input   wire [1*SPLT_NUM-1   :0]   s_b_valid_bus,
    output  wire [1*SPLT_NUM-1   :0]   s_b_ready_bus,
                                       
    // read address channel            
    output  wire [ID_W*SPLT_NUM-1:0]   s_ar_id_bus,
    output  wire [AW*SPLT_NUM-1  :0]   s_ar_addr_bus,
    output  wire [8*SPLT_NUM-1   :0]   s_ar_len_bus,
    output  wire [3*SPLT_NUM-1   :0]   s_ar_size_bus,
    output  wire [2*SPLT_NUM-1   :0]   s_ar_burst_bus,
    output  wire [4*SPLT_NUM-1   :0]   s_ar_cache_bus,
    output  wire [3*SPLT_NUM-1   :0]   s_ar_prot_bus,
    output  wire [4*SPLT_NUM-1   :0]   s_ar_qos_bus,
    output  wire [1*SPLT_NUM-1   :0]   s_ar_valid_bus,
    input   wire [1*SPLT_NUM-1   :0]   s_ar_ready_bus,

    // read data channel  
    input  wire [ID_W*SPLT_NUM-1  :0]   s_r_id_bus,
    input  wire [DW*SPLT_NUM-1    :0]   s_r_data_bus,
    input  wire [2*SPLT_NUM-1     :0]   s_r_resp_bus,
    input  wire [1*SPLT_NUM-1     :0]   s_r_last_bus,
    input  wire [1*SPLT_NUM-1     :0]   s_r_valid_bus,
    output wire [1*SPLT_NUM-1     :0]   s_r_ready_bus

    );


    // write address channel
    wire [ID_W-1:0]        s_aw_id   [SPLT_NUM-1:0];
    wire [AW-1  :0]        s_aw_addr [SPLT_NUM-1:0];
    wire [7:0]             s_aw_len  [SPLT_NUM-1:0];
    wire [2:0]             s_aw_size [SPLT_NUM-1:0];
    wire [1:0]             s_aw_burst[SPLT_NUM-1:0];
    wire [3:0]             s_aw_cache[SPLT_NUM-1:0];
    wire [2:0]             s_aw_prot [SPLT_NUM-1:0];
    wire [3:0]             s_aw_qos  [SPLT_NUM-1:0];
    wire [SPLT_NUM-1:0]    s_aw_valid;
    wire [SPLT_NUM-1:0]    s_aw_ready;                              
    // write data channel   
    wire [DW-1  :0]        s_w_data [SPLT_NUM-1:0];
    wire [DW/8-1:0]        s_w_strb [SPLT_NUM-1:0];
    wire                   s_w_last [SPLT_NUM-1:0];
    wire                   s_w_valid[SPLT_NUM-1:0];
    wire                   s_w_ready[SPLT_NUM-1:0];
                          
    // write response channel 
    wire [ID_W-1:0]        s_b_id   [SPLT_NUM-1:0];
    wire [1:0]             s_b_resp [SPLT_NUM-1:0];
    wire                   s_b_valid[SPLT_NUM-1:0];
    wire                   s_b_ready[SPLT_NUM-1:0];
                                  
    // read address channel  
    wire [ID_W-1:0]        s_ar_id   [SPLT_NUM-1:0];
    wire [AW-1  :0]        s_ar_addr [SPLT_NUM-1:0];
    wire [7:0]             s_ar_len  [SPLT_NUM-1:0];
    wire [2:0]             s_ar_size [SPLT_NUM-1:0];
    wire [1:0]             s_ar_burst[SPLT_NUM-1:0];
    wire [3:0]             s_ar_cache[SPLT_NUM-1:0];
    wire [2:0]             s_ar_prot [SPLT_NUM-1:0];
    wire [3:0]             s_ar_qos  [SPLT_NUM-1:0];
    wire                   s_ar_valid[SPLT_NUM-1:0];
    wire                   s_ar_ready[SPLT_NUM-1:0];

    // read data channel  
    wire [ID_W-1:0]        s_r_id   [SPLT_NUM-1:0];
    wire [DW-1  :0]        s_r_data [SPLT_NUM-1:0];
    wire [1:0]             s_r_resp [SPLT_NUM-1:0];
    wire                   s_r_last [SPLT_NUM-1:0];
    wire                   s_r_valid[SPLT_NUM-1:0];
    wire                   s_r_ready[SPLT_NUM-1:0];

    reg m_aw_ready_pre;
    reg m_w_ready_pre;
    reg m_ar_ready_pre;

    reg [SPLT_PTR_W-1:0] w_resp_ptr;
    reg [SPLT_PTR_W-1:0] r_resp_ptr;
    

    integer j;
    genvar  i;
    generate
        if(SPLT_NUM == 1) begin: splt_num_eq_1_gen
            // write address
            assign s_aw_id_bus      = m_aw_id;
            assign s_aw_addr_bus    = m_aw_addr;
            assign s_aw_len_bus     = m_aw_len;
            assign s_aw_size_bus    = m_aw_size;
            assign s_aw_burst_bus   = m_aw_burst;
            assign s_aw_cache_bus   = m_aw_cache;
            assign s_aw_prot_bus    = m_aw_prot;
            assign s_aw_qos_bus     = m_aw_qos;
            assign s_aw_valid_bus   = m_aw_valid;
            //
            assign m_aw_ready       = s_aw_ready_bus;


            // write data
            assign s_w_data_bus     = m_w_data;
            assign s_w_strb_bus     = m_w_strb;
            assign s_w_last_bus     = m_w_last;
            assign s_w_valid_bus    = m_w_valid;
            //
            assign m_w_ready        = s_w_ready_bus;

            // write response
            assign m_b_id           = s_b_id_bus;
            assign m_b_resp         = s_b_resp_bus;
            assign m_b_valid        = s_b_valid_bus;
            //
            assign s_b_ready_bus    = m_b_ready;

            // read address
            assign s_ar_id_bus      = m_ar_id;
            assign s_ar_addr_bus    = m_ar_addr;
            assign s_ar_len_bus     = m_ar_len;
            assign s_ar_size_bus    = m_ar_size;
            assign s_ar_burst_bus   = m_ar_burst;
            assign s_ar_cache_bus   = m_ar_cache;
            assign s_ar_prot_bus    = m_ar_prot;
            assign s_ar_qos_bus     = m_ar_qos;
            assign s_ar_valid_bus   = m_ar_valid;
            //
            assign m_ar_ready       = s_ar_ready_bus;

            // read data
            assign m_r_id           = s_r_id_bus;
            assign m_r_data         = s_r_data_bus;
            assign m_r_resp         = s_r_resp_bus;
            assign m_r_last         = s_r_last_bus;
            assign m_r_valid        = s_r_valid_bus;
            //
            assign s_r_ready_bus    = m_r_ready;
        end
        else begin :splt_num_gt_1_gen0
            for(i = 0; i < SPLT_NUM; i=i+1) begin: splt_num_gt_1_gen1
                assign s_aw_id_bus   [ID_W *(i+1)-1 : i*ID_W]  = s_aw_id   [i];
                assign s_aw_addr_bus [AW   *(i+1)-1 : i*AW  ]  = s_aw_addr [i];
                assign s_aw_len_bus  [8    *(i+1)-1 : i*8   ]  = s_aw_len  [i];
                assign s_aw_size_bus [3    *(i+1)-1 : i*3   ]  = s_aw_size [i];
                assign s_aw_burst_bus[2    *(i+1)-1 : i*2   ]  = s_aw_burst[i];
                assign s_aw_cache_bus[4    *(i+1)-1 : i*4   ]  = s_aw_cache[i];
                assign s_aw_prot_bus [3    *(i+1)-1 : i*3   ]  = s_aw_prot [i];
                assign s_aw_qos_bus  [4    *(i+1)-1 : i*4   ]  = s_aw_qos  [i];
                assign s_aw_valid_bus[i]                       = s_aw_valid[i];
                assign s_aw_ready[i]                           = s_aw_ready_bus[i];
                                                             
                assign s_w_data_bus  [DW   *(i+1)-1 : i*DW   ] = s_w_data  [i];
                assign s_w_strb_bus  [(DW/8)*(i+1)-1:i*(DW/8)] = s_w_strb  [i];
                assign s_w_last_bus  [i]                       = s_w_last  [i];      
                assign s_w_valid_bus [i]                       = s_w_valid [i];
                assign s_w_ready     [i]                       = s_w_ready_bus [i];

                assign s_b_id[i]        = s_b_id_bus   [ID_W*(i+1)-1 :i*ID_W];   
                assign s_b_resp[i]      = s_b_resp_bus [2*(i+1)-1    :i*2   ];
                assign s_b_valid[i]     = s_b_valid_bus[i];
                assign s_b_ready_bus[i] = s_b_ready    [i];



                assign s_ar_id_bus   [ID_W *(i+1)-1 : i*ID_W]  = s_ar_id   [i];
                assign s_ar_addr_bus [AW   *(i+1)-1 : i*AW  ]  = s_ar_addr [i];
                assign s_ar_len_bus  [8    *(i+1)-1 : i*8   ]  = s_ar_len  [i];
                assign s_ar_size_bus [3    *(i+1)-1 : i*3   ]  = s_ar_size [i];
                assign s_ar_burst_bus[2    *(i+1)-1 : i*2   ]  = s_ar_burst[i];
                assign s_ar_cache_bus[4    *(i+1)-1 : i*4   ]  = s_ar_cache[i];
                assign s_ar_prot_bus [3    *(i+1)-1 : i*3   ]  = s_ar_prot [i];
                assign s_ar_qos_bus  [4    *(i+1)-1 : i*4   ]  = s_ar_qos  [i];
                assign s_ar_valid_bus[i]                       = s_ar_valid[i];
                assign s_ar_ready    [i]                       = s_ar_ready_bus[i];

                assign s_r_id[i]        = s_r_id_bus   [ID_W*(i+1)-1 :i*ID_W]; 
                assign s_r_data[i]      = s_r_data_bus [DW  *(i+1)-1 :i*DW  ];  
                assign s_r_resp[i]      = s_r_resp_bus [2*(i+1)-1    :i*2   ];
                assign s_r_last[i]      = s_r_last_bus [i];
                assign s_r_valid[i]     = s_r_valid_bus[i];
                assign s_r_ready_bus[i] = s_r_ready    [i];
            end

            //---------------------  Write Transaction Mux  --------------------
            // Write Address Channel
            always @(*) begin :m_aw_ready_gen0
                m_aw_ready_pre = 0;
                for(j=0; j<SPLT_NUM; j=j+1) begin :m_aw_ready_gen1
                    m_aw_ready_pre = m_aw_ready_pre | (w_splt_indic[j] & s_aw_ready[j]);
                end
            end
            assign m_aw_ready = m_aw_ready_pre;

            for (i=0 ;i < SPLT_NUM ;i=i+1 ) begin: signal_gen_0
                assign s_aw_valid[i] = m_aw_valid && w_splt_indic[i];

                assign s_aw_id   [i]   = {ID_W{s_aw_valid[i]}} & m_aw_id;
                assign s_aw_addr [i]   = {AW  {s_aw_valid[i]}} & m_aw_addr;
                assign s_aw_len  [i]   = {8   {s_aw_valid[i]}} & m_aw_len;
                assign s_aw_size [i]   = {3   {s_aw_valid[i]}} & m_aw_size;
                assign s_aw_burst[i]   = {2   {s_aw_valid[i]}} & m_aw_burst;
                assign s_aw_cache[i]   = {4   {s_aw_valid[i]}} & m_aw_cache;
                assign s_aw_prot [i]   = {3   {s_aw_valid[i]}} & m_aw_prot;
                assign s_aw_qos  [i]   = {4   {s_aw_valid[i]}} & m_aw_qos;
            end

            // Write Data Channel
            always @(*) begin:m_w_ready_gen0
                m_w_ready_pre = 0;
                for(j=0; j<SPLT_NUM; j=j+1) begin:m_w_ready_gen1
                    m_w_ready_pre = m_w_ready_pre | (w_splt_indic[j] & s_w_ready[j]);
                end
            end
            assign m_w_ready = m_w_ready_pre;

            for (i=0 ;i < SPLT_NUM ;i=i+1 ) begin :signal_gen_1
                assign s_w_valid[i] = m_w_valid && w_splt_indic[i];

                assign s_w_data [i]   = {DW     {s_w_valid[i]}} & m_w_data;
                assign s_w_strb [i]   = {(DW/8) {s_w_valid[i]}} & m_w_strb;
                assign s_w_last [i]   = {1      {s_w_valid[i]}} & m_w_last;
            end

            // Write Response Channel
            always @(*) begin:w_resp_ptr_gen0
                w_resp_ptr = 0;
                for(j = 0; j < SPLT_NUM; j=j+1) begin:w_resp_ptr_gen1
                    if(s_b_valid[j]) begin w_resp_ptr = j[SPLT_PTR_W-1:0]; end
                end
            end

            assign m_b_valid = s_b_valid[w_resp_ptr];
            assign m_b_id    = s_b_id   [w_resp_ptr];
            assign m_b_resp  = s_b_resp [w_resp_ptr];

            for (i = 0; i<SPLT_NUM; i=i+1 ) begin :s_b_ready_gen
                assign s_b_ready[i] = (w_resp_ptr==i) && m_b_ready;
            end

            //---------------------  Read Transaction Mux  ---------------------

            // Read Address Channel
            always @(*) begin:m_ar_ready_gen0
                m_ar_ready_pre = 1'b0;
                for(j=0; j < SPLT_NUM; j=j+1) begin:m_ar_ready_gen1
                    m_ar_ready_pre = m_ar_ready_pre | (r_splt_indic[j] & s_ar_ready[j]);
                end
            end
            assign m_ar_ready = m_ar_ready_pre;

            for (i=0; i < SPLT_NUM; i=i+1 ) begin: signal_gen_2
                assign s_ar_valid[i] = m_ar_valid && r_splt_indic[i];

                assign s_ar_id   [i]   = {ID_W{s_ar_valid[i]}} & m_ar_id;
                assign s_ar_addr [i]   = {AW  {s_ar_valid[i]}} & m_ar_addr;
                assign s_ar_len  [i]   = {8   {s_ar_valid[i]}} & m_ar_len;
                assign s_ar_size [i]   = {3   {s_ar_valid[i]}} & m_ar_size;
                assign s_ar_burst[i]   = {2   {s_ar_valid[i]}} & m_ar_burst;
                assign s_ar_cache[i]   = {4   {s_ar_valid[i]}} & m_ar_cache;
                assign s_ar_prot [i]   = {3   {s_ar_valid[i]}} & m_ar_prot;
                assign s_ar_qos  [i]   = {4   {s_ar_valid[i]}} & m_ar_qos;
            end

            // Read Data Response
            always @(*) begin:r_resp_ptr_gen0
                r_resp_ptr = 0;
                for(j = 0; j < SPLT_NUM; j=j+1) begin:r_resp_ptr_gen1
                    if(s_r_valid[j]) begin r_resp_ptr = j[SPLT_PTR_W-1:0]; end
                end
            end

            assign m_r_valid = s_r_valid[r_resp_ptr];

            assign m_r_id    = s_r_id   [r_resp_ptr];
            assign m_r_data  = s_r_data [r_resp_ptr];
            assign m_r_resp  = s_r_resp [r_resp_ptr];
            assign m_r_last  = s_r_last [r_resp_ptr];

            for (i = 0; i<SPLT_NUM; i=i+1 ) begin : s_r_ready_gen
                assign s_r_ready[i] = (r_resp_ptr==i) && m_r_ready;
            end
        end
    
    endgenerate

endmodule












// Access permissions
`define AXI_PROT_UNPRIVILEGED_ACCESS                        3'b000
`define AXI_PROT_PRIVILEGED_ACCESS                          3'b001
`define AXI_PROT_SECURE_ACCESS                              3'b000
`define AXI_PROT_NON_SECURE_ACCESS                          3'b010
`define AXI_PROT_DATA_ACCESS                                3'b000
`define AXI_PROT_INSTRUCTION_ACCESS                         3'b100

// Memory types (AR)
`define AXI_ARCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define AXI_ARCACHE_DEVICE_BUFFERABLE                       4'b0001
`define AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define AXI_ARCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define AXI_ARCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b1010
`define AXI_ARCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b1110
`define AXI_ARCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1010
`define AXI_ARCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define AXI_ARCACHE_WRITE_BACK_NO_ALLOCATE                  4'b1011
`define AXI_ARCACHE_WRITE_BACK_READ_ALLOCATE                4'b1111
`define AXI_ARCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1011
`define AXI_ARCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111

// Memory types (AW)
`define AXI_AWCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define AXI_AWCACHE_DEVICE_BUFFERABLE                       4'b0001
`define AXI_AWCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define AXI_AWCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define AXI_AWCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b0110
`define AXI_AWCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b0110
`define AXI_AWCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1110
`define AXI_AWCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define AXI_AWCACHE_WRITE_BACK_NO_ALLOCATE                  4'b0111
`define AXI_AWCACHE_WRITE_BACK_READ_ALLOCATE                4'b0111
`define AXI_AWCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1111
`define AXI_AWCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111

module ysyx_210528_biu (
    
    // Global AXI Signals
    input wire aclk,
    input wire aresetn,

    //---------- CPU Interface Signals ----------
    // signals from if module
    input wire [`YSYX210528_InstAddrBus]  if_inst_addr,
    input wire                 if_inst_ena,
    input wire                 if_inst_ready,

    output wire                if_inst_valid,
    output wire [`YSYX210528_InstBus]     if_inst,

    // signals from mem module
    input wire [`YSYX210528_DataAddrBus]  mem_data_addr,

    input wire [7:0]           mem_wmask,
    input wire [`YSYX210528_DataBus]      mem_wdata,
    input wire                 mem_we,
    output wire                mem_wfinish,

    output wire [`YSYX210528_DataBus]     mem_rdata,
    input wire                 mem_re,
    output wire                mem_rfinish,
    

    //----------- AXI Interface Signals ----------
    // write address channel
    output wire [`YSYX210528_AXI_AxID_BUS]      axi_aw_id,
    output wire [`YSYX210528_AXI_AxADDR_BUS]    axi_aw_addr,
    output wire [`YSYX210528_AXI_AxLEN_BUS]     axi_aw_len,
    output wire [`YSYX210528_AXI_AxSIZE_BUS]    axi_aw_size,
    output wire [`YSYX210528_AXI_AxBURST_BUS]   axi_aw_burst,
    //output wire                      axi_aw_lock,
    output wire [`YSYX210528_AXI_AxCACHE_BUS]   axi_aw_cache,
    output wire [`YSYX210528_AXI_AxPROT_BUS]    axi_aw_prot,
    output wire [`YSYX210528_AXI_AxQOS_BUS]     axi_aw_qos,
    //output wire [`YSYX210528_AXI_AxREGION_BUS]  axi_aw_region,
    //output wire                      axi_aw_user    
    output wire                      axi_aw_valid,
    input  wire                      axi_aw_ready,

    // write data channel
    output wire [`YSYX210528_AXI_xDATA_BUS]     axi_w_data,
    output wire [`YSYX210528_AXI_WSTRB_BUS]     axi_w_strb,
    output wire                      axi_w_last,
    //output wire                    axi_w_user
    output wire                      axi_w_valid,
    input  wire                      axi_w_ready,

    // write response channel
    input wire [`YSYX210528_AXI_xID_BUS]        axi_b_id,
    input wire [`YSYX210528_AXI_xRESP_BUS]      axi_b_resp,
    //input wire                     axi_b_user
    input  wire                      axi_b_valid,
    output wire                      axi_b_ready,

    // read address channel
    output wire [`YSYX210528_AXI_AxID_BUS]      axi_ar_id,
    output wire [`YSYX210528_AXI_AxADDR_BUS]    axi_ar_addr,
    output wire [`YSYX210528_AXI_AxLEN_BUS]     axi_ar_len,
    output wire [`YSYX210528_AXI_AxSIZE_BUS]    axi_ar_size,
    output wire [`YSYX210528_AXI_AxBURST_BUS]   axi_ar_burst,
    //output wire                    axi_ar_lock,
    output wire [`YSYX210528_AXI_AxCACHE_BUS]   axi_ar_cache,
    output wire [`YSYX210528_AXI_AxPROT_BUS]    axi_ar_prot,
    output wire [`YSYX210528_AXI_AxQOS_BUS]     axi_ar_qos,
    //output wire [`YSYX210528_AXI_AxREGION_BUS]  axi_ar_region,
    //output wire                    axi_aw_user    
    output wire                      axi_ar_valid,
    input  wire                      axi_ar_ready,

    // read data channel
    input wire [`YSYX210528_AXI_xID_BUS]        axi_r_id,
    input wire [`YSYX210528_AXI_xDATA_BUS]      axi_r_data,
    input wire [`YSYX210528_AXI_xRESP_BUS]      axi_r_resp,
    input wire                       axi_r_last,
    //input wire                     axi_r_user
    input wire                       axi_r_valid,
    output wire                      axi_r_ready

    );

    //-------------------- MMIO Address Recognition --------------------
    wire if_access_uart , if_access_spi_ctrl , if_access_spi_flash;
    wire mem_access_uart, mem_access_spi_ctrl, mem_access_spi_flash;

    assign if_access_uart       = (if_inst_addr >= `YSYX210528_UART_ADDR_START) && (if_inst_addr <= `YSYX210528_UART_ADDR_END);
    assign if_access_spi_ctrl   = (if_inst_addr >= `YSYX210528_SPI_CTRL_START ) && (if_inst_addr <= `YSYX210528_SPI_CTRL_END );
    assign if_access_spi_flash  = (if_inst_addr >= `YSYX210528_FLASH_ADDR_START) && (if_inst_addr <= `YSYX210528_FLASH_ADDR_END);

    assign mem_access_uart      = (mem_data_addr >= `YSYX210528_UART_ADDR_START) && (mem_data_addr <= `YSYX210528_UART_ADDR_END);
    assign mem_access_spi_ctrl  = (mem_data_addr >= `YSYX210528_SPI_CTRL_START ) && (mem_data_addr <= `YSYX210528_SPI_CTRL_END );
    assign mem_access_spi_flash = (mem_data_addr >= `YSYX210528_FLASH_ADDR_START) && (mem_data_addr <= `YSYX210528_FLASH_ADDR_END);

    wire if_access_apb  = (if_access_spi_ctrl  | if_access_spi_flash  | if_access_uart );
    wire mem_access_apb = (mem_access_spi_ctrl | mem_access_spi_flash | mem_access_uart);


    //-------------------- Write Transaction Control --------------------

    parameter [1:0] W_STATE_IDLE = 2'b00, W_STATE_W = 2'b01, W_STATE_AW = 2'b10, W_STATE_RESP = 2'b11;
    reg [1:0] wtrans_state, wtrans_nxt_state;

    wire aw_handshake = axi_aw_valid && axi_aw_ready;
    wire w_handshake  = axi_w_valid  && axi_w_ready;
    wire b_handshake  = axi_b_valid  && axi_b_ready && (axi_b_id == 4'b0000);
    wire b_success    = b_handshake  && (axi_b_resp == 2'b00);

    // generate next state
    always @(*) begin
        case(wtrans_state) 
            W_STATE_IDLE:begin
                if(aw_handshake && w_handshake)        begin wtrans_nxt_state = W_STATE_RESP; end
                else if(aw_handshake & (~w_handshake)) begin wtrans_nxt_state = W_STATE_W;    end
                else if((~aw_handshake) & w_handshake) begin wtrans_nxt_state = W_STATE_AW;   end
                else                                   begin wtrans_nxt_state = W_STATE_IDLE; end
            end
            W_STATE_W: begin
                if(w_handshake)                        begin wtrans_nxt_state = W_STATE_RESP; end
                else                                   begin wtrans_nxt_state = W_STATE_W;    end
            end
            W_STATE_AW: begin
                if(aw_handshake)                       begin wtrans_nxt_state = W_STATE_RESP; end
                else                                   begin wtrans_nxt_state = W_STATE_AW;   end
            end                                        
            W_STATE_RESP:begin                         
                if(b_success)                          begin wtrans_nxt_state = W_STATE_IDLE; end
                else if(b_handshake)                   begin wtrans_nxt_state = W_STATE_IDLE; end
                else                                   begin wtrans_nxt_state = W_STATE_RESP; end
            end
            default:                                   begin wtrans_nxt_state = W_STATE_IDLE; end
        endcase 
    end

    // state transition
    always @(posedge aclk) begin
        if(~aresetn) begin
            wtrans_state <= W_STATE_IDLE;
        end
        else begin
            wtrans_state <= wtrans_nxt_state;
        end
    end

    // generate output signals

    assign axi_aw_id     =  4'b0000;
    assign axi_aw_len    =  8'd0;
    assign axi_aw_size   =  mem_access_apb ? `YSYX210528_AXI_SIZE_BYTES_4 : `YSYX210528_AXI_SIZE_BYTES_8;  
    assign axi_aw_burst  =  `YSYX210528_AXI_BURST_TYPE_INCR;
    assign axi_aw_cache  =  `AXI_AWCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE;
    assign axi_aw_prot   =  `AXI_PROT_UNPRIVILEGED_ACCESS | `AXI_PROT_SECURE_ACCESS | `AXI_PROT_DATA_ACCESS;
    assign axi_aw_qos    =  4'h0;

    wire [63:0] aw_addr_temp = mem_access_apb ? {mem_data_addr[63:0]}:{mem_data_addr[63:3],3'b000};
    assign axi_aw_valid  = (wtrans_state == W_STATE_IDLE|wtrans_state==W_STATE_AW) ? mem_we: 1'b0;
    assign axi_aw_addr   = (wtrans_state == W_STATE_IDLE|wtrans_state==W_STATE_AW) ? aw_addr_temp:`YSYX210528_ZeroWord;


    assign axi_w_last    = 1'b1;
    //assign axi_w_user  = 0;
    assign axi_w_valid   = (wtrans_state == W_STATE_IDLE|wtrans_state==W_STATE_W) ? mem_we: 1'b0;
    assign axi_w_data    = (wtrans_state == W_STATE_IDLE|wtrans_state==W_STATE_W) ? mem_wdata:`YSYX210528_ZeroWord;

    assign axi_w_strb    = (wtrans_state == W_STATE_IDLE|wtrans_state == W_STATE_W) ? mem_wmask : 8'h00;

    assign axi_b_ready   = 1'b1;

    // mem_wfinish signal to mem
    assign mem_wfinish   = (wtrans_state == W_STATE_RESP) && b_handshake;



    //-------------------- Read Transaction Control --------------------

    wire mem_ar_valid,if_ar_valid;

    parameter R_STATE_IDLE = 2'b00, R_STATE_ADDR = 2'b01, R_STATE_DATA = 2'b10 ;
    reg [1:0] mem_rtrans_state, mem_rtrans_nxt_state;
    reg [1:0] if_rtrans_state,if_rtrans_nxt_state;

    wire mem_ar_handshake = mem_ar_valid && axi_ar_ready;
    wire if_ar_handshake  = if_ar_valid  && axi_ar_ready;

    wire r_handshake = axi_r_valid && axi_r_ready;
    wire mem_r_handshake;
    assign mem_r_handshake = axi_r_valid  && axi_r_ready && (axi_r_id == 4'b0001) && (axi_r_resp == 2'b00);

    wire if_r_handshake;
    assign if_r_handshake = r_handshake && (axi_r_id == 4'b0000) && (axi_r_resp == 2'b00);
    

    //generate mem_rtrans_nxt_state
    always @(*) begin
        case (mem_rtrans_state)
            R_STATE_IDLE: begin
                if(mem_ar_handshake)      begin mem_rtrans_nxt_state = R_STATE_DATA; end
                else if(mem_ar_valid)     begin mem_rtrans_nxt_state = R_STATE_ADDR; end
                else                      begin mem_rtrans_nxt_state = R_STATE_IDLE; end
            end 
            R_STATE_ADDR: begin
                if(mem_ar_handshake)      begin mem_rtrans_nxt_state = R_STATE_DATA; end
                else                      begin mem_rtrans_nxt_state = R_STATE_ADDR; end
                
            end
            R_STATE_DATA: begin
                if(mem_r_handshake && axi_r_last) begin
                    mem_rtrans_nxt_state = R_STATE_IDLE;
                end
                else begin
                    mem_rtrans_nxt_state = R_STATE_DATA;
                end
            end
            default: mem_rtrans_nxt_state = R_STATE_IDLE;
        endcase        
    end
    //generate if_rtrans_nxt_state
    always @(*) begin
        case (if_rtrans_state)
            R_STATE_IDLE: begin
                if(if_ar_handshake)      begin if_rtrans_nxt_state = R_STATE_DATA; end
                else if(if_ar_valid)     begin if_rtrans_nxt_state = R_STATE_ADDR; end
                else                     begin if_rtrans_nxt_state = R_STATE_IDLE; end
            end 
            R_STATE_ADDR: begin
                if(if_ar_handshake)      begin if_rtrans_nxt_state = R_STATE_DATA;  end
                else                     begin if_rtrans_nxt_state = R_STATE_ADDR;  end
            end
            R_STATE_DATA: begin
                if(if_r_handshake && axi_r_last) begin
                    if_rtrans_nxt_state = R_STATE_IDLE;
                end
                else begin
                    if_rtrans_nxt_state = R_STATE_DATA;
                end
            end
            default: begin if_rtrans_nxt_state = R_STATE_IDLE; end
        endcase        
    end

    // state transition
    always @(posedge aclk) begin
        if(~aresetn) begin
            mem_rtrans_state <= R_STATE_IDLE;
        end
        else begin
            mem_rtrans_state <= mem_rtrans_nxt_state;
        end   
    end

    always @(posedge aclk) begin
        if(~aresetn) begin
            if_rtrans_state <= R_STATE_IDLE;
        end
        else begin
            if_rtrans_state <= if_rtrans_nxt_state;
        end 
    end


    // generate output signals
    // signals declaration
    reg [31:0] if_inst_reg; //buffer for if_inst
    reg if_inst_valid_reg;  //buffer for if_inst

    assign mem_ar_valid   = (if_rtrans_state != R_STATE_ADDR) && (mem_rtrans_state != R_STATE_DATA) && mem_re;
    assign if_ar_valid    = ~mem_ar_valid && (if_rtrans_state != R_STATE_DATA) && if_inst_ena && ~if_inst_valid_reg;
    assign axi_ar_valid = mem_ar_valid | if_ar_valid;

    // read address channel output
    assign axi_ar_id    = mem_ar_valid ? 4'b0001 : (if_ar_valid ? 4'b0000 : 4'b0000);

    wire [63:0] data_addr_temp = mem_access_apb ? {mem_data_addr[63:0]} : {mem_data_addr[63:3],3'b000};
    wire [63:0] inst_addr_temp = if_access_apb  ? {if_inst_addr[63:0]} : {if_inst_addr[63:3],3'b000 };

    assign axi_ar_addr  = mem_ar_valid ? data_addr_temp : (if_ar_valid ? inst_addr_temp : 64'd0);
    assign axi_ar_len   = 8'd0;
    assign axi_ar_size  = ( (mem_ar_valid & mem_access_apb)|(if_ar_valid & if_access_apb) ) ? `YSYX210528_AXI_SIZE_BYTES_4: `YSYX210528_AXI_SIZE_BYTES_8;
    assign axi_ar_burst = `YSYX210528_AXI_BURST_TYPE_INCR;

    assign axi_ar_cache = `AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE;
    assign axi_ar_prot  = `AXI_PROT_UNPRIVILEGED_ACCESS | `AXI_PROT_SECURE_ACCESS | `AXI_PROT_DATA_ACCESS;
    assign axi_ar_qos   = 4'h0;

    // read data channel output
    assign axi_r_ready = 1'b1;


    // signals to mem and if
    assign mem_rfinish = mem_r_handshake ;
    assign mem_rdata   = axi_r_data ;


    wire [`YSYX210528_InstBus] if_inst_temp;
    wire if_inst_valid_temp;
    assign if_inst_temp = if_inst_addr[2] ? axi_r_data[63:32]:axi_r_data[31:0];
    assign if_inst_valid_temp = if_r_handshake;


    //buffer for if_inst
    always @(posedge aclk) begin
        if(~aresetn) begin
            if_inst_reg <= 32'd0;
            if_inst_valid_reg <= 1'b0;
        end
        else if(if_inst_valid_temp && ~if_inst_ready) begin
            if_inst_reg        <= if_inst_temp;
            if_inst_valid_reg  <= if_inst_valid_temp;
        end
        else if(if_inst_ready && if_inst_valid) begin
            if_inst_reg        <= 32'd0;
            if_inst_valid_reg  <= 1'b0;
        end
        else begin
            if_inst_reg        <= if_inst_reg;
            if_inst_valid_reg  <= if_inst_valid_reg;
        end
    end

    assign if_inst = if_inst_valid_temp ? if_inst_temp :
                     if_inst_valid_reg  ? if_inst_reg  :
                                                32'd0  ;
    assign if_inst_valid = if_inst_valid_reg | if_inst_valid_temp;

endmodule


module ysyx_210528_clint (
    input wire clk,
    input wire rst,
    //----------- AXI Interface Signals ----------
    // write address channel (slave)
    input  wire [`YSYX210528_AXI_AxID_BUS]        axi_aw_id,
    input  wire [`YSYX210528_AXI_AxADDR_BUS]      axi_aw_addr,
    input  wire [`YSYX210528_AXI_AxLEN_BUS]       axi_aw_len,
    input  wire [`YSYX210528_AXI_AxSIZE_BUS]      axi_aw_size,
    input  wire [`YSYX210528_AXI_AxBURST_BUS]     axi_aw_burst,
    input  wire                        axi_aw_valid,
    output wire                        axi_aw_ready,

    // write data channel   (slave)
    input  wire [`YSYX210528_AXI_xDATA_BUS]       axi_w_data,
    input  wire [`YSYX210528_AXI_WSTRB_BUS]       axi_w_strb,
    input  wire                        axi_w_last,
    input  wire                        axi_w_valid,
    output wire                        axi_w_ready,

    // write response channel (slave)
    output wire [`YSYX210528_AXI_xID_BUS]        axi_b_id,
    output wire [`YSYX210528_AXI_xRESP_BUS]      axi_b_resp,
    output wire                       axi_b_valid,
    input  wire                       axi_b_ready,

    // read address channel  (slave)
    input wire [`YSYX210528_AXI_AxID_BUS]        axi_ar_id,
    input wire [`YSYX210528_AXI_AxADDR_BUS]      axi_ar_addr,
    input wire [`YSYX210528_AXI_AxLEN_BUS]       axi_ar_len,
    input wire [`YSYX210528_AXI_AxSIZE_BUS]      axi_ar_size,
    input wire [`YSYX210528_AXI_AxBURST_BUS]     axi_ar_burst,
    input wire                        axi_ar_valid,
    output wire                       axi_ar_ready,
                                      
    // read data channel  (slave)
    output wire [`YSYX210528_AXI_xID_BUS]        axi_r_id,
    output wire [`YSYX210528_AXI_xDATA_BUS]      axi_r_data,
    output wire [`YSYX210528_AXI_xRESP_BUS]      axi_r_resp,
    output wire                       axi_r_last,
    output wire                       axi_r_valid,
    input wire                        axi_r_ready,
    
    //--------------- Interrupt Signals ---------------
    output wire                       timer_intr
    );

    reg [`YSYX210528_RegBus] csr_mtime, csr_mtimecmp;
    wire csr_mtime_ena, csr_mtimecmp_ena;
    wire [`YSYX210528_RegBus] mtime_nxt_value, mtimecmp_nxt_value;

    wire [`YSYX210528_RegBus] wmask = { {8{axi_w_strb[7]}}, {8{axi_w_strb[6]}}, {8{axi_w_strb[5]}},
                             {8{axi_w_strb[4]}}, {8{axi_w_strb[3]}}, {8{axi_w_strb[2]}},
                             {8{axi_w_strb[1]}}, {8{axi_w_strb[0]}} };
    
    assign mtime_nxt_value    = csr_mtime_ena    ? ( wmask & axi_w_data) : csr_mtime +64'd1;
    assign mtimecmp_nxt_value = csr_mtimecmp_ena ? ( wmask & axi_w_data) : csr_mtimecmp;

    always @(posedge clk) begin
        if(rst == `YSYX210528_RstEnable) begin
            csr_mtime <= `YSYX210528_ZeroWord;
        end
        else begin
            csr_mtime <= mtime_nxt_value;
        end
    end

    always @(posedge clk) begin
        if(rst == `YSYX210528_RstEnable) begin
            csr_mtimecmp <= `YSYX210528_ZeroWord;
        end
        else begin
            csr_mtimecmp <= mtimecmp_nxt_value;
        end
    end


    //------------------  Write Transaction Control ------------------

    parameter [1:0] W_STATE_IDLE = 2'b00, W_STATE_INFO = 2'b01, W_STATE_RESP = 2'b10;
    reg [1:0] wtrans_state, wtrans_nxt_state;

    // State Transition
    always @(posedge clk) begin
        if(rst == `YSYX210528_RstEnable) begin
            wtrans_state <= W_STATE_IDLE;
        end
        else begin
            wtrans_state <= wtrans_nxt_state;
        end 
    end

    // Generate Next State

    wire aw_handshake = axi_aw_ready && axi_aw_valid && (axi_aw_len == 8'd0) && (axi_aw_size == 3'b011) && (axi_aw_burst == 2'b01);
    wire w_handshake  = axi_w_ready  && axi_w_valid  && axi_w_last; 
    wire b_handshake  = axi_b_ready  && axi_b_valid ;

    assign csr_mtime_ena    = aw_handshake && w_handshake && (axi_aw_addr == `YSYX210528_MTIME_ADDR   );
    assign csr_mtimecmp_ena = aw_handshake && w_handshake && (axi_aw_addr == `YSYX210528_MTIMECMP_ADDR);


    always @(*) begin
        case(wtrans_state) 
            W_STATE_IDLE:begin
                if(aw_handshake && w_handshake)   begin wtrans_nxt_state = W_STATE_RESP; end
                else if(axi_aw_valid|axi_w_valid) begin wtrans_nxt_state = W_STATE_INFO; end
                else                              begin wtrans_nxt_state = W_STATE_IDLE; end
            end
            W_STATE_INFO: begin
                if(aw_handshake && w_handshake)   begin wtrans_nxt_state = W_STATE_RESP; end
                else                              begin wtrans_nxt_state = W_STATE_INFO; end
            end
            W_STATE_RESP:begin
                if(b_handshake)                   begin wtrans_nxt_state = W_STATE_IDLE; end
                else                              begin wtrans_nxt_state = W_STATE_RESP; end
            end
            default:                              begin wtrans_nxt_state = W_STATE_IDLE; end
        endcase 
    end


    // Generate Output Signals
    assign axi_aw_ready = axi_w_valid && axi_aw_valid;
    assign axi_w_ready  = axi_w_valid && axi_aw_valid;

    reg [`YSYX210528_AXI_xID_BUS] b_id_reg;
    always @(posedge clk) begin
        if (rst == `YSYX210528_RstEnable) begin
            b_id_reg    <= 4'd0;
        end
        else if (csr_mtimecmp_ena|csr_mtime_ena) begin
            b_id_reg    <= axi_aw_id;
        end
    end

    assign axi_b_id    = (wtrans_state == W_STATE_RESP) ? b_id_reg : 4'd0;
    assign axi_b_valid = (wtrans_state == W_STATE_RESP);
    assign axi_b_resp  = 2'b00;


                                       
    //-------------------  Read Transaction Control  -------------------
    parameter [1:0] R_STATE_IDLE = 2'b00, R_STATE_ADDR = 2'b01, R_STATE_DATA = 2'b10;
    reg [1:0] rtrans_state, rtrans_nxt_state;

    // State Transition
    always @(posedge clk) begin
        if(rst == `YSYX210528_RstEnable) begin
            rtrans_state <= R_STATE_IDLE;
        end
        else begin
            rtrans_state <= rtrans_nxt_state;
        end 
    end

    // Generate Next State

    wire ar_handshake = axi_ar_ready && axi_ar_valid && (axi_ar_len == 8'd0) && (axi_ar_size == 3'b011) && (axi_ar_burst == 2'b01);
    wire r_handshake  = axi_r_ready  && axi_r_valid ;
    always @(*) begin
        case (rtrans_state)
            R_STATE_IDLE: begin
                if(ar_handshake)      begin rtrans_nxt_state = R_STATE_DATA; end
                else if(axi_ar_valid) begin rtrans_nxt_state = R_STATE_ADDR; end
                else                  begin rtrans_nxt_state = R_STATE_IDLE; end
            end                       
                                      
            R_STATE_ADDR: begin       
                if(ar_handshake)      begin rtrans_nxt_state = R_STATE_DATA; end
                else                  begin rtrans_nxt_state = R_STATE_ADDR; end
            end
            R_STATE_DATA: begin
                if(r_handshake)       begin rtrans_nxt_state = R_STATE_IDLE; end
                else                  begin rtrans_nxt_state = R_STATE_DATA; end
            end
            default:                  begin rtrans_nxt_state = R_STATE_IDLE; end
        endcase       
    end

    wire mtime_rd_ena = ar_handshake && ( axi_ar_addr == `YSYX210528_MTIME_ADDR );
    wire mtimecmp_rd_ena = ar_handshake && ( axi_ar_addr == `YSYX210528_MTIMECMP_ADDR );

    reg [`YSYX210528_RegBus] r_data_reg;
    reg [3:0] r_id_reg;
    always @(posedge clk) begin
        if(rst == `YSYX210528_RstEnable) begin
            r_data_reg    <= 64'd0;
            r_id_reg      <= 4'b0000;
        end
        else if(mtime_rd_ena | mtimecmp_rd_ena)begin
            r_data_reg    <= mtime_rd_ena ? csr_mtime : csr_mtimecmp;
            r_id_reg      <= axi_ar_id;
        end
    end

    // Generate Output Signals
    assign axi_ar_ready = (rtrans_state == R_STATE_ADDR) | (rtrans_state == R_STATE_IDLE);

    assign axi_r_valid  = (rtrans_state == R_STATE_DATA);                    
    assign axi_r_id     = (rtrans_state == R_STATE_DATA) ? r_id_reg   : 4'd0;
    assign axi_r_data   = (rtrans_state == R_STATE_DATA) ? r_data_reg : 64'd0;
    assign axi_r_resp   = 2'b00;
    assign axi_r_last   = (rtrans_state == R_STATE_DATA) ? 1'b1       : 1'b0;

    //---------------  Timer Interrupt Signal    ---------------
    assign timer_intr  = (csr_mtime >= csr_mtimecmp);

endmodule





module ysyx_210528_csr (
    input wire clk,
    input wire rst,
    input [`YSYX210528_InstAddrBus] pc_i,

    input wire csr_wr_en,
    input wire csr_rd_en,
    input wire [11:0] csr_idx,

    input wire cmt_mret_ena,
    input wire ecall_trap_ena,
    input wire [`YSYX210528_RegBus]trap_mcause_value,

    input wire tmr_intr_ena,
    output wire tmr_trap_ena,

    output wire [`YSYX210528_RegBus] read_csr_data,
    input  wire [`YSYX210528_RegBus] wbck_csr_data,

    input  wire ex_stall
    );


    //-------------------- 0xB00 MRW mcycle --------------------
    wire sel_mcycle = (csr_idx == 12'hb00);
    wire rd_mcycle  = csr_rd_en && sel_mcycle;
    wire wr_mcycle  = csr_wr_en && sel_mcycle;
    reg [`YSYX210528_RegBus] csr_mcycle;
    always @(posedge clk) begin
        if(rst == `YSYX210528_RstEnable) begin
            csr_mcycle <= `YSYX210528_ZeroWord;
        end
        else if(wr_mcycle) begin
            csr_mcycle <= wbck_csr_data;
        end
        else begin
            csr_mcycle <= csr_mcycle + 64'd1;
        end
    end

    //-------------------- 0x300 MRW mstatus --------------------
    wire sel_mstatus = (csr_idx == 12'h300);
    wire rd_mstatus  = sel_mstatus && csr_rd_en;
    wire wr_mstatus  = sel_mstatus && csr_wr_en;


    reg csr_mstatus_mpie, csr_mstatus_mie;
    // Implement MPIE field
    wire mstatus_mpie_ena = 
                 // The CSR is written by CSR instruction
                 wr_mstatus   | 
                 // The MRET instruction commited
                 cmt_mret_ena | 
                 // The trap is taken
                 (ecall_trap_ena | tmr_trap_ena) ;
    
    wire mstatus_mpie_nxt = (ecall_trap_ena|tmr_trap_ena) ? csr_mstatus_mie :
                                             cmt_mret_ena ? 1'b1            :
                                               wr_mstatus ? wbck_csr_data[7]:
                                                            csr_mstatus_mpie;

    always @(posedge clk) begin
        if(rst == `YSYX210528_RstEnable) begin
            csr_mstatus_mpie <= 1'b0;
        end
        else if(mstatus_mpie_ena & ~ex_stall) begin //when ex is stall,don't change mpie
            csr_mstatus_mpie <= mstatus_mpie_nxt;
        end
        else begin
            csr_mstatus_mpie <= csr_mstatus_mpie;
        end
    end

    // Implement MIE field
    wire mstatus_mie_ena = mstatus_mpie_ena;

    wire mstatus_mie_nxt = (ecall_trap_ena|tmr_trap_ena) ? 1'b0            :
                                            cmt_mret_ena ? csr_mstatus_mpie:
                                              wr_mstatus ? wbck_csr_data[3]:
                                                           csr_mstatus_mie ;

    always @(posedge clk) begin
        if(rst == `YSYX210528_RstEnable) begin
            csr_mstatus_mie <= 1'b0;
        end 
        else if(mstatus_mie_ena & ~ex_stall) begin // when ex is stall,don't change mie
            csr_mstatus_mie <= mstatus_mie_nxt;
        end 
        else begin
            csr_mstatus_mie <= csr_mstatus_mie;
        end      
    end

    // Implement MPP Field
    reg [1:0] csr_mstatus_mpp;
    wire mstatus_mpp_ena = mstatus_mpie_ena;
    wire [1:0] mstatus_mpp_nxt = (ecall_trap_ena|tmr_trap_ena) ? 2'b11               :
                                                  cmt_mret_ena ? 2'b00               :
                                                    wr_mstatus ? wbck_csr_data[12:11]:
                                                                 csr_mstatus_mpp     ;
                                                     
    always @(posedge clk) begin
        if(rst == `YSYX210528_RstEnable) begin
            csr_mstatus_mpp <= 2'b00;
        end
        else if(mstatus_mpp_ena) begin
            csr_mstatus_mpp <= mstatus_mpp_nxt;
        end
        else begin
            csr_mstatus_mpp <= csr_mstatus_mpp;
        end
    end

    // Implement XS field
    wire [1:0] csr_mstatus_xs;
    // If no EAI coprocessor interface configured, the XS is just hardwired to 0
    assign csr_mstatus_xs = 2'b00;

    // Implement FS field
    reg [1:0] csr_mstatus_fs;
    // If no FPU configured, the FS is just hardwired to 0
    always @(posedge clk) begin
        if(rst == `YSYX210528_RstEnable) begin
            csr_mstatus_fs <= 2'b00;
        end
        else if(wr_mstatus) begin
            csr_mstatus_fs <= wbck_csr_data[14:13];
        end
        else begin
            csr_mstatus_fs <= csr_mstatus_fs;
        end
    end

    // Implement SD field
    wire csr_mstatus_sd = (csr_mstatus_xs == 2'b11) | (csr_mstatus_fs == 2'b11);
    

    // Pack the full mstatus register
    wire [`YSYX210528_RegBus] csr_mstatus;
    assign csr_mstatus[63]    = csr_mstatus_sd  ;   //SD
    assign csr_mstatus[62:36] = 27'd0           ;   //Reserved
    assign csr_mstatus[35:34] = 2'b00           ;   //SXL
    assign csr_mstatus[33:32] = 2'b00           ;   //UXL
    assign csr_mstatus[31:23] = 9'd0            ;   //Reserved
    assign csr_mstatus[22:17] = 6'd0            ;   //TSR--MPRV
    assign csr_mstatus[16:15] = csr_mstatus_xs  ;   //XS
    assign csr_mstatus[14:13] = csr_mstatus_fs  ;   //FS
    assign csr_mstatus[12:11] = csr_mstatus_mpp ;   //MPP
    assign csr_mstatus[10: 9] = 2'b00           ;   //Reserved
    assign csr_mstatus[8]     = 1'b0            ;   //SPP
    assign csr_mstatus[7]     = csr_mstatus_mpie;   //MPIE
    assign csr_mstatus[6]     = 1'b0            ;   //Reserved
    assign csr_mstatus[5]     = 1'b0            ;   //SPIE
    assign csr_mstatus[4]     = 1'b0            ;   //UPIE
    assign csr_mstatus[3]     = csr_mstatus_mie ;   //MIE
    assign csr_mstatus[2]     = 1'b0            ;   //Reserved
    assign csr_mstatus[1]     = 1'b0            ;   //SIE
    assign csr_mstatus[0]     = 1'b0            ;   //UIE


    //-------------------- 0x305 MRW mtvec --------------------
    wire sel_mtvec = (csr_idx == 12'h305);
    wire rd_mtvec  = (sel_mtvec && csr_rd_en) | ecall_trap_ena | tmr_trap_ena;
    wire wr_mtvec  = sel_mtvec && csr_wr_en;
    // implement base field
    reg [63:2] csr_mtvec_base;
    always @(posedge clk) begin
        if(rst == `YSYX210528_RstEnable) begin
            csr_mtvec_base <= 62'd0;
        end
        else if(wr_mtvec) begin
            csr_mtvec_base <= wbck_csr_data[63:2];
        end
        else begin
            csr_mtvec_base <= csr_mtvec_base;
        end
    end

    // implement mode field
    wire [1:0] csr_mtvec_mode;
    assign csr_mtvec_mode = 2'b00;
    // pack the full mtvec register 
    wire [`YSYX210528_RegBus] csr_mtvec;
    assign csr_mtvec = {csr_mtvec_base,csr_mtvec_mode};


    //-------------------- 0x341 MRW MEPC --------------------
    wire sel_mepc = (csr_idx == 12'h341);
    wire rd_mepc  = (sel_mepc && csr_rd_en)  | cmt_mret_ena;
    wire wr_mepc  = (sel_mepc && csr_wr_en)  | ecall_trap_ena | tmr_trap_ena;
    
    // implement base field
    reg [`YSYX210528_RegBus] csr_mepc;
    always @(posedge clk) begin
        if(rst == `YSYX210528_RstEnable) begin
            csr_mepc <= `YSYX210528_ZeroWord;
        end
        else if(wr_mepc) begin
            csr_mepc <= {wbck_csr_data[63:2],2'b00};
        end
        else begin
            csr_mepc <= csr_mepc;
        end
    end

    //-------------------- 0x342 MRW MCAUSE --------------------
    reg [`YSYX210528_RegBus] csr_mcause;
    wire sel_mcause = (csr_idx == 12'h342);
    wire rd_mcause  = sel_mcause && csr_rd_en;
    wire wr_mcause  = sel_mcause && csr_wr_en;
    wire csr_mcause_ena = wr_mcause | ecall_trap_ena | tmr_trap_ena;
    wire [`YSYX210528_RegBus]  csr_mcause_nxt = (ecall_trap_ena | tmr_trap_ena) ? trap_mcause_value:
                                                           wr_mcause ? wbck_csr_data    : 
                                                                       csr_mcause ;

    always @(posedge clk) begin
        if(rst == `YSYX210528_RstEnable) begin
            csr_mcause <= `YSYX210528_ZeroWord;
        end
        else if(csr_mcause_ena)begin
            csr_mcause <= csr_mcause_nxt;            
        end
        else begin
            csr_mcause <= csr_mcause;
        end
    end


    //-------------------- 0x304 MRW MIE --------------------
    wire sel_mie = (csr_idx == 12'h304);
    wire rd_mie  = sel_mie && csr_rd_en;
    wire wr_mie  = sel_mie && csr_wr_en;

    // implement mtie field
    reg csr_mie_mtie;
    always @(posedge clk) begin
        if(rst == `YSYX210528_RstEnable) begin
            csr_mie_mtie <= 1'b0;
        end
        else if(wr_mie) begin
            csr_mie_mtie <= wbck_csr_data[7];
        end
        else begin
            csr_mie_mtie <= csr_mie_mtie;
        end
    end

    // pack the full mie register
    wire [`YSYX210528_RegBus] csr_mie;
    assign csr_mie[6:0]  = 7'd0;
    assign csr_mie[7]    = csr_mie_mtie;
    assign csr_mie[63:8] = 56'd0;

    //-------------------- 0x344 MRW MIP --------------------
    wire sel_mip = (csr_idx == 12'h344);
    wire rd_mip  = sel_mip && csr_rd_en;

    // implement mtip field
    reg csr_mip_mtip;
    always @(posedge clk) begin
        if(rst == `YSYX210528_RstEnable) begin
            csr_mip_mtip <= 1'b0;
        end
        else begin
            csr_mip_mtip <= tmr_intr_ena;
        end
    end

    // pack the full mie register
    wire [`YSYX210528_RegBus] csr_mip;
    assign csr_mip[6:0]  = 7'd0;
    assign csr_mip[7]    = csr_mip_mtip;
    assign csr_mip[63:8] = 56'd0;

    // generate tmr_trap_ena
    assign tmr_trap_ena = csr_mip_mtip & csr_mstatus_mie & csr_mie_mtie && (pc_i != 64'd0);


    //-------------------- 0x340 MRW MSCRATCH  --------------------
    wire sel_mscratch = (csr_idx == 12'h340);
    wire rd_mscratch  = sel_mscratch && csr_rd_en;
    wire wr_mscratch  = sel_mscratch && csr_wr_en;
    reg [`YSYX210528_RegBus] csr_mscratch;

    always @(posedge clk) begin
        if(rst == `YSYX210528_RstEnable) begin
            csr_mscratch <= 64'd0;
        end
        else if(wr_mscratch) begin
            csr_mscratch <= wbck_csr_data;
        end
        else begin
            csr_mscratch <= csr_mscratch;
        end
    end


    //-------------------- 0x100 SRW SSTATUS --------------------
    wire sel_sstatus = (csr_idx == 12'h100);
    wire rd_sstatus  = sel_sstatus && csr_rd_en;
    wire [`YSYX210528_RegBus] csr_sstatus;
    assign csr_sstatus[63]    = (csr_mstatus_fs == 2'b11);
    assign csr_sstatus[62:15] = 48'd0;
    assign csr_sstatus[14:13] = csr_mstatus_fs;
    assign csr_sstatus[12: 0] = 13'd0;
    


    //-------------------- generate the Read path --------------------

    assign read_csr_data = 64'd0 | ({64{rd_mcycle}}  & csr_mcycle  )
                                 | ({64{rd_mstatus}} & csr_mstatus )
                                 | ({64{rd_mtvec}}   & csr_mtvec   )
                                 | ({64{rd_mepc}}    & csr_mepc    )
                                 | ({64{rd_mcause}}  & csr_mcause  )
                                 | ({64{rd_mie}}     & csr_mie     )
                                 | ({64{rd_mip}}     & csr_mip     )
                                 | ({64{rd_mscratch}}& csr_mscratch)
                                 | ({64{rd_sstatus}} & csr_sstatus );
                                 

endmodule



module ysyx_210528_ex_mem (
    input wire clk,
    input wire rst,
    input wire [4:0] stall_ctrl,
    // input signals
    input wire [7:0]          ex_inst_type,
    input wire                ex_rd_ena,
    input wire [`YSYX210528_RegBus]      ex_rd_data,
    input wire [`YSYX210528_RegAddrBus]  ex_rd_addr,

    input wire [2:0]          ex_ls_sel,
    input wire [`YSYX210528_DataAddrBus] ex_ls_addr,
    //output signals
    output reg [7:0]          mem_inst_type,
    output reg                mem_rd_ena,
    output reg [`YSYX210528_RegBus]      mem_rd_data,
    output reg [`YSYX210528_RegAddrBus]  mem_rd_addr,

    output reg [2:0]          mem_ls_sel,
    output reg [`YSYX210528_DataAddrBus] mem_ls_addr
    );

    always @(posedge clk) begin
        if(rst == `YSYX210528_RstEnable) begin
            mem_inst_type <= 8'd0;
            mem_rd_ena    <= 1'b0;
            mem_rd_data   <= `YSYX210528_ZeroWord;
            mem_rd_addr   <= 5'd0;
            mem_ls_sel    <= 3'd0;
            mem_ls_addr   <= `YSYX210528_ZeroWord;
        end
        else begin
            if(stall_ctrl[3] == `YSYX210528_NoStop && stall_ctrl[4] == `YSYX210528_NoStop) begin
                mem_inst_type <= ex_inst_type;
                mem_rd_ena    <= ex_rd_ena;
                mem_rd_data   <= ex_rd_data;
                mem_rd_addr   <= ex_rd_addr;
                mem_ls_sel    <= ex_ls_sel;
                mem_ls_addr   <= ex_ls_addr;
            end
            else if((stall_ctrl[2:0]==3'b111)&& stall_ctrl[3] == `YSYX210528_Stop&&stall_ctrl[4] == `YSYX210528_NoStop) begin
                mem_inst_type <= 8'd0;
                mem_rd_ena    <= 1'b0;
                mem_rd_data   <= `YSYX210528_ZeroWord;
                mem_rd_addr   <= 5'd0;
                mem_ls_sel    <= 3'd0;
                mem_ls_addr   <= `YSYX210528_ZeroWord;
            end
            else begin
                mem_inst_type <= mem_inst_type;
                mem_rd_ena    <= mem_rd_ena;
                mem_rd_data   <= mem_rd_data;
                mem_rd_addr   <= mem_rd_addr ;
                mem_ls_sel    <= mem_ls_sel;
                mem_ls_addr   <= mem_ls_addr;
            end
        end
    end

endmodule

module ysyx_210528_ex (
    input wire clk,
    input wire rst,
    input wire [`YSYX210528_InstAddrBus]pc_i,
    //input ports
    input wire [7:0] inst_type_i,
    input wire [7:0] inst_opcode_i,
    input wire [`YSYX210528_RegBus] op1_i,
    input wire [`YSYX210528_RegBus] op2_i,
    input wire rd_ena_i,
    input wire [`YSYX210528_RegAddrBus] rd_addr_i,

    input wire [2 :0] ls_sel_i,
    input wire [11:0] addr_offset_i,
    

    //output ports
    output wire [7:0] inst_type_o,
    output wire rd_ena_o,
    output wire [`YSYX210528_RegBus] rd_data_o,
    output wire [`YSYX210528_RegAddrBus] rd_addr_o,

    output wire [2 :0] ls_sel_o,
    output wire [`YSYX210528_DataAddrBus] ls_addr_o,

    output wire  ex_flush,
    output wire branch_pc_ena,
    output wire [`YSYX210528_InstAddrBus] branch_pc,

    // signals about ex_stall_req
    input  wire if_stall_req,
    output wire ex_stall_req,

    // interrupt signal
    input  wire timer_intr,
    input  wire ex_stall
    );

    reg [`YSYX210528_RegBus] exe_res;

    //********** execute the INST_SLTI INST_SLT **********
    wire [`YSYX210528_RegBus] op2_i_mux = ~op2_i + 64'd1; // one's complement of op2_i
    wire [`YSYX210528_RegBus] op1_sub_op2 = op1_i + op2_i_mux;

    //********** execute ADDXX **********
    wire [`YSYX210528_RegBus] op1_add_op2   = op1_i +op2_i;
    wire [`YSYX210528_RegBus] op1_addw_op2 = {{32{op1_add_op2[31]}},op1_add_op2[31:0]};

    //********** execute SLT SLTI **********
    //op1_ls_op2: op1 is less than op2 (signed)
    wire op1_ls_op2 = (op1_i[63] && ~op2_i[63])||(~op1_i[63] && ~op2_i[63] && op1_sub_op2[63])
                      ||(op1_i[63] && op2_i[63] && op1_sub_op2[63]);
    
    //********** execute SRAI SRA **********
    wire [`YSYX210528_RegBus] shift_res = ( { 64{op1_i[63]} }<<(7'd64-{1'b0,op2_i[5:0]}) )|( op1_i>>op2_i[5:0] );
    
    //********** execute SLLW SLLIW **********
    wire [31:0]    op1_sllw_op2 = op1_i[31:0] << op2_i[4:0];
    wire [`YSYX210528_RegBus] sllw_res     = {{32{op1_sllw_op2[31]}},op1_sllw_op2};

    //********** execute SRLIW SRLW **********
    wire [31:0]    op1_srlw_op2 = op1_i[31:0] >> op2_i[4:0];
    wire [`YSYX210528_RegBus] srlw_res     = {{32{op1_srlw_op2[31]}},op1_srlw_op2};

    //********** execute SRAIW SRAW **********
    wire [31:0]    op1_sraw_op2 = ( {32{op1_i[31]}}<<(6'd32-{1'b0,op2_i[4:0]}) )|( op1_i[31:0]>>op2_i[4:0] );
    wire [`YSYX210528_RegBus] sraw_res     = {{32{op1_sraw_op2[31]}},op1_sraw_op2};

    //********** execute SUBW       **********
    wire [31:0]    op1_subw_op2 = op1_i[31:0] - op2_i[31:0];
    wire [`YSYX210528_RegBus] subw_res     = {{32{op1_subw_op2[31]}},op1_subw_op2};


    //lui and auipc offset
    wire [`YSYX210528_RegBus] upper_imm = {{32{op2_i[19]}},op2_i[19:0],12'd0};

    always @(*) begin
        if(rst == `YSYX210528_RstEnable) begin exe_res = `YSYX210528_ZeroWord; end
        else begin
            case (inst_opcode_i)
                `YSYX210528_INST_ADDI, `YSYX210528_INST_ADD:  begin exe_res = op1_add_op2;              end 
                `YSYX210528_INST_SLTI, `YSYX210528_INST_SLT:  begin exe_res = {63'd0,op1_ls_op2};       end
                `YSYX210528_INST_SLTIU,`YSYX210528_INST_SLTU: begin exe_res = {63'd0,(op1_i < op2_i)};  end
                `YSYX210528_INST_XORI, `YSYX210528_INST_XOR:  begin exe_res = op1_i  ^  op2_i;          end
                `YSYX210528_INST_ORI , `YSYX210528_INST_OR :  begin exe_res = op1_i  |  op2_i;          end
                `YSYX210528_INST_ANDI, `YSYX210528_INST_AND:  begin exe_res = op1_i  &  op2_i;          end
                `YSYX210528_INST_SLLI, `YSYX210528_INST_SLL:  begin exe_res = op1_i <<  op2_i[5:0];     end
                `YSYX210528_INST_SRLI, `YSYX210528_INST_SRL:  begin exe_res = op1_i >>  op2_i[5:0];     end
                `YSYX210528_INST_SRAI, `YSYX210528_INST_SRA:  begin exe_res = shift_res;                end
                `YSYX210528_INST_SUB            :  begin exe_res = op1_sub_op2;              end
                `YSYX210528_INST_LUI,`YSYX210528_INST_AUIPC:  begin exe_res = op1_i + upper_imm;        end
                `YSYX210528_INST_JAL,`YSYX210528_INST_JALR:   begin exe_res = op2_i + 64'd4;            end
                `YSYX210528_INST_ADDIW,`YSYX210528_INST_ADDW: begin exe_res = op1_addw_op2;             end
                `YSYX210528_INST_SLLIW,`YSYX210528_INST_SLLW: begin exe_res = sllw_res;                 end
                `YSYX210528_INST_SRLIW,`YSYX210528_INST_SRLW: begin exe_res = srlw_res;                 end                     
                `YSYX210528_INST_SRAIW,`YSYX210528_INST_SRAW: begin exe_res = sraw_res;                 end
                `YSYX210528_INST_SUBW            : begin exe_res = subw_res;                 end
                default               : begin exe_res = `YSYX210528_ZeroWord;                end
            endcase
        end
    end


    // Conditional Branch
    reg ex_flush_branch;
    always @(*) begin
        if(~inst_type_i[2]) begin ex_flush_branch = `YSYX210528_FlushDisable;  end
        else begin
            case (inst_opcode_i)
                `YSYX210528_INST_BEQ  : begin ex_flush_branch = (op1_i == op2_i)  ? `YSYX210528_FlushDisable:`YSYX210528_FlushEnable; end 
                `YSYX210528_INST_BNE  : begin ex_flush_branch = (op1_i != op2_i)  ? `YSYX210528_FlushDisable:`YSYX210528_FlushEnable; end 
                `YSYX210528_INST_BLTU : begin ex_flush_branch = (op1_i <  op2_i)  ? `YSYX210528_FlushDisable:`YSYX210528_FlushEnable; end 
                `YSYX210528_INST_BGEU : begin ex_flush_branch = (op1_i >=  op2_i) ? `YSYX210528_FlushDisable:`YSYX210528_FlushEnable; end 
                `YSYX210528_INST_BLT  : begin ex_flush_branch = (  op1_ls_op2  )  ? `YSYX210528_FlushDisable:`YSYX210528_FlushEnable; end 
                `YSYX210528_INST_BGE  : begin ex_flush_branch = ( ~op1_ls_op2  )  ? `YSYX210528_FlushDisable:`YSYX210528_FlushEnable; end 
                default:     begin ex_flush_branch = `YSYX210528_FlushDisable;  end
            endcase
        end        
    end



    // CSR Instructions and Priviledge Instructions

    wire tmr_trap_ena; 
    reg ecall_trap_ena,cmt_mret_ena;
    reg  csr_wr_en, csr_rd_en;
    wire [11:0] csr_idx = inst_type_i[7] ? op2_i[11:0] : 12'd0;
    wire [`YSYX210528_RegBus] read_csr_data ;
    reg  [`YSYX210528_RegBus] wbck_csr_data ;
    reg  [`YSYX210528_RegBus] trap_mcause_value;

    wire trap_ena = ecall_trap_ena | (tmr_trap_ena);
    

    // Mask Set And Clear Result
    wire [`YSYX210528_RegBus] mask_set_res   = read_csr_data | op1_i ;
    wire [`YSYX210528_RegBus] mask_clear_res = read_csr_data & (~op1_i);
    ysyx_210528_csr csr0(
        .clk(clk),
        .rst(rst),
        .pc_i(pc_i),

        .csr_wr_en(csr_wr_en ),   
        .csr_rd_en(csr_rd_en ),
        .csr_idx(csr_idx),

        .cmt_mret_ena(cmt_mret_ena ),
        .ecall_trap_ena(ecall_trap_ena ),
        .trap_mcause_value(trap_mcause_value),

        .tmr_intr_ena(timer_intr),
        .tmr_trap_ena(tmr_trap_ena),

        .read_csr_data(read_csr_data),
        .wbck_csr_data(wbck_csr_data),
        .ex_stall(ex_stall)
    );

    always @(*) begin
        if(~inst_type_i[7]) begin
            csr_wr_en         = `YSYX210528_WriteDisable;
            csr_rd_en         = `YSYX210528_ReadDisable ;
            cmt_mret_ena      = 1'b0         ;
            ecall_trap_ena    = 1'b0         ;
            wbck_csr_data     = `YSYX210528_ZeroWord    ;
            trap_mcause_value = `YSYX210528_ZeroWord    ;

        end
        else begin
            csr_wr_en         = `YSYX210528_WriteDisable;
            csr_rd_en         = `YSYX210528_ReadDisable ;
            cmt_mret_ena      = 1'b0         ;
            ecall_trap_ena    = 1'b0         ;
            wbck_csr_data     = `YSYX210528_ZeroWord    ;
            trap_mcause_value = `YSYX210528_ZeroWord    ;
            case (inst_opcode_i)
                `YSYX210528_INST_CSRRW,`YSYX210528_INST_CSRRWI: begin
                    csr_wr_en     = `YSYX210528_WriteEnable;
                    csr_rd_en     = (rd_addr_o == 5'b0) ? `YSYX210528_ReadDisable : `YSYX210528_ReadEnable;
                    wbck_csr_data = op1_i;
                end
                `YSYX210528_INST_CSRRS,`YSYX210528_INST_CSRRSI: begin
                    csr_wr_en     = (op1_i == `YSYX210528_ZeroWord) ? `YSYX210528_WriteDisable:`YSYX210528_WriteEnable;
                    csr_rd_en     = `YSYX210528_ReadEnable;
                    wbck_csr_data = mask_set_res;
                end
                `YSYX210528_INST_CSRRC,`YSYX210528_INST_CSRRCI: begin
                    csr_wr_en     = (op1_i == `YSYX210528_ZeroWord) ? `YSYX210528_WriteDisable:`YSYX210528_WriteEnable;
                    csr_rd_en     = `YSYX210528_ReadEnable;
                    wbck_csr_data = mask_clear_res;
                end
                `YSYX210528_INST_ECALL:              begin
                    ecall_trap_ena    = 1'b1;
                    wbck_csr_data     = pc_i; //MEPC
                    trap_mcause_value = 64'd11;
                end
                `YSYX210528_INST_MRET:              begin
                    cmt_mret_ena  = 1'b1;
                end
                default: begin
                    csr_wr_en         = `YSYX210528_WriteDisable;
                    csr_rd_en         = `YSYX210528_ReadDisable ;
                    cmt_mret_ena      = 1'b0         ;
                    ecall_trap_ena    = 1'b0         ;
                end
            endcase
        end
        if(tmr_trap_ena) begin 
            csr_wr_en         = `YSYX210528_WriteDisable;
            csr_rd_en         = `YSYX210528_ReadDisable ;
            cmt_mret_ena      = 1'b0         ;
            ecall_trap_ena    = 1'b0         ;
            wbck_csr_data     = pc_i         ;
            trap_mcause_value = 64'h8000_0000_0000_0007;
        end
    end

    // generate output signals

    assign rd_data_o    =  inst_type_i[0] ? op2_i :(inst_type_i[7] ? read_csr_data : exe_res);
    // when trap don't execute the instruction
    assign inst_type_o  =  inst_type_i & {8{~tmr_trap_ena}};
    assign rd_ena_o     =  rd_ena_i    & (~tmr_trap_ena); 
    assign rd_addr_o    =  rd_addr_i;

    // load and store info
    assign ls_addr_o    = (inst_type_i[1]|inst_type_i[0]) ? (op1_i + {{52{addr_offset_i[11]}},addr_offset_i}) : `YSYX210528_ZeroWord;
    assign ls_sel_o     = ls_sel_i;


    assign branch_pc_ena = (ex_flush_branch == `YSYX210528_FlushEnable) | trap_ena | cmt_mret_ena;
    assign branch_pc     =    (trap_ena  | cmt_mret_ena) ? read_csr_data :
                       (ex_flush_branch == `YSYX210528_FlushEnable) ? pc_i+64'd4    :
                                                               `YSYX210528_ZeroWord ;

    assign ex_stall_req = branch_pc_ena && if_stall_req;
    assign ex_flush     = branch_pc_ena;

endmodule




module ysyx_210528_id_ex (
    input wire clk,
    input wire rst,
    input wire id_ex_bubble,

    // stall control signals
    input wire [4:0] stall_ctrl,

    //input 
    input wire [`YSYX210528_InstAddrBus] id_pc,
    input wire [7:0] id_inst_type,
    input wire [7:0] id_inst_opcode,
    input wire [`YSYX210528_RegBus] id_op1,
    input wire [`YSYX210528_RegBus] id_op2,
    input wire id_rd_ena,
    input wire [`YSYX210528_RegAddrBus] id_rd_addr,

    input wire [11:0] id_addr_offset,
    input wire [2 :0] id_ls_sel,
    
    //output
    output reg [`YSYX210528_InstAddrBus] ex_pc,
    output reg [7:0] ex_inst_type,
    output reg [7:0] ex_inst_opcode,
    output reg [`YSYX210528_RegBus] ex_op1,
    output reg [`YSYX210528_RegBus] ex_op2,
    output reg ex_rd_ena,
    output reg [`YSYX210528_RegAddrBus] ex_rd_addr,

    output reg [11:0] ex_addr_offset,
    output reg [2 :0] ex_ls_sel

    );

    always @(posedge clk) begin

        if(rst == `YSYX210528_RstEnable) begin
            ex_pc                <= `YSYX210528_ZeroWord;
            ex_inst_type         <= 8'd0;
            ex_inst_opcode       <= 8'd0;
            ex_op1               <= 64'd0;
            ex_op2               <= 64'd0;
            ex_rd_ena            <= 1'b0;
            ex_rd_addr           <= 5'd0;
            ex_addr_offset       <= 12'd0;
            ex_ls_sel            <= 3'd0;
        end
        else if((stall_ctrl[2] == `YSYX210528_NoStop) && (stall_ctrl[4:3]==2'b00)) begin
            
            if(id_ex_bubble) begin
                ex_pc                <= `YSYX210528_ZeroWord;
                ex_inst_type         <= 8'd0;
                ex_inst_opcode       <= 8'd0;
                ex_op1               <= 64'd0;
                ex_op2               <= 64'd0;
                ex_rd_ena            <= 1'b0;
                ex_rd_addr           <= 5'd0;
                ex_addr_offset       <= 12'd0;
                ex_ls_sel            <= 3'd0;
            end
            else begin
                ex_pc          <= id_pc;
                ex_inst_type   <= id_inst_type;
                ex_inst_opcode <= id_inst_opcode;
                ex_op1         <= id_op1;
                ex_op2         <= id_op2;
                ex_rd_ena      <= id_rd_ena;
                ex_rd_addr     <= id_rd_addr;
                ex_addr_offset <= id_addr_offset;
                ex_ls_sel      <= id_ls_sel;            
            end

        end
        else if((stall_ctrl[1:0] == 2'b11) && stall_ctrl[2] == `YSYX210528_Stop && stall_ctrl[3]==`YSYX210528_NoStop) begin
            ex_pc                <= `YSYX210528_ZeroWord;
            ex_inst_type         <= 8'd0;
            ex_inst_opcode       <= 8'd0;
            ex_op1               <= 64'd0;
            ex_op2               <= 64'd0;
            ex_rd_ena            <= 1'b0;
            ex_rd_addr           <= 5'd0;
            ex_addr_offset       <= 12'd0;
            ex_ls_sel            <= 3'd0;
        end
        else begin
            ex_pc                <= ex_pc;
            ex_inst_type         <= ex_inst_type;
            ex_inst_opcode       <= ex_inst_opcode;
            ex_op1               <= ex_op1;
            ex_op2               <= ex_op2;
            ex_rd_ena            <= ex_rd_ena;
            ex_rd_addr           <= ex_rd_addr;
            ex_addr_offset       <= ex_addr_offset;
            ex_ls_sel            <= ex_ls_sel;
        end
    end

endmodule


module ysyx_210528_id (
    input wire rst,
    input wire [`YSYX210528_InstBus] inst_i,
    input wire [`YSYX210528_InstAddrBus] pc_i,

    // fetch data from regfile
    input wire [`YSYX210528_RegBus] op1_data_i,
    input wire [`YSYX210528_RegBus] op2_data_i,
    output wire [`YSYX210528_RegAddrBus] op1_addr_o,
    output wire [`YSYX210528_RegAddrBus] op2_addr_o,
    output wire op1_read_o,
    output wire op2_read_o,

    //signals from ex module
    input wire [`YSYX210528_RegBus] ex_rd_data,
    input wire [`YSYX210528_RegAddrBus] ex_rd_addr,
    input wire ex_rd_ena,
    input wire [7:0]ex_inst_type, // load related data hazard

    //signals from mem module
    input wire [`YSYX210528_RegBus] mem_rd_data,
    input wire [`YSYX210528_RegAddrBus] mem_rd_addr,
    input wire mem_rd_ena,

    //signals from regfile
    //input wire wb_rd_ena,
    //input wire [`YSYX210528_RegAddrBus] wb_rd_addr,
    
    //signal to pipeline_ctrl
    output wire id_stall_req,
    input wire if_stall_req,

    //output to id_exe
    output wire [7:0] inst_type,
    output wire [7:0] inst_opcode,
    output reg [`YSYX210528_RegBus] op1_o,
    output reg [`YSYX210528_RegBus] op2_o,
    output wire rd_w_ena,
    output wire [`YSYX210528_RegAddrBus] rd_w_addr,
    output wire [`YSYX210528_InstAddrBus] pc_o,
   
    output wire [11:0] store_addr_offset,
    output wire [2 :0] mem_op_sel,


    //output to pc and if_id(branch instruction)
    output wire jalr_pc_ena,
    output wire [`YSYX210528_InstAddrBus]jalr_pc,
    output wire id_flush
    );

    //I-type
    wire [6:0]   opcode;
    wire [4:0]   rd;
    wire [2:0]   funct3;
    wire [4:0]   rs1;
    wire [11:0]  imm;
    assign opcode   = inst_i[6:0];
    assign rd       = inst_i[11:7];
    assign funct3   = inst_i[14:12];
    assign rs1      = inst_i[19:15];
    assign imm      = inst_i[31:20];

    // R-type addition
    wire [6:0]   funct7;
    wire [4:0]   rs2;
    assign funct7   = inst_i[31:25];
    assign rs2      = inst_i[24:20];
    // U-type addition
    wire [19:0]  u_imm;
    assign u_imm    = inst_i[31:12];

    // J-type addition
    // wire [20:1] j_imm;
    //assign {j_imm[20],j_imm[10:1],j_imm[11],j_imm[19:12]} = inst_i[31:12];

    // B-type addition
    //wire [12:1] b_imm;
    //assign {b_imm[12],b_imm[10:5],b_imm[4:1],b_imm[11]} = {inst_i[31:25],inst_i[11:7]};

    // S-type addition
    wire [11:0] s_imm;
    assign s_imm = {inst_i[31:25], inst_i[11:7]};


    //*************** decode opcode ***************
    assign inst_type[7]   = (rst == `YSYX210528_RstEnable) ? 0:(opcode[6:2] == `YSYX210528_SYSTEM);
    assign inst_type[6]   = (rst == `YSYX210528_RstEnable) ? 0:(opcode[6:2] == `YSYX210528_INT_REG_REG_W);
    assign inst_type[5]   = (rst == `YSYX210528_RstEnable) ? 0:(opcode[6:2] == `YSYX210528_INT_REG_IMM_W); 
    assign inst_type[4]   = (rst == `YSYX210528_RstEnable) ? 0:(opcode[6:2] == `YSYX210528_INT_REG_IMM); 
    assign inst_type[3]   = (rst == `YSYX210528_RstEnable) ? 0:(opcode[6:2] == `YSYX210528_INT_REG_REG);
    assign inst_type[2]   = (rst == `YSYX210528_RstEnable) ? 0:(opcode[6:2] == `YSYX210528_BRANCH);
    assign inst_type[1]   = (rst == `YSYX210528_RstEnable) ? 0:(opcode[6:2] == `YSYX210528_LOAD) && (opcode[1:0]==2'b11);
    assign inst_type[0]   = (rst == `YSYX210528_RstEnable) ? 0:(opcode[6:2] == `YSYX210528_STORE);

    wire inst_lui         = (rst == `YSYX210528_RstEnable) ? 0:(opcode[6:2] == `YSYX210528_INT_LUI);
    wire inst_auipc       = (rst == `YSYX210528_RstEnable) ? 0:(opcode[6:2] == `YSYX210528_INT_AUIPC);
    wire inst_jal         = (rst == `YSYX210528_RstEnable) ? 0:(opcode[6:2] == `YSYX210528_JUMP_JAL);
    wire inst_jalr        = (rst == `YSYX210528_RstEnable) ? 0:(opcode[6:2] == `YSYX210528_JUMP_JALR);
    wire inst_jump        = inst_jal|inst_jalr;

    //Integer Computational Instructions
    wire inst_addi  = inst_type[4] & ~funct3[2] & ~funct3[1] & ~funct3[0];
    wire inst_slti  = inst_type[4] & ~funct3[2] &  funct3[1] & ~funct3[0];
    wire inst_sltiu = inst_type[4] & ~funct3[2] &  funct3[1] &  funct3[0];
    wire inst_xori  = inst_type[4] &  funct3[2] & ~funct3[1] & ~funct3[0];
    wire inst_ori   = inst_type[4] &  funct3[2] &  funct3[1] & ~funct3[0];
    wire inst_andi  = inst_type[4] &  funct3[2] &  funct3[1] &  funct3[0];
    wire inst_slli  = inst_type[4] & ~funct3[2] & ~funct3[1] &  funct3[0];
    wire inst_srli  = inst_type[4] &  funct3[2] & ~funct3[1] &  funct3[0] & ~imm[10];
    wire inst_srai  = inst_type[4] &  funct3[2] & ~funct3[1] &  funct3[0] &  imm[10];
   
    wire inst_addiw = inst_type[5] & ~funct3[2] & ~funct3[1] & ~funct3[0];
    wire inst_slliw = inst_type[5] & ~funct3[2] & ~funct3[1] &  funct3[0];
    wire inst_srliw = inst_type[5] &  funct3[2] & ~funct3[1] &  funct3[0] & ~imm[10];
    wire inst_sraiw = inst_type[5] &  funct3[2] & ~funct3[1] &  funct3[0] &  imm[10];

    wire inst_add   = inst_type[3]  & ~funct3[2] & ~funct3[1] & ~funct3[0] & ~funct7[5];
    wire inst_sub   = inst_type[3]  & ~funct3[2] & ~funct3[1] & ~funct3[0] &  funct7[5];
    wire inst_sll   = inst_type[3]  & ~funct3[2] & ~funct3[1] &  funct3[0] ;
    wire inst_slt   = inst_type[3]  & ~funct3[2] &  funct3[1] & ~funct3[0] ;
    wire inst_sltu  = inst_type[3]  & ~funct3[2] &  funct3[1] &  funct3[0] ;
    wire inst_xor   = inst_type[3]  &  funct3[2] & ~funct3[1] & ~funct3[0] ;
    wire inst_srl   = inst_type[3]  &  funct3[2] & ~funct3[1] &  funct3[0] & ~funct7[5];
    wire inst_sra   = inst_type[3]  &  funct3[2] & ~funct3[1] &  funct3[0] &  funct7[5];
    wire inst_or    = inst_type[3]  &  funct3[2] &  funct3[1] & ~funct3[0] ;
    wire inst_and   = inst_type[3]  &  funct3[2] &  funct3[1] &  funct3[0] ;
  
    wire inst_addw = inst_type[6] & ~funct3[2] & ~funct3[1] & ~funct3[0] & ~imm[10];
    wire inst_subw = inst_type[6] & ~funct3[2] & ~funct3[1] & ~funct3[0] &  imm[10];
    wire inst_sllw = inst_type[6] & ~funct3[2] & ~funct3[1] &  funct3[0];
    wire inst_srlw = inst_type[6] &  funct3[2] & ~funct3[1] &  funct3[0] & ~imm[10];
    wire inst_sraw = inst_type[6] &  funct3[2] & ~funct3[1] &  funct3[0] &  imm[10];


    // Branch Instructions 
    wire inst_beq   = inst_type[2]  & ~funct3[2] & ~funct3[1] & ~funct3[0] ;
    wire inst_bne   = inst_type[2]  & ~funct3[2] & ~funct3[1] &  funct3[0] ;
    wire inst_blt   = inst_type[2]  &  funct3[2] & ~funct3[1] & ~funct3[0] ;
    wire inst_bge   = inst_type[2]  &  funct3[2] & ~funct3[1] &  funct3[0] ;
    wire inst_bltu  = inst_type[2]  &  funct3[2] &  funct3[1] & ~funct3[0] ;
    wire inst_bgeu  = inst_type[2]  &  funct3[2] &  funct3[1] &  funct3[0] ;

    // CSR Instructions
    wire inst_csrrw = inst_type[7]  & ~funct3[2] & ~funct3[1] &  funct3[0] ;
    wire inst_csrrs = inst_type[7]  & ~funct3[2] &  funct3[1] & ~funct3[0] ;
    wire inst_csrrc = inst_type[7]  & ~funct3[2] &  funct3[1] &  funct3[0] ;
    wire inst_csrrwi= inst_type[7]  &  funct3[2] & ~funct3[1] &  funct3[0] ;
    wire inst_csrrsi= inst_type[7]  &  funct3[2] &  funct3[1] & ~funct3[0] ;
    wire inst_csrrci= inst_type[7]  &  funct3[2] &  funct3[1] &  funct3[0] ;

    wire inst_csr_rs1 = inst_csrrw | inst_csrrs | inst_csrrc;
    wire inst_csr_imm = inst_csrrwi | inst_csrrsi |inst_csrrci;

    // Privileged Instructions
    wire inst_ecall   = inst_type[7]  & ~funct3[2] & ~funct3[1] & ~funct3[0] && (imm == 12'd0);
    wire inst_mret    = inst_type[7]  & ~funct3[2] & ~funct3[1] & ~funct3[0] && (funct7 == 7'b0011000);

    
    //specify the instruction
    assign inst_opcode[0] = (  rst == 1'b1 ) ? 0 : inst_csrrc |inst_beq  |inst_addi | inst_srai|inst_slt |inst_sra|inst_auipc|inst_slliw|inst_subw;
    assign inst_opcode[1] = (  rst == 1'b1 ) ? 0 : inst_csrrwi|inst_bne  |inst_slti | inst_srai|inst_sltu|inst_or |inst_jal  |inst_sraiw|inst_sllw;
    assign inst_opcode[2] = (  rst == 1'b1 ) ? 0 : inst_csrrsi|inst_blt  |inst_sltiu| inst_add |inst_slt |inst_and|inst_jalr |inst_sraiw|inst_srlw;
    assign inst_opcode[3] = (  rst == 1'b1 ) ? 0 : inst_csrrci|inst_bge  |inst_xori | inst_add |inst_sltu|inst_lui|inst_addiw|inst_slliw|inst_sraw;
    assign inst_opcode[4] = (  rst == 1'b1 ) ? 0 : inst_ecall |inst_bltu |inst_ori  | inst_sub |inst_xor |inst_sra|inst_addiw|inst_srliw|inst_sllw;
    assign inst_opcode[5] = (  rst == 1'b1 ) ? 0 : inst_mret  |inst_bgeu |inst_andi | inst_sub |inst_srl |inst_or |inst_jalr |inst_addw |inst_subw;
    assign inst_opcode[6] = (  rst == 1'b1 ) ? 0 :            |inst_csrrw|inst_slli | inst_sll |inst_xor |inst_and|inst_jal  |inst_addw |inst_sraw;
    assign inst_opcode[7] = (  rst == 1'b1 ) ? 0 :            |inst_csrrs|inst_srli | inst_sll |inst_srl |inst_lui|inst_auipc|inst_srliw|inst_srlw;

    //output signal: 
    wire   op1_load_relate,op2_load_relate;
    assign op1_load_relate = (rst == `YSYX210528_RstEnable) ? 0 : op1_read_o && (ex_inst_type == 8'b0000_0010) && (op1_addr_o == ex_rd_addr);
    assign op2_load_relate = (rst == `YSYX210528_RstEnable) ? 0 : op2_read_o && (ex_inst_type == 8'b0000_0010) && (op2_addr_o == ex_rd_addr);
    assign id_stall_req    = (rst == `YSYX210528_RstEnable) ? 0 : op1_load_relate | op2_load_relate | (id_flush && if_stall_req);

    assign pc_o = (rst == `YSYX210528_RstEnable) ? `YSYX210528_ZeroWord : pc_i;

    assign op1_read_o = 1'b0 | inst_type[6]|inst_type[5]|inst_type[4]|inst_type[3]|inst_jalr|inst_type[2]|inst_type[1]|inst_type[0]|inst_csr_rs1;
    assign op1_addr_o = op1_read_o ? rs1 : 5'd0;

    assign op2_read_o = 1'b0 | inst_type[3] | inst_type[2] | inst_type[0]|inst_type[6];
    assign op2_addr_o = op2_read_o ? rs2 : 0;

    assign rd_w_ena   = (rd != 5'd0)&&(inst_type[6]|inst_type[5]|inst_type[4] |inst_type[3]|inst_lui|inst_auipc|inst_jump|inst_type[1]|inst_type[7]);
    assign rd_w_addr  = rd_w_ena   ? rd  : 0;

    assign store_addr_offset = inst_type[1] ?   imm:
                               inst_type[0] ? s_imm:
                                              12'd0;
    
    assign mem_op_sel = (rst == `YSYX210528_RstEnable) ? 3'b000 : funct3;


    //***** check ex,mem and wb to solve the data hazard in pipeline ******
    wire ex_op1,mem_op1;
    assign ex_op1  =  (ex_rd_addr == op1_addr_o)  && ex_rd_ena;
    assign mem_op1 =  (mem_rd_addr == op1_addr_o) && mem_rd_ena;

    always @(*) begin
        if(rst == `YSYX210528_RstEnable ) begin op1_o = `YSYX210528_ZeroWord;    end
        else if (op1_read_o) 
        begin 
            if(ex_op1)       begin op1_o = ex_rd_data ;  end
            else if(mem_op1) begin op1_o = mem_rd_data;  end
            else             begin op1_o = op1_data_i ;  end
        end
        else if(inst_auipc|inst_jal) begin op1_o = pc_i;             end
        else if(inst_csr_imm)        begin op1_o = {{59{1'b0}},rs1}; end
        else                         begin op1_o = `YSYX210528_ZeroWord;        end
    end


    wire ex_op2, mem_op2;
    assign ex_op2  = (ex_rd_addr  == op2_addr_o)  &&  ex_rd_ena;
    assign mem_op2 = (mem_rd_addr == op2_addr_o) && mem_rd_ena;
    always @(*) begin
        if(rst == `YSYX210528_RstEnable) begin op2_o = `YSYX210528_ZeroWord; end
        else if(op2_read_o)
        begin 
            if      (ex_op2)  begin op2_o = ex_rd_data ;  end
            else if(mem_op2)  begin op2_o = mem_rd_data;  end
            else              begin op2_o = op2_data_i;   end
        end
        else if (inst_type[4]|inst_type[5]|inst_type[7]) begin op2_o = {{52{imm[11]}},imm};    end
        else if (inst_lui|inst_auipc)                    begin op2_o = {{44{u_imm[19]}},u_imm};end
        else if (inst_jump)                              begin op2_o = pc_i;                   end
        else                                             begin op2_o = `YSYX210528_ZeroWord;              end
    end



    //jalr: signals to pc and if_id 
    //wire wb_op1;
    //assign wb_op1 = (wb_rd_addr == op1_addr_o) && wb_rd_ena;

    wire [`YSYX210528_InstAddrBus] jalr_pc_temp = {{52{imm[11]}},imm}+op1_o;
    //wire   predict_success = ~ex_op1 & ~mem_op1 & ~wb_op1 & (op1_addr_o == 5'd1);

    assign jalr_pc_ena = (rst == `YSYX210528_RstEnable) ? 0 : inst_jalr; //&& ~predict_success;
    assign jalr_pc     = inst_jalr ? {jalr_pc_temp[63:1],1'b0 & jalr_pc_temp[0]} : `YSYX210528_ZeroWord;

    assign id_flush = (rst == `YSYX210528_RstEnable) ? `YSYX210528_FlushDisable : 
                              jalr_pc_ena ?  `YSYX210528_FlushEnable :
                                             `YSYX210528_FlushDisable;

endmodule







module ysyx_210528_if_id (
    input wire clk,
    input wire rst,
    
    input wire [`YSYX210528_InstAddrBus] if_pc,
    input wire [`YSYX210528_InstBus] if_inst,
    input wire if_id_flush,
    input wire if_id_bubble,

    input wire if_inst_valid,
    output wire if_inst_ready,
    //stall control and req signal
    input wire [4:0] stall_ctrl,
    output wire if_stall_req,

    output reg [`YSYX210528_InstAddrBus] id_pc,
    output reg [`YSYX210528_InstBus] id_inst
    );


    always@(posedge clk) begin
        if(rst == `YSYX210528_RstEnable|if_id_flush) begin
            id_pc   <= `YSYX210528_ZeroWord;
            id_inst <= 32'h0000_0000;
        end
        else if((stall_ctrl[1] == `YSYX210528_Stop) && (stall_ctrl[2] == `YSYX210528_NoStop) && (stall_ctrl[4:3]==2'b00)) begin
            id_pc   <= `YSYX210528_ZeroWord;
            id_inst <= 32'h0000_0000;
        end
        else if((stall_ctrl[0] == `YSYX210528_Stop) && (stall_ctrl[1] == `YSYX210528_Stop) && (stall_ctrl[2] == `YSYX210528_Stop)) begin
            id_pc   <= id_pc;
            id_inst <= id_inst;
        end
        else begin
            if(if_id_bubble) begin
                id_pc   <= `YSYX210528_ZeroWord;
                id_inst <= 32'h0000_0000;
            end
            else begin
                id_pc   <= if_pc;
                id_inst <= if_inst;
            end
        end
    end

    assign if_stall_req = (rst == `YSYX210528_RstEnable) ? 1'b0:(if_inst_valid == 1'b0);

    assign if_inst_ready = (stall_ctrl[1] == `YSYX210528_NoStop);

endmodule






module ysyx_210528_mem (
    input wire rst,
    input wire [7:0]          inst_type_i,
    input wire                rd_ena_i,
    input wire [`YSYX210528_RegBus]      rd_data_i,
    input wire [`YSYX210528_RegAddrBus]  rd_addr_i,


    input wire [`YSYX210528_DataAddrBus] ls_addr_i,
    input wire [2:0]          ls_sel_i,

    //to memory
    output wire [`YSYX210528_DataAddrBus] data_addr_o,
    output wire [7:0]          wmask_o,
    input  wire [`YSYX210528_DataBus]     data_i,
    output wire [`YSYX210528_DataBus]     data_o,
    output wire                we,
    output wire                re,
    input  wire                mem_finish,

    //to mem_wb
    output wire                rd_ena_o,
    output wire [`YSYX210528_RegBus]      rd_data_o,
    output wire [`YSYX210528_RegAddrBus]  rd_addr_o,

    //to pipelinectrl
    output wire                mem_stall_req
    );

    //*************** signals to ram *****************
    assign we          = (rst == `YSYX210528_RstEnable) ? 1'b0 : inst_type_i[0];
    assign re          = (rst == `YSYX210528_RstEnable) ? 1'b0 : inst_type_i[1];
    assign data_addr_o = (rst == `YSYX210528_RstEnable) ? `YSYX210528_ZeroWord : ls_addr_i[63:0];

    // load data part:
    reg [`YSYX210528_DataBus] load_data;

    wire [2:0] byte_sel        = ls_addr_i[2:0];
    wire [1:0] half_byte_sel   = ls_addr_i[2:1];
    wire       word_sel        = ls_addr_i[2];

    reg  [7:0]  data_byte;
    reg  [15:0] data_half_byte;
    wire [31:0] data_word;

    always @(*) begin
        case (byte_sel)
            3'b000:  data_byte = data_i[ 7: 0];
            3'b001:  data_byte = data_i[15: 8];
            3'b010:  data_byte = data_i[23:16];
            3'b011:  data_byte = data_i[31:24];
            3'b100:  data_byte = data_i[39:32];
            3'b101:  data_byte = data_i[47:40];
            3'b110:  data_byte = data_i[55:48];
            default: data_byte = data_i[63:56];
        endcase
    end

    always @(*) begin
        case (half_byte_sel)
            2'b00:   data_half_byte = data_i[15: 0];
            2'b01:   data_half_byte = data_i[31:16];
            2'b10:   data_half_byte = data_i[47:32];
            default: data_half_byte = data_i[63:48];
        endcase
    end

    assign data_word = word_sel ? data_i[63:32] : data_i[31:0];

    always @(*) begin
        if(inst_type_i == 8'b0000_0010) begin
            case (ls_sel_i)
                `YSYX210528_LB_SEL :begin load_data = {{56{data_byte[7]}}, data_byte};            end
                `YSYX210528_LH_SEL :begin load_data = {{48{data_half_byte[15]}}, data_half_byte}; end                                 
                `YSYX210528_LW_SEL :begin load_data = {{32{data_word[31]}}, data_word};           end
                `YSYX210528_LBU_SEL:begin load_data = {{56{1'b0}}, data_byte};                    end
                `YSYX210528_LHU_SEL:begin load_data = {{48{1'b0}}, data_half_byte};               end
                `YSYX210528_LWU_SEL:begin load_data = {{32{1'b0}}, data_word};                    end
                `YSYX210528_LD_SEL :begin load_data = data_i;                                     end
                default :begin load_data = `YSYX210528_ZeroWord;                                  end
            endcase
        end
        else begin load_data = `YSYX210528_ZeroWord;  end
    end

    // store data part: 

    reg [`YSYX210528_DataBus] store_data;
    reg [7:0]      store_mask;

    reg [`YSYX210528_DataBus] sb_data, sh_data, sw_data;
    reg [7:0]      sb_mask, sh_mask, sw_mask;
    always @(*) begin
        if(rst == `YSYX210528_RstEnable) begin
            sb_data = 64'd0;
            sb_mask = 8'd0;
        end
        else begin
            case (byte_sel)
                3'b000:begin 
                    sb_data = {56'd0,rd_data_i[7:0]};
                    sb_mask = 8'b0000_0001;
                end
                3'b001:begin
                    sb_data = {48'd0,rd_data_i[7:0],8'd0};
                    sb_mask = 8'b0000_0010;
                end
                3'b010:begin 
                    sb_data = {40'd0,rd_data_i[7:0],16'd0};
                    sb_mask = 8'b0000_0100;
                end
                3'b011:begin
                    sb_data = {32'd0,rd_data_i[7:0],24'd0};
                    sb_mask = 8'b0000_1000;
                end
                3'b100:begin
                    sb_data = {24'd0,rd_data_i[7:0],32'd0};
                    sb_mask = 8'b0001_0000;
                end
                3'b101: begin
                    sb_data = {16'd0,rd_data_i[7:0],40'd0};
                    sb_mask = 8'b0010_0000;
                end
                3'b110: begin
                    sb_data = {8'd0 ,rd_data_i[7:0],48'd0};
                    sb_mask = 8'b0100_0000;
                end
                default:begin
                    sb_data = {rd_data_i[7:0],56'd0};
                    sb_mask = 8'b1000_0000;
                end
            endcase
        end
    end

    always @(*) begin
        if(rst == `YSYX210528_RstEnable) begin
            sh_data = 64'd0;
            sh_mask =  8'd0;
        end
        else begin
            case (half_byte_sel)
                2'b00: begin
                    sh_data = {48'd0,rd_data_i[15:0]};
                    sh_mask = 8'b0000_0011;
                end
                2'b01: begin
                    sh_data = {32'd0,rd_data_i[15:0],16'd0};
                    sh_mask = 8'b0000_1100;
                end
                2'b10: begin
                    sh_data = {16'd0,rd_data_i[15:0],32'd0};
                    sh_mask = 8'b0011_0000;
                end
                default: begin
                    sh_data = {rd_data_i[15:0],48'd0};
                    sh_mask = 8'b1100_0000;
                end
            endcase
        end
    end

    always @(*) begin
        if(rst == `YSYX210528_RstEnable) begin
            sw_data = 64'd0;
            sw_mask =  8'd0;
        end
        else begin
            case (word_sel)
                1'b0: begin
                    sw_data = {32'd0, rd_data_i[31:0]};
                    sw_mask = 8'b0000_1111;
                end
                default: begin
                    sw_data = {rd_data_i[31:0],32'd0};
                    sw_mask = 8'b1111_0000;
                end
            endcase
        end
    end

    always @(*) begin
        if(rst == `YSYX210528_RstEnable) begin
            store_data  = 64'd0;
            store_mask  =  8'd0;
        end
        else begin
            case (ls_sel_i)
                `YSYX210528_SB_SEL: begin
                    store_data = sb_data;
                    store_mask = sb_mask;
                end
                `YSYX210528_SH_SEL: begin
                    store_data = sh_data;
                    store_mask = sh_mask;
                end
                `YSYX210528_SW_SEL: begin
                    store_data = sw_data;
                    store_mask = sw_mask;                
                end
                `YSYX210528_SD_SEL: begin
                    store_data = rd_data_i;
                    store_mask = 8'b1111_1111;
                end
                default: begin
                    store_data = 64'd0;
                    store_mask =  8'd0;
                end
            endcase
        end
    end

    assign data_o   = (rst == `YSYX210528_RstEnable|~inst_type_i[0]) ? 64'd0:store_data;
    assign wmask_o  = (rst == `YSYX210528_RstEnable|~inst_type_i[0]) ?  8'd0:store_mask; 

    //*************** signals to pipelinectrl ***************
    assign mem_stall_req = (rst == `YSYX210528_RstEnable) ? 1'b0 : ((re|we) && (mem_finish == 1'b0)); 

    //*************** signal to mem_wb ***************
    assign rd_addr_o = rd_addr_i;
    assign rd_data_o = inst_type_i[1] ? load_data :rd_data_i;
    assign rd_ena_o =  rd_ena_i;

endmodule


module ysyx_210528_mem_wb (
    input wire clk,
    input wire rst,

    // stall control signal
    input wire [4:0] stall_ctrl,

    input wire [`YSYX210528_RegBus]     mem_rd_data,
    input wire [`YSYX210528_RegAddrBus] mem_rd_addr,
    input wire               mem_rd_ena,

    output reg [`YSYX210528_RegBus]     wb_rd_data,
    output reg [`YSYX210528_RegAddrBus] wb_rd_addr,
    output reg               wb_rd_ena
    );

    always @(posedge clk) begin
        if(rst == `YSYX210528_RstEnable) begin
            wb_rd_data  <= `YSYX210528_ZeroWord;
            wb_rd_addr  <= 5'd0;
            wb_rd_ena   <= 1'b0;
        end
        else begin
            if(stall_ctrl[4]==`YSYX210528_NoStop) begin
                wb_rd_data  <= mem_rd_data;
                wb_rd_addr  <= mem_rd_addr;
                wb_rd_ena   <= mem_rd_ena;
            end
            else if((stall_ctrl[3:0]==4'b1111) && stall_ctrl[4]==`YSYX210528_Stop)begin
                wb_rd_data  <= `YSYX210528_ZeroWord;
                wb_rd_addr  <= 5'd0;
                wb_rd_ena   <= 1'b0;
            end
            else begin
                wb_rd_data  <= wb_rd_data;
                wb_rd_addr  <= wb_rd_addr;
                wb_rd_ena   <= wb_rd_ena ;
            end
        end
    end
    
endmodule

module ysyx_210528_mini_id_bpu (
    input wire rst,

    input wire [`YSYX210528_InstBus]     inst_i,
    input wire [`YSYX210528_InstAddrBus] pc_i,

    //x1 data
    output wire x1_read_ena,
    input  wire [`YSYX210528_RegBus]     x1_data,

    // predict pc 
    output wire [`YSYX210528_InstAddrBus] prdt_pc_o,
    output wire prdt_pc_valid_o

    );

    wire [`YSYX210528_InstAddrBus] prdt_pc_add_op1, prdt_pc_add_op2, prdt_pc_temp;

    wire [6 :0] opcode  = inst_i[6:0];
    //J-type imm
    wire [20:1] j_imm;
    assign {j_imm[20],j_imm[10:1],j_imm[11],j_imm[19:12]} = inst_i[31:12];

    //I-type imm
    wire [11:0] i_imm   = inst_i[31:20];

    //B-type imm
    wire [12:1] b_imm;
    assign {b_imm[12],b_imm[10:5],b_imm[4:1],b_imm[11]} = {inst_i[31:25],inst_i[11:7]};


    //decode
    wire inst_jal,inst_jalr,inst_bxx;
    assign inst_jal     = (opcode[6:2] == `YSYX210528_JUMP_JAL) && (opcode[1:0]== 2'b11);
    assign inst_jalr    = (opcode[6:2] == `YSYX210528_JUMP_JALR)&& (opcode[1:0]== 2'b11);
    assign inst_bxx     = (opcode[6:2] == `YSYX210528_BRANCH)   && (opcode[1:0]== 2'b11);

    assign x1_read_ena  = (rst == `YSYX210528_RstEnable) ? 0 : inst_jalr;

    //generate prdt_pc_add_opx
    assign prdt_pc_add_op1 = inst_jalr ? x1_data : pc_i;

    assign prdt_pc_add_op2 = inst_jal ? {{44{j_imm[20]}},j_imm[20:1]<<1}:
                             inst_bxx ? {{52{b_imm[12]}},b_imm[12:1]<<1}:
                            inst_jalr ?    {{52{i_imm[11]}},i_imm[11:0]}:
                                                                   64'd4;

    assign prdt_pc_temp = prdt_pc_add_op1 + prdt_pc_add_op2;
    assign prdt_pc_o    = (rst == `YSYX210528_RstEnable)? `YSYX210528_ZeroWord:(inst_jalr ? {prdt_pc_temp[63:1],1'b0}: prdt_pc_temp);
    assign prdt_pc_valid_o = inst_jalr ? 1'b0 : 1'b1; 

endmodule




module ysyx_210528_pc (
    input wire clk,
    input wire rst,

    input wire [`YSYX210528_InstAddrBus] prdt_pc_i,
    input wire prdt_pc_valid_i,

    input wire [`YSYX210528_InstAddrBus] id_pc_i,
    input wire id_pc_ena,

    input wire [`YSYX210528_InstAddrBus] ex_pc_i,
    input wire ex_pc_ena,

    //pc stall signal
    input wire pc_stall,

    output reg [`YSYX210528_InstAddrBus] pc,
    output wire ce
    );

    reg pc_valid;
    always @(posedge clk) begin
        if(rst)                        begin pc_valid <= 1'b1;            end
        else if(ex_pc_ena | id_pc_ena) begin pc_valid <= 1'b1;            end
        else if(pc_stall == `YSYX210528_Stop)     begin pc_valid <= pc_valid;        end
        else                           begin pc_valid <= prdt_pc_valid_i; end
    end


    always @(posedge clk) begin
        if(rst == `YSYX210528_RstEnable) begin
            pc <= `YSYX210528_ADDR_START;
        end
        else begin
            if      (ex_pc_ena) pc <= ex_pc_i;
            else if (id_pc_ena) pc <= id_pc_i;
            else if (pc_stall == `YSYX210528_Stop) begin 
                pc <= pc;
            end
            else begin
                pc <= prdt_pc_i;              
            end
        end
    end
    
    assign ce = (rst == `YSYX210528_RstEnable) ? `YSYX210528_ChipDisable:
                           pc_valid ? `YSYX210528_ChipEnable :
                                      `YSYX210528_ChipDisable;

endmodule


module ysyx_210528_pipeline_ctrl(

    input wire rst,
    //input: stall request from id, ex and mem
    input wire if_stall_req,
    input wire id_stall_req,
    input wire ex_stall_req,
    input wire mem_stall_req,

    //output: stall control signals
    //stall_ctrl[0] --> pc
    //stall_ctrl[1] --> if
    //stall_ctrl[2] --> id
    //stall_ctrl[3] --> ex
    //stall_ctrl[4] --> mem
    //stall_ctrl[5] --> wb
    output reg [4:0] stall_ctrl
    );



    always @(*) begin
        if(rst == `YSYX210528_RstEnable)          begin stall_ctrl = 5'b00000; end
        else if(mem_stall_req== `YSYX210528_Stop) begin stall_ctrl = 5'b11111; end
        else if(ex_stall_req == `YSYX210528_Stop) begin stall_ctrl = 5'b01111; end
        else if(id_stall_req == `YSYX210528_Stop) begin stall_ctrl = 5'b00111; end
        else if(if_stall_req == `YSYX210528_Stop) begin stall_ctrl = 5'b00011; end
        else                           begin stall_ctrl = 5'b00000; end
    end
    
endmodule


module ysyx_210528_regfile (
    input wire clk,
    input wire rst,

    //one write port
    input wire  [`YSYX210528_RegAddrBus] waddr,
    input wire  [`YSYX210528_RegBus] wdata,
    input wire  we,
    
    //two read ports
    input  wire  [`YSYX210528_RegAddrBus] raddr1,
    output wire  [`YSYX210528_RegBus] rdata1,
    input  wire  re1,

    input  wire [`YSYX210528_RegAddrBus] raddr2,
    output wire [`YSYX210528_RegBus] rdata2,
    input  wire re2,

    //shortcut to x1
    input  wire  x1_read_ena,
    output wire [`YSYX210528_RegBus] x1_data

    );

    
    reg [`YSYX210528_RegBus] regs [31:0];
    integer i;

    always @(posedge clk) begin
        if(rst == `YSYX210528_RstEnable) begin
            for (i = 0;i<32 ;i=i+1 ) begin 
                regs[i] <= `YSYX210528_ZeroWord;
            end
        end
        else begin
            if(we == `YSYX210528_WriteEnable && waddr!=5'h0) begin
                regs[waddr] <= wdata;
            end
        end
    end


    //********** output signals **********
    assign rdata1  = ((rst == `YSYX210528_RstDisable)&&(re1 == `YSYX210528_ReadEnable))?
      ((waddr==raddr1)&&(we==`YSYX210528_WriteEnable) ? wdata:regs[raddr1] ):
                                                        `YSYX210528_ZeroWord;

    assign rdata2  = ((rst == `YSYX210528_RstDisable)&&(re2 == `YSYX210528_ReadEnable))?
      ((waddr==raddr2)&&(we==`YSYX210528_WriteEnable) ? wdata:regs[raddr2] ):
                                                        `YSYX210528_ZeroWord;

    assign x1_data = ((rst == `YSYX210528_RstDisable)&&(x1_read_ena==`YSYX210528_ReadEnable))?
              ((waddr == 5'b00001)&&(we==`YSYX210528_WriteEnable) ? wdata:regs[1]):
                                                              `YSYX210528_ZeroWord;


endmodule



module ysyx_210528_rvcpu (
    input wire                 clk,
    input wire                 rst,
    // instruction bus
    output wire [`YSYX210528_InstAddrBus] inst_addr,
    output wire                inst_ena,

    output wire                inst_ready,
    input wire [`YSYX210528_InstBus]      inst,
    input wire                 biu_inst_valid,

    // data bus
    output wire [`YSYX210528_DataAddrBus] data_addr,
    output wire [7:0]          wmask,
    output wire [`YSYX210528_DataBus]     data_o,
    input  wire [`YSYX210528_DataBus]     data_i,
    output wire                we,
    output wire                re,
    input  wire                mem_finish,
                               
    // interrupt signals       
    input  wire                timer_intr

    );

    //********** define connections **********
    wire [`YSYX210528_InstAddrBus]       pc;
    assign inst_addr = pc;


    //between pc and id/ex
    wire [`YSYX210528_InstAddrBus]       jalr_pc;
    wire                      jalr_pc_ena; 
    wire [`YSYX210528_InstAddrBus]       branch_pc;
    wire                      branch_pc_ena; 

    //between mini_id_bpuand pc
    wire [`YSYX210528_InstAddrBus]       prdt_pc;
    wire                      prdt_pc_valid;
    //between mini_id_bpu and regfile
    wire                      x1_read_ena;
    wire [`YSYX210528_RegBus]            x1_data;

     
    // between if_id and id
    wire                      id_flush; //flush signal
    wire [`YSYX210528_InstAddrBus]       pc_id;
    wire [`YSYX210528_InstBus]           inst_id;

    // between id and regfile 
    wire [`YSYX210528_RegAddrBus]   raddr1,raddr2;
    wire                 re1,re2;
    wire [`YSYX210528_RegBus]       rdata1,rdata2;


    // between id and id_ex
    wire [`YSYX210528_InstAddrBus] id_pc;
    wire [7:0]          id_inst_type;
    wire [7:0]          id_inst_opcode;
    wire [`YSYX210528_RegBus]      id_op1;
    wire [`YSYX210528_RegBus]      id_op2;
    wire                id_rd_ena;
    wire [`YSYX210528_RegAddrBus]  id_rd_addr;

    wire [11:0]         id_addr_offset;
    wire [2 :0]         id_ls_sel;    

    //between id_ex and ex
    wire [`YSYX210528_InstAddrBus] pc_ex;
    wire [7:0]          inst_type_ex;
    wire [7:0]          inst_opcode_ex;
    wire [`YSYX210528_RegBus]      op1_ex;
    wire [`YSYX210528_RegBus]      op2_ex;
    wire                rd_ena_ex;
    wire [`YSYX210528_RegAddrBus]  rd_addr_ex;

    wire [11:0]         addr_offset_ex;
    wire [ 2:0]         ls_sel_ex;  

    //between ex and ex_mem
    wire ex_flush;
    wire [7:0]          ex_inst_type;
    wire                ex_rd_ena;
    wire [`YSYX210528_RegBus]      ex_rd_data;
    wire [`YSYX210528_RegAddrBus]  ex_rd_addr;

    wire [`YSYX210528_DataAddrBus] ex_ls_addr;
    wire [2:0]          ex_ls_sel;

    //between ex_mem to mem
    wire [7:0]          inst_type_mem;
    wire                rd_ena_mem;
    wire [`YSYX210528_RegBus]      rd_data_mem;
    wire [`YSYX210528_RegAddrBus]  rd_addr_mem;

    wire [`YSYX210528_DataAddrBus] ls_addr_mem;
    wire [2:0]          ls_sel_mem;

    //between mem and mem_wb
    wire                mem_rd_ena;
    wire [`YSYX210528_RegBus]      mem_rd_data;
    wire [`YSYX210528_RegAddrBus]  mem_rd_addr;
    //between mem_wb and regfile
    wire                rd_ena_wb;
    wire [`YSYX210528_RegBus]      rd_data_wb;
    wire [`YSYX210528_RegAddrBus]  rd_addr_wb;

    // signals related to pipeline_ctrl 
    wire [4:0]          stall_ctrl;
    wire                id_stall_req;
    wire                if_stall_req;
    wire                ex_stall_req;
    wire                mem_stall_req;
    

    //********** fetch instructions **********
    //instantiate pc module
    ysyx_210528_pc pc0(
        .clk(clk),
        .rst(rst),
        .prdt_pc_i(prdt_pc),
        .prdt_pc_valid_i(prdt_pc_valid),

        .id_pc_i(jalr_pc),
        .id_pc_ena(jalr_pc_ena),
        .ex_pc_i(branch_pc),
        .ex_pc_ena(branch_pc_ena),

        .pc_stall(stall_ctrl[0]),

        .pc(pc),
        .ce(inst_ena)
    );

    //instantiate mini_id_bpu module
    ysyx_210528_mini_id_bpu mini_id_bpu0(
        .rst(rst),
        
        .inst_i(inst),
        .pc_i(pc),

        //x1 data
        .x1_read_ena(x1_read_ena),
        .x1_data(x1_data),

        // predict pc 
        .prdt_pc_o(prdt_pc),
        .prdt_pc_valid_o(prdt_pc_valid)
    );


    //instantiate if_id module
    ysyx_210528_if_id if_id0(
        .clk(clk),
        .rst(rst),

        .if_pc(pc),
        .if_inst(inst),
        .if_inst_ready(inst_ready),
        .if_inst_valid(biu_inst_valid),

        .id_pc(pc_id),
        .id_inst(inst_id),
        .if_id_flush(ex_flush),
        .if_id_bubble(id_flush),
        .stall_ctrl(stall_ctrl),
        .if_stall_req(if_stall_req)
    );


    //********** decode instructions **********

    //instantiate regfile
    ysyx_210528_regfile regfile0(
        .clk(clk),
        .rst(rst),

        //one write port
        .waddr(rd_addr_wb),
        .wdata(rd_data_wb),
        .we(rd_ena_wb),
    
        //two read ports
        .raddr1(raddr1),
        .rdata1(rdata1),
        .re1(re1),

        .raddr2(raddr2),
        .rdata2(rdata2),
        .re2(re2),

        //shortcut between x1 and mini_id_bpu
        .x1_read_ena(x1_read_ena),
        .x1_data(x1_data)
    );

    ysyx_210528_id id0(
        .rst(rst),
        .inst_i(inst_id),
        .pc_i(pc_id),

        // fetch data from regfile
        .op1_data_i(rdata1),
        .op2_data_i(rdata2),
        .op1_addr_o(raddr1),
        .op2_addr_o(raddr2),
        .op1_read_o(re1),
        .op2_read_o(re2),
        // signal from ex stage
        .ex_rd_data(ex_rd_data),
        .ex_rd_addr(ex_rd_addr),
        .ex_rd_ena(ex_rd_ena),
        .ex_inst_type(ex_inst_type),

        //signals from mem stage
        .mem_rd_data(mem_rd_data),
        .mem_rd_addr(mem_rd_addr),
        .mem_rd_ena(mem_rd_ena),

        //signals from wb stage
        //.wb_rd_ena (rd_ena_wb),
        //.wb_rd_addr(rd_addr_wb),

        //signal to pipeline_ctrl
        .id_stall_req(id_stall_req),
        .if_stall_req(if_stall_req),

        //output to id_exe
        .inst_type(id_inst_type),
        .inst_opcode(id_inst_opcode),
        .op1_o(id_op1),
        .op2_o(id_op2),
        .rd_w_ena(id_rd_ena),
        .rd_w_addr(id_rd_addr),
        .pc_o(id_pc),

        .store_addr_offset(id_addr_offset),
        .mem_op_sel(id_ls_sel),

        //output to pc and if_id 
        .jalr_pc_ena(jalr_pc_ena),
        .jalr_pc(jalr_pc),
        .id_flush(id_flush)
    );

    ysyx_210528_id_ex id_ex0(
        .clk(clk),
        .rst(rst),
        .id_ex_bubble(ex_flush),

        //input 
        .id_pc(id_pc),
        .id_inst_type(id_inst_type),
        .id_inst_opcode(id_inst_opcode),
        .id_op1(id_op1),
        .id_op2(id_op2),
        .id_rd_ena(id_rd_ena),
        .id_rd_addr(id_rd_addr),

        .id_addr_offset(id_addr_offset),
        .id_ls_sel(id_ls_sel),

        .stall_ctrl(stall_ctrl),
    
        //output
        .ex_pc(pc_ex),
        .ex_inst_type(inst_type_ex),
        .ex_inst_opcode(inst_opcode_ex),
        .ex_op1(op1_ex),
        .ex_op2(op2_ex),
        .ex_rd_ena(rd_ena_ex),
        .ex_rd_addr(rd_addr_ex),

        .ex_addr_offset(addr_offset_ex),
        .ex_ls_sel(ls_sel_ex)
    );

    //********** execute instructions **********
    ysyx_210528_ex ex0(
        .clk(clk),
        .rst(rst),
        //input ports
        .pc_i(pc_ex),
        .inst_type_i(inst_type_ex),
        .inst_opcode_i(inst_opcode_ex),
        .op1_i(op1_ex),
        .op2_i(op2_ex),
        .rd_ena_i(rd_ena_ex),
        .rd_addr_i(rd_addr_ex),

        .ls_sel_i(ls_sel_ex),
        .addr_offset_i(addr_offset_ex),

        //output ports
        .inst_type_o(ex_inst_type),
        .rd_ena_o(ex_rd_ena),
        .rd_data_o(ex_rd_data),
        .rd_addr_o(ex_rd_addr),
        .ls_sel_o(ex_ls_sel),
        .ls_addr_o(ex_ls_addr),

        .ex_flush(ex_flush),
        .branch_pc_ena(branch_pc_ena),
        .branch_pc(branch_pc),

        .if_stall_req(if_stall_req),
        .ex_stall_req(ex_stall_req),

        //interrupt
        .timer_intr(timer_intr),

        .ex_stall(stall_ctrl[3])
    );

    ysyx_210528_ex_mem ex_mem0(
        .clk(clk),
        .rst(rst),
        // input signals
        .ex_inst_type(ex_inst_type),
        .ex_rd_ena(ex_rd_ena),
        .ex_rd_data(ex_rd_data),
        .ex_rd_addr(ex_rd_addr),

        .ex_ls_sel(ex_ls_sel),
        .ex_ls_addr(ex_ls_addr),

        .stall_ctrl(stall_ctrl),
        // output signals
        .mem_inst_type(inst_type_mem),
        .mem_rd_ena(rd_ena_mem),
        .mem_rd_data(rd_data_mem),
        .mem_rd_addr(rd_addr_mem),

        .mem_ls_sel(ls_sel_mem),
        .mem_ls_addr(ls_addr_mem)
    );

    //********** access memory **********
    ysyx_210528_mem mem0(
        .rst(rst),
        .inst_type_i(inst_type_mem),
        .rd_ena_i(rd_ena_mem),
        .rd_data_i(rd_data_mem),
        .rd_addr_i(rd_addr_mem),

        .ls_sel_i(ls_sel_mem),
        .ls_addr_i(ls_addr_mem),
        // to memory
        .data_addr_o(data_addr),
        .wmask_o(wmask),
        .data_i(data_i),
        .data_o(data_o),
        .we(we),
        .re(re),
        .mem_finish(mem_finish),
        // to mem_wb
        .rd_ena_o(mem_rd_ena),
        .rd_data_o(mem_rd_data),
        .rd_addr_o(mem_rd_addr),

        // to pipelinectrl
        .mem_stall_req(mem_stall_req)
    );

   ysyx_210528_mem_wb mem_wb0(
        .clk(clk),
        .rst(rst),

        .mem_rd_data(mem_rd_data),
        .mem_rd_addr(mem_rd_addr),
        .mem_rd_ena(mem_rd_ena),

        .stall_ctrl(stall_ctrl),

        .wb_rd_data(rd_data_wb),
        .wb_rd_addr(rd_addr_wb),
        .wb_rd_ena(rd_ena_wb)
    );

    ysyx_210528_pipeline_ctrl pipeline_ctrl0(
        .rst(rst),
        //input: stall request from id, ex and mem
        .if_stall_req(if_stall_req),
        .id_stall_req(id_stall_req),
        .ex_stall_req(ex_stall_req),
        .mem_stall_req(mem_stall_req),

        //output: stall control signals
        //stall_ctrl[0] --> pc
        //stall_ctrl[1] --> if
        //stall_ctrl[2] --> id
        //stall_ctrl[3] --> ex
        //stall_ctrl[4] --> mem
        //stall_ctrl[5] --> wb
        .stall_ctrl(stall_ctrl)
    );

endmodule



module ysyx_210528 (
    //clock and reset
    input           clock,
    input           reset,
    // interrupt 
    input           io_interrupt,

    // AXI Master Bus

    // write address channel
    input           io_master_awready,
    output          io_master_awvalid,
    output [31:0]   io_master_awaddr,
    output [3:0]    io_master_awid,
    output [7:0]    io_master_awlen,
    output [2:0]    io_master_awsize,
    output [1:0]    io_master_awburst,
                  
    // write data channel
    input           io_master_wready,
    output          io_master_wvalid,
    output [63:0]   io_master_wdata,
    output [7:0]    io_master_wstrb,
    output          io_master_wlast,
                  
    // write response channel
    output          io_master_bready,
    input           io_master_bvalid,
    input  [1:0]    io_master_bresp,
    input  [3:0]    io_master_bid,   
                    
    // read address channel
    input           io_master_arready,
    output          io_master_arvalid,
    output [31:0]   io_master_araddr,
    output [3:0]    io_master_arid,
    output [7:0]    io_master_arlen,
    output [2:0]    io_master_arsize,
    output [1:0]    io_master_arburst,
                    
    // read data channel
    output          io_master_rready,
    input           io_master_rvalid,
    input  [1:0]    io_master_rresp,
    input  [63:0]   io_master_rdata,
    input           io_master_rlast,
    input  [3:0]    io_master_rid,

    // AXI Slave Bus
    // write address channel
    output          io_slave_awready,
    input           io_slave_awvalid,
    input [31:0]    io_slave_awaddr,
    input [3:0]     io_slave_awid,
    input [7:0]     io_slave_awlen,
    input [2:0]     io_slave_awsize,
    input [1:0]     io_slave_awburst,
                  
    // write data channel
    output          io_slave_wready,
    input           io_slave_wvalid,
    input [63:0]    io_slave_wdata,
    input [7:0]     io_slave_wstrb,
    input           io_slave_wlast,
                  
    // write response channel
    input           io_slave_bready,
    output          io_slave_bvalid,
    output [1:0]    io_slave_bresp,
    output [3:0]    io_slave_bid,   
                    
    // read address channel
    output          io_slave_arready,
    input           io_slave_arvalid,
    input [31:0]    io_slave_araddr,
    input [3:0]     io_slave_arid,
    input [7:0]     io_slave_arlen,
    input [2:0]     io_slave_arsize,
    input [1:0]     io_slave_arburst,
                    
    // read data channel
    input           io_slave_rready,
    output          io_slave_rvalid,
    output [1:0]    io_slave_rresp,
    output [63:0]   io_slave_rdata,
    output          io_slave_rlast,
    output [3:0]    io_slave_rid
    );

// connections between core and biu
    // if bus
    wire [`YSYX210528_InstAddrBus]  inst_addr;
    wire [`YSYX210528_InstBus]      inst;
    wire                 inst_ena;
    wire                 inst_valid;
    wire                 inst_ready;

    // mem bus
    wire [`YSYX210528_DataAddrBus]  data_addr;
    wire [`YSYX210528_DataBus]      rdata;
    wire [`YSYX210528_DataBus]      wdata;
    wire [7:0]           wmask;
    wire                 re;
    wire                 we;
    wire                 mem_rfinish;
    wire                 mem_wfinish;
//
//--------------- Interrupt Signals ---------------
    wire                 timer_intr;

// rvcpu
    ysyx_210528_rvcpu rvcpu0(
        .clk(clock),
        .rst(reset),

        //inst bus
        .inst(inst),
        .inst_addr(inst_addr),
        .inst_ena(inst_ena),
        .inst_ready(inst_ready),
        .biu_inst_valid(inst_valid),

        //data bus
        .data_addr(data_addr),
        .wmask(wmask),
        .data_o(wdata),
        .data_i(rdata),
        .we(we),
        .re(re),
        .mem_finish(mem_rfinish|mem_wfinish),

        //interrupt signal
        .timer_intr(timer_intr)
    );
//

// connections between biu and splitter
    // write address channel
    wire [`YSYX210528_AXI_AxID_BUS]        core_aw_id;
    wire [`YSYX210528_AXI_AxADDR_BUS]      core_aw_addr;
    wire [`YSYX210528_AXI_AxLEN_BUS]       core_aw_len;
    wire [`YSYX210528_AXI_AxSIZE_BUS]      core_aw_size;
    wire [`YSYX210528_AXI_AxBURST_BUS]     core_aw_burst;
    wire [`YSYX210528_AXI_AxCACHE_BUS]     core_aw_cache;
    wire [`YSYX210528_AXI_AxPROT_BUS]      core_aw_prot;
    wire [`YSYX210528_AXI_AxQOS_BUS]       core_aw_qos;
    wire                        core_aw_valid;
    wire                        core_aw_ready;
    // write data channel  
    wire [`YSYX210528_AXI_xDATA_BUS]       core_w_data;
    wire [`YSYX210528_AXI_WSTRB_BUS]       core_w_strb;
    wire                        core_w_last;
    wire                        core_w_valid;
    wire                        core_w_ready;
    // write response channel 
    wire [`YSYX210528_AXI_xID_BUS]         core_b_id;
    wire [`YSYX210528_AXI_xRESP_BUS]       core_b_resp;
    wire                        core_b_valid;
    wire                        core_b_ready;
    // read address channel  
    wire [`YSYX210528_AXI_AxID_BUS]        core_ar_id;
    wire [`YSYX210528_AXI_AxADDR_BUS]      core_ar_addr;
    wire [`YSYX210528_AXI_AxLEN_BUS]       core_ar_len;
    wire [`YSYX210528_AXI_AxSIZE_BUS]      core_ar_size;
    wire [`YSYX210528_AXI_AxBURST_BUS]     core_ar_burst;
    wire [`YSYX210528_AXI_AxCACHE_BUS]     core_ar_cache;
    wire [`YSYX210528_AXI_AxPROT_BUS]      core_ar_prot;
    wire [`YSYX210528_AXI_AxQOS_BUS]       core_ar_qos;
    wire                        core_ar_valid;
    wire                        core_ar_ready;
    // read data channel  
    wire [`YSYX210528_AXI_xID_BUS]         core_r_id;
    wire [`YSYX210528_AXI_xDATA_BUS]       core_r_data;
    wire [`YSYX210528_AXI_xRESP_BUS]       core_r_resp;
    wire                        core_r_last;
    wire                        core_r_valid;
    wire                        core_r_ready;
//

// biu
    ysyx_210528_biu biu0 (
    // Global core Signals
        .aclk(clock),
        .aresetn(~reset),

    //---------- CPU Interface Signals ----------
    // signals from if module
        .if_inst_addr(inst_addr),
        .if_inst_ena(inst_ena),
        .if_inst_ready(inst_ready),

        .if_inst_valid(inst_valid),
        .if_inst(inst),

    // signals from mem module
        .mem_data_addr(data_addr),

        .mem_wmask(wmask),
        .mem_wdata(wdata),
        .mem_we(we),
        .mem_wfinish(mem_wfinish),

        .mem_rdata(rdata),
        .mem_re(re),
        .mem_rfinish(mem_rfinish),
    

    //----------- AXI Interface Signals ----------
    // write address channel        
        .axi_aw_valid(core_aw_valid),
        .axi_aw_ready(core_aw_ready),
        .axi_aw_id(core_aw_id),
        .axi_aw_addr(core_aw_addr),
        .axi_aw_len(core_aw_len),
        .axi_aw_size(core_aw_size),
        .axi_aw_burst(core_aw_burst),
        .axi_aw_cache(core_aw_cache),
        .axi_aw_prot(core_aw_prot),
        .axi_aw_qos(core_aw_qos),

    // write data channel
        .axi_w_data(core_w_data),
        .axi_w_strb(core_w_strb),
        .axi_w_last(core_w_last),
        .axi_w_valid(core_w_valid),
        .axi_w_ready(core_w_ready),

    // write response channel
        .axi_b_id(core_b_id),
        .axi_b_resp(core_b_resp),
        .axi_b_valid(core_b_valid),
        .axi_b_ready(core_b_ready),

    // read address channel
        .axi_ar_valid(core_ar_valid),
        .axi_ar_ready(core_ar_ready),
        .axi_ar_id(core_ar_id),
        .axi_ar_addr(core_ar_addr),
        .axi_ar_len(core_ar_len),
        .axi_ar_size(core_ar_size),
        .axi_ar_burst(core_ar_burst),

        .axi_ar_cache(core_ar_cache),
        .axi_ar_prot(core_ar_prot),
        .axi_ar_qos(core_ar_qos),

    // read data channel
        .axi_r_id(core_r_id),
        .axi_r_data(core_r_data),
        .axi_r_resp(core_r_resp),
        .axi_r_last(core_r_last),
        .axi_r_valid(core_r_valid),
        .axi_r_ready(core_r_ready)

    );
//


// io_slave
    assign io_slave_awready = 1'b0;

    assign io_slave_wready  = 1'b0;

    assign io_slave_bvalid  = 1'b0;
    assign io_slave_bid     = 4'b0000;
    assign io_slave_bresp   = 2'b00;


    assign io_slave_arready = 1'b0;

    assign io_slave_rvalid  = 1'b0;
    assign io_slave_rresp   = 2'b00;
    assign io_slave_rdata   = 64'd0;
    assign io_slave_rid     = 4'b0000;
    assign io_slave_rlast   = 1'b0;


//


// connections between splitter and perips
    // write address channel
    wire [1:0] w_splt_indic, r_splt_indic;

    wire [ 4*2-1   :0]   s_aw_id_bus;
    wire [64*2-1   :0]   s_aw_addr_bus;
    wire [ 8*2-1   :0]   s_aw_len_bus;
    wire [ 3*2-1   :0]   s_aw_size_bus;
    wire [ 2*2-1   :0]   s_aw_burst_bus;
    wire [ 1*2-1   :0]   s_aw_valid_bus;
    wire [ 1*2-1   :0]   s_aw_ready_bus;
                                                                   
    // write data channel              
    wire [    64*2-1   :0]   s_w_data_bus;
    wire [(64/8)*2-1   :0]   s_w_strb_bus;
    wire [     1*2-1   :0]   s_w_last_bus;
    wire [     1*2-1   :0]   s_w_valid_bus;
    wire [     1*2-1   :0]   s_w_ready_bus;
                                    
    // write response channel 
    wire [4*2-1    :0]   s_b_id_bus;
    wire [2*2-1    :0]   s_b_resp_bus;
    wire [1*2-1    :0]   s_b_valid_bus;
    wire [1*2-1    :0]   s_b_ready_bus;
                                       
    // read address channel            
    wire [ 4*2-1   :0]   s_ar_id_bus;
    wire [64*2-1   :0]   s_ar_addr_bus;
    wire [ 8*2-1   :0]   s_ar_len_bus;
    wire [ 3*2-1   :0]   s_ar_size_bus;
    wire [ 2*2-1   :0]   s_ar_burst_bus;
    wire [ 1*2-1   :0]   s_ar_valid_bus;
    wire [ 1*2-1   :0]   s_ar_ready_bus;

    // read data channel  
    wire [ 4*2-1   :0]   s_r_id_bus;
    wire [64*2-1   :0]   s_r_data_bus;
    wire [ 2*2-1   :0]   s_r_resp_bus;
    wire [ 1*2-1   :0]   s_r_last_bus;
    wire [ 1*2-1   :0]   s_r_valid_bus;
    wire [ 1*2-1   :0]   s_r_ready_bus;


// connection between clint and splitter
    // write address channel
    wire [`YSYX210528_AXI_AxID_BUS]        clint_aw_id;
    wire [`YSYX210528_AXI_AxADDR_BUS]      clint_aw_addr;
    wire [`YSYX210528_AXI_AxLEN_BUS]       clint_aw_len;
    wire [`YSYX210528_AXI_AxSIZE_BUS]      clint_aw_size;
    wire [`YSYX210528_AXI_AxBURST_BUS]     clint_aw_burst;
    wire                        clint_aw_valid;
    wire                        clint_aw_ready;
    // write data channel   
    wire [`YSYX210528_AXI_xDATA_BUS]       clint_w_data;
    wire [`YSYX210528_AXI_WSTRB_BUS]       clint_w_strb;
    wire                        clint_w_last;
    wire                        clint_w_valid;
    wire                        clint_w_ready;
    // write response channel 
    wire [`YSYX210528_AXI_xID_BUS]         clint_b_id;
    wire [`YSYX210528_AXI_xRESP_BUS]       clint_b_resp;
    wire                        clint_b_valid;
    wire                        clint_b_ready;
    // read address channel  
    wire [`YSYX210528_AXI_AxID_BUS]        clint_ar_id;
    wire [`YSYX210528_AXI_AxADDR_BUS]      clint_ar_addr;
    wire [`YSYX210528_AXI_AxLEN_BUS]       clint_ar_len;
    wire [`YSYX210528_AXI_AxSIZE_BUS]      clint_ar_size;
    wire [`YSYX210528_AXI_AxBURST_BUS]     clint_ar_burst;
    wire                        clint_ar_valid;
    wire                        clint_ar_ready;
    // read data channel  
    wire [`YSYX210528_AXI_xID_BUS]         clint_r_id;
    wire [`YSYX210528_AXI_xDATA_BUS]       clint_r_data;
    wire [`YSYX210528_AXI_xRESP_BUS]       clint_r_resp;
    wire                        clint_r_last;
    wire                        clint_r_valid;
    wire                        clint_r_ready;


    
    assign {clint_aw_id   , io_master_awid   } = s_aw_id_bus   ;
    assign {clint_aw_addr , io_master_awaddr } = {s_aw_addr_bus[127:64], s_aw_addr_bus[31:0]} ;
    assign {clint_aw_len  , io_master_awlen  } = s_aw_len_bus  ;
    assign {clint_aw_size , io_master_awsize } = s_aw_size_bus ;
    assign {clint_aw_burst, io_master_awburst} = s_aw_burst_bus;
    assign {clint_aw_valid, io_master_awvalid} = s_aw_valid_bus;
    assign s_aw_ready_bus = {clint_aw_ready, io_master_awready};
                                       
                                       
    // write data channel              
    assign {clint_w_data  , io_master_wdata } = s_w_data_bus ;
    assign {clint_w_strb  , io_master_wstrb } = s_w_strb_bus ;
    assign {clint_w_last  , io_master_wlast } = s_w_last_bus ;
    assign {clint_w_valid , io_master_wvalid} = s_w_valid_bus;
    assign s_w_ready_bus = {clint_w_ready , io_master_wready};
                                    
    // write response channel 
    assign s_b_id_bus    = {clint_b_id   , io_master_bid   };
    assign s_b_resp_bus  = {clint_b_resp , io_master_bresp };
    assign s_b_valid_bus = {clint_b_valid, io_master_bvalid};
    assign {clint_b_ready, io_master_bready} = s_b_ready_bus;
                                       
    // read address channel            
    assign {clint_ar_id   , io_master_arid   } = s_ar_id_bus   ;
    assign {clint_ar_addr , io_master_araddr } = {s_ar_addr_bus[127:64],s_ar_addr_bus[31:0]};
    assign {clint_ar_len  , io_master_arlen  } = s_ar_len_bus  ;
    assign {clint_ar_size , io_master_arsize } = s_ar_size_bus ;
    assign {clint_ar_burst, io_master_arburst} = s_ar_burst_bus;
    assign {clint_ar_valid, io_master_arvalid} = s_ar_valid_bus;
    assign s_ar_ready_bus =  {clint_ar_ready, io_master_arready};

    // read data channel  
    assign s_r_id_bus    = {clint_r_id   , io_master_rid   } ;
    assign s_r_data_bus  = {clint_r_data , io_master_rdata } ;
    assign s_r_resp_bus  = {clint_r_resp , io_master_rresp } ;
    assign s_r_last_bus  = {clint_r_last , io_master_rlast } ;
    assign s_r_valid_bus = {clint_r_valid, io_master_rvalid} ;
    assign {clint_r_ready, io_master_rready} = s_r_ready_bus ;


    assign w_splt_indic[1] = (core_aw_addr == `YSYX210528_MTIMECMP_ADDR) | (core_aw_addr == `YSYX210528_MTIME_ADDR);
    assign w_splt_indic[0] = (core_aw_addr != `YSYX210528_MTIMECMP_ADDR)  & (core_aw_addr != `YSYX210528_MTIME_ADDR);


    assign r_splt_indic[1] = (core_ar_addr == `YSYX210528_MTIMECMP_ADDR) | (core_ar_addr == `YSYX210528_MTIME_ADDR);
    assign r_splt_indic[0] = (core_ar_addr != `YSYX210528_MTIMECMP_ADDR) & (core_ar_addr != `YSYX210528_MTIME_ADDR);
//


// axi splitter instantiation
    ysyx_210528_axi_splt#(
        .AW       (64),
        .DW       (64),
        .ID_W     (4),
        .SPLT_NUM (2),
        .SPLT_PTR_W(1)
    )axi_splt0(

        .w_splt_indic(w_splt_indic),
        .r_splt_indic(r_splt_indic),
    //----------- AXI Interface Signals To Or From Master ----------
    // write address channel 
        .m_aw_id   (core_aw_id   ),
        .m_aw_addr (core_aw_addr ),
        .m_aw_len  (core_aw_len  ),
        .m_aw_size (core_aw_size ),
        .m_aw_burst(core_aw_burst),
        .m_aw_cache(core_aw_cache),
        .m_aw_prot (core_aw_prot ),
        .m_aw_qos  (core_aw_qos  ),
        .m_aw_valid(core_aw_valid),
        .m_aw_ready(core_aw_ready),
                                                      
    // write data channel   
        .m_w_data (core_w_data ),
        .m_w_strb (core_w_strb ),
        .m_w_last (core_w_last ),
        .m_w_valid(core_w_valid),
        .m_w_ready(core_w_ready),
                          
    // write response channel 
        .m_b_id   (core_b_id   ),
        .m_b_resp (core_b_resp ),
        .m_b_valid(core_b_valid),
        .m_b_ready(core_b_ready),
                                  
    // read address channel  
        .m_ar_id   (core_ar_id   ),
        .m_ar_addr (core_ar_addr ),
        .m_ar_len  (core_ar_len  ),
        .m_ar_size (core_ar_size ),
        .m_ar_burst(core_ar_burst),
        .m_ar_cache(core_ar_cache),
        .m_ar_prot (core_ar_prot ),
        .m_ar_qos  (core_ar_qos  ),
        .m_ar_valid(core_ar_valid),
        .m_ar_ready(core_ar_ready),

    // read data channel  
        .m_r_id   (core_r_id   ),
        .m_r_data (core_r_data ),
        .m_r_resp (core_r_resp ),
        .m_r_last (core_r_last ),
        .m_r_valid(core_r_valid),
        .m_r_ready(core_r_ready),

    //----------- AXI Interface Signals To Or From Slave ----------
    // write address channel 
        .s_aw_id_bus   (s_aw_id_bus   ),
        .s_aw_addr_bus (s_aw_addr_bus ),
        .s_aw_len_bus  (s_aw_len_bus  ),
        .s_aw_size_bus (s_aw_size_bus ),
        .s_aw_burst_bus(s_aw_burst_bus),
        .s_aw_cache_bus(              ),
        .s_aw_prot_bus (              ),
        .s_aw_qos_bus  (              ),
        .s_aw_valid_bus(s_aw_valid_bus),
        .s_aw_ready_bus(s_aw_ready_bus),
                                       
                                       
    // write data channel              
        .s_w_data_bus (s_w_data_bus),
        .s_w_strb_bus (s_w_strb_bus),
        .s_w_last_bus (s_w_last_bus),
        .s_w_valid_bus(s_w_valid_bus),
        .s_w_ready_bus(s_w_ready_bus),
                                    
    // write response channel 
        .s_b_id_bus   (s_b_id_bus   ),
        .s_b_resp_bus (s_b_resp_bus ),
        .s_b_valid_bus(s_b_valid_bus),
        .s_b_ready_bus(s_b_ready_bus),
                                       
    // read address channel            
        .s_ar_id_bus   (s_ar_id_bus   ),
        .s_ar_addr_bus (s_ar_addr_bus ),
        .s_ar_len_bus  (s_ar_len_bus  ),
        .s_ar_size_bus (s_ar_size_bus ),
        .s_ar_burst_bus(s_ar_burst_bus),
        .s_ar_cache_bus(              ),
        .s_ar_prot_bus (              ),
        .s_ar_qos_bus  (              ),
        .s_ar_valid_bus(s_ar_valid_bus),
        .s_ar_ready_bus(s_ar_ready_bus),

    // read data channel  
        .s_r_id_bus   (s_r_id_bus   ),
        .s_r_data_bus (s_r_data_bus ),
        .s_r_resp_bus (s_r_resp_bus ),
        .s_r_last_bus (s_r_last_bus ),
        .s_r_valid_bus(s_r_valid_bus),
        .s_r_ready_bus(s_r_ready_bus)
    );




// clint instantiation
    ysyx_210528_clint clint0 (
        .clk(clock),
        .rst(reset),
    //----------- AXI Interface Signals ----------
    // write address channel (slave)
        .axi_aw_id   (clint_aw_id   ),
        .axi_aw_addr (clint_aw_addr ),
        .axi_aw_len  (clint_aw_len  ),
        .axi_aw_size (clint_aw_size ),
        .axi_aw_burst(clint_aw_burst),
        .axi_aw_valid(clint_aw_valid),
        .axi_aw_ready(clint_aw_ready),

    // write data channel   (slave)
        .axi_w_data  (clint_w_data),
        .axi_w_strb  (clint_w_strb),
        .axi_w_last  (clint_w_last),
        .axi_w_valid (clint_w_valid),
        .axi_w_ready (clint_w_ready),

    // write response channel (slave)
        .axi_b_id    (clint_b_id),
        .axi_b_resp  (clint_b_resp),
        .axi_b_valid (clint_b_valid),
        .axi_b_ready (clint_b_ready),

    // read address channel  (slave)
        .axi_ar_id   (clint_ar_id   ),
        .axi_ar_addr (clint_ar_addr ),
        .axi_ar_len  (clint_ar_len  ),
        .axi_ar_size (clint_ar_size ),
        .axi_ar_burst(clint_ar_burst),
        .axi_ar_valid(clint_ar_valid),
        .axi_ar_ready(clint_ar_ready),

    // read data channel  (slave)
        .axi_r_id    (clint_r_id    ),
        .axi_r_data  (clint_r_data  ),
        .axi_r_resp  (clint_r_resp  ),
        .axi_r_last  (clint_r_last  ),
        .axi_r_valid (clint_r_valid ),
        .axi_r_ready (clint_r_ready ),
    
    //--------------- Interrupt Signals ---------------
        .timer_intr  (timer_intr    )
    );
//


endmodule









