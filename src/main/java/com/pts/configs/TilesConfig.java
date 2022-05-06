package com.pts.configs;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Configuration
public class TilesConfig {

    @Bean
    public UrlBasedViewResolver viewResolver() {
        UrlBasedViewResolver view = new UrlBasedViewResolver();
        view.setViewClass(TilesView.class);
        view.setOrder(-1);
        return view;
    }

    @Bean
    public TilesConfigurer tilesConfigurer() {
        TilesConfigurer tile = new TilesConfigurer();
        tile.setDefinitions("WEB-INF/tiles.xml");
        tile.setCheckRefresh(true);
        return tile;
    }
}
