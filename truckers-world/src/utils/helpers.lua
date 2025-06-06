local function log(message)
    outputDebugString("[Truckers World] " .. message)
end

local function validateInput(input, expectedType)
    return type(input) == expectedType
end

local function roundNumber(num, decimals)
    local mult = 10^(decimals or 0)
    return math.floor(num * mult + 0.5) / mult
end

local function formatCurrency(amount)
    return string.format("$%.2f", amount)
end

return {
    log = log,
    validateInput = validateInput,
    roundNumber = roundNumber,
    formatCurrency = formatCurrency
}