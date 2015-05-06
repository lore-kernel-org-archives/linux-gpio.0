From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: omap: Fix regression for MPUIO interrupts
Date: Wed, 6 May 2015 15:21:10 +0200
Message-ID: <CACRpkdZqSEgaVOV1gCQvCLc1-x7eU3WZwAM2QT2HT21xqCHZ2Q@mail.gmail.com>
References: <1429833257-28188-1-git-send-email-tony@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1429833257-28188-1-git-send-email-tony@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Felipe Balbi <balbi@ti.com>, Javier Martinez Canillas <javier@dowhile0.org>, Grygorii Strashko <grygorii.strashko@linaro.org>, Kevin Hilman <khilman@deeprootsystems.com>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Apr 24, 2015 at 1:54 AM, Tony Lindgren <tony@atomide.com> wrote:

> At some point with all the GPIO clean-up we've broken the
> MPUIO interrupts. Those are just a little bit different from
> the GPIO interrupts, so we can fix it up just by setting
> different irqchip functions for it. And then we can just
> remove all old code trying to do the same.
>
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Felipe Balbi <balbi@ti.com>
> Cc: Javier Martinez Canillas <javier@dowhile0.org>
> Cc: Grygorii Strashko <grygorii.strashko@linaro.org>
> Cc: Kevin Hilman <khilman@deeprootsystems.com>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Santosh Shilimkar <ssantosh@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Patch applied for fixes with the ACKs etc,

Yours,
Linus Walleij
