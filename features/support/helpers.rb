def to_button string
  return "new_task_button" if string == "the new task button"
  return "new_task_submit_button" if string == "the new task submit button"
  raise "I don't know '#{string}'"
end

def to_field string
  return "task_title" if string == "the task title field"
  return "task_description" if string == "the task description field"
  return "task_min_capacity" if string == "the task minimum capacity field"
  return "task_remote" if string == "the task remote field"
  return "task_task_type_id" if string == "the task type field"
  return "task_skills_programacao_de_softwares_e_aplicativos_ou_web" if string == "the task programming skill field"
  return "task_deadline" if string == "the task deadline field"
  raise "I don't know '#{string}'"
end

def to_route string
  return task_path(Task.order(:id).last) if string == "the new task page"
  raise "I don't know '#{string}'"
end
