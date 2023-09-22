-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
-- Here we build the network with all the groups that have a name starting with DF CCCP AWACS and DF CCCP EWR.
DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes({ "RED AWACS", "RED EW" })
DetectionSetGroup:FilterStart()

-- Setup the detection and group targets to a 30km range!
Detection = DETECTION_AREAS:New(DetectionSetGroup, 50000)

-- Now Setup the A2A dispatcher, and initialize it using the Detection object.
A2ADispatcher = AI_A2A_DISPATCHER:New(Detection)

-- Mutual Defense System

-- Set up Hot Border
local CCCPBorderZone = ZONE_POLYGON:New("CCCP BORDER", GROUP:FindByName("CCCP BORDER"))
A2ADispatcher:SetBorderZone(CCCPBorderZone)

A2ADispatcher:SetTacticalDisplay(true)

-- Set Engagement range to 100000km
A2ADispatcher:SetEngageRadius(200000)

-- Set 150km as the radius to ground control intercept detected targets from the nearest airbase.
A2ADispatcher:SetGciRadius(200000)

A2ADispatcher:SetIntercept(5)

-- Setup the squadrons.
A2ADispatcher:SetSquadron("Rene_Mouawad", AIRBASE.Syria.Rene_Mouawad, { "SQ CCCP SU-27" }, 20)
A2ADispatcher:SetSquadronGci("Rene_Mouawad", 800, 1200)
A2ADispatcher:SetSquadronTakeoffFromParkingHot("Rene_Mouawad")
A2ADispatcher:SetSquadronLandingNearAirbase("Rene_Mouawad")

A2ADispatcher:SetSquadron("Tiyas", AIRBASE.Syria.Tiyas, "SQ CCCP SU-30", 20)
A2ADispatcher:SetSquadronGci("Tiyas", 800, 1200)
A2ADispatcher:SetSquadronTakeoffFromParkingHot("Tiyas")
A2ADispatcher:SetSquadronLandingNearAirbase("Tiyas")

A2ADispatcher:Start()
