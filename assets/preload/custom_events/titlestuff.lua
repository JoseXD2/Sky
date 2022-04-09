songended = false

function onUpdatePost()
    if songended == false then
    setPropertyFromClass('lime.app.Application', 'current.window.title', 'FNF SKY.LUA ENGINE '..'Song: '..getProperty('curSong')..' | '..getProperty('scoreTxt.text'))
    end
end
function onDestroy()
    songended = true
    setPropertyFromClass('lime.app.Application', 'current.window.title', 'FNF SKY.LUA ENGINE')
end

function onGameOver()
    songended = true
    setPropertyFromClass('lime.app.Application', 'current.window.title', 'FNF SKY.LUA ENGINE'..' Song: '..getProperty('curSong')..' | GameOver')
    return Function_Continue
end