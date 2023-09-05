#= 
Author: Damir Akchurin
Date: 07/18/2023
=#

# Preamble:
using DelimitedFiles
using CairoMakie, MathTeXEngine
CairoMakie.activate!(type=:svg)

# Plotting parameters:
SizeInches = (8, 6)
SizePixels = 72 .* SizeInches

#= BEAMS: LOCAL BUCKLING =#
# Local Buckling Tests on Cold-Formed Steel Beams:
Test = "8.5Z120-3E2W"
Curve = readdlm("References/Local Buckling Tests on Cold-Formed Steel Beams/Data/$Test.txt", ',', Float64)
begin
    F = Figure(resolution=SizePixels, fontsize=14, fonts=(; regular=texfont()))
    A = Axis(F[1, 1],
        title="Yu and Schafer (2003)", titlefont=texfont(),
        xlabel=L"Actuator displacement, $\Delta$ (mm)", ylabel=L"Actuator force, $F$ (kN)",
        limits=(0, nothing, 0, nothing))
    lines!(Curve, label=Test, color=:black, markersize=6)
    axislegend(position=:lt)
    F
end

# Strength and Behavior of Advanced High Strength Steel Structural Components:
Test = "203C-32D-340Fy-1.3t-1"
Curve = readdlm("References/Strength and Behavior of Advanced High Strength Steel Structural Components/Data/Beams/$Test.txt", ',', Float64)
begin
    F = Figure(resolution=SizePixels, fontsize=14, fonts=(; regular=texfont()))
    A = Axis(F[1, 1],
        title="Ding (2022)", titlefont=texfont(),
        xlabel=L"Actuator displacement, $\Delta$ (in.)", ylabel=L"Actuator force, $F$ (lb)",
        limits=(0, nothing, 0, nothing))
    lines!(Curve[:, 1:2], label=Test, color=:black, markersize=6)
    axislegend(position=:lt)
    F
end

#= BEAMS: DISTORTIONAL BUCKLING =#
# Distortional Buckling Tests on Cold-Formed Steel Beams:
Test = "D8.5Z120-4E1W"
Curve = readdlm("References/Distortional Buckling Tests on Cold-Formed Steel Beams/Data/$Test.txt", ',', Float64)
begin
    F = Figure(resolution=SizePixels, fontsize=14, fonts=(; regular=texfont()))
    A = Axis(F[1, 1],
        title="Yu and Schafer (2006)", titlefont=texfont(),
        xlabel=L"Actuator displacement, $\Delta$ (mm)", ylabel=L"Actuator force, $F$ (kN)",
        limits=(0, nothing, 0, nothing))
    lines!(Curve, label=Test, color=:black, markersize=6)
    axislegend(position=:lt)
    F
end

# Strength and Behavior of Advanced High Strength Steel Structural Components:
Test = "203C-19D-340Fy-1.3t-1"
Curve = readdlm("References/Strength and Behavior of Advanced High Strength Steel Structural Components/Data/Beams/$Test.txt", ',', Float64)
begin
    F = Figure(resolution=SizePixels, fontsize=14, fonts=(; regular=texfont()))
    A = Axis(F[1, 1],
        title="Ding (2022)", titlefont=texfont(),
        xlabel=L"Actuator displacement, $\Delta$ (in.)", ylabel=L"Actuator force, $F$ (lb)",
        limits=(0, nothing, 0, nothing))
    lines!(Curve[:, 1:2], label=Test, color=:black, markersize=6)
    axislegend(position=:lt)
    F
end

#= BEAMS: LATERAL-TORSIONAL BUCKLING =#
# Distortional Buckling Tests on Cold-Formed Steel Beams:
Test = "D8C097-5E4W"
Curve = readdlm("References/Distortional Buckling Tests on Cold-Formed Steel Beams/Data/$Test.txt", ',', Float64)
begin
    F = Figure(resolution=SizePixels, fontsize=14, fonts=(; regular=texfont()))
    A = Axis(F[1, 1],
        title="Yu and Schafer (2006)", titlefont=texfont(),
        xlabel=L"Actuator displacement, $\Delta$ (mm)", ylabel=L"Actuator force, $F$ (kN)",
        limits=(0, nothing, 0, nothing))
    lines!(Curve, label=Test, color=:black, markersize=6)
    axislegend(position=:lt)
    F
end