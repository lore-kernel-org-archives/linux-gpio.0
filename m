From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/9] pinctrl: sh-pfc: r8a7795: Fix MOD_SEL2 bit26 to 0x0
 when using SCK5_A
Date: Wed, 16 Aug 2017 13:59:04 +0200
Message-ID: <CAMuHMdW7DeRCT+CHF628BcZ5yba1K3akRbUp4qwv+LtnDXXpsQ@mail.gmail.com>
References: <1501242081-3805-1-git-send-email-ykaneko0929@gmail.com> <1501242081-3805-3-git-send-email-ykaneko0929@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:36508 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751287AbdHPL7F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Aug 2017 07:59:05 -0400
In-Reply-To: <1501242081-3805-3-git-send-email-ykaneko0929@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>

On Fri, Jul 28, 2017 at 1:41 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch fixes the implementation incorrect of MOD_SEL2 bit26 value
> when SCK5_A pin function is selected for IPSR16 bit[31:28].
>
> This is a correction to the incorrect implementation of MOD_SEL register
> pin assignment for R8A7795 ES2.0 SoC specification of R-Car Gen3 Hardware
> User's Manual Rev.0.51E or later.
>
> Fixes: 12f5d9a1dc7f ("pinctrl: sh-pfc: r8a7795: Replace for Renesas R8A7795 ES2.0 SoC")

That commit is not in upstream. The proper one is:
Fixes: b205914c8f822ef2 ("pinctrl: sh-pfc: r8a7795: Add support for
R-Car H3 ES2.0")

> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

i.e. will queue in sh-pfc-for-v4.14 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
