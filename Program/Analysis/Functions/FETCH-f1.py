# 平均 FP 和 FN 值
avg_fp = {
    "DYNINST": 11.29,
    "BAP": 132.48,
    "RADARE2": 3.63,
    "NUCLEUS": 21.92,
    "IDA PRO": 1.81,
    "BINARY NINJA": 40.07,
    "GHIDRA": 34.37,
    "ANGR": 52.73,
    "FETCH": 0.67
}

avg_fn = {
    "DYNINST": 84.88,
    "BAP": 90.65,
    "RADARE2": 95.71,
    "NUCLEUS": 20.58,
    "IDA PRO": 36.17,
    "BINARY NINJA": 10.32,
    "GHIDRA": 5.23,
    "ANGR": 0.19,
    "FETCH": 0.11
}

# 计算 F1 score 的函数
def calculate_f1(fp, fn):
    return 2 / (1 / (1 - fp/100) + 1 / (1 - fn/100))

# 计算每个工具的 F1 score
f1_scores = {tool: calculate_f1(avg_fp[tool], avg_fn[tool]) for tool in avg_fp}

# 输出 F1 scores
for tool, f1_score in sorted(f1_scores.items(), key=lambda item: item[1], reverse=True):
    print(f"{tool}: {f1_score:.4f}")
