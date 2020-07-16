# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy


class JobcrawlerItem(scrapy.Item):
    url = scrapy.Field()
    title = scrapy.Field()
    company = scrapy.Field()
    location = scrapy.Field()
    salary = scrapy.Field()
    description = scrapy.Field()
    contract = scrapy.Field()
    workingday = scrapy.Field()


    pass
