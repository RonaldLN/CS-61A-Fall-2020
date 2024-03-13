import { defineConfig } from 'vitepress'
import { withMermaid } from "vitepress-plugin-mermaid"

export default withMermaid(
// https://vitepress.dev/reference/site-config
// export default defineConfig({
  defineConfig({
    title: "Notes of CS61A 20Fa",
    description: "CS61A 20Fa 笔记",
    head: [
      ['link', { rel: 'icon', href: '/CS-61A-Fall-2020/notebook-outline.ico', media: '(prefers-color-scheme: light)' }],
      ['link', { rel: 'icon', href: '/CS-61A-Fall-2020/notebook-outline-white.ico', media: '(prefers-color-scheme: dark)' }],
      // [
      //   'link',
      //   { rel: 'preconnect', href: 'https://fonts.googleapis.com' }
      // ],
      // [
      //   'link',
      //   { rel: 'preconnect', href: 'https://fonts.gstatic.com', crossorigin: '' }
      // ],
      // [
      //   'link',
      //   { href: 'https://fonts.googleapis.com/css2?family=JetBrains+Mono:ital,wght@0,100..800;1,100..800&display=swap', rel: 'stylesheet' }
      // ]
    ],
    lang: "zh-Hans",
    base: "/CS-61A-Fall-2020/",
    themeConfig: {
      // https://vitepress.dev/reference/default-theme-config
      siteTitle: "CS61A 20Fa 笔记",
      // logo: "/notebook-outline.svg",
      logo: {
        light: '/notebook-outline.svg',
        dark: '/notebook-outline-white.svg'
      },

      nav: [
        { text: '首页', link: '/' },
        {
          text: '目录',
          items: [
            { text: '标题链接', link: '/table_of_content' },
            { text: 'Part 1', link: '/CS61A_part1' },
            { text: 'Part 2', link: '/CS61A_part2' },
            { text: 'Part 3', link: '/CS61A_part1' }
          ]
        }
      ],

      sidebar: [
        {
          text: 'Examples',
          items: [
            { text: 'Markdown Examples', link: '/markdown-examples' },
            { text: 'Runtime API Examples', link: '/api-examples' }
          ]
        }
      ],

      socialLinks: [
        { icon: 'github', link: 'https://github.com/RonaldLN/CS-61A-Fall-2020/tree/note-website' },
        { icon: {
            svg: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M11.984 0A12 12 0 0 0 0 12a12 12 0 0 0 12 12 12 12 0 0 0 12-12A12 12 0 0 0 12 0a12 12 0 0 0-.016 0zm6.09 5.333c.328 0 .593.266.592.593v1.482a.594.594 0 0 1-.593.592H9.777c-.982 0-1.778.796-1.778 1.778v5.63c0 .327.266.592.593.592h5.63c.982 0 1.778-.796 1.778-1.778v-.296a.593.593 0 0 0-.592-.593h-4.15a.592.592 0 0 1-.592-.592v-1.482a.593.593 0 0 1 .593-.592h6.815c.327 0 .593.265.593.592v3.408a4 4 0 0 1-4 4H5.926a.593.593 0 0 1-.593-.593V9.778a4.444 4.444 0 0 1 4.445-4.444h8.296Z"/></svg>'
        }, link: 'https://gitee.com/ronald-luo/CS-61A-Fall-2020/tree/note-website' }
      ],
      
      footer: {
        message: '基于 <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/">CC BY-NC-SA 4.0</a> 许可发布',
        copyright: `版权所有 © 2024-${new Date().getFullYear()} <a href="https://github.com/RonaldLN">Ronald Luo</a>`
      },

      docFooter: {
        prev: '上一页',
        next: '下一页'
      },

      outline: {
        label: '页面导航'
      },

      lastUpdated: {
        text: '最后更新于',
        formatOptions: {
          dateStyle: 'short',
          timeStyle: 'medium'
        }
      },

      langMenuLabel: '多语言',
      returnToTopLabel: '回到顶部',
      sidebarMenuLabel: '菜单',
      darkModeSwitchLabel: '主题',
      lightModeSwitchTitle: '切换到浅色模式',
      darkModeSwitchTitle: '切换到深色模式',

      search: {
        provider: 'local',
        options: {
          locales: {
            root: {
              translations: {
                button: {
                  buttonText: '搜索文档',
                  buttonAriaLabel: '搜索文档'
                },
                modal: {
                  noResultsText: '无法找到相关结果',
                  resetButtonTitle: '清除查询条件',
                  footer: {
                    selectText: '选择',
                    navigateText: '切换'
                  }
                }
              }
            }
          }
        }
      }
    },

    markdown: {
      math: true,
      image: {
        lazyLoading: true
      },
    }
  })
)