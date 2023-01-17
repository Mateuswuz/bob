function onCreatePost()

	setProperty('healthBar.y', getProperty('healthBar.y')+25)
	setProperty('iconP1.y', getProperty('iconP1.y')+25)
	setProperty('iconP2.y', getProperty('iconP2.y')+25)
	setProperty('scoreTxt.y', getProperty('scoreTxt.y')-82)

	makeLuaSprite('bg', 'graybox', -1100, 0)
    addLuaSprite('bg', false)
    makeGraphic('bg', 3840, 2160, '4C4C4C')

    makeLuaSprite('couch', 'couch', 250+50, 410)
    addLuaSprite('couch', false)

    makeAnimatedLuaSprite('wildy', 'wildybounce', 290+50, 390);
    addAnimationByPrefix('wildy', 'wildy', 'wildybounce', 24, false)
    addLuaSprite('wildy', false)

    makeAnimatedLuaSprite('phlox', 'phloxbounce', 445+50, 353);
    addAnimationByPrefix('phlox', 'phlox', 'phloxbounce', 24, false)
    addLuaSprite('phlox', false)

    makeLuaSprite('table', 'table', 345, 755)
    addLuaSprite('table', false)

    setScrollFactor('couch', 0.8, 1)
    setScrollFactor('wildy', 0.8, 1)
    setScrollFactor('phlox', 0.8, 1)


    --characters
    makeAnimatedLuaSprite('girl', 'chatdancesBIG/girl', -1200, 320);-- -825
    addAnimationByPrefix('girl', 'girl', 'girldance', 24, false)

    makeAnimatedLuaSprite('custard', 'chatdancesBIG/custard', -1700, 420);-- -400
    addAnimationByPrefix('custard', 'custard', 'custarddance', 24, false)
    scaleObject('custard', 1.2, 1.2)

    makeAnimatedLuaSprite('xave', 'chatdancesBIG/xave', -1700, 375);-- -600
    addAnimationByPrefix('xave', 'xave', 'xavedance', 24, false)

    makeAnimatedLuaSprite('alfur', 'chatdancesBIG/alfur', -1000, 560);-- -625
    addAnimationByPrefix('alfur', 'alfur', 'alfurdance', 24, false)
    scaleObject('alfur', 0.6, 0.6)

    makeAnimatedLuaSprite('meri', 'chatdancesBIG/meri', 2000, 340);-- 1000
    addAnimationByPrefix('meri', 'meri', 'meridance', 24, false)

    makeAnimatedLuaSprite('sonic', 'chatdancesBIG/realsonicexe', 1700, 385);-- 1245
    addAnimationByPrefix('sonic', 'sonic', 'exedance', 24, false)
    scaleObject('sonic', 1.1, 1.1)

    makeAnimatedLuaSprite('ski', 'chatdancesBIG/ski', 1700, 415);-- 1535
    addAnimationByPrefix('ski', 'ski', 'skidance', 24, false)

    makeAnimatedLuaSprite('amongus', 'chatdancesBIG/amongy', 1700, 595);-- 1470
    addAnimationByPrefix('amongus', 'amongus', 'amongydance', 24, false)
    scaleObject('amongus', 0.8, 0.8)

    --bars
    makeLuaSprite('TopBar', 'empty', 0, -120)
	makeGraphic('TopBar', 1280, 120, '000000')
	setObjectCamera('TopBar', 'hud')
	addLuaSprite('TopBar', false)

	makeLuaSprite('BotBar', 'empty', 0, 720)
	makeGraphic('BotBar', 1280, 120, '000000')
	setObjectCamera('BotBar', 'hud')
	addLuaSprite('BotBar', false)
end

function onUpdate() --debug positions. easily helps get positions.. made it meself coolio. keep "enable" to false unless ur editing a dif stage or sum.
	enable = false;
	curchar = 'gf'
		if enable then
			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.RIGHT') then
			setProperty(curchar .. '.x', getProperty(curchar.. '.x')+5)
			debugPrint('x = '.. getProperty(curchar.. '.x'))
		elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.LEFT') then
			setProperty(curchar .. '.x', getProperty(curchar.. '.x')-5)
			debugPrint('x = '.. getProperty(curchar.. '.x'))
		elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.UP') then
			setProperty(curchar .. '.y', getProperty(curchar.. '.y')-5)
			debugPrint('y = '.. getProperty(curchar.. '.y'))
		elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.DOWN') then
			setProperty(curchar .. '.y', getProperty(curchar.. '.y')+5)
			debugPrint('y = '.. getProperty(curchar.. '.y'))
		end
	end
	if not enable then
		--no debug
	end
end
	

function onBeatHit()
	if curBeat % 1 == 0 then
		objectPlayAnimation('wildy', 'wildy', true)
		objectPlayAnimation('phlox', 'phlox', true)
	end

	if curBeat >= 288 and curBeat <= 352 then
		if curBeat % 1 == 0 then
			objectPlayAnimation('alfur', 'alfur', true)
			objectPlayAnimation('girl', 'girl', true)
			objectPlayAnimation('xave', 'xave', true)
			objectPlayAnimation('custard', 'custard', true)
			objectPlayAnimation('meri', 'meri', true)
			objectPlayAnimation('sonic', 'sonic', true)
			objectPlayAnimation('amongus', 'amongus', true)
			objectPlayAnimation('ski', 'ski', true)
		end
	end
end