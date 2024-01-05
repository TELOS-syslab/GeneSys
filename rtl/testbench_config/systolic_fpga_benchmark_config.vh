`define Resnet50_gemm57
    bit [31:0] instruction_base_addr    = 32'd67108864;

`ifdef Resnet50_gemm57
    bit [31:0] num_instruction_bytes               = 32'd600; // num_instr * 4
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
    
    integer config_stride                          = 1048576; // high stride = 0 & Low stride = 4096
    integer config_input_num_tiles                 = 1;
    integer config_bias_num_tiles                  = 4;
    integer config_weight_num_tiles                = 4;
    integer config_output_num_tiles                = 4;  
    integer config_input_tile_size_32B_cnt         = 128;
    integer config_bias_tile_size_32B_cnt          = 256;
    integer config_weight_tile_size_32B_cnt        = 32768;
    integer config_output_tile_size_32B_cnt        = 256;
    
    bit last_layer_obuf                            = 1;
    integer instr_filep   = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer56_gemm57/gemm57_decimal.txt","r"); 
    integer instr_filep1  = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer56_gemm57/gemm57_decimal.txt","r"); 

    integer output_filep  = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer56_gemm57/data/output.txt","r");
    integer output_filep1 = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer56_gemm57/data/output.txt","r");
    integer output_filep2 = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer56_gemm57/data/output.txt","r");

    integer input_filep   = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer56_gemm57/data/flatten_120_494Y/flatten_120_494Y_shuffled.txt","r");
    integer input_filep1  = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer56_gemm57/data/flatten_120_494Y/flatten_120_494Y_shuffled.txt","r");

    integer params_filep  = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer56_gemm57/data/fc.weight/fc.weight_shuffled.txt","r"); 
    integer params_filep1 = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer56_gemm57/data/fc.weight/fc.weight_shuffled.txt","r"); 

    integer bias_filep    = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer56_gemm57/data/fc.bias.txt","r"); 
    integer bias_filep1   = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer56_gemm57/data/fc.bias.txt","r"); 
    
    integer simd_file1    = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer56_gemm57/gemm57_decimal.txt","r");
    integer simd_file2    = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer56_gemm57/gemm57_decimal.txt","r");

`elsif bert_layer3_transpose2d
    bit [31:0] num_instruction_bytes               = 32'd1300; // num_instr * 4
    bit [63:0] axi00_imem_addr                     = 67108864; // does not matter as Innstructions as written using config reg
    bit [63:0] axi03_obuf_addr                     = 542003200;
                                                     
    bit [63:0] axi01_parambuf_addr                 = 93298688; // 67108864 + 26189824
    bit [63:0] axi02_ibuf_addr                     = 96747520; // 67108864 + 29638656
    bit [63:0] axi04_bias_addr                     = 92155904; // 67108864 + 25047040
    
    bit [63:0] axi04_simd_addr                     = 0;
    bit [63:0] axi04_simd_ld_ptr_offset0           = 0;
    bit [63:0] axi04_simd_ld_ptr_offset1           = 0;
    
    bit last_layer_obuf                            = 0;
    bit [63:0] obuf_ptr1_st                        = axi03_obuf_addr + 0;
    bit [63:0] vmem_ptr1_st                        = 26210304;
    bit [63:0] vmem_ptr2_st                        = 0;
    
    integer config_stride                          = 1048576; // high stride = 0 & Low stride = 4096
    integer config_input_num_tiles                 = 1;
    integer config_bias_num_tiles                  = 4;
    integer config_weight_num_tiles                = 4;
    integer config_output_num_tiles                = 4;  
    integer config_input_tile_size_32B_cnt         = 128;
    integer config_bias_tile_size_32B_cnt          = 256;
    integer config_weight_tile_size_32B_cnt        = 32768;
    integer config_output_tile_size_32B_cnt        = 256;
      
    integer instr_filep   = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/bert-base-cased-transpose-opt-trimmed-ort_benchmark16x16_endtoend/layer3_tensor_transpose3d4/tensor_transpose3d4_decimal.txt","r");
    integer instr_filep1  = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/bert-base-cased-transpose-opt-trimmed-ort_benchmark16x16_endtoend/layer3_tensor_transpose3d4/tensor_transpose3d4_decimal.txt","r"); 

    integer output_filep  = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/bert-base-cased-transpose-opt-trimmed-ort_benchmark16x16_endtoend/layer3_tensor_transpose3d4/data/229_transposed.txt","r");
    integer output_filep1 = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/bert-base-cased-transpose-opt-trimmed-ort_benchmark16x16_endtoend/layer3_tensor_transpose3d4/data/229_transposed.txt","r");
    integer output_filep2 = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/bert-base-cased-transpose-opt-trimmed-ort_benchmark16x16_endtoend/layer3_tensor_transpose3d4/data/229_transposed.txt","r");

    integer input_filep   = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer4_conv_bias5/data/maxpool_2_324Y/maxpool_2_324Y_shuffled.txt","r");
    integer input_filep1  = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer4_conv_bias5/data/maxpool_2_324Y/maxpool_2_324Y_shuffled.txt","r");

    integer params_filep  = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer4_conv_bias5/data/conv_8_509B/conv_8_509B_shuffled.txt","r"); 
    integer params_filep1 = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer4_conv_bias5/data/conv_8_509B/conv_8_509B_shuffled.txt","r"); 

    integer bias_filep    = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer4_conv_bias5/data/conv_8_510D.txt","r"); 
    integer bias_filep1   = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer4_conv_bias5/data/conv_8_510D.txt","r"); 
    
    integer simd_file1    = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/bert-base-cased-transpose-opt-trimmed-ort_benchmark16x16_endtoend/layer3_tensor_transpose3d4/data/add_19_229Y.txt","r");
    integer simd_file2    = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/bert-base-cased-transpose-opt-trimmed-ort_benchmark16x16_endtoend/layer3_tensor_transpose3d4/data/add_19_229Y.txt","r");

`elsif Resnet50_conv_bias_relu1_noquant
    bit [31:0] num_instruction_bytes               = 32'd2048; // num_instr * 4
    bit [63:0] axi00_imem_addr                     = 67108864; // does not matter as Innstructions as written using config reg
    bit [63:0] axi03_obuf_addr                     = 542003200;
                                                     
    bit [63:0] axi01_parambuf_addr                 = 93298688; // 67108864 + 9379840
    bit [63:0] axi02_ibuf_addr                     = 96747520; // 67108864 + 26234880
    bit [63:0] axi04_bias_addr                     = 92155904; // 67108864 + 1523712
    
    bit [63:0] axi04_simd_addr                     = 0;
    bit [63:0] axi04_simd_ld_ptr_offset0           = 0;
    bit [63:0] axi04_simd_ld_ptr_offset1           = 0;
    
    bit last_layer_obuf                            = 0;
    bit [63:0] obuf_ptr1_st                        = axi03_obuf_addr + 0;
    bit [63:0] vmem_ptr1_st                        = 0;
    bit [63:0] vmem_ptr2_st                        = 29622272;
    
    integer config_stride                          = 1048576; // high stride = 0 & Low stride = 4096
    integer config_input_num_tiles                 = 1;
    integer config_bias_num_tiles                  = 4;
    integer config_weight_num_tiles                = 4;
    integer config_output_num_tiles                = 4;  
    integer config_input_tile_size_32B_cnt         = 128;
    integer config_bias_tile_size_32B_cnt          = 256;
    integer config_weight_tile_size_32B_cnt        = 32768;
    integer config_output_tile_size_32B_cnt        = 256;
      
    integer instr_filep   = $fopen("C:/Users/hax032/Desktop/resnet50_genesys16x16/layer0_conv_bias_relu1/conv_bias_relu1_decimal.txt","r");
    integer instr_filep1  = $fopen("C:/Users/hax032/Desktop/resnet50_genesys16x16/layer0_conv_bias_relu1/conv_bias_relu1_decimal.txt","r"); 

    integer output_filep  = $fopen("C:/Users/hax032/Desktop/resnet50_genesys16x16/layer0_conv_bias_relu1/data/relu_1_323Y.txt","r");
    integer output_filep1 = $fopen("C:/Users/hax032/Desktop/resnet50_genesys16x16/layer0_conv_bias_relu1/data/relu_1_323Y.txt","r");
    integer output_filep2 = $fopen("C:/Users/hax032/Desktop/resnet50_genesys16x16/layer0_conv_bias_relu1/data/relu_1_323Y.txt","r");

    integer input_filep   = $fopen("C:/Users/hax032/Desktop/resnet50_genesys16x16/layer0_conv_bias_relu1/data/input/input_shuffled.txt","r");
    integer input_filep1  = $fopen("C:/Users/hax032/Desktop/resnet50_genesys16x16/layer0_conv_bias_relu1/data/input/input_shuffled.txt","r");

    integer params_filep  = $fopen("C:/Users/hax032/Desktop/resnet50_genesys16x16/layer0_conv_bias_relu1/data/conv_0_497B/conv_0_497B_shuffled.txt","r"); 
    integer params_filep1 = $fopen("C:/Users/hax032/Desktop/resnet50_genesys16x16/layer0_conv_bias_relu1/data/conv_0_497B/conv_0_497B_shuffled.txt","r"); 

    integer bias_filep    = $fopen("C:/Users/hax032/Desktop/resnet50_genesys16x16/layer0_conv_bias_relu1/data/conv_0_498D.txt","r"); 
    integer bias_filep1   = $fopen("C:/Users/hax032/Desktop/resnet50_genesys16x16/layer0_conv_bias_relu1/data/conv_0_498D.txt","r"); 
    
    integer simd_file1    = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer1_max_pool2/data/relu_1_323Y.txt","r");
    integer simd_file2    = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer1_max_pool2/data/relu_1_323Y.txt","r");

`elsif SAC_1
    bit [31:0] num_instruction_bytes               = 32'd2048; // num_instr * 4
    bit [63:0] axi00_imem_addr                     = 67108864; // does not matter as Innstructions as written using config reg
    bit [63:0] axi03_obuf_addr                     = 542003200;
                                                     
    bit [63:0] axi01_parambuf_addr                 = 67121152; // 67108864 + 12288
    bit [63:0] axi02_ibuf_addr                     = 67280896; // 67108864 + 172032
    bit [63:0] axi04_bias_addr                     = 67260416; // 67108864 + 151552
    
    bit [63:0] axi04_simd_addr                     = 0;
    bit [63:0] axi04_simd_ld_ptr_offset0           = 0;
    bit [63:0] axi04_simd_ld_ptr_offset1           = 0;
    
    bit last_layer_obuf                            = 0;
    bit [63:0] obuf_ptr1_st                        = axi03_obuf_addr + 0;
    bit [63:0] vmem_ptr1_st                        = 176128;
    bit [63:0] vmem_ptr2_st                        = 0;
    
    integer config_stride                          = 1048576; // high stride = 0 & Low stride = 4096
    integer config_input_num_tiles                 = 1;
    integer config_bias_num_tiles                  = 4;
    integer config_weight_num_tiles                = 4;
    integer config_output_num_tiles                = 4;  
    integer config_input_tile_size_32B_cnt         = 128;
    integer config_bias_tile_size_32B_cnt          = 256;
    integer config_weight_tile_size_32B_cnt        = 32768;
    integer config_output_tile_size_32B_cnt        = 256;
      
    integer instr_filep   = $fopen("C:/Users/hax032/Desktop/sac_model_simd_repo_genesys16x16/layer0_gemm_relu1/gemm_relu1_decimal.txt","r");
    integer instr_filep1  = $fopen("C:/Users/hax032/Desktop/sac_model_simd_repo_genesys16x16/layer0_gemm_relu1/gemm_relu1_decimal.txt","r"); 

    integer output_filep  = $fopen("C:/Users/hax032/Desktop/sac_model_simd_repo_genesys16x16/layer0_gemm_relu1/data/onnx_Gemm_8_Y.txt","r");
    integer output_filep1 = $fopen("C:/Users/hax032/Desktop/sac_model_simd_repo_genesys16x16/layer0_gemm_relu1/data/onnx_Gemm_8_Y.txt","r");
    integer output_filep2 = $fopen("C:/Users/hax032/Desktop/sac_model_simd_repo_genesys16x16/layer0_gemm_relu1/data/onnx_Gemm_8_Y.txt","r");

    integer input_filep   = $fopen("C:/Users/hax032/Desktop/sac_model_simd_repo_genesys16x16/layer0_gemm_relu1/data/onnx_Gemm_0_A/onnx_Gemm_0_A_shuffled.txt","r");
    integer input_filep1  = $fopen("C:/Users/hax032/Desktop/sac_model_simd_repo_genesys16x16/layer0_gemm_relu1/data/onnx_Gemm_0_A/onnx_Gemm_0_A_shuffled.txt","r");

    integer params_filep  = $fopen("C:/Users/hax032/Desktop/sac_model_simd_repo_genesys16x16/layer0_gemm_relu1/data/actor.0.0.weight/actor.0.0.weight_shuffled.txt","r"); 
    integer params_filep1 = $fopen("C:/Users/hax032/Desktop/sac_model_simd_repo_genesys16x16/layer0_gemm_relu1/data/actor.0.0.weight/actor.0.0.weight_shuffled.txt","r"); 

    integer bias_filep    = $fopen("C:/Users/hax032/Desktop/sac_model_simd_repo_genesys16x16/layer0_gemm_relu1/data/actor.0.0.bias.txt","r"); 
    integer bias_filep1   = $fopen("C:/Users/hax032/Desktop/sac_model_simd_repo_genesys16x16/layer0_gemm_relu1/data/actor.0.0.bias.txt","r"); 
    
    integer simd_file1    = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer1_max_pool2/data/relu_1_323Y.txt","r");
    integer simd_file2    = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer1_max_pool2/data/relu_1_323Y.txt","r");

`elsif Resnet50_conv_bias5
    bit [31:0] num_instruction_bytes               = 32'd1300; // num_instr * 4
    bit [63:0] axi00_imem_addr                     = 67108864; // does not matter as Innstructions as written using config reg
    bit [63:0] axi03_obuf_addr                     = 542003200;
                                                     
    bit [63:0] axi01_parambuf_addr                 = 93298688; // 67108864 + 3833856
    bit [63:0] axi02_ibuf_addr                     = 96747520; // 67108864 + 29638656
    bit [63:0] axi04_bias_addr                     = 92155904; // 67108864 + 12546048
    
    bit [63:0] axi04_simd_addr                     = 0;
    bit [63:0] axi04_simd_ld_ptr_offset0           = 0;
    bit [63:0] axi04_simd_ld_ptr_offset1           = 0;
    
    bit last_layer_obuf                            = 0;
    bit [63:0] obuf_ptr1_st                        = axi03_obuf_addr + 0;
    bit [63:0] vmem_ptr1_st                        = 26210304;
    bit [63:0] vmem_ptr2_st                        = 0;
    
    integer config_stride                          = 1048576; // high stride = 0 & Low stride = 4096
    integer config_input_num_tiles                 = 1;
    integer config_bias_num_tiles                  = 4;
    integer config_weight_num_tiles                = 4;
    integer config_output_num_tiles                = 4;  
    integer config_input_tile_size_32B_cnt         = 128;
    integer config_bias_tile_size_32B_cnt          = 256;
    integer config_weight_tile_size_32B_cnt        = 32768;
    integer config_output_tile_size_32B_cnt        = 256;
      
    integer instr_filep   = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer4_conv_bias5/conv_bias5_decimal.txt","r");
    integer instr_filep1  = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer4_conv_bias5/conv_bias5_decimal.txt","r"); 

    integer output_filep  = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer4_conv_bias5/data/conv_8_508Y.txt","r");
    integer output_filep1 = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer4_conv_bias5/data/conv_8_508Y.txt","r");
    integer output_filep2 = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer4_conv_bias5/data/conv_8_508Y.txt","r");

    integer input_filep   = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer4_conv_bias5/data/maxpool_2_324Y/maxpool_2_324Y_shuffled.txt","r");
    integer input_filep1  = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer4_conv_bias5/data/maxpool_2_324Y/maxpool_2_324Y_shuffled.txt","r");

    integer params_filep  = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer4_conv_bias5/data/conv_8_509B/conv_8_509B_shuffled.txt","r"); 
    integer params_filep1 = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer4_conv_bias5/data/conv_8_509B/conv_8_509B_shuffled.txt","r"); 

    integer bias_filep    = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer4_conv_bias5/data/conv_8_510D.txt","r"); 
    integer bias_filep1   = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer4_conv_bias5/data/conv_8_510D.txt","r"); 
    
    integer simd_file1    = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer1_max_pool2/data/relu_1_323Y.txt","r");
    integer simd_file2    = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer1_max_pool2/data/relu_1_323Y.txt","r");
    
`elsif Resnet50_conv_bias_add_relu54
    bit [31:0] num_instruction_bytes               = 32'd2048; // num_instr * 4
    bit [63:0] axi00_imem_addr                     = 67108864; // does not matter as Innstructions as written using config reg
    bit [63:0] axi03_obuf_addr                     = 542003200;
                                                     
    bit [63:0] axi01_parambuf_addr                 = 74264576; // 67108864 + 7155712
    bit [63:0] axi02_ibuf_addr                     = 93765632; // 67108864 + 26656768
    bit [63:0] axi04_bias_addr                     = 75313152; // 67108864 + 8204288
    
    bit [63:0] axi04_simd_addr                     = 0;
    bit [63:0] axi04_simd_ld_ptr_offset0           = 26210304;
    bit [63:0] axi04_simd_ld_ptr_offset1           = 0;
    
    bit last_layer_obuf                            = 1;
    bit [63:0] obuf_ptr1_st                        = axi03_obuf_addr + 0;
    bit [63:0] vmem_ptr1_st                        = 26210304;
    bit [63:0] vmem_ptr2_st                        = 0;
    
    integer config_stride                          = 1048576; // high stride = 0 & Low stride = 4096
    integer config_input_num_tiles                 = 1;
    integer config_bias_num_tiles                  = 4;
    integer config_weight_num_tiles                = 4;
    integer config_output_num_tiles                = 4;  
    integer config_input_tile_size_32B_cnt         = 128;
    integer config_bias_tile_size_32B_cnt          = 256;
    integer config_weight_tile_size_32B_cnt        = 32768;
    integer config_output_tile_size_32B_cnt        = 256;
      
    integer instr_filep   = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer53_conv_bias_add_relu54/conv_bias_add_relu54_decimal.txt","r");
    integer instr_filep1  = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer53_conv_bias_add_relu54/conv_bias_add_relu54_decimal.txt","r"); 

    integer output_filep  = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer53_conv_bias_add_relu54/data/relu_118_492Y.txt","r");
    integer output_filep1 = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer53_conv_bias_add_relu54/data/relu_118_492Y.txt","r");
    integer output_filep2 = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer53_conv_bias_add_relu54/data/relu_118_492Y.txt","r");

    integer input_filep   = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer53_conv_bias_add_relu54/data/relu_115_488Y/relu_115_488Y_shuffled.txt","r");
    integer input_filep1  = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer53_conv_bias_add_relu54/data/relu_115_488Y/relu_115_488Y_shuffled.txt","r");

    integer params_filep  = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer53_conv_bias_add_relu54/data/conv_116_653B/conv_116_653B_shuffled.txt","r"); 
    integer params_filep1 = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer53_conv_bias_add_relu54/data/conv_116_653B/conv_116_653B_shuffled.txt","r"); 

    integer bias_filep    = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer53_conv_bias_add_relu54/data/conv_116_654D.txt","r"); 
    integer bias_filep1   = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer53_conv_bias_add_relu54/data/conv_116_654D.txt","r"); 
    
    integer simd_file1    = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer53_conv_bias_add_relu54/data/relu_111_482Y.txt","r");
    integer simd_file2    = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_benchmark16x16_endtoend_quant0/layer53_conv_bias_add_relu54/data/relu_111_482Y.txt","r");
    
 `elsif Resnet50_conv_bias_relu3
    bit [31:0] num_instruction_bytes               = 32'd980; // num_instr * 4
    bit [63:0] axi00_imem_addr                     = 67108864; // does not matter as Innstructions as written using config reg
    bit [63:0] axi03_obuf_addr                     = 542003200;
                                                     
    bit [63:0] axi01_parambuf_addr                 = 79613952; // 67108864 + 12505088
    bit [63:0] axi02_ibuf_addr                     = 96747520; // 67108864 + 29638656
    bit [63:0] axi04_bias_addr                     = 80191488; // 67108864 + 13082624
    
    bit [63:0] axi04_simd_addr                     = 0;
    bit [63:0] axi04_simd_ld_ptr_offset0           = 0;
    bit [63:0] axi04_simd_ld_ptr_offset1           = 0;
    
    bit last_layer_obuf                            = 0;
    bit [63:0] obuf_ptr1_st                        = axi03_obuf_addr + 0;
    bit [63:0] vmem_ptr1_st                        = 0;
    bit [63:0] vmem_ptr2_st                        = 29421568;
    
    integer config_stride                          = 1048576; // high stride = 0 & Low stride = 4096
    integer config_input_num_tiles                 = 1;
    integer config_bias_num_tiles                  = 4;
    integer config_weight_num_tiles                = 4;
    integer config_output_num_tiles                = 4;  
    integer config_input_tile_size_32B_cnt         = 128;
    integer config_bias_tile_size_32B_cnt          = 256;
    integer config_weight_tile_size_32B_cnt        = 32768;
    integer config_output_tile_size_32B_cnt        = 256;
      
    integer instr_filep   = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer2_conv_bias_relu3/conv_bias_relu3_decimal.txt","r");
    integer instr_filep1  = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer2_conv_bias_relu3/conv_bias_relu3_decimal.txt","r"); 

    integer output_filep  = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer2_conv_bias_relu3/data/relu_4_327Y.txt","r");
    integer output_filep1 = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer2_conv_bias_relu3/data/relu_4_327Y.txt","r");
    integer output_filep2 = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer2_conv_bias_relu3/data/relu_4_327Y.txt","r");

    integer input_filep   = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer2_conv_bias_relu3/data/maxpool_2_324Y/maxpool_2_324Y_shuffled.txt","r");
    integer input_filep1  = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer2_conv_bias_relu3/data/maxpool_2_324Y/maxpool_2_324Y_shuffled.txt","r");

    integer params_filep  = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer2_conv_bias_relu3/data/conv_3_500B/conv_3_500B_shuffled.txt","r"); 
    integer params_filep1 = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer2_conv_bias_relu3/data/conv_3_500B/conv_3_500B_shuffled.txt","r"); 

    integer bias_filep    = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer2_conv_bias_relu3/data/conv_3_501D.txt","r"); 
    integer bias_filep1   = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer2_conv_bias_relu3/data/conv_3_501D.txt","r"); 
    
    integer simd_file1    = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer1_max_pool2/data/relu_1_323Y.txt","r");
    integer simd_file2    = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer1_max_pool2/data/relu_1_323Y.txt","r");
    
 `elsif Resnet50_conv_bias_add_relu6
    bit [31:0] num_instruction_bytes               = 32'd1264; // num_instr * 4
    bit [63:0] axi00_imem_addr                     = 67108864; // does not matter as Innstructions as written using config reg
    bit [63:0] axi03_obuf_addr                     = 542003200;
                                                     
    bit [63:0] axi01_parambuf_addr                 = 73273344; // 67108864 + 6164480
    bit [63:0] axi02_ibuf_addr                     = 99741696; // 67108864 + 32632832
    bit [63:0] axi04_bias_addr                     = 82550784; // 67108864 + 15441920
    
    bit [63:0] axi04_simd_addr                     = 0;
    bit [63:0] axi04_simd_ld_ptr_offset0           = 26210304;
    bit [63:0] axi04_simd_ld_ptr_offset1           = 0;
    
    bit last_layer_obuf                            = 0;
    bit [63:0] obuf_ptr1_st                        = axi03_obuf_addr + 0;
    bit [63:0] vmem_ptr1_st                        = 29421568;
    bit [63:0] vmem_ptr2_st                        = 0;
    
    integer config_stride                          = 1048576; // high stride = 0 & Low stride = 4096
    integer config_input_num_tiles                 = 1;
    integer config_bias_num_tiles                  = 4;
    integer config_weight_num_tiles                = 4;
    integer config_output_num_tiles                = 4;  
    integer config_input_tile_size_32B_cnt         = 128;
    integer config_bias_tile_size_32B_cnt          = 256;
    integer config_weight_tile_size_32B_cnt        = 32768;
    integer config_output_tile_size_32B_cnt        = 256;
      
    integer instr_filep   = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer5_conv_bias_add_relu6/conv_bias_add_relu6_decimal.txt","r");
    integer instr_filep1  = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer5_conv_bias_add_relu6/conv_bias_add_relu6_decimal.txt","r"); 

    integer output_filep  = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer5_conv_bias_add_relu6/data/relu_10_336Y.txt","r");
    integer output_filep1 = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer5_conv_bias_add_relu6/data/relu_10_336Y.txt","r");
    integer output_filep2 = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer5_conv_bias_add_relu6/data/relu_10_336Y.txt","r");

    integer input_filep   = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer5_conv_bias_add_relu6/data/relu_6_330Y/relu_6_330Y_shuffled.txt","r");
    integer input_filep1  = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer5_conv_bias_add_relu6/data/relu_6_330Y/relu_6_330Y_shuffled.txt","r");

    integer params_filep  = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer5_conv_bias_add_relu6/data/conv_7_506B/conv_7_506B_shuffled.txt","r"); 
    integer params_filep1 = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer5_conv_bias_add_relu6/data/conv_7_506B/conv_7_506B_shuffled.txt","r"); 

    integer bias_filep    = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer5_conv_bias_add_relu6/data/conv_7_507D.txt","r"); 
    integer bias_filep1   = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer5_conv_bias_add_relu6/data/conv_7_507D.txt","r"); 
    
    integer simd_file1    = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer5_conv_bias_add_relu6/data/conv_8_508Y.txt","r");
    integer simd_file2    = $fopen("C:/Users/hax032/Desktop/genesys_tests/16x16/resnet50_9_29_23_data/layer5_conv_bias_add_relu6/data/conv_8_508Y.txt","r");    

`endif
