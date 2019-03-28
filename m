From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/3] gpio: Fix gpiochip_add_data_with_key() error path
Date: Thu, 28 Mar 2019 19:20:41 +0100
Message-ID: <CAMuHMdWyG13EXTu6ouk+STJ_b3pAz6cgj7=RDecBRC2aWHzCWA@mail.gmail.com>
References: <20190328131349.18838-1-geert+renesas@glider.be>
 <20190328131349.18838-3-geert+renesas@glider.be> <c7b93076-4016-5413-dc03-0be1965bf498@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c7b93076-4016-5413-dc03-0be1965bf498@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mukesh Ojha <mojha@codeaurora.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Benoit Parrot <bparrot@ti.com>, Laxman Dewangan <ldewangan@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Mukesj,

On Thu, Mar 28, 2019 at 4:31 PM Mukesh Ojha <mojha@codeaurora.org> wrote:
> On 3/28/2019 6:43 PM, Geert Uytterhoeven wrote:
> > The err_remove_chip block is too coarse, and may perform cleanup that
> > must not be done.  E.g. if of_gpiochip_add() fails, of_gpiochip_remove()
> > is still called, causing:
> >
> >      OF: ERROR: Bad of_node_put() on /soc/gpio@e6050000
> >      CPU: 1 PID: 20 Comm: kworker/1:1 Not tainted 5.1.0-rc2-koelsch+ #407
> >      Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
> >      Workqueue: events deferred_probe_work_func
> >      [<c020ec74>] (unwind_backtrace) from [<c020ae58>] (show_stack+0x10/0x14)
> >      [<c020ae58>] (show_stack) from [<c07c1224>] (dump_stack+0x7c/0x9c)
> >      [<c07c1224>] (dump_stack) from [<c07c5a80>] (kobject_put+0x94/0xbc)
> >      [<c07c5a80>] (kobject_put) from [<c0470420>] (gpiochip_add_data_with_key+0x8d8/0xa3c)
> >      [<c0470420>] (gpiochip_add_data_with_key) from [<c0473738>] (gpio_rcar_probe+0x1d4/0x314)
> >      [<c0473738>] (gpio_rcar_probe) from [<c052fca8>] (platform_drv_probe+0x48/0x94)
> >
> > and later, if a GPIO consumer tries to use a GPIO from a failed
> > controller:
> >
> >      WARNING: CPU: 0 PID: 1 at lib/refcount.c:156 kobject_get+0x38/0x4c
> >      refcount_t: increment on 0; use-after-free.
> >      Modules linked in:
> >      CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.1.0-rc2-koelsch+ #407
> >      Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
> >      [<c020ec74>] (unwind_backtrace) from [<c020ae58>] (show_stack+0x10/0x14)
> >      [<c020ae58>] (show_stack) from [<c07c1224>] (dump_stack+0x7c/0x9c)
> >      [<c07c1224>] (dump_stack) from [<c0221580>] (__warn+0xd0/0xec)
> >      [<c0221580>] (__warn) from [<c02215e0>] (warn_slowpath_fmt+0x44/0x6c)
> >      [<c02215e0>] (warn_slowpath_fmt) from [<c07c58fc>] (kobject_get+0x38/0x4c)
> >      [<c07c58fc>] (kobject_get) from [<c068b3ec>] (of_node_get+0x14/0x1c)
> >      [<c068b3ec>] (of_node_get) from [<c0686f24>] (of_find_node_by_phandle+0xc0/0xf0)
> >      [<c0686f24>] (of_find_node_by_phandle) from [<c0686fbc>] (of_phandle_iterator_next+0x68/0x154)
> >      [<c0686fbc>] (of_phandle_iterator_next) from [<c0687fe4>] (__of_parse_phandle_with_args+0x40/0xd0)
> >      [<c0687fe4>] (__of_parse_phandle_with_args) from [<c0688204>] (of_parse_phandle_with_args_map+0x100/0x3ac)
> >      [<c0688204>] (of_parse_phandle_with_args_map) from [<c0471240>] (of_get_named_gpiod_flags+0x38/0x380)
> >      [<c0471240>] (of_get_named_gpiod_flags) from [<c046f864>] (gpiod_get_from_of_node+0x24/0xd8)
> >      [<c046f864>] (gpiod_get_from_of_node) from [<c0470aa4>] (devm_fwnode_get_index_gpiod_from_child+0xa0/0x144)
> >      [<c0470aa4>] (devm_fwnode_get_index_gpiod_from_child) from [<c05f425c>] (gpio_keys_probe+0x418/0x7bc)
> >      [<c05f425c>] (gpio_keys_probe) from [<c052fca8>] (platform_drv_probe+0x48/0x94)
> >
> > Fix this by splitting the cleanup block, and adding a missing call to
> > gpiochip_irqchip_remove().
> >
> > Fixes: 28355f81969962cf ("gpio: defer probe if pinctrl cannot be found")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > I'm not so sure about the need for the call to
> > gpiochip_irqchip_remove(), as add/remove are not really symmetrical.
> > Any comments?
> > ---
> >   drivers/gpio/gpiolib.c | 12 ++++++++----
> >   1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 144af07335815998..ed4da07effe0ac40 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -1379,7 +1379,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
> >
> >       status = gpiochip_add_irqchip(chip, lock_key, request_key);
> >       if (status)
> > -             goto err_remove_chip;
> > +             goto err_free_irqchip_mask;
>
> Name is quite confusing
> this should be
>
> s/err_free_irqchip_mask/err_free_gpiochip_mask

Thanks, makes perfect sense.

> After reviewing back and forth it looks good, apart from the naming.
> Please fix.

Done (locally).

> Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
