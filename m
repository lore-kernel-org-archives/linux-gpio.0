From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 0/5] Renesas RZ series pinctrl driver
Date: Thu, 26 Jan 2017 20:56:47 +0100
Message-ID: <CAMuHMdVw=--dc2N=58fOWZo6Kv=APPWzXvN-YO3Do36Er5mP=w@mail.gmail.com>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:33017 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752658AbdAZT4t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2017 14:56:49 -0500
In-Reply-To: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Jacopo,

On Wed, Jan 25, 2017 at 7:09 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
>    after having discussed in great detail the RZ series per-pin PFC hardware
> peculiarities, this is a proposal for a possible pin-based pin controller
> driver for SoC devices of Renesas RZ family.

"RZ" is a bad name, as there are (currently) 3 RZ subfamilies, and they
differ a lot. So it's better to use "RZ/A".
Or perhaps even "RZ/A1", as you never know what's going to happen with "2"...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
