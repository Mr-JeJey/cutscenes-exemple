-- Exemple fait par Mr_JeJey#8785 grâce aux nombreux forums.. J'espère que ca vous aidera ! :)

local function StartLaScene()
	local plyrId = PlayerPedId()
	local playerClone = ClonePed_2(plyrId, 0.0, false, true, 1)

        RequestCutscene('mp_intro_mcs_13', 8) 
	
        while not (HasCutsceneLoaded()) do
            Wait(0)
        end

	SetBlockingOfNonTemporaryEvents(playerClone, true)
	SetEntityVisible(playerClone, false, false)
	SetEntityInvincible(playerClone, true)
	SetEntityCollision(playerClone, false, false)
	FreezeEntityPosition(playerClone, true)
	SetPedHelmet(playerClone, false)
	RemovePedHelmet(playerClone, true)

	SetCutsceneEntityStreamingFlags('MP_1', 0, 1)
	RegisterEntityForCutscene(plyrId, 'MP_1', 0, GetEntityModel(plyrId), 64)
    
	RequestCollisionAtCoord(1273.908, -1715.918, 54.77644)

	Wait(10)
	StartCutscene(0)
	Wait(10)
	ClonePedToTarget(playerClone, plyrId)
	Wait(10)
	DeleteEntity(playerClone)
  
end
	

RegisterCommand("cut", function(source, args)
	StartLaScene()
end)


RegisterCommand("stopcut", function(source, args)
	StopCutsceneImmediately()
end)







