local allow = true

function onCreate()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'rondies')
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'ronfuckingdies')

end

function onUpdate()
    if inGameOver == true and allow then
        plus = cameraX

        setProperty('camFollow.y', 390)
        setProperty('camFollow.x', 880)
        allow = false
    elseif not allow then
        --ops
    end
end