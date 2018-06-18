From: Tony Lindgren <tony@atomide.com>
Subject: Re: [Letux-kernel] BUG: drivers/pinctrl/core: races in
 pinctrl_groups and deferred probing
Date: Sun, 17 Jun 2018 23:46:51 -0700
Message-ID: <20180618064651.GL112168@atomide.com>
References: <F20BD6B3-D4D7-4D5D-B464-64402650BDE5@goldelico.com>
 <20180614120157.GE112168@atomide.com>
 <FC373DE9-6D6B-40C5-ACED-C07B1B524469@goldelico.com>
 <20180615065810.GI112168@atomide.com>
 <20180615111318.GJ112168@atomide.com>
 <029F115C-480E-485A-B547-9D5873925CEF@goldelico.com>
 <4DE2E482-B0D3-4799-9E2D-74E2180B305B@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4DE2E482-B0D3-4799-9E2D-74E2180B305B@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel@pyra-handheld.com, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: linux-gpio@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [180616 11:10]:
> There is also good news: the selectors are now assigned in strict sequence.
> This is a big improvement:

OK thanks for testing.

> If slots 17 and 18 do not really exist (or are deleted after failed probing), there is
> a NULL return. Which triggers the strcmp(NULL), because the strcmp is not guarded against
> non-existing slots in the radix tree.
> 
> So a simple workaround could be:
> 
> 		if (gname && !strcmp(gname, pin_group)) {
> 
> But I think the fundamental problem is that the same driver assigns multiple slots if
> probing is deferred.
> 
> Therefore, I tried to find out more why this happens. Here are some more observations by
> studying the code and adding a dump_stack() inside pinctrl_generic_add_group():
> 
> 1.  the records stored in the radix tree are allocated through devm_kzalloc() within
>     pinctrl_generic_add_group().
> 2.  I have not found a mechanism that removes them from the radix tree if they are
>     devm freed which IMHO happens if the probe fails (and all devm objects are
>     rewound).
> 3.  I could not observe calls to pinctrl_generic_remove_group()
> 4.  this means a stale pointer to the group_desc is still stored in the radix tree
>     if driver probing fails
> 5.  scanning through the radix tree for a matching gname in pinctrl_get_group_selector()
>     accesses this stale radix tree entry.
>     It has either been overwritten by something else - or contains a dangling pointer for
>     group->name. This explains the randomness of the problem but that it is also repeatable
>     to some extent. For a pure race of some 100 instructions it happens IMHO too often.
> 6.  the pinctrl_generic_add_group() is called from create_pinctrl() through 
>     pinctrl_dt_to_map() and pcs_dt_node_to_map(), i.e. before the pinctrl_maps_mutex
>     is locked in create_pinctrl(). This means that pinctrl_generic_add_group() is
>     not locked in this case.
> 
> I hope this helps to pinpoint and solve the remaining bugs.

Yes sounds like that's where things still go wrong. I'll take a look
if it makes sense to assign the selector from the pin controller
driver instead or just ignoring the holes.

I'll try to debug the devm issue too.

Regards,

Tony
