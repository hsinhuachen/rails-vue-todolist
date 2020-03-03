# Rails todolist use vue

* rails new rails-vue-todolist --skip-turbolinks --skip-spring --webpack=vue
* touch app/javascript/todolists.vue
* yarn add vue-resource

## install bootstrap-vue
* yarn add vue bootstrap-vue bootstrap

## Add column
* rails g migration add_column_to_todolist duedate:text sorting:integer

## vue drag
* yarn add vuedraggable
