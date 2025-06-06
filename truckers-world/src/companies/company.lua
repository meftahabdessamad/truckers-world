local companies = {}

function companies.createCompany(name, owner)
    local company = {
        name = name,
        owner = owner,
        balance = 0,
        drivers = {},
        trucks = {}
    }
    return company
end

function companies.addDriver(company, driver)
    table.insert(company.drivers, driver)
end

function companies.addTruck(company, truck)
    table.insert(company.trucks, truck)
end

function companies.updateBalance(company, amount)
    company.balance = company.balance + amount
end

function companies.getCompanyInfo(company)
    return {
        name = company.name,
        owner = company.owner,
        balance = company.balance,
        drivers = company.drivers,
        trucks = company.trucks
    }
end

return companies