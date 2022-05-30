package com.example.spring_cv.service.curriculum;

import com.example.spring_cv.model.curriculumVitae.Task;
import com.example.spring_cv.repository.curriculum.TaskRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskService {

    private final TaskRepository taskRepository;

    public TaskService(TaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }

    public void saveTask(Task task){
        taskRepository.save(task);
    }

    public void saveAllTasks(List<Task> tasks){
        taskRepository.saveAll(tasks);
    }

    public void deleteTask(Long id){
        taskRepository.deleteById(id);
    }
}
