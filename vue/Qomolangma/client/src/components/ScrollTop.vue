<template>

</template>
<script>
export default {
    name: 'scroll-top',
    methods: {
        returnTop() {
            document.documentElement.scrollTop = document.body.scrollTop = 0;
        }
    }
}
</script>

<style lang="scss" scoped>
@import '../assets/css/scroll-top.scss';
</style>
