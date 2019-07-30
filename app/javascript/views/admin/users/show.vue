<template>
    <div id="users-show-view">
        <p>Id: {{user.id}}</p>
        <p>Name: {{user.name}}</p>
        <p>Email: {{user.email}}</p>
        <p>Role: {{user.role}}</p>
        <p>Created at: {{user.created_at | formatDate}}</p>
        <p>Updated at: {{user.updated_at | formatDate}}</p>
    </div>
</template>

<script>
    export default {
        props: ['user'],
        data() {
            return {
            }
        }
    }
</script>

<style scoped>
    #users-show-view {
        margin-left: 100px !important;
        padding: 5px;
        margin-top: 15px;
        margin-bottom: 15px;
    }
</style>