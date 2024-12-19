from idautils import *
from idc import *
from idaapi import *

def export_functions(output_file):
    """
    导出所有函数地址到指定文件
    """
    with open(output_file, "w") as f:
        for func_ea in Functions():  # 遍历所有函数地址
            # func_name = get_func_name(func_ea)  # 获取函数名
            f.write(f"{hex(func_ea)}\n")  # 写入文件
    print(f"Exported functions to {output_file}")

if __name__ == "__main__":
    # 等待 IDA 自动分析完成
    print("Waiting for IDA auto-analysis to complete...")
    idaapi.auto_wait()  # 等待自动分析完成
    print("Auto-analysis completed.")

    # 禁用保存数据库功能
    idaapi.set_database_flag(idaapi.DBFL_KILL)

    # 导出函数
    output_file = r"functions.txt"  # 修改为你的输出路径
    export_functions(output_file)

    # 退出 IDA
    idc.qexit(0)
