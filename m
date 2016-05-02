From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpio: make gpiod_to_irq() return negative for NO_IRQ
Date: Mon, 2 May 2016 13:25:00 +0200
Message-ID: <CAMuHMdXawvn8DaMsgb74QqMGeAnw0ZH51MK+ng5Bm9AWe2X40A@mail.gmail.com>
References: <1462187702-7450-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:35686 "EHLO
	mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753569AbcEBLZB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 May 2016 07:25:01 -0400
Received: by mail-io0-f194.google.com with SMTP id u185so25109876iod.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 May 2016 04:25:01 -0700 (PDT)
In-Reply-To: <1462187702-7450-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Mon, May 2, 2016 at 1:15 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> If a translation returns zero, that means NO_IRQ, so we
> should return an error since the function is documented to
> return a negative code on error.
>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
