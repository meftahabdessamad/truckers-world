local Truck = {}
Truck.__index = Truck

function Truck:new(model, capacity, fuelEfficiency)
    local instance = setmetatable({}, Truck)
    instance.model = model
    instance.capacity = capacity
    instance.fuelEfficiency = fuelEfficiency
    instance.currentLoad = 0
    instance.fuelLevel = 100 -- Assuming full tank at start
    return instance
end

function Truck:loadCargo(amount)
    if self.currentLoad + amount <= self.capacity then
        self.currentLoad = self.currentLoad + amount
        return true
    else
        return false, "Exceeds capacity"
    end
end

function Truck:unloadCargo(amount)
    if self.currentLoad - amount >= 0 then
        self.currentLoad = self.currentLoad - amount
        return true
    else
        return false, "Not enough cargo to unload"
    end
end

function Truck:refuel(amount)
    self.fuelLevel = math.min(self.fuelLevel + amount, 100) -- Max fuel level is 100
end

function Truck:consumeFuel(distance)
    local fuelNeeded = distance / self.fuelEfficiency
    if self.fuelLevel >= fuelNeeded then
        self.fuelLevel = self.fuelLevel - fuelNeeded
        return true
    else
        return false, "Not enough fuel"
    end
end

function Truck:getStatus()
    return {
        model = self.model,
        currentLoad = self.currentLoad,
        fuelLevel = self.fuelLevel
    }
end

return Truck