using DelimitedFiles
using CairoMakie, MathTeXEngine
CairoMakie.activate!(type=:svg)

# Extract test labels:
Directory = "References/Beams/Cheng-2003-Local Buckling Tests on Cold-Formed Steel Beams/"
rm(string(Directory, "RawData-TXT/.DS_Store"), force=true)
Filenames = readdir(string(Directory, "RawData-TXT/"))
NumTests = length(Filenames)

# Extract load-deformation curves:
LDCurves = Vector{Matrix{Float64}}(undef, NumTests)
for i in 1:NumTests
    LDCurves[i] = readdlm(string(Directory, "RawData-TXT/", Filenames[i]), ',')
end

# Plot:
begin
    F = Figure(resolution=72 .* (12, 9), fonts=(; regular=texfont()), fontsize=14)

    Label(F[0, 1][1, 1], L"Local Buckling Tests on Cold-Formed Steel Beams$$", fontsize=16, tellwidth=false)
    Label(F[0, 1][2, 1], L"Cheng Yu and Benjamin W. Schafer (2003)$$", fontsize=12, tellwidth=false)

    A = Axis(F[1, 1],
        xlabel=L"Actuator displacement, $\Delta$ (mm)", ylabel=L"Actuator force, $F$ (kN)",
        xminorticks=IntervalsBetween(5), yminorticks=IntervalsBetween(5),
        xminorticksvisible=true, yminorticksvisible=true,
        xminorgridvisible=true, yminorgridvisible=true,
        limits=(0, nothing, 0, nothing), aspect=4 / 3)

    for i in 1:NumTests
        lines!(LDCurves[i])
    end

    F
end

save(string(Directory, "RawData.pdf"), F)