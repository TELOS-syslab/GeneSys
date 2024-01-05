`define Resnet50_gemm57
    bit [31:0] instruction_base_addr    = 32'd67108864;

`ifdef Resnet50_gemm57
    bit [31:0] num_instruction_bytes               = 32'd1024; // num_instr * 4
    bit [63:0] axi00_imem_addr                     = 67108864; // does not matter as Innstructions as written using config reg
    bit [63:0] axi03_obuf_addr                     = 542003200;                                                 
    
    bit [63:0] axi01_parambuf_addr                 = 84140032;  // 67108864+17031168
    bit [63:0] axi02_ibuf_addr                     = 93728768;  // 67108864+26619904
    bit [63:0] axi04_bias_addr                     = 75849728;  // 67108864+8740864

    bit [63:0] axi04_simd_addr                     = 0;
    bit [63:0] axi04_simd_ld_ptr_offset0           = 0;
    bit [63:0] axi04_simd_ld_ptr_offset1           = 0;                 
    
    bit last_layer_obuf                            = 0;
    bit [63:0] obuf_ptr1_st                        = axi03_obuf_addr + 0;
    bit [63:0] vmem_ptr1_st                        = 26210304;
    bit [63:0] vmem_ptr2_st                        = 0;
    
    // integer config_stride                          = 1048576; // high stride = 0 & Low stride = 4096
    // integer config_input_num_tiles                 = 1;
    // integer config_bias_num_tiles                  = 4;
    // integer config_weight_num_tiles                = 4;
    // integer config_output_num_tiles                = 4;  
    // integer config_input_tile_size_32B_cnt         = 128;
    // integer config_bias_tile_size_32B_cnt          = 256;
    // integer config_weight_tile_size_32B_cnt        = 32768;
    // integer config_output_tile_size_32B_cnt        = 256;
    
    bit last_layer_obuf                            = 1;
    integer instr_filep   = $fopen("./path_to_compiled_test_folder/layer56_gemm57/gemm57_decimal.txt","r"); 
    integer instr_filep1  = $fopen("./path_to_compiled_test_folder/layer56_gemm57/gemm57_decimal.txt","r"); 

    integer output_filep  = $fopen("./path_to_compiled_test_folder/layer56_gemm57/data/output.txt","r");
    integer output_filep1 = $fopen("./path_to_compiled_test_folder/layer56_gemm57/data/output.txt","r");
    integer output_filep2 = $fopen("./path_to_compiled_test_folder/layer56_gemm57/data/output.txt","r");

    integer input_filep   = $fopen("./path_to_compiled_test_folder/layer56_gemm57/data/flatten_120_494Y/flatten_120_494Y_shuffled.txt","r");
    integer input_filep1  = $fopen("./path_to_compiled_test_folder/layer56_gemm57/data/flatten_120_494Y/flatten_120_494Y_shuffled.txt","r");

    integer params_filep  = $fopen("./path_to_compiled_test_folder/layer56_gemm57/data/fc.weight/fc.weight_shuffled.txt","r"); 
    integer params_filep1 = $fopen("./path_to_compiled_test_folder/layer56_gemm57/data/fc.weight/fc.weight_shuffled.txt","r"); 

    integer bias_filep    = $fopen("./path_to_compiled_test_folder/layer56_gemm57/data/fc.bias.txt","r"); 
    integer bias_filep1   = $fopen("./path_to_compiled_test_folder/layer56_gemm57/data/fc.bias.txt","r"); 
    
    integer simd_file1    = $fopen("./path_to_compiled_test_folder/layer56_gemm57/gemm57_decimal.txt","r");
    integer simd_file2    = $fopen("./path_to_compiled_test_folder/layer56_gemm57/gemm57_decimal.txt","r");

`endif
