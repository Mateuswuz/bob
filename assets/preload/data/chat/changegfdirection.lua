local facevalue = 0

function onBeatHit()
	if curBeat >= 32 then --yes i did all of them manually.. 
		if curBeat == 32 or
		curBeat == 48 or
		curBeat == 64 or
		curBeat == 80 or curBeat == 80+8 or
		curBeat == 96 or curBeat == 96+16 or 
		curBeat == 112 or 
		curBeat == 128 or 
		curBeat == 160 or curBeat == 160+16 or
		curBeat == 192 or curBeat == 192+16 or
		curBeat == 208 or curBeat == 208+8 or 
		curBeat == 224 or curBeat == 224+16 or 
		curBeat == 240 or curBeat == 240+16 or 
		curBeat == 256 or curBeat == 256+8 or
		curBeat == 272 or curBeat == 272+8 or
		curBeat == 288 or
		curBeat == 320 or 
		curBeat == 336 or curBeat == 336+8 or
		curBeat == 352 or curBeat == 352+8 or 
		curBeat == 368 or
		curBeat == 380 or 
		curBeat == 400 then
			triggerEvent('Change Character', 'gf', 'lmanleft')
			characterPlayAnim('gf', 'danceRight')
		elseif curBeat == 40 or
		curBeat == 56 or 
		curBeat == 72 or
		curBeat == 84 or curBeat == 84+8 or
		curBeat == 104 or curBeat == 104+16 or
		curBeat == 120 or
		curBeat == 144 or
		curBeat == 168 or curBeat == 168+16 or
		curBeat == 200 or curBeat == 200+12 or
		curBeat == 220 or 
		curBeat == 232 or curBeat == 232+16 or 
		curBeat == 248 or curBeat == 248+12 or 
		curBeat == 268 or 
		curBeat == 276 or curBeat == 276+8 or
		curBeat == 304 or
		curBeat == 328 or 
		curBeat == 340 or curBeat == 340+8 or 
		curBeat == 356 or curBeat == 356+8 or 
		curBeat == 372 or 
		curBeat == 392 or 
		curBeat == 408 then
			triggerEvent('Change Character', 'gf', 'lmanright')
			characterPlayAnim('gf', 'danceRight')
		end
	end
end