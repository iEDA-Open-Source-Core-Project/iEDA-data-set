# iEDA-data-set

## 要求
- 内核配置:写清楚内核包括的部件, 比如, 经典五级流水线, ICACHE+DCACHE, AXI4-Full总线  
  每级流水的基本左右: if取指, id译码, ex执行, mem访存, wb写会, ICACHE+DCACHE指令与数据高速缓存, AXI4-Full总线连接核与SoC  
- 仓库位置: https://github.com/iEDA-Open-Source-Core-Project/iEDA-data-set/edit/main/README.md  
- 分支:main  
- 贡献者: 卢狗  
**在文件ysyx_name.v的title部分同步相关信息**  


## e203

- 内核配置:不带`ITCM/DTCM`,分支预测为静态预测,已测试指令集为`RISCV-32 I/M`;  
  2 级流水线处理器核,流水线的按序主体是位于第一级的“取指”和位于第二级的“执行”和“写回”;
- 仓库位置:https://github.com/iEDA-Open-Source-Core-Project/e203
- 分支:main

## e203_1
> 带 64KB ITCM，和 64KB DTCM，地址映射如下
> | NAME| BASE | SIZE |
> |----| ---- | ---- |
> |ITCM| 0x0001_0000 | 64KB |
> |DTCM| 0x0201_0000 | 64KB |
- 内核配置:带`ITCM/DTCM`,分支预测为静态预测,已测试指令集为`RISCV-32 I/M`;  
  2 级流水线处理器核,流水线的按序主体是位于第一级的“取指”和位于第二级的“执行”和“写回”;
- 仓库位置:https://github.com/iEDA-Open-Source-Core-Project/e203
- 分支:with-itcm-dtcm
- 移植 rtthread 仓库：https://github.com/iEDA-Open-Source-Core-Project/rt-thread-e203
- 贡献者：李子龙

## darkriscv

- 内核配置：含pre-decode id/ex wb 3 级流水线处理器核; ICACHE+DCACHE指令与数据高速缓存;
  AXI4-Full总线连接核与SoC支持RISCV-32 I指令集
- 仓库位置：https://github.com/iEDA-Open-Source-Core-Project/darkriscv
- 分支： freeze
- 贡献者 ： 郭栋良 、尚杰
## cva6
- 内核配置：
  - cva6 是一个 RV64GC ISA、6-stage 顺序单发射，乱序执行，顺序写回 64bit CPU core，完全实现了 Volume I: User-Level ISA V 2.1 中指定的 I、M 和 C 扩展以及 draft privilege extension 1.10，且实现了三个特权级 M、S、U 以完全支持类Unix操作系统。在本次移植配置过程中，去除了浮点运算单元。
- 总线：采用 Axi4 总线进行通讯，支持突发传输
- TLB 和 Cache：
  - 10 项全相联 ITLB，如果 hit 当周期返回（组合逻辑电路）
  - 10 项全相联 DTLB，如果 hit 下一周期返回（组合逻辑电路+寄存器）
  - 4 路组相联 Icache，cacheline 128bit，Cache size 16K
  - 4 路组相联 Dcache，cacheline 128bit，Cache size 32K，（采用 wrtite though）
- 流水线：六级流水线，分别为 pc_gen，inst_fetch，decode，issue，ex，commit
  - 采用 Scoreboard 技术和一个轻量级的寄存器重命名来实现 ex 阶段的乱序执行
  - 在前端采用 bth,htb,ras 技术来实现分支预测
- 仓库位置：https://github.com/iEDA-Open-Source-Core-Project/cva6
- 分支：leesum_v1
- 贡献者：李子龙

## ibex

- 内核配置：
  - ibex为 Prefetch Buffer 的 if 和 id/ex 2 级流水线处理器核;
  - AXI4-Full 总线连接核与 SoC 支持 RISCV-32;
  - IMC 指令集,Zicsr，Zifencei,Smepmp;
- 仓库位置： https://github.com/iEDA-Open-Source-Core-Project/Ibex.git
- 分支： main
- 贡献者 ： 苗恒, 李子龙


