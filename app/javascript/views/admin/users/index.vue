<template>
    <div id="users-index-view">
        <div class="manage-header">
            <h1>Manage Users</h1>
        </div>

        <table class="my-table">
            <tr>
                <th class="my-th">user_id</th>
                <th class="my-th">name</th>
                <th class="my-th">email</th>
                <th class="my-th">role</th>
                <th class="my-th">show user</th>
                <th class="my-th">edit user</th>
            </tr>
            <tr v-for="user in users">
                <td class="my-td">{{user.id}}</td>
                <td class="my-td">{{user.name}}</td>
                <td class="my-td">{{user.email}}</td>
                <td class="my-td">{{user.role}}</td>
                <td class="my-td"> <a v-bind:href="'/admin/users/' + user.id">show</a></td>
                <td class="my-td" v-if="user.role !== 'admin'"><a v-bind:href="'/admin/users/' + user.id + '/edit'">edit</a></td>
                <td class="my-td" v-else-if="current_user.role === 'admin'"><a v-bind:href="'/admin/users/' + user.id + '/edit'">edit</a></td>
                <td class="my-td" v-else>you can't do this</td>
            </tr>
        </table>


    </div>

</template>



<script>
    export default {
        props: ['users', 'current_user'],
        data() {
            return {
            }
        }
    }
</script>

<style scoped>

</style>


<!--
<div class="manage-header">
    <h1>Manage Users</h1>
</div>

<div class="search-bar">
    <%= form_tag(admin_users_path, method: :get) do %>
    <%= text_field_tag :term, params[:term] %>
    <%= submit_tag 'Search name', name: nil, class: 'btn btn-primary' %>
    <% end %>
</div>


<table class="my-table">
    <tr>
        <th class="my-th">user_id</th>
        <th class="my-th">name</th>
        <th class="my-th">email</th>
        <th class="my-th">role</th>
        <th class="my-th">show_user</th>
        <th class="my-th">edit_user</th>
        <th class="my-th">delete_user</th>
    </tr>
    <% @users.each do |u| %>
    <tr>
        <td class="my-td"><%= u.id %></td>
        <td class="my-td"><%= u.name %></td>
        <td class="my-td"><%= u.email %></td>
        <td class="my-td"><%= u.role %></td>
        <td class="my-td"><%= link_to 'show', admin_user_path(u.id) %></td>
        <% if u.role.to_s != "admin" %>
        <td class="my-td"><%= link_to 'edit', edit_admin_user_path(u.id) %></td>
        <td class="my-td"><%= link_to 'delete', admin_user_path(u.id), method: :delete, data: {confirm: "Are you sure you want to delete user permanently?"} %></td>
        <% elsif current_user.try(:admin?) %>
        <td class="my-td"><%= link_to 'edit', edit_admin_user_path(u.id) %></td>
        <td class="my-td"><%= link_to 'delete', admin_user_path(u.id), method: :delete, data: {confirm: "Are you sure you want to delete user permanently?"} %></td>
        <% else %>
        <td class="my-td">you can't do this</td>
        <td class="my-td">you can't do this</td>
        <% end %>
    </tr>
    <% end %>
</table>

<div class="my-pagination">
    <%= will_paginate @users %>
</div>

-->