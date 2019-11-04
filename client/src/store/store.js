import Vue from 'vue'
import Vuex from 'vuex'

import Auth from './modules/auth'
import Employee from './modules/employee'
import Bonos from './modules/Bonus'
import Permisos from './modules/permits'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    Auth, 
    Employee,
    Bonos,
    Permisos
  },
  // state: {

  // },
  // mutations: {

  // },
  // actions: {

  // }
})
