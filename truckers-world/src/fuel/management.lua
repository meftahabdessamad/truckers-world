local FuelManagement = {}

FuelManagement.fuelLevels = {}

function FuelManagement:setFuelLevel(vehicle, level)
    self.fuelLevels[vehicle] = level
end

function FuelManagement:getFuelLevel(vehicle)
    return self.fuelLevels[vehicle] or 0
end

function FuelManagement:refuel(vehicle, amount)
    local currentLevel = self:getFuelLevel(vehicle)
    self:setFuelLevel(vehicle, currentLevel + amount)
end

function FuelManagement:consumeFuel(vehicle, amount)
    local currentLevel = self:getFuelLevel(vehicle)
    if currentLevel >= amount then
        self:setFuelLevel(vehicle, currentLevel - amount)
    else
        self:setFuelLevel(vehicle, 0)
    end
end

function FuelManagement:isOutOfFuel(vehicle)
    return self:getFuelLevel(vehicle) <= 0
end

return FuelManagement