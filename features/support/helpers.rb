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
  return "task_material" if string == "the task material field"
  return "task_handout" if string == "the task handout field"
  return "task_deliverable" if string == "the task deliverable field"
  return "task_points" if string == "the task points field"
  raise "I don't know '#{string}'"
end

def to_route string
  return task_path(Task.order(:id).last) if string == "the created task page"
  return root_path if string == "the homepage"
  return task_path(@task) if string == "this task page"
  raise "I don't know '#{string}'"
end

def to_element string
  return '.task .title' if string == 'this task title'
  return '.task .category' if string == 'this task category'
  return '.task .description' if string == 'this task description'
  return '.task .deadline' if string == 'this task deadline'  
  return ".title_field.error" if string == "the task title error message"
  return "#new_task_button" if string == "the new task button"
  raise "I don't know '#{string}'"
end

def to_text string
  return @task.title if string == 'this task title'
  return @task.type if string == 'this task category'
  return @task.description if string == 'this task description'
  return @task.deadline if string == 'this task deadline'
end
