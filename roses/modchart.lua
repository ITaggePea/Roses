function start (song)
	print("Song: " .. song .. " @ " .. bpm .. " downscroll: " .. downscroll)
end

local defaultHudX = 0
local defaultHudY = 0

local defaultWindowX = -100
local defaultWindowY = 0

local lastStep = 0


function update (elapsed)
    local currentBeat = (songPos / 1000)*(bpm/60)

end

function beatHit (beat) 

end

function stepHit (step)

    if curStep == 1 then --for testing
        
    end

    if curStep == 64 then
        cameraFlash('game', '0xFFFFFFFF', 0.7)
        changeDadAuto('2vplus-senpai-angry')
        changeStage('senpaihd')
        changeBFAuto('bf')
        changeGFAuto('gf')
        setupNoteSplash('-normal')
        changeStaticNotes('normal', 'normal')
    end

    if curStep == 132 then
        changeDadAuto('botan')
        setupNoteSplash('-holofunk')
    end

    if curStep == 164 then
        changeBFAuto('pico')
    end
    
    if curStep == 192 then
        changeDadAuto('shaggy')
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
        setupNoteSplash('-majin')
    end

    if curStep == 480 then
        changeBFAuto('sunky')
    end
  
    if curStep == 515 then
        changeDadAuto('mom')
        changeBoyfriendCharacter('bf', 710, 460)
        changeGFAuto('nogf')
         changeBFIcon('bf-no-win')
    end

    if curStep == 576 then
        changeDadAuto('sarvente')
    end

    if curStep == 608 then
        changeBoyfriendCharacter('whitty', 710, 100)
        changeGFAuto('gf')
    end

    if curStep == 640 then
        changeDadAuto('tabi')
    end

    if curStep == 672 then
        changeBFAuto('cj')
    end
end


 

