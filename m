From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/8] drivers/pinctrl: make sh-pfc/core.c explicitly non-modular
Date: Wed, 9 Mar 2016 10:24:10 +0700
Message-ID: <CACRpkdb67YPaUbHBqQ2=qw9CRV83A4Cf+9v5-idFvKOb60NyhQ@mail.gmail.com>
References: <1456778924-20730-1-git-send-email-paul.gortmaker@windriver.com>
	<1456778924-20730-5-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1456778924-20730-5-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 1, 2016 at 3:48 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig / Makefile currently controlling compilation of this code is:
>
> drivers/pinctrl/sh-pfc/Makefile:obj-$(CONFIG_PINCTRL_SH_PFC)    += sh-pfc.o
> drivers/pinctrl/sh-pfc/Makefile:sh-pfc-objs                     = core.o pinctrl.o
>
> drivers/pinctrl/sh-pfc/Kconfig:config PINCTRL_SH_PFC
> drivers/pinctrl/sh-pfc/Kconfig: def_bool y
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
>
> Since module_init already wasn't being used in this code, the init
> ordering remains unchanged with this commit.
>
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> was (or is now) contained at the top of the file in the comments.
>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied with Laurent's and Geert's ACKs.

Yours,
Linus Walleij
