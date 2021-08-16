extends Node2D


signal on_stats_changed(key,value)










func change_stats(key,value):
	emit_signal("on_stats_changed",key,value)