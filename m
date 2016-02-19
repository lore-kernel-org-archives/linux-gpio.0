From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] input: gpio_keys_polled: Correct check for invalid gpiod
Date: Fri, 19 Feb 2016 11:01:19 +0100
Message-ID: <CAMuHMdULdoKSbZ-YVP-UipKBGQ=x59fgeF1d3REHEP5MrSqdvg@mail.gmail.com>
References: <1455875906-5048-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:36660 "EHLO
	mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1426440AbcBSKBT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Feb 2016 05:01:19 -0500
Received: by mail-io0-f180.google.com with SMTP id l127so103796913iof.3
        for <linux-gpio@vger.kernel.org>; Fri, 19 Feb 2016 02:01:19 -0800 (PST)
In-Reply-To: <1455875906-5048-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Olliver Schinagl <oliver@schinagl.nl>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Feb 19, 2016 at 10:58 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> At this point in gpio_keys_polled_probe(), button->gpiod contains either
> a pointer to a GPIO descriptor or NULL, because:
>   - gpio_keys_polled_get_devtree_pdata() fills in button->gpiod only if
>     devm_get_gpiod_from_child() succeeded,
>   - gpio_to_desc() returns NULL on failure, not an ERR_PTR(),
>   - button->gpiod is untouched if it was NULL, and button->gpio is not
>     valid.
>
> Hence check for NULL only, and return -EINVAL on failure.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Sorry, scratch this, sent to wrong audience.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
