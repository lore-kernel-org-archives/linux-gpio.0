From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7796: Add voltage switch operations
 for SDHI
Date: Fri, 9 Sep 2016 10:24:55 +0200
Message-ID: <CAMuHMdUM4B0KQMS127VGTSV8DkDGaUAy_vfK1XK6EnVd5p9DPQ@mail.gmail.com>
References: <1473335853-32102-1-git-send-email-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:35035 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752647AbcIIIY4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Sep 2016 04:24:56 -0400
In-Reply-To: <1473335853-32102-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>

On Thu, Sep 8, 2016 at 1:57 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> This patch supports the {get,set}_io_voltage operations of SDHI.
>
> This operates the POCCTRL0 register on R8A7796 SoC and makes 1.8v/3.3v
> voltage switch.
>
> Based on work by Takeshi Kihara and Wolfram Sang.
>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
