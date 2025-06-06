local DeliveryJob = {}
DeliveryJob.jobs = {}

function DeliveryJob:createJob(player, destination, reward)
    local jobId = #self.jobs + 1
    self.jobs[jobId] = {
        player = player,
        destination = destination,
        reward = reward,
        status = "in progress"
    }
    return jobId
end

function DeliveryJob:completeJob(jobId)
    local job = self.jobs[jobId]
    if job and job.status == "in progress" then
        job.status = "completed"
        -- Add reward to player
        givePlayerMoney(job.player, job.reward)
        return true
    end
    return false
end

function DeliveryJob:getJobStatus(jobId)
    local job = self.jobs[jobId]
    if job then
        return job.status
    end
    return nil
end

function DeliveryJob:getAllJobs()
    return self.jobs
end

return DeliveryJob