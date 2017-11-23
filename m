From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7796: Rename RTS{0,1,3,4}# pin
 function definitions
Date: Thu, 23 Nov 2017 11:40:34 +0100
Message-ID: <CAMuHMdXYMH3h_FGVv4Ysw0HiTH=2J1w9Unv6bVfTHiCaxwtwgg@mail.gmail.com>
References: <1510844361-24114-1-git-send-email-ykaneko0929@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:33659 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752471AbdKWKkf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Nov 2017 05:40:35 -0500
In-Reply-To: <1510844361-24114-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>

On Thu, Nov 16, 2017 at 3:59 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch renames the pin function macro definitions of the GPSR5 and
> IPSR{0,3,5,6,12} registers value for the RTS{0,1,3,4}# pin.
>
> This is a correction because GPSR and IPSR register specification for
> R8A7796 SoC was changed in R-Car Gen3 Hardware User's Manual Rev.0.54E.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.16.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
