From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 03/54] gpio: em: Be sure to clamp return value
Date: Tue, 22 Dec 2015 15:54:23 +0100
Message-ID: <CAMuHMdVULhfM1-zhPBRiA8K77nxRDq1MjuyhZPh7CcvF83Huhg@mail.gmail.com>
References: <1450793461-21934-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f170.google.com ([209.85.213.170]:35990 "EHLO
	mail-ig0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753525AbbLVOyY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 09:54:24 -0500
Received: by mail-ig0-f170.google.com with SMTP id ph11so61747566igc.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 06:54:23 -0800 (PST)
In-Reply-To: <1450793461-21934-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <damm@opensource.se>

On Tue, Dec 22, 2015 at 3:11 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret = !!(val) design pattern.
>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Magnus Damm <damm@opensource.se>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
