From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: omap: Allow building as a loadable module
Date: Wed, 6 May 2015 15:23:48 +0200
Message-ID: <CACRpkdapSYfA=SniQQJs_r=X25sw+XujH7UxouU3=RUXNoqdMg@mail.gmail.com>
References: <1429833382-28532-1-git-send-email-tony@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1429833382-28532-1-git-send-email-tony@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Felipe Balbi <balbi@ti.com>, Javier Martinez Canillas <javier@dowhile0.org>, Grygorii Strashko <grygorii.strashko@linaro.org>, Kevin Hilman <khilman@deeprootsystems.com>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Apr 24, 2015 at 1:56 AM, Tony Lindgren <tony@atomide.com> wrote:

> We currently get all kinds of errors building the omap gpio driver
> as a module starting with:
>
> undefined reference to `omap2_gpio_resume_after_idle'
> undefined reference to `omap2_gpio_prepare_for_idle'
> ...
>
> Let's fix the issue by adding inline functions to the header.
> Note that we can now also remove the two unused functions for
> omap_set_gpio_debounce and omap_set_gpio_debounce_time.
>
> Then doing rmmod on the module produces further warnings
> because of missing exit related functions. Let's add those.
>
> And finally, we can make the Kconfig entry just a tristate
> option that's selected for omaps.
>
> Cc: Felipe Balbi <balbi@ti.com>
> Cc: Javier Martinez Canillas <javier@dowhile0.org>
> Cc: Grygorii Strashko <grygorii.strashko@linaro.org>
> Cc: Kevin Hilman <khilman@deeprootsystems.com>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Santosh Shilimkar <ssantosh@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Patch applied for v4.2.

Yours,
Linus Walleij
