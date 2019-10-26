package com.mahendra.candi.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    CustomSuccessHandler customSuccessHandler;

    @Autowired
    public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception{
        auth.inMemoryAuthentication().withUser("user").password("{noop}user1234").roles("USER");
        auth.inMemoryAuthentication().withUser("admin").password("{noop}admin1234").roles("ADMIN");
        auth.inMemoryAuthentication().withUser("dba").password("{noop}dba1234").roles("DBA", "ADMIN");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/", "/home").permitAll()
                .antMatchers("/admin/**").access("hasRole('ADMIN')")
                .antMatchers("/db/**").access("hasRole('ADMIN') and hasRole('DBA')")
                .and().formLogin()
                    .loginPage("/login").successHandler(customSuccessHandler)
                    .usernameParameter("ssoId")
                .passwordParameter("password")
                .and().csrf()
                .and().exceptionHandling().accessDeniedPage("/accessDenied")
                .and().logout().logoutSuccessUrl("/home");
    }
}
