function addTodo() {
  const input = document.getElementById('todo-input');
  const newTodoText = input.value.trim();
  if (newTodoText !== '') {
    const newTodoItem = document.createElement('li');
    newTodoItem.textContent = newTodoText;
    newTodoItem.addEventListener('click', toggleComplete);

    const removeButton = document.createElement('button');
    removeButton.textContent = 'Remove';
    removeButton.classList.add('remove-btn');
    removeButton.addEventListener('click', removeTodo);

    newTodoItem.appendChild(removeButton);
    document.getElementById('todo-list').appendChild(newTodoItem);
    input.value = '';
  }
}

function toggleComplete(event) {
  event.target.classList.toggle('completed');
}

function removeTodo(event) {
  event.stopPropagation();
  const item = event.target.parentNode;
  document.getElementById('todo-list').removeChild(item);
}
