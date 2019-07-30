import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
import UsersShowView from 'views/admin/users/show'
import BootstrapVue from 'bootstrap-vue'
import moment from 'moment'

Vue.use(BootstrapVue)

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
    const element = document.getElementById("users-show-view")
    const props = JSON.parse(element.getAttribute('data'))

    Vue.filter('formatDate', function(value) {

        if (value) {

            return moment(String(value)).format('YYYY-MM-DD hh:mm')

        }

    });
    if (element != null && props != null) {

        new Vue({
            el: '#users-show-view',
            render: h => h(UsersShowView, { props }),
        });
    }
});