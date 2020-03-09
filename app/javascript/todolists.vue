<template>
  <div class="container">
    <h1>Todo Lists</h1>

    <div class="form">
      <div class="form-group">
        <label for="todoTitle">Enter a title for this card…</label>
        <input type="text" v-model="todo" class="form-control" autofocus="true" id="todoTitle">
      </div>
      <div class="form-group">
        <label for="todoDate">Due date</label>
        <b-form-datepicker id="todoDate" v-model="duedate"></b-form-datepicker>
      </div>
      <button @click="addTodo()" class="btn btn-primary" :disabled="!todo.length">Add Todo</button>
    </div>

    <hr />

    <table width="50%">
      <thead>
        <tr>
          <th>#</th>
          <th>Item</th>
          <th>Due date</th>
          <th></th>
        </tr>
      </thead>
      <tbody is="draggable" tag="tbody">
        <tr v-for="todo in list" >
          <td>{{ todo.id }}</td>
          <td>{{ todo.item }}</td>
          <td>{{ todo.duedate }}</td>
          <td><button @click="delTodo(todo.id)" class="btn btn-danger">Delete</button></td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import draggable from 'vuedraggable'

export default {
  components: {
    draggable
  },
  data: function () {
    return {
      todo: '',
      duedate: '',
      list: [
        { id: 1, item: "kevin", duedate: '0000-00-00' },
        { id: 2, item: "KKK", duedate: '0000-00-00' }
      ]
    }
  },
  created: function() {
   this.fetchTodoLists();
  },
  methods: {
    fetchTodoLists: function() {
       const resource = this.$resource('/todolists.json/{ id }');
       resource.get().then(function(response){
         this.list = response.data
       });
    },
    addTodo() {
      this.$http.post('todolists.json', { item: this.todo, duedate: this.duedate }, {})
      .then((res) => this.fetchTodoLists(), this.todo = '', this.duedate = '')
      .catch((error) => console.log('Error: ' + error));
    },
    delTodo(todo_id) {
      if(confirm("Are you sure")){
        this.$http.delete('todolists/'+ todo_id +'.json')
        .then((res) => this.fetchTodoLists())
        .catch((error) => console.log('Error:' + error));
      }
    }
  }
}
</script>