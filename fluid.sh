DEV=2
#FNT=SF2/065.8mg_Music_Man_Gm_Gs_V1.0_Bank.sf2
#FNT=SF2/078.5mg_Melting_Pot_Bank.sf2
#FNT=SF2/084.0mg_All_In_One_Gm_V1.1_Bank.sf2
#FNT=SF2/111.2mg_Zx128_Kr5_Bank.sf2
#FNT=SF2/79.7mg_Marino_Enhanced_Gm_Gs_V1.0_Bank.sf2
FNT='SF2/GS_sound_set_(16_bit).sf2'
SND=snd/killbill.mid

fluidsynth --audio-driver=alsa -o audio.alsa.device=hw:2 $FNT $SND
