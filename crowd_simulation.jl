using Agents, Random, Plots

# Definisikan tipe agen dengan struktur dasar (dengan posisi di ruang 2D)
@agent Person GridAgent{2} begin
    # Tambahkan properti jika diperlukan, misalnya status atau kecepatan
end

# Buat ruang grid 2D dengan ukuran 20x20 (non-periodik)
space = GridSpace((20, 20); periodic=false)
model = ABM(Person, space; properties=Dict(:step => 0))

# Tambahkan 50 agen ke dalam model dengan posisi acak
for i in 1:50
    add_agent!(Person(), model)
end

# Definisikan perilaku agen: bergerak secara acak ke salah satu sel tetangga
function agent_step!(agent, model)
    moves = nearby_positions(agent, model, 1)  # Mendapatkan posisi tetangga dalam radius 1
    if !isempty(moves)
        new_pos = rand(moves)
        move_agent!(agent, new_pos, model)
    end
end

# Jalankan simulasi selama 50 langkah
steps = 50
run!(model, agent_step!, steps; when = (model -> model.properties[:step] += 1))

# Visualisasikan posisi akhir semua agen
plt = scatter([a.pos[1] for a in allagents(model)],
              [a.pos[2] for a in allagents(model)],
              xlabel="X", ylabel="Y",
              title="Posisi Akhir Agen",
              legend=false)
savefig(plt, "crowd_simulation.png")
println("Simulasi selesai. Plot disimpan sebagai 'crowd_simulation.png'.")
