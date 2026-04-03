extends Node

const url_registry: Dictionary[String, WebpageData] = {
	"page1.com": preload("uid://da6j7k6txtj65"),
	"page2.com": preload("uid://b5x5vxmwbg3w"),
}

func get_url_data(url: String) -> WebpageData:
	return url_registry[url]
