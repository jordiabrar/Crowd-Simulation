# Simulasi Pergerakan Agen (Crowd Simulation) dengan Agents.jl

## Deskripsi
Proyek ini mensimulasikan pergerakan kerumunan (crowd simulation) menggunakan library [Agents.jl](https://juliadynamics.github.io/Agents.jl/stable/) di Julia. Setiap agen berada dalam ruang grid 2D dan dapat berpindah secara acak ke salah satu tetangganya pada setiap langkah waktu.

### Fitur Utama
- Agen berjalan acak di dalam ruang grid 2D.
- Simulasi selama 50 langkah waktu.
- Visualisasi posisi akhir agen.

## Teknologi yang Digunakan
- **Agents.jl**: Framework untuk Agent-Based Modeling di Julia.
- **Plots.jl**: Untuk membuat visualisasi posisi agen.
- **Random.jl**: Untuk pemilihan acak langkah agen.

## Struktur Agen
Agen didefinisikan dengan `@agent`, menggunakan `GridAgent{2}` untuk berada di grid 2D. Tambahan properti seperti status atau kecepatan bisa ditambahkan jika diperlukan.

## Langkah-Langkah Simulasi
1. Membuat grid 2D 20x20 tanpa wrapping (non-periodik).
2. Menambahkan 50 agen ke posisi acak.
3. Pada setiap langkah, setiap agen memilih salah satu posisi tetangganya secara acak dan berpindah ke sana.
4. Simulasi berlangsung selama 50 langkah.

## Visualisasi
Visualisasi akhir berupa scatter plot dari posisi seluruh agen setelah 50 langkah disimpan dalam file:
```
crowd_simulation.png
```

## Menjalankan Proyek
Pastikan paket berikut telah terinstal:
```julia
using Pkg
Pkg.add(["Agents", "Plots"])
```
Lalu jalankan skrip utama untuk melihat simulasi dan menyimpan visualisasinya.

## Hasil
File gambar `crowd_simulation.png` menunjukkan distribusi akhir dari semua agen dalam ruang simulasi.
