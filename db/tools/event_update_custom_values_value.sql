# 用来设置自定义属性“根任务作者”，实际上就是在这个表里创建一个关联
# “根任务作者”，任务链里面顶层任务的创建者，用来过滤类似“任务单”这个的任务链。
update custom_values t
set   t.value = (
			SELECT ta.author_id
			from issues ta 
			where ta.id = (
			SELECT a.root_id
			from issues a
			where a.id = t.customized_id
		)
	)
where custom_field_id = 5
and value is null