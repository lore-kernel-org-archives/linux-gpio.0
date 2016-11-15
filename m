From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCHv3 4/6] pinctrl: sh-pfc: r8a7795: Use lookup function for
 bias data
Date: Tue, 15 Nov 2016 10:36:53 +0100
Message-ID: <CAMuHMdU0OLfBdePE731p+41u6M_c_OZT8fXgubKtK3ZphmJCUg@mail.gmail.com>
References: <20161112160429.12524-1-niklas.soderlund+renesas@ragnatech.se>
 <20161112160429.12524-5-niklas.soderlund+renesas@ragnatech.se> <4115979.NYxXNf2aDF@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:38461 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934210AbcKOJgy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2016 04:36:54 -0500
In-Reply-To: <4115979.NYxXNf2aDF@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Nov 13, 2016 at 2:48 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> Except for the bias_info for which I trust your regexp skills,

$ cat ~/.gitconfig
...
[alias]
        wdiff = diff --color-words
        wshow = show --color-words

and "git wshow" shows no mistakes crept into the table.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
