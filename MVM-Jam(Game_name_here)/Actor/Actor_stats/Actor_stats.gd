extends Node2D

signal on_stats_changed(key,value)

var stats={} 






func set_stats_data(key,value):
	stats[key]=value

func get_stats_data(key):
	return stats[key]



