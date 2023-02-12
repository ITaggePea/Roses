function onCreate()
	makeHealthIcon('iconP4', 'dad', false)
    setObjectOrder('iconP4', getObjectOrder('iconP2') + 1)
    setProperty('iconP4.alpha', 0)

    makeHealthIcon('iconP3', 'gf', true)
    setObjectOrder('iconP3', getObjectOrder('iconP1') + 1)
    setProperty('iconP3.alpha', 0)

	iconY = getProperty('iconP1.y')
end

iconY = 0

function onUpdate(elapsed) 
	     local currentBeat = (songPos / 1000)*(bpm/60)

          setObjectOrder('iconP3', getObjectOrder('iconP1') + 1)

		if getProperty('dad1.alpha') == 1 then
               setObjectOrder('dad1', getObjectOrder('dad') + 1)
		end

		if getProperty('boyfriend1.alpha') == 1 then
               setObjectOrder('boyfriend1', getObjectOrder('boyfriend') + 1)
		end

		if getProperty('iconP4.alpha') == 1 then
			setProperty('iconP4.scale.x', getProperty('iconP2.scale.x'))
			setProperty('iconP4.scale.y', getProperty('iconP2.scale.y'))
	
			setProperty('iconP4.animation.curAnim.curFrame', getProperty('iconP2.animation.curAnim.curFrame'))
		end
	
		if getProperty('iconP3.alpha') == 1 then
			setProperty('iconP3.scale.x', getProperty('iconP1.scale.x'))
			setProperty('iconP3.scale.y', getProperty('iconP1.scale.y'))
			setProperty('iconP3.animation.curAnim.curFrame', getProperty('iconP1.animation.curAnim.curFrame'))
		end
		
		if useDoubleDadIcons == true then
			setProperty('opponentIconScale', 1.05)
			setProperty('iconP4.x', getProperty('iconP2.x') - 50)
			setProperty('iconP4.alpha', 1)
		end
	
		if useDoubleBFIcons == true then
			setProperty('playerIconScale', 1.05)
			setProperty('iconP3.x', getProperty('iconP1.x') + 50)
			setProperty('iconP3.y', getProperty('iconP1.y') + 40)
			setProperty('iconP3.x', getProperty('iconP1.x') + getProperty('newpoint.x'))
			setProperty('iconP3.alpha', 1)
		end

		if useDoubleDadIcons == false and getProperty('opponentIconScale') ~= 1.2 then
			setProperty('opponentIconScale', 1.2)
		end

		if useDoubleBFIcons == false and getProperty('playerIconScale') ~= 1.2 then
			setProperty('playerIconScale', 1.2)
		end
	end

function onUpdatePost()
	if useDoubleBFIcons == true then
		if getProperty('iconP1.y') ~= iconY - 20 then
			setProperty('iconP1.y', iconY - 20)
			setProperty('iconP3.y', getProperty('iconP1.y') + 40)
		end

		if getProperty('iconP3.animation.name') == 'solid' and curStep >= 1056 and curStep < 1152 then
			setProperty('iconP3.scale.x', getProperty('iconP1.scale.x') + 0.15)
			setProperty('iconP3.scale.y', getProperty('iconP1.scale.y') + 0.15)
		end
	end

	if useDoubleDadIcons == true then
		if getProperty('iconP2.y') ~= iconY - 20 then
			setProperty('iconP2.y', iconY - 20)
			setProperty('iconP4.y', getProperty('iconP2.y') + 40)
		end
	end
end

useDoubleDadIcons = false
useDoubleBFIcons = false


function onStepHit(step)
	if curStep == 515 then
        useDoubleDadIcons = true
        useDoubleBFIcons = true

        cameraFlash('game', '0xFFFFFFFF', 0.7, true)
        setProperty('dad1.alpha', 1)
        setProperty('iconP3.alpha', 1)
        setProperty('iconP4.alpha', 1)
    end

	if curStep == 515 then
        makeLuaCharacter('boyfriend1', 'bf-gfV2', true, false)
	   setProperty('boyfriend1.x', getProperty('boyfriend1.x') + 200)
        setObjectOrder('boyfriend1', getObjectOrder('boyfriend') - 1)

        makeHealthIcon('bfIcon1', 'gf', true)
        setObjectOrder('bfIcon1', getObjectOrder('iconP1') + 1)
        setProperty('bfIcon1.alpha', 0)
  
        setProperty('boyfriend1.alpha', 0)
    end


	if curStep == 576 then 
        makeLuaCharacter('dad1', 'ruv', false, false)
        setProperty('dad1.x', getProperty('dad1.x') + 200)
        setObjectOrder('dad1', getObjectOrder('dad') - 1)

        makeHealthIcon('dadIcon1', 'ruv', false)
        setObjectOrder('dadIcon1', getObjectOrder('iconP2') + 1)
        setProperty('dadIcon1.alpha', 2)

        setProperty('dad1.alpha', 0)
    end

	if curStep == 576 then -- part 2
        playDadSing = true
        setProperty('dad1.alpha', 1)
    end

	if curStep == 608 then -- part 1
        makeLuaCharacter('boyfriend1', 'carol', true, false)
	   setProperty('boyfriend1.x', getProperty('boyfriend1.x') + 200)
        setObjectOrder('boyfriend1', getObjectOrder('boyfriend') - 1)

        makeHealthIcon('bfIcon1', 'carol', true)
        setObjectOrder('bfIcon1', getObjectOrder('iconP1') + 1)
        setProperty('bfIcon1.alpha', 0)
  
        setProperty('boyfriend1.alpha', 0)
    end

	if curStep == 608 then -- part 2
        playBFSing = true
        setProperty('boyfriend1.alpha', 1)
    end

	if curStep == 640 then -- part 1
        makeLuaCharacter('dad1', 'agoti', false, false)
        setProperty('dad1.x', getProperty('dad1.x') + 200)
        setObjectOrder('dad1', getObjectOrder('dad') - 1)

        makeHealthIcon('dadIcon1', 'agoti', false)
        setObjectOrder('dadIcon1', getObjectOrder('iconP2') + 1)
        setProperty('dadIcon1.alpha',2)

        setProperty('dad1.alpha', 1)
    end

	if curStep == 640 then -- part 2
        playDadSing = true
        setProperty('dad1.alpha', 1)
    end

	if curStep == 672 then -- part 1
        makeLuaCharacter('boyfriend1', 'ruby', true, false)
	   setProperty('boyfriend1.x', getProperty('boyfriend1.x') + 200)
        setObjectOrder('boyfriend1', getObjectOrder('boyfriend') - 1)

        makeHealthIcon('bfIcon1', 'ruby', true)
        setObjectOrder('bfIcon1', getObjectOrder('iconP1') + 1)
        setProperty('bfIcon1.alpha', 0)
  
        setProperty('boyfriend1.alpha', 0)
    end

	if curStep == 672 then -- part 2
        playBFSing = true
        setProperty('boyfriend1.alpha', 1)
    end
end

function playerOneTurn()
    mustHit = true
end

function playerTwoTurn()
    mustHit = false
end

local sDir = {'singLEFT','singDOWN', 'singUP','singRIGHT'};
dadAlt = ""

function dadNoteHit(note, isSustain, noteType, dType)
	if dType == 0 then
		playDadSing = true
		if getProperty('dad.curCharacter') == 'bendy-da' then

			if isSustain == false then
				playActorAnimation('dad', sDir[note + 1].. dadAlt, true, false)
			end
		else
			playActorAnimation('dad', sDir[note + 1], true, false)
		end
	
		setProperty('dad.holdTimer', 0)

	elseif dType == 1 then
		playDadSing = false
		playActorAnimation('dad1', sDir[note + 1], true, false)
		setProperty('dad1.holdTimer', 0)

		playActorAnimation('dad', sDir[note + 1], true, false)
		setProperty('dad.holdTimer', 0)
	end
end

function bfNoteHit(note, isSustain, noteType, dType)

	if dType == 0 then
		playBFSing = true
		if getProperty('boyfriend.curCharacter') == 'bendy-da' then

			if isSustain == false then
				playActorAnimation('boyfriend', sDir[note + 1].. boyfriendAlt, true, false)
			end
		else
			playActorAnimation('boyfriend', sDir[note + 1], true, false)
		end
	
		setProperty('boyfriend.holdTimer', 0)

	elseif dType == 1 then
		playBFSing = false
            playActorAnimation('boyfriend1', sDir[note + 1], true, false)
            setProperty('boyfriend1.holdTimer', 0)

            playActorAnimation('boyfriend', sDir[note + 1], true, false)
            setProperty('boyfriend.holdTimer', 0)
	end

end

function playerOneMiss(note, songPos, dType)

end

function onTweenCompleted(t, tag)
	if tag == 'colorTween' then
		tweenColor('white', 0.2, RGBColor(255,216,0), RGBColor(255,255,255))
	end

	if tag == 'reverseColorTween' then
		tweenColor('white', 0.2, RGBColor(255,216,0), RGBColor(255,0,0))
	end
end
