import Vue from 'vue'
import Vuex from 'vuex'

import Auth from './modules/auth'
import Employee from './modules/employee'
import Bonos from './modules/bonus'
import Permisos from './modules/permits'
import Salary from './modules/salary'
import Overtime from './modules/overtime'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    Auth, 
    Employee,
    Bonos,
    Permisos,
    Salary,
    Overtime
  },
  // state: {

  // },
  // mutations: {

  // },
  // actions: {

  // }
})
