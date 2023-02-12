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

function update (elapsed)
    local currentBeat = (songPos / 1000)*(bpm/60)

    if (getProperty('dad.animation.name') == 'idle' or getProperty('dad.animation.name') == 'danceRight') and (getProperty('dad1.animation.name') == 'idle' or getProperty('dad1.animation.name') == 'danceRight') and mustHitSection == false and stopFollow == false then
        setCamFollow(xx, yy)
    end

    if (getProperty('boyfriend.animation.name') == 'idle' or getProperty('boyfriend.animation.name') == 'danceRight') and mustHitSection == true and stopFollow == false and (getProperty('boyfriend1.animation.name') == 'idle' or getProperty('boyfriend1.animation.name') == 'danceRight') then
        setCamFollow(xx2, yy2)
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

    if useDoubleDadIcons then
        setProperty('opponentIconScale', 1.05)
        setProperty('iconP4.x', getProperty('iconP2.x') - 50)
        setProperty('iconP4.y', getProperty('iconP2.y') + 30)
        setProperty('iconP4.alpha', 1)
    end

    if useDoubleBFIcons then
        setProperty('playerIconScale', 1.05)
        setProperty('iconP3.x', getProperty('iconP1.x') + 40)
        setProperty('iconP3.y', getProperty('iconP1.y') + 30)
        setProperty('iconP3.alpha', 1)
    end

    if getProperty('dad1.alpha') == 1 then
        setObjectOrder('dad1', getObjectOrder('dad') - 1)
    end

    if getProperty('boyfriend1.alpha') == 1 then
        setObjectOrder('boyfriend1', getObjectOrder('boyfriend') - 1)
    end
end

useDoubleDadIcons = false
useDoubleBFIcons = false

function onStepHit(step)
     if curStep == 64 then
         cameraFlash('game', '0xFFFFFFFF', 0.7)
         changeDadAuto('2vplus-senpai-angry')
         changeBFAuto('bf')
         changeGFAuto('gf')

	    changeNotesDad('normal')
	    changeNotesBF('normal')
     end

     if curStep == 132 then
         changeDadAuto('botan')
	    changeNotesDad('holofunk')
     end

     if curStep == 164 then
         changeBFAuto('pico')
     end
    
     if curStep == 192 then
         changeDadAuto('shaggy')
	    changeNotesDad('normal')
     end

     if curStep == 224 then
         changeBFAuto('blantados-new')
     end

     if curStep == 256 then
         changeDadAuto('beast-sonic')
     end

     if curStep == 288 then
         changeBFAuto('soul-tails')
     end

     if curStep == 320 then
         changeDadAuto('tricky')   
     end

     if curStep == 352 then
         changeBFAuto('tord-c')
     end
    
     if curStep == 384 then
         changeDadAuto('eteled2')
     end

     if curStep == 416 then
         changeBFAuto('baldigrr')  
     end

     if curStep == 448 then
         changeDadAuto('majin-new')
	    changeNotesDad('majin')
     end

     if curStep == 480 then
         changeBFAuto('sunky-new')
     end
  
	if curStep == 515 then
         useDoubleDadIcons = true
         useDoubleBFIcons = true

         cameraFlash('game', '0xFFFFFFFF', 0.7, true)
	    changeNotesDad('normal')

         makeLuaCharacter('dad1', 'dad', false, false)
         changeDadAuto('mom')
         setProperty('iconP4.alpha', 1)
	    setProperty('dad.x', getProperty('dad.x') - 225)

         makeLuaCharacter('boyfriend1', 'bf-gfV2', true, false)
         changeBFAuto('bf')
         changeGFAuto('nogf')
         setProperty('iconP3.alpha', 1)
	    setProperty('boyfriend.x', getProperty('boyfriend.x') + 225)
	    setProperty('boyfriend1.y', getProperty('boyfriend1.y') - 25)
     end

	if curStep == 576 then 
         changeLuaCharacter('dad1', 'ruv') 
         changeDadAuto('sarvente')
	    changeAddedIcon('iconP4', getProperty('dad1.healthIcon'))
	    setProperty('dad.x', getProperty('dad.x') - 225)
     end

	if curStep == 608 then
         changeLuaCharacter('boyfriend1', 'carol') 
         changeBFAuto('whitty')
         changeGFAuto('gf')
	    changeAddedIcon('iconP3', getProperty('boyfriend1.healthIcon'))
	    setProperty('boyfriend.x', getProperty('boyfriend.x') + 225)
     end

	if curStep == 640 then
         changeLuaCharacter('dad1', 'agoti') 
         changeDadAuto('tabi')
	    changeAddedIcon('iconP4', getProperty('dad1.healthIcon'))
	    setProperty('dad.x', getProperty('dad.x') - 225)
	    changeNotesDad('agoti')
     end

	if curStep == 672 then
         changeLuaCharacter('boyfriend1', 'ruby') 
         changeBFAuto('cj')
	    changeAddedIcon('iconP3', getProperty('boyfriend1.healthIcon'))
	    setProperty('boyfriend.x', getProperty('boyfriend.x') + 225)
	    changeNotesBF('Cj-Ruby')
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

function changeNotesDad(skin)
	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes', i, 'texture', skin)
	end

	local daSection = curSection

	if daSection % 2 == 1 then -- in case the event moves back 1
		daSection = curSection + 1
	end

	for i = 0,70 do
		if getPropertyFromGroup('notes', i, 'noteSection') == daSection then
			setPropertyFromGroup('notes', i, 'texture', skin)
		end
	end
end

function changeNotesBF(skin)
	for i = 4,7 do
		setPropertyFromGroup('strumLineNotes', i, 'texture', skin)
	end

	local daSection = curSection

	if daSection % 2 == 1 then -- in case the event moves back 1
		daSection = curSection + 1
	end

	for i = 0,70 do
		if getPropertyFromGroup('notes', i, 'noteSection') == daSection then
			setPropertyFromGroup('notes', i, 'texture', skin)
		end
	end
end
