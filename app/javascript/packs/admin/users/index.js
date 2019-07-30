import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
import UsersIndexView from 'views/admin/users/index'
import BootstrapVue from 'bootstrap-vue'

Vue.use(BootstrapVue)

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
    const element = document.getElementById("users-index-view")
    const props = JSON.parse(element.getAttribute('data'))


    if (element != null && props != null) {

        new Vue({
            el: '#users-index-view',
            render: h => h(UsersIndexView, { props }),
        });
    }
});