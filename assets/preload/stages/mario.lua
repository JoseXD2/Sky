local hits = 0
local bush = 0
local bush2 = 0
local hill = 0
local blocks = 0
local cloud = 0
local current = "-fire"
local invinc = 0
local flash = 0
function onCreatePost()
    setProperty('timeBar.y', 10000)
    setProperty('timeTxt.y', 10000)
    setPropertyFromClass('GameOverSubstate', 'characterName', 'pixelbluedeath'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'Smashing Windshields'); --put in mods/music/
    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes', i, "x", getPropertyFromGroup('strumLineNotes', i, "x") - 775)
    end
    for i = 4,7 do
        setPropertyFromGroup('strumLineNotes', i, "x", getPropertyFromGroup('strumLineNotes', i, "x") - 80)
    end
    cameraSetTarget("boyfriend")
    setProperty('health', 2)
    setProperty('healthBar.visible', false)
    setProperty('healthBarBG.visible', false)
    setProperty('iconP2.visible', false)
    setProperty('iconP1.visible', false)
    makeLuaSprite('atmosphere', 'bg/sky', -500,-500)
    scaleObject('atmosphere', 2,2)
    addLuaSprite('atmosphere')
    makeLuaSprite('bush', 'bg/bush', 12*160 - 60, 159)
    makeLuaSprite('bush2', 'bg/bush', 12*160 - 60, 159)
    makeLuaSprite('hill', 'bg/hill', 12*160 - 60, 129)
    scaleObject('bush', 10,10)
    scaleObject('bush2', 10,10)
    scaleObject('hill', 10,10)
    makeLuaSprite("blocks", 'bg/blocks', 0, -207)
    scaleObject('blocks.antialiasing', false)
    makeLuaSprite('cloud', 'bg/cloud', 0,97)
    scaleObject('cloud', 10,10)
    setProperty('cloud.antialiasing', false)
    setProperty('bush.antialiasing', false)
    setProperty('bush2.antialiasing', false)
    setProperty('hill.antialiasing', false)
    scaleObject('blocks', 10,10)
    for i = 1, 16 do
        makeLuaSprite(tostring(i), "bg/ground",(i*160) - 540,319)
        scaleObject(tostring(i), 10,10)
        addLuaSprite(tostring(i))
        makeLuaSprite(tostring(-i), "bg/ground",(i*160) - 540,479)
        scaleObject(tostring(-i), 10,10)
        addLuaSprite(tostring(-i))
        setProperty(tostring(i) .. ".antialiasing", false)
        setProperty(tostring(-i) .. ".antialiasing", false)
    end
    makeLuaSprite('borderL', 'bg/aspect',0,0)
    addLuaSprite('borderL', true)
    setObjectCamera("borderL", "hud")
    makeLuaText("sky", "SKYBLUE", 500, 226, 30)
    setTextFont("sky","Press Start 2P.ttf")
    setTextSize('sky', 40)
    setTextBorder('sky', 0, 'FFFFFF')
    addLuaText("sky")
    makeLuaText("score", "000000", 255, 226, 70)
    setTextAlignment("sky", 'left')
    setTextAlignment("score", 'left')
    setTextFont("score","Press Start 2P.ttf")
    setTextSize('score', 40)
    setTextBorder('score', 0, 'FFFFFF')
    addLuaText("score")
    setProperty('scoreTxt.visible', false)
    setProperty('showRating', false)
    setProperty('blocks.antialiasing', false)
    setProperty('numScore.visible', false)
    triggerEvent("Alt Idle Animation", "BF", "-fire")
end

function noteMiss(id, direction, noteType, isSustainNote)
    setProperty('health', 2)
    if invinc == 0 then
        playSound("hurt", 10)
        hits = hits + 1
        invinc = 1
        flash = 0
        runTimer('invinc', 1, 1)
    end
    if hits == 1 then
        current = ""
        triggerEvent("Alt Idle Animation", "BF", "")
    end
    if hits == 2 then
        current = "-alt"
        triggerEvent("Alt Idle Animation", "BF", "-alt")
    end
    if hits == 3 then
        setProperty('health', 0)
    end
    score = getProperty('songScore')
    if score > 99999 then
        setProperty("score.text", score)
    elseif score > 9999 then
        setProperty("score.text", "0" .. tostring(score))
    elseif score > 999 then
        setProperty("score.text", "00" .. tostring(score))
    elseif score > 99 then
        setProperty("score.text", "000" .. tostring(score))
    elseif score > 9 then
        setProperty("score.text", "0000" .. tostring(score))
    else
        setProperty("score.text", "00000" .. tostring(score))
    end
end

function onUpdatePost()
    setProperty("camHUD.zoom", 1) 
    setProperty("camGAME.zoom", 0.77) 
    if invinc == 1 then
        if flash == 0 then
            setProperty('boyfriend.visible', false)
        elseif flash == 10 then
            setProperty('boyfriend.visible', true)
        end
        flash = flash + 1
        if flash == 20 then
            flash = 0
        end
    end
    for i = 1, 16 do
        ground = tostring(i) .. ".x"
        ground2 = tostring(-i) .. ".x"
        setProperty(ground, getProperty(ground) - 20)
        setProperty(ground2, getProperty(ground2) - 20)
        if getProperty(ground) == -700 then
            if math.random(1,14) == 1 and hill == 0 then
                hill = 1
                addLuaSprite('hill')
                setProperty('hill.x', 12*160 - 61)
            end
            if math.random(1,7) == 1 and bush == 0 then
                addLuaSprite('bush')
                bush = 1
                setProperty('bush.x', 12*160 - 64)
            elseif math.random(1,7) == 1 and bush2 == 0 then
                bush2 = 1
                addLuaSprite('bush2')
                setProperty('bush2.x', 12*160 - 61)
            end
            if math.random(1,5) == 1 and cloud == 0 then
                cloud = 1
                addLuaSprite('cloud')
                setProperty('cloud.x', 12*160 - 61)
            end
            if math.random(1,40) == 1 and blocks == 0 then
                blocks = 1
                addLuaSprite('blocks')
                setProperty('blocks.x', 12*160 - 45)
            end
            setProperty(ground, 12*160 - 60)
            setProperty(ground2, 12*160 - 60)
            if getProperty("bush.x") <= -700 then
                bush = 0
                removeLuaSprite('bush', false)
            end
            if getProperty("bush2.x") <= -700 then
                bush2 = 0
                removeLuaSprite('bush2', false)
            end
            if getProperty("hill.x") <= -700 then
                hill = 0
                removeLuaSprite('hill', false)
            end
            if getProperty("blocks.x") <= -1500 then
                blocks = 0
                removeLuaSprite('blocks', false)
            end
            if getProperty("cloud.x") <= -700 then
                cloud = 0
                removeLuaSprite('cloud', false)
            end
        end
    end
    setProperty('bush.x', getProperty('bush.x') - 20)
    setProperty('hill.x', getProperty('hill.x') - 20)
    setProperty('bush2.x', getProperty('bush2.x') - 20)
    setProperty('blocks.x', getProperty('blocks.x') - 20)
    setProperty('cloud.x', getProperty('clouds.x') - 20)
end

function onMoveCamera(focus)
    cameraSetTarget("boyfriend")
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    dir = ""
    if direction == 0 then
        dir = "LEFT"
    elseif direction == 1 then
        dir = "DOWN"
    elseif direction == 2 then
        dir = "UP"
    elseif direction == 3 then
        dir = "RIGHT"
    end
    characterPlayAnim("boyfriend", "sing" .. dir .. current, true)
    score = getProperty('songScore')
    if score > 99999 then
        setProperty("score.text", score)
    elseif score > 9999 then
        setProperty("score.text", "0" .. tostring(score))
    elseif score > 999 then
        setProperty("score.text", "00" .. tostring(score))
    elseif score > 99 then
        setProperty("score.text", "000" .. tostring(score))
    elseif score > 9 then
        setProperty("score.text", "0000" .. tostring(score))
    else
        setProperty("score.text", "00000" .. tostring(score))
    end
end

function onTimerCompleted(tag)
    invinc = 0
    setProperty('boyfriend.visible', true)
end