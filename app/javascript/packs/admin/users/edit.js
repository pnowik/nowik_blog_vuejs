import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
import UsersEditView from 'views/admin/users/edit'
import BootstrapVue from 'bootstrap-vue'

Vue.use(BootstrapVue)

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
    const element = document.getElementById("users-edit-view")
    const props = JSON.parse(element.getAttribute('data'))
    if (element != null && props != null) {

        new Vue({
            el: '#users-edit-view',
            render: h => h(UsersEditView, { props }),
        });
    }
});