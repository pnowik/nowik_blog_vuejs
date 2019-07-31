<template>
    <div id="users-edit-view">
    <h1>Edit user</h1>
    <form method="get" action="/admin/users/3/edit" class="form-horizontal">
        <input type="hidden" name="authenticity_token" :value="csrf">
        <div class="form-group">
            <label class="col-sm-2 control-label">Name</label>
            <input type="name" class="input" name="name">
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">Email</label>
            <input type="email" class="input" name="email">
        </div>

        <div class="form-group" style="margin-top: 60px !important;">
            <div class="col-sm-offset-2 col-sm-6">
                <button type="submit">Update</button>
            </div>
        </div>
    </form>
    </div>
</template>

<script>
    export default {
        props: ['user'],
        data: function() {
            return ({
                csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            })
        }
    }
</script>

<style scoped>

</style>





<!--
<h2>Edit user</h2>


<%= form_for(@user, url: admin_user_path(@user.id), html: { class: 'form-horizontal' }) do |f| %>

<div class="form-group">
    <%= f.label :avatar, class: 'col-sm-2 control-label'  %>
    <div class="col-sm-6">
        <%= f.file_field :avatar %>
    </div>
</div>

<div class="form-group">
    <%= f.label :name, class: 'col-sm-2 control-label'  %>
    <div class="col-sm-6">
        <%= f.text_field :name, autofocus: true, class: 'form-control'  %>
    </div>
</div>

<div class="form-group">
    <%= f.label :email, class: 'col-sm-2 control-label'  %>
    <div class="col-sm-6">
        <%= f.email_field :email, class: 'form-control'  %>
    </div>
</div>

<% if @user.role != "admin" %>
<div class="form-group">
    <%= f.label :role, class: 'col-sm-2 control-label'  %>
    <div class="col-sm-6">
        <%= f.select :role, [['standard', 'standard'], ['mod', 'mod']], class: 'form-control' %>
    </div>
</div>
<% end %>

<div class="form-group" style="margin-top: 60px !important;">
    <div class="col-sm-offset-2 col-sm-6">
        <%= f.submit "Update", url: edit_admin_user_path(@user.id), class: "btn btn-primary" %>
    </div>
</div>

<% end %>

-->