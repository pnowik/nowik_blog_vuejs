<template>
    <div id="users-show-view">
        <p>Id: {{user.id}}</p>
        <p>Name: {{user.name}}</p>
        <p>Email: {{user.email}}</p>
        <p>Role: {{user.role}}</p>
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