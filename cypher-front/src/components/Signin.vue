<template>
    <div> 
        <div>
            <h3>Sign In</h3>
            <form @submit.prevent="signin">
                <div v-if="error">{{ error }}</div>
                <div>
                    <label for="email">Email Address</label>
                    <input type="email" v-model="email" class="input" id="email" placeholder="boopy@boop.com">
                </div>
                <div>
                    <label for="password">Password</label>
                    <input type="password" v-model="password" class="input" id="password">
                </div>
                <button type="submit">Sign In</button>
            </form>
            <div>
                <router-link to="/signup">Sign Up</router-link>
            </div>
        </div>
    </div>
</template>

<script>

import { securedAxiosInstance, plainAxiosInstance } from '../backend/axios'

export default{
    name: 'Signin', 
    props: ['plain'],
    data () {
        return {
            email: '',
            password: '',
            error: ''
        }
    },
    created(){
        this.checkSignedIn(),
    // props are exposed on `this`
        console.log(this.plain),
        console.log(plainAxiosInstance)
    },
    updated(){
        this.checkSignedIn()
    },
    methods: {
        signin() {
            this.$http.plain.post('/signin', { email: this.email, password: this.password})
            .then(response => this.signinSuccessful(response))
            .catch(error => this.signinFailed(error))
        },
        signinSuccessful(response){
            if (!response.data.csrf) {
                this.signinFailed(response)
                return
            }        
            localStorage.csrf = response.data.csrf
            localStorage.signedIn = true
            this.error = ''
            this.$router.replace('/messages')
        },
        signinFailed(error){
            this.error = (error.response && error.response.data && error.response.data.error) || ''
            delete localStorage.csrf
            delete localStorage.signedIn
        },
        checkSignedIn() {
            if (localStorage.signedIn){
                this.$router.replace('/messages')
            }
        }
    }
}
</script>

<style scoped>

</style>