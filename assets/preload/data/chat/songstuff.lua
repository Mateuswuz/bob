-- XCAM = 346.5 & 563 == 454.75
-- YCAM = 710.5 & 725 == 717.75

function onCreate()
	setProperty('camHUD.visible', false)
	setProperty('dad.visible', false)
	setProperty('boyfriend.visible', false)
	setProperty('gf.visible', false)
	setTextFont('scoreTxt', 'PhantomMuff.ttf')
	setTextFont('timeTxt', 'PhantomMuff.ttf')
	setTextBorder('scoreTxt', '2', '000000')
	setProperty('timeBar.scale.x', 1.5)
	setProperty('timeBarBG.scale.x', 1.5)
end

function onCreatePost()
	setProperty('isCameraOnForcedPos', true)

	setProperty('couch.x', getProperty('couch.x')-1000)
	setProperty('wildy.x', getProperty('wildy.x')-1000)
	setProperty('phlox.x', getProperty('phlox.x')-1000)
	setProperty('table.x', getProperty('table.x')-1000)

	makeAnimatedLuaSprite('introText', 'chattext', 0, 0)
	addAnimationByPrefix('introText', 'chattext', 'introText', 24, true)
	addAnimationByPrefix('introText', 'chattext2', 'popIntro', 24, true)
	addAnimationByPrefix('introText', 'chattext3', 'madeBy', 24, true)
	addAnimationByPrefix('introText', 'chattext4', 'popMadeBy', 24, true)
	setObjectCamera('introText', 'camOther')
	scaleObject('introText', 0.8, 0.8)
	screenCenter('introText')
	addLuaSprite('introText', true)

	setProperty('camFollow.x', 467.75)
	setProperty('camFollow.y', 717.75)

	setProperty('introText.alpha', 0)

	texty = getProperty('introText.y')
end

function onStepHit()
	if curStep == 1 then
		doTweenAlpha('hi', 'introText', 1, 0.5, 'cubeOut')

		doTweenX('movecouch1', 'couch', getProperty('couch.x')+1000, 9, 'quintInOut')
		doTweenX('movecouch2', 'wildy', getProperty('wildy.x')+1000, 9, 'quintInOut')
		doTweenX('movecouch3', 'phlox', getProperty('phlox.x')+1000, 9, 'quintInOut')
		doTweenX('movetable1', 'table', getProperty('table.x')+1000, 9, 'quintInOut')

	elseif curStep == 16 then
		objectPlayAnimation('introText', 'chattext2', false)
	elseif curStep == 32 then
		setProperty('introText.x', getProperty('introText.x')+55)
		objectPlayAnimation('introText', 'chattext3', false)
		
		setProperty('introText.y', getProperty('introText.y')+20)
		doTweenY('movetext', 'introText', texty, 0.6, 'circOut')

	elseif curStep == 48 then
		setProperty('introText.x', getProperty('introText.x')-25)
		objectPlayAnimation('introText', 'chattext4', false)
	elseif curStep == 60 then
		doTweenY('moveaway', 'introText', getProperty('introText.y')+60, 0.7, 'cubeInOut')
		doTweenAlpha('fadeaway', 'introText', 0, 0.7, 'cubeInOut')
		setProperty('isCameraOnForcedPos', false)
	end

	if curStep == 1444 then
		setProperty('isCameraOnForcedPos', true)
		setProperty('defaultCamZoom', 1.5)
		doTweenZoom('closeup', 'camGame', 1.5, 0.001, 'linear')

		setProperty('camFollow.x', 136.5)
		setProperty('camFollowPos.x', 136.5)
		setProperty('camGame.scroll.x', 136.5)

		setProperty('camFollow.y', 670.5)
		setProperty('camFollowPos.y', 670.5)
		setProperty('camGame.scroll.y', 670.5)
	elseif curStep == 1445 then

		setProperty('camFollow.x', 693)
		setProperty('camFollowPos.x', 693)
		setProperty('camGame.scroll.x', 693)
	elseif curStep == 1450 then

		setProperty('camFollow.x', 206.5)
		setProperty('camFollowPos.x', 206.5)
		setProperty('camGame.scroll.x', 206.5)
	elseif curStep == 1453 then

		setProperty('camFollow.x', 693)
		setProperty('camFollowPos.x', 693)
		setProperty('camGame.scroll.x', 693)
	end

	if curStep == 1460 then
		setProperty('isCameraOnForcedPos', false)

		setProperty('defaultCamZoom', 0.8)
		setProperty('cameraSpeed', 1.5)
		doTweenZoom('closeup', 'camGame', 0.8, 0.001, 'linear')

		setProperty('camFollow.x', 454.75)
		setProperty('camFollowPos.x', 454.75)
		setProperty('camGame.scroll.x', 454.75)

		setProperty('camFollow.y', 717.75)
		setProperty('camFollowPos.y', 717.75)
		setProperty('camGame.scroll.y', 717.75)
	end
end

function onBeatHit()
	if curBeat == 16 then
		removeLuaSprite('introText')
		setProperty('dad.visible', true)
		triggerEvent('Play Animation', 'intro', 'dad')
	elseif curBeat == 24 then
		setProperty('boyfriend.visible', true)
		triggerEvent('Play Animation', 'intro', 'bf')
	end

	if curBeat == 31 then
		setProperty('camHUD.visible', true)
		setProperty('gf.visible', true)
		characterPlayAnim('gf', 'stare', true)
	elseif curBeat == 32 then
		doTweenY('bar1', 'TopBar', 0-20, 0.8, 'circOut')
		doTweenY('bar2', 'BotBar', 600+20, 0.8, 'circOut')
		setProperty('defaultCamZoom', 0.9)
	elseif curBeat > 32 then
		setProperty('camHUD.visible', true)
		setProperty('dad.visible', true)
		setProperty('boyfriend.visible', true)
		removeLuaSprite('introText')

		doTweenY('bar1', 'TopBar', 0-20, 0.8, 'circOut')
		doTweenY('bar2', 'BotBar', 600+20, 0.8, 'circOut')
	end

	if curBeat >= 224 and curBeat <= 272 then
		if curBeat % 1 == 0 then
			triggerEvent('Add Camera Zoom', 0.045, 0.004)
		end
	end

	if curBeat == 288 then
		doTweenZoom('zoomout', 'camGame', 0.47, 23.6, 'linear')

		--tween characters (left)
		addLuaSprite('custard', false)
		doTweenX('custardmove', 'custard', -400, 3.5, 'quartOut')
		addLuaSprite('xave', false)
		doTweenX('xavemove', 'xave', -600, 3.5, 'quartOut')

		--tween characters right
		addLuaSprite('meri', false)
		doTweenX('merimove', 'meri', 1000, 3.5, 'quartOut')
	elseif curBeat == 304 then
		addLuaSprite('sonic', false)
		doTweenX('sonicmove', 'sonic', 1245, 2, 'quartOut')
	elseif curBeat == 320 then
		--tween left
		addLuaSprite('girl', false)
		doTweenX('girlmove', 'girl', -825, 1.8, 'quartOut')
		addLuaSprite('alfur', false)
		doTweenX('alfurmove', 'alfur', -625, 1.8, 'quartOut')
	elseif curBeat == 328 then
		--tween right
		addLuaSprite('ski', false)
		doTweenX('skimove', 'ski', 1535, 1.9, 'quartOut')
		addLuaSprite('amongus', false)
		doTweenX('amongusmove', 'amongus', 1470, 2, 'quartOut')
	elseif curBeat == 336 then
		cancelTween('zoomout')
		doTweenZoom('zoomin', 'camGame', 1, 3, 'quartOut')
		setProperty('defaultCamZoom', 1)
	end

	if curBeat == 352 then
		setProperty('defaultCamZoom', 0.8)
		doTweenX('custardbye', 'custard', -1700, 3, 'quartOut')
		doTweenX('meribye', 'meri', 2000, 3, 'quartOut')

		--since i cant see em rn
		removeLuaSprite('xave')
		removeLuaSprite('alfur')
		removeLuaSprite('girl')
		removeLuaSprite('sonic')
		removeLuaSprite('amongus')
		removeLuaSprite('ski')
	end
end