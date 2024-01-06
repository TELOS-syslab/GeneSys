`define Resnet50_layer0_conv_bias_relu1
    bit [31:0] instruction_base_addr    = 32'd67108864;

`ifdef Resnet50_layer0_conv_bias_relu1
    bit [31:0] num_instruction_bytes               = 32'd1024; 
    bit [63:0] axi00_imem_addr                     = 67108864; 
    bit [63:0] axi03_obuf_addr                     = 542003200;                                                 
    bit [63:0] axi04_simd_addr                     = 0;
    
    bit [63:0] axi01_parambuf_offset               = 229376;  
    bit [63:0] axi02_ibuf_offset                   = 29597696;  
    bit [63:0] axi04_bias_offset                   = 430080;  
    bit [63:0] obuf_ptr1_st_offset                 = 0;
    bit [63:0] axi04_simd_ld_ptr_offset1           = 0;
    bit [63:0] axi04_simd_ld_ptr_offset2           = 0;                 
    bit [63:0] axi04_simd_st_ptr_offset1           = 0;
    bit [63:0] axi04_simd_st_ptr_offset2           = 26210304;  
    bit last_layer_obuf                            = 0;

    bit [63:0] axi01_parambuf_addr                 = axi00_imem_addr + axi01_parambuf_offset;
    bit [63:0] axi02_ibuf_addr                     = axi00_imem_addr + axi02_ibuf_offset;
    bit [63:0] axi04_bias_addr                     = axi00_imem_addr + axi04_bias_offset;
    bit [63:0] obuf_ptr1_st                        = axi03_obuf_addr + obuf_ptr1_st_offset;
    bit [63:0] vmem_ptr1_st                        = axi04_simd_addr+axi04_simd_st_ptr_offset1;
    bit [63:0] vmem_ptr2_st                        = axi04_simd_addr+axi04_simd_st_ptr_offset2;

    integer config_stride                          = 1048576;
    integer config_input_num_tiles                 = 1;
    integer config_bias_num_tiles                  = 4;
    integer config_weight_num_tiles                = 4;
    integer config_output_num_tiles                = 4;  
    integer config_input_tile_size_32B_cnt         = 128;
    integer config_bias_tile_size_32B_cnt          = 256;
    integer config_weight_tile_size_32B_cnt        = 32768;
    integer config_output_tile_size_32B_cnt        = 256;

    integer instr_filep   = $fopen("./path_to_compiled_test_folder/layer0_conv_bias_relu1/conv_bias_relu1_decimal.txt","r"); 
    integer instr_filep1  = $fopen("./path_to_compiled_test_folder/layer0_conv_bias_relu1/conv_bias_relu1_decimal.txt","r"); 

    integer output_filep  = $fopen("./path_to_compiled_test_folder/layer0_conv_bias_relu1/data/relu_1_323Y.txt","r");
    integer output_filep1 = $fopen("./path_to_compiled_test_folder/layer0_conv_bias_relu1/data/relu_1_323Y.txt","r");
    integer output_filep2 = $fopen("./path_to_compiled_test_folder/layer0_conv_bias_relu1/data/relu_1_323Y.txt","r");

    integer input_filep   = $fopen("./path_to_compiled_test_folder/layer0_conv_bias_relu1/data/input/input_shuffled.txt","r");
    integer input_filep1  = $fopen("./path_to_compiled_test_folder/layer0_conv_bias_relu1/data/input/input_shuffled.txt","r");

    integer params_filep  = $fopen("./path_to_compiled_test_folder/layer0_conv_bias_relu1/data/conv_0_497B/conv_0_497B_shuffled.txt","r"); 
    integer params_filep1 = $fopen("./path_to_compiled_test_folder/layer0_conv_bias_relu1/data/conv_0_497B/conv_0_497B_shuffled.txt","r"); 

    integer bias_filep    = $fopen("./path_to_compiled_test_folder/layer0_conv_bias_relu1/data/conv_0_498D.txt","r"); 
    integer bias_filep1   = $fopen("./path_to_compiled_test_folder/layer0_conv_bias_relu1/data/conv_0_498D.txt","r"); 
    
    integer simd_file1    = $fopen("./path_to_compiled_test_folder/layer0_conv_bias_relu1/conv_bias_relu1_decimal.txt","r");
    integer simd_file2    = $fopen("./path_to_compiled_test_folder/layer0_conv_bias_relu1/conv_bias_relu1_decimal.txt","r");

`endif
