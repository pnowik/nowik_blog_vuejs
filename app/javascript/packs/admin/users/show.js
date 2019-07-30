import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
import UsersShowView from 'views/admin/users/show';

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
    const element = document.getElementById("users-show-view")
    const props = JSON.parse(element.getAttribute('data'))
    if (element != null && props != null) {

        new Vue({
            el: '#users-show-view',
            render: h => h(UsersShowView, { props }),
        });
    }
});