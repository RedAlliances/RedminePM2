# ���������Զ������ԡ����������ߡ���ʵ���Ͼ�����������ﴴ��һ������
# �����������ߡ������������涥������Ĵ����ߣ������������ơ����񵥡��������������
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