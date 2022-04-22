copy mKartTI.z80 Spasm\mKartTI.z80
copy audio.z80 Spasm\audio.z80
copy draw.z80 Spasm\draw.z80
copy math.z80 Spasm\math.z80
copy physics.z80 Spasm\physics.z80
copy tables.z80 Spasm\tables.z80
copy track.z80 Spasm\track.z80
copy kart.z80 Spasm\kart.z80
copy entity.z80 Spasm\entity.z80
cd Spasm & spasm64 mKartTI.z80 mKartTI.bin -L & cd ..
copy Spasm\mKartTI.bin RabbitSign\mKartTI.bin
copy Spasm\mKartTI.lab RabbitSign\mKartTI.lab
cd RabbitSign & rabbitsign mKartTI.bin -g -v & python labCorrect.py mKartTI.lab & cd ..
copy RabbitSign\mKartTI.8xk mKartTI.8xk
copy RabbitSign\mKartTI.lab mKartTI.lab