# iEDA-data-set

## 要求
-内核配置:写清楚内核包括的部件, 比如, 经典五级流水线, ICACHE+DCACHE, AXI4-Full总线
 每级流水的基本左右: if取指, id译码, ex执行, mem访存, wb写会, ICACHE+DCACHE指令与数据高速缓存, AXI4-Full总线连接核与SoC
-仓库位置: https://github.com/iEDA-Open-Source-Core-Project/iEDA-data-set/edit/main/README.md
-分支:main


## e203

- 内核配置:不带`ITCM/DTCM`,分支预测为静态预测,已测试指令集为`RISCV-32 I/M`;  
  2 级流水线处理器核,流水线的按序主体是位于第一级的“取指”和位于第二级的“执行”和“写回”;
- 仓库位置:https://github.com/iEDA-Open-Source-Core-Project/e203
- 分支:main


## darkriscv

- 内核配置：3 级流水线处理器核;
- 仓库位置：https://github.com/iEDA-Open-Source-Core-Project/darkriscv
- 分支： freeze
