From: Tony Lindgren <tony@atomide.com>
Subject: Re: [Letux-kernel] BUG: drivers/pinctrl/core: races in
 pinctrl_groups and deferred probing
Date: Mon, 18 Jun 2018 21:34:08 -0700
Message-ID: <20180619043408.GT112168@atomide.com>
References: <4DE2E482-B0D3-4799-9E2D-74E2180B305B@goldelico.com>
 <CAHp75Vf7-xcsoSJ--9nJYbxpwSfDv201UwnxJHoFbwtD187SPw@mail.gmail.com>
 <20180618091433.GP112168@atomide.com>
 <BB5DB278-9827-4351-99DF-54C875B1879F@goldelico.com>
 <20180618095428.GQ112168@atomide.com>
 <CA+Ot1OxNj30KgHWJHXgWbnXYkNXTNvd_t-b6+uG3u=z8+pZf2Q@mail.gmail.com>
 <20180618115122.GT26255@atomide.com>
 <CDD8B994-59E9-42DC-A77D-AF4F35EBF101@goldelico.com>
 <20180618181744.GS112168@atomide.com>
 <404C63D9-169E-4051-88E0-2856F3602A72@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <404C63D9-169E-4051-88E0-2856F3602A72@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Christ van Willegen <cvwillegen@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, kernel@pyra-handheld.com, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: linux-gpio@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [180618 18:33]:
> >> So code just needs group cleanup on failed probing and fixing the mutex around pinctrl_generic_add_group().
> >> 
> >> I think we need the mutex because a race still can happen when create_pinctrl() is calling pcs_dt_node_to_map()
> >> and pinctrl_generic_add_group() w/o being locked on pinctrl_maps_mutex.
> >> 
> >> The race I suspect is that two drivers are trying to insert the same name and may come
> >> both to the conclusion that it does not yet exist. And both insert into the radix tree.
> >> 
> >> The window of risk is small though... It is in pinctrl_generic_add_group() between calling
> >> pinctrl_generic_group_name_to_selector() and radix_tree_insert() so we probably won't
> >> see it in real hardware tests.
> > 
> > Hmm but that race should be already fixed with mutex held
> > by the pin controller drivers with these fixes? Or am I
> > missing something still?
> 
> Hm. Maybe we refer to a different mutex?

Yes I think that's the case, you're talking about a different
mutex here :)

> I had seen the call sequence
> 
> create_pinctrl()-> pinctrl_dt_to_map() -> pcs_dt_node_to_map() -> pinctrl_generic_add_group()
> 
> w/o any lock inside.
> 
> There is a mutex_lock(&pinctrl_maps_mutex); in create_pinctrl(), but locked after that.
> 
> Or is there a lock outside of create_pinctrl()?
> 
> If I look into the stack dumps, call nesting is
> 
> driver_probe_device() -> pinctrl_bind_pins() -> devm_pinctrl_get() -> create_pinctrl()
> 
> They all do no locking.
> 
> Maybe I am missing something.

Can you please post a patch for that as you already have it
debugged? That's easier to understand than reading a verbal
patch :)

Regards,

Tony
