From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpio: gpio-rcar: Support S2RAM
Date: Wed, 6 Dec 2017 20:01:52 +0100
Message-ID: <CAMuHMdXRLuXeVmE9UAFGMdKV4gFSNO3kiVkh-q2MYM8spPkF7Q@mail.gmail.com>
References: <1512586115-4698-1-git-send-email-ykaneko0929@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:35203 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752121AbdLFTBy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Dec 2017 14:01:54 -0500
In-Reply-To: <1512586115-4698-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>

Hi Kaneko-san,

On Wed, Dec 6, 2017 at 7:48 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Hien Dang <hien.dang.eb@renesas.com>
>
> This patch adds an implementation that saves and restores the state of
> GPIO configuration on suspend and resume.
>
> Signed-off-by: Hien Dang <hien.dang.eb@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Thanks for your patch!

> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -31,6 +31,16 @@
>  #include <linux/spinlock.h>
>  #include <linux/slab.h>
>
> +struct gpio_rcar_bank_info {
> +       bool iointsel;
> +       bool inoutsel;
> +       bool outdt;
> +       bool active_high_rising_edge;
> +       bool level_trigger;
> +       bool both;
> +       bool intmsk;
> +};

So for each GPIO, you save 7 bools = 7 bytes.

>  struct gpio_rcar_priv {
>         void __iomem *base;
>         spinlock_t lock;
> @@ -41,6 +51,7 @@ struct gpio_rcar_priv {
>         unsigned int irq_parent;
>         bool has_both_edge_trigger;
>         bool needs_clk;
> +       struct gpio_rcar_bank_info bank_info[32];

That's 32 x 7 = 224 bytes in total.

What about just using 7 u32s instead, one for each register to save?
That way you only need 7 x 4 = 28 bytes, and you can probably optimize
the code to just save/restore the whole register at once.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
