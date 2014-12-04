# ���������Զ������ԡ����������ߡ���ʵ���Ͼ�����������ﴴ��һ������
# �����������ߡ������������涥������Ĵ����ߣ������������ơ����񵥡��������������
# customized_id ==> issues.id
# custom_field_id ==> custom_fields.id
# value ==> issues.root_id.author_id

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