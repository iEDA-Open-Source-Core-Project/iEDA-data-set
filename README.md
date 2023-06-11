# iEDA-data-set

## 要求

- 内核配置:写清楚内核包括的部件, 比如, 经典五级流水线, ICACHE+DCACHE, AXI4-Full 总线  
  每级流水的基本左右: if 取指, id 译码, ex 执行, mem 访存, wb 写会, ICACHE+DCACHE 指令与数据高速缓存, AXI4-Full 总线连接核与 SoC
- 仓库位置: https://github.com/iEDA-Open-Source-Core-Project/iEDA-data-set/edit/main/README.md
- 分支:main
- 贡献者: 卢狗  
  **在文件 ysyx_name.v 的 title 部分同步相关信息**

## e203

- 内核配置:不带`ITCM/DTCM`,分支预测为静态预测,已测试指令集为`RISCV-32 I/M`;  
  2 级流水线处理器核,流水线的按序主体是位于第一级的“取指”和位于第二级的“执行”和“写回”;
- 仓库位置:https://github.com/iEDA-Open-Source-Core-Project/e203
- 分支:main

## darkriscv

- 内核配置：含 pre-decode id/ex wb 3 级流水线处理器核; ICACHE+DCACHE 指令与数据高速缓存;
  AXI4-Full 总线连接核与 SoC 支持 RISCV-32 I 指令集
- 仓库位置：https://github.com/iEDA-Open-Source-Core-Project/darkriscv
- 分支： freeze
- 贡献者 ： 郭栋良 、尚杰

## ibex

- 内核配置：
  - 含 Prefetch Buffer 的 if 和 id/ex 2 级流水线处理器核;
  - AXI4-Full 总线连接核与 SoC 支持 RISCV-32;
  - IMC 指令集,Zicsr，Zifencei,Smepmp;
- 仓库位置： https://github.com/iEDA-Open-Source-Core-Project/Ibex.git
- 分支： main
- 贡献者 ： 苗恒, 李子龙
