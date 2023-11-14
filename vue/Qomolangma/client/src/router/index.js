import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/pages/Home'
import MyMusic from '@/pages/MyMusic'
import Singer from '@/pages/Singer'
import SongList from '@/pages/SongList'
import Search from '@/pages/Search'
import Lyric from '@/pages/lyric'
import SignUp from '@/pages/SignUp'
import LoginIn from '@/pages/LoginIn'
import Setting from '@/pages/Setting'
import SingerAlbum from '@/pages/SingerAlbum'
import SongListAlbum from '@/pages/SongListAlbum'
import change from '@/pages/change'
import listvue from '@/pages/listvue'
import Comment from '@/pages/CommentPage'
import ListSong from '@/pages/ListSongPage'
import Gpt from '@/pages/gpt'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/gpt',
      name: 'gpt',
      component: Gpt
    },
    {
      path: '/',
      name: 'home',
      component: Home
    },
    {
      path: '/ListSong',
      name: 'ListSong',
      component: ListSong
    },
    {
      path: '/comment',
      name: 'comment',
      component: Comment
    },
    {
      path: '/my-Qomolangma',
      name: 'my-Qomolangma',
      component: MyMusic
    },
    {
      path: '/singer',
      name: 'singer',
      component: Singer
    },
    {
      path: '/change',
      name: 'change',
      component: change
    },
    {
      path: '/song-list',
      name: 'song-list',
      component: SongList
    },
    {
      path: '/search',
      name: 'search',
      component: Search
    },
    {
      path: '/lyric',
      name: 'lyric',
      component: Lyric
    },
    {
      path: '/sign-up',
      name: 'sign-up',
      component: SignUp
    },
    {
      path: '/login-in',
      name: 'login-in',
      component: LoginIn
    },
    {
      path: '/setting',
      name: 'setting',
      component: Setting
    },
    {
      path: '/singer-album/:id',
      name: 'singer-album',
      component: SingerAlbum
    },
    {
      path: '/song-list-album/:id',
      name: 'song-list-album',
      component: SongListAlbum
    },
    {
      path: '/listvue',
      name: 'listvue',
      component: listvue
    },



  ],
  scrollBehavior (to, from, savedPosition) {
    return { x: 0, y: 0 }
  }
})
