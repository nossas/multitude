def to_button string
  return "new_task_button" if string == "the new task button"
  return "task_submit_button" if string == "the new task submit button"
  return "edit_task_button" if string == "the edit task button"
  return "task_submit_button" if string == "the edit task submit button"
  raise "I don't know '#{string}'"
end

def to_field string
  return "task_title" if string == "the task title field"
  return "task_description" if string == "the task description field"
  return "task_max_deliveries" if string == "the task max deliveries field"
  return "task_remote" if string == "the task remote field"
  return "task_task_type_id" if string == "the task type field"
  return "task_skills_programacao_de_softwares_e_aplicativos_ou_web" if string == "the task programming skill field"
  return "task_deadline" if string == "the task deadline field"
  return "task_material" if string == "the task material field"
  return "task_handout" if string == "the task handout field"
  return "task_deliverable" if string == "the task deliverable field"
  return "task_points" if string == "the task points field"
  return "task_hashtag" if string == "the task hashtag field"
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
  return '.task .hashtag' if string == 'this task hashtag'
  return '.task .category' if string == 'this task category'
  return '.task .description' if string == 'this task description'
  return '.task .deadline' if string == 'this task deadline'
  return '.task .points' if string == 'this task points'
  return '.task .skills' if string == 'this task skills'
  return ".title_field.error" if string == "the task title error message"
  return "#new_task_button" if string == "the new task button"
  return "#edit_task_button" if string == "the edit task button"
  raise "I don't know '#{string}'"
end

def to_text string
  return @task.reload.title if string == 'this task title'
  return @task.reload.hashtag if string == 'this task hashtag'
  return @task.reload.type if string == 'this task category'
  return @task.reload.description if string == 'this task description'
  return @task.reload.points if string == 'this task points'
  return @task.reload.formatted_deadline if string == 'this task deadline'
end
