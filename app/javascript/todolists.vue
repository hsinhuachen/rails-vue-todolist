<template>
  <div class="container-fluid">
    <h1>Todo Lists</h1>

    <div class="row">
      <input type="text" v-model="todo" class="form-control" autofocus="true">
      <button @click="addTodo()" class="btn btn-primary" :disabled="!todo.length">Add Todo</button>
    </div>
    <table>
      <thead>
        <tr>
          <th>#</th>
          <th>Item</th>
          <th></th>
        </tr>
      </thead>

      <tbody>
        <tr v-for="todo in list" >
          <td>{{ todo.id }}</td>
          <td>{{ todo.item }}</td>
          <td><button @click="delTodo(todo.id)" class="btn btn-danger">Delete</button></td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      todo: '',
      list: [
        { id: 1, item: "Foo" },
        { id: 2, item: "Bar" }
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
      this.$http.post('todolists.json', { item: this.todo }, {})
      .then((res) => this.fetchTodoLists(), this.todo = '')
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