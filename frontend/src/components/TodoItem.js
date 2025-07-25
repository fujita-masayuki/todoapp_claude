import React from 'react';

const TodoItem = ({ todo, onToggle, onDelete }) => {
  return (
    <div className="todo-item">
      <input
        type="checkbox"
        className="todo-checkbox"
        checked={todo.completed}
        onChange={onToggle}
      />
      <span className={`todo-text ${todo.completed ? 'completed' : ''}`}>
        {todo.title}
      </span>
      <button className="todo-delete" onClick={onDelete}>
        削除
      </button>
    </div>
  );
};

export default TodoItem;