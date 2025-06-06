local repairs = {}

function repairs.checkVehicleHealth(vehicle)
    local health = getElementHealth(vehicle)
    return health
end

function repairs.performRepair(vehicle)
    local currentHealth = repairs.checkVehicleHealth(vehicle)
    if currentHealth < 1000 then
        local repairCost = (1000 - currentHealth) * 10 -- Example cost calculation
        setElementHealth(vehicle, 1000)
        return repairCost
    end
    return 0 -- No repair needed
end

function repairs.getRepairCost(vehicle)
    local currentHealth = repairs.checkVehicleHealth(vehicle)
    if currentHealth < 1000 then
        return (1000 - currentHealth) * 10 -- Example cost calculation
    end
    return 0 -- No repair needed
end

return repairs