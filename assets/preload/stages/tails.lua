function onCreate()
	-- background shit
	makeLuaSprite('tails', 'tails', -600, -300);
	setScrollFactor('tails', 0.9, 0.9);
	addLuaSprite('tails', false);

	makeLuaSprite('blackgradient', 'BlackGradient', -200, -250);
	setObjectCamera('blackgradient', 'other');
	setScrollFactor('blackgradient', 0, 0);
	scaleObject('blackgradient', 1.4, 1.4)
        setProperty('blackgradient.visible', false);
	addLuaSprite('blackgradient', true);

	makeLuaSprite('gradient', 'RedGrad', -70, -50);
	setObjectCamera('gradient', 'other');
	setScrollFactor('gradient', 0, 0);
	scaleObject('gradient', 1.15, 1.15)
	addLuaSprite('gradient', true);


	makeLuaSprite('black', 'Black', -200, -100);
	setObjectCamera('black', 'other');
	setScrollFactor('black', 0, 0);
	scaleObject('black', 1.4, 1.4)
	addLuaSprite('black', true);
        setProperty('black.alpha', 0.0);

	makeLuaSprite('pleasedontleave', 'pleasedontleave', 0, 0);
	setObjectCamera('pleasedontleave', 'other');
	setScrollFactor('pleasedontleave', 0, 0);
        setProperty('pleasedontleave.visible', false);
	addLuaSprite('pleasedontleave', true);

	makeLuaSprite('black2', 'Black', -200, -100);
	setScrollFactor('black2', 0, 0);
	scaleObject('black2', 1.4, 1.4)
        setProperty('black2.visible', false);
	addLuaSprite('black2', true);

	makeLuaSprite('pleasedontleave2', 'pleasedontleave', 0, 0);
	setScrollFactor('pleasedontleave2', 0, 0);
        setProperty('pleasedontleave2.visible', false);
	addLuaSprite('pleasedontleave2', true);

	makeAnimatedLuaSprite('Static', 'staticBACKGROUND2', 0, 0);
	setObjectCamera('Static', 'other');
	addAnimationByPrefix('Static', 'STATIC', 'menuSTATICNEW', 24, true)
	objectPlayAnimation('Static', 'STATIC', false)
	setProperty('Static.alpha', 0.2);
	addLuaSprite('Static', true);

end
function onUpdate()
    health = getProperty('health')
    if health <= 2.0 then
	   setProperty('gradient.alpha', 0.0);
	end
	if health <= 1.8 then
	   setProperty('gradient.alpha', 0.1);
	end
	if health <= 1.6 then
	   setProperty('gradient.alpha', 0.2);
	end
	if health <= 1.4 then
	   setProperty('gradient.alpha', 0.3);
	end
	if health <= 1.2 then
	   setProperty('gradient.alpha', 0.4);
	end
	if health <= 1.0 then
	   setProperty('gradient.alpha', 0.5);
	end
	if health <= 0.8 then
	   setProperty('gradient.alpha', 0.6);
	end
	if health <= 0.6 then
	   setProperty('gradient.alpha', 0.7);
	end
	if health <= 0.4 then
	   setProperty('gradient.alpha', 0.8);
	end
	if health <= 0.2 then
	   setProperty('gradient.alpha', 0.9);
	end
	if health <= 0.05 then
	   setProperty('gradient.alpha', 1.0);
	end
end
function onBeatHit()
    if curBeat == 294 then
	   setProperty('black.alpha', 1.0);
    end
    if curBeat == 296 then
	   setProperty('black.alpha', 0.0);
           setProperty('blackgradient.visible', true);
    end
    if curBeat == 424 then
	   setProperty('black.alpha', 1.0);
           setProperty('pleasedontleave.visible', true);
    end
    if curBeat == 430 then
	   setProperty('black.alpha', 0.0);
           setProperty('blackgradient.visible', false);
           setProperty('pleasedontleave.visible', false);
    end
    if curBeat == 624 then
	   setProperty('black2.visible', true);
           setProperty('pleasedontleave2.visible', true);
    end
    if curBeat == 632 then
           doTweenAlpha('dothetweenvg', 'black', 1, 1, 'quadIn');
    end

end