jQuery ->
  $('#taskdate_tasks_attributes_0_dtstart').datepicker
  	dateFormat: 'yy-mm-dd'
  $('#taskdate_tasks_attributes_1_dtstart').datepicker
  	dateFormat: 'yy-mm-dd'
  $('#taskdate_tasks_attributes_2_dtstart').datepicker
  	dateFormat: 'yy-mm-dd'
  $('#taskdate_tasks_attributes_0_dtstop').datepicker
  	dateFormat: 'yy-mm-dd'
  $('#taskdate_tasks_attributes_1_dtstop').datepicker
  	dateFormat: 'yy-mm-dd'
  $('#taskdate_tasks_attributes_2_dtstop').datepicker
  	dateFormat: 'yy-mm-dd'
  $('#taskdate_tasks_attribute_0_project_id').autocomplete
    source: $('#taskdate_tasks_attribute_0_project_id').data('autocomplete-source')


