bookmarklet_insta = "javascript:function iprl5(){var d=document,z=d.createElement('scr'+'ipt'),b=d.body,l=d.location;try{if(!b)throw(0);d.title='(Saving...) '+d.title;z.setAttribute('src',l.protocol+'//www.instapaper.com/j/D0KGEstBBf1o?a=send-to-kindle&u='+encodeURIComponent(l.href)+'&t='+(new Date().getTime()));b.appendChild(z);}catch(e){alert('Please wait until the page has loaded.');}}iprl5();void(0)"

c.aliases.update({ 'insta': 'jseval '+bookmarklet_insta })

#c.unbind('H', mode='normal')
#c.unbind('J', mode='normal')
#c.unbind('K', mode='normal')
#c.unbind('L', mode='normal')


config.bind('H', 'tab-prev',  mode='normal')
config.bind('K', 'back' , mode='normal')
config.bind('J', 'forward' , mode='normal')
config.bind('L', 'tab-next', mode='normal')

config.bind(',v', 'spawn mpv --script ~/.config/mpv/plugins/mpris.so {url}')
#send to kindle via instapaper
config.bind(',s', 'insta')
