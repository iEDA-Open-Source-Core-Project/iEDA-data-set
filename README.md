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


## darkriscv

- 内核配置：含pre-decode id/ex wb 3 级流水线处理器核; ICACHE+DCACHE指令与数据高速缓存;
  AXI4-Full总线连接核与SoC支持RISCV-32 I指令集
- 仓库位置：https://github.com/iEDA-Open-Source-Core-Project/darkriscv
- 分支： freeze
- 贡献者 ： 郭栋良 、尚杰

## ibex

- 内核配置：含Prefetch Buffer的 if 和 id/ex 2 级流水线处理器核; 
AXI4-Full总线连接核与SoC支持RISCV-32 IMC指令集,Zicsr，Zifencei,Smepmp
- 仓库位置： https://github.com/iEDA-Open-Source-Core-Project/Ibex.git
- 分支： freeze
- 贡献者 ： 苗恒
