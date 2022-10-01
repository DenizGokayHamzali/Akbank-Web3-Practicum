// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TodoList {
    struct Todo {
        string text; // description of the Todo.
        bool completed;
    }

    Todo[] public todos; // an array of 'Todo' structs.
    // calldata is a cheaper option than memory.
    function create(string calldata _text) external { // create to insert a new Todo.
        todos.push(Todo({ // mapping, key value.
            text: _text,
            completed: false
        }));
    }

    function updateText(uint _index, string calldata _text) external { // update text to-do. 
        todos [_index].text = _text;        
    }

    function get (uint _index) external view returns (string memory, bool) { // get the data stored inside a to-do.
        Todo memory todo = todos[_index]; // storage 29397 gas, memory 29480 gas btw.
        return (todo.text, todo.completed);
    }

    function toggleCompleted(uint _index) external { // completed or uncompleted check function.
        todos[_index].completed = !todos[_index].completed;
    }
}
