From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 134/182] m68k: gpio: switch to gpiochip_add_data()
Date: Wed, 9 Dec 2015 14:59:36 +0100
Message-ID: <CAMuHMdXhcaDfhwOR6Cw+zU+AWFPNftiZ0NtQPS9nssH1YfkC8A@mail.gmail.com>
References: <1449668315-4352-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:34693 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751151AbbLIN7g (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:59:36 -0500
Received: by obciw8 with SMTP id iw8so35745572obc.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:59:36 -0800 (PST)
In-Reply-To: <1449668315-4352-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Greg Ungerer <gerg@uclinux.org>

Hi Linus,

On Wed, Dec 9, 2015 at 2:38 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> We're planning to remove the gpiochip_add() function to swith
> to gpiochip_add_data() with NULL for data argument.

Just wondering, and I don't think this was clarified in the cover letter
(I'm not subscribed to linux-gpio, so I used a web archive): why don't you keep
gpiochip_add() as an inline wrapper around gpiochip_add_data()?
That would avoid conversions like this one.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
