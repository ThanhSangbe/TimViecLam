/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pts.configs;

import java.util.Properties;
import javax.sql.DataSource;
import static org.hibernate.cfg.AvailableSettings.DIALECT;
import static org.hibernate.cfg.AvailableSettings.SHOW_SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;

/**
 *
 * @author DELL
 */
@Configuration
@PropertySource("classpath:database.properties")
public class HibernateConfig {
    @Autowired
    private Environment env;
    @Bean
    public LocalSessionFactoryBean getSessionFactory()
    {
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
        sessionFactory.setPackagesToScan(new String[]{
            "com.pts.Pojo"
        });
        sessionFactory.setDataSource(dataSource());
        sessionFactory.setHibernateProperties(hibernateProperties());
        return sessionFactory;
    }
    @Bean
    public DataSource dataSource()
    {
        DriverManagerDataSource datasource = new DriverManagerDataSource();
        datasource.setDriverClassName(env.getProperty("hibernate.connection.driverClass"));
        datasource.setUrl(env.getProperty("hibernate.connection.url"));
        datasource.setUsername(env.getProperty("hibernate.connection.username"));
        datasource.setPassword(env.getProperty("hibernate.connection.password"));
        return datasource;
    }
    private Properties hibernateProperties()
    {
        Properties p = new Properties();
        p.put(DIALECT,env.getProperty("hibernate.dialect"));
        p.put(SHOW_SQL,env.getProperty("hibernate.showSql"));
        return p;
    }
    @Bean
    public HibernateTransactionManager transactionManager()
    {
            HibernateTransactionManager h = new HibernateTransactionManager();
            h.setSessionFactory(getSessionFactory().getObject());
            return h;
    }
}
