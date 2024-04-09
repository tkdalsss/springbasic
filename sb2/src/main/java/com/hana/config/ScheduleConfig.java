package com.hana.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;

@Configuration
public class ScheduleConfig implements SchedulingConfigurer {

    private final int POOL_SIZE = 6;

    @Override
    public void configureTasks(ScheduledTaskRegistrar registry) {
        ThreadPoolTaskScheduler tHreadPoolTaskScheduler = new ThreadPoolTaskScheduler();
        tHreadPoolTaskScheduler.setPoolSize(POOL_SIZE);
        tHreadPoolTaskScheduler.setThreadNamePrefix("CommB-Scheduled-task-");
        tHreadPoolTaskScheduler.initialize();

        registry.setTaskScheduler(tHreadPoolTaskScheduler);
    }
}
