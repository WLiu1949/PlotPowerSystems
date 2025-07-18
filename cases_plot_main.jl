#!/usr/bin/env julia
using Pkg; Pkg.activate(@__DIR__)
using PowerModels, PowerPlots   # 不再用 Plots

const CASE_DIR = joinpath(@__DIR__, "cases")
const PIC_DIR  = joinpath(@__DIR__, "pictures")

#targets = ["case14.m"]     # 想画谁就填谁
targets = ["case5.m"]     # 想画谁就填谁

for f in targets
    data = PowerModels.parse_file(joinpath(CASE_DIR, f))
    plt  = powerplot(data; show_flow=true, show_voltage=true)  # 去掉 size
    out  = joinpath(PIC_DIR, replace(f, ".m"=>".png"))
    PowerPlots.save(out, plt)          # ← 官方导出接口
    println("✅ 已保存：$out")
end