From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 4/8] drivers/pinctrl: make sh-pfc/core.c explicitly non-modular
Date: Wed, 2 Mar 2016 12:05:39 +0100
Message-ID: <CAMuHMdWwiZNJ7UavdNJhfee9EhOHM6CybtNgOKkH9nRdqjiqWg@mail.gmail.com>
References: <1456778924-20730-1-git-send-email-paul.gortmaker@windriver.com>
	<1456778924-20730-5-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f194.google.com ([209.85.213.194]:33578 "EHLO
	mail-ig0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751025AbcCBLFk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Mar 2016 06:05:40 -0500
In-Reply-To: <1456778924-20730-5-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Feb 29, 2016 at 9:48 PM, Paul Gortmaker
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

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Linus: Feel free to take this with the other patches from the series.
Or do you prefer I queue it up in sh-pfc-for-v4.7?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
