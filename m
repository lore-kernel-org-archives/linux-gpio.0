From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 9/9] pinctrl: sh-pfc: r8a7795: Fix to reserved MOD_SEL2 bit22
Date: Wed, 16 Aug 2017 14:23:48 +0200
Message-ID: <CAMuHMdW=5YE3kuCofgi3r35VVK0N6b7eobzr_9ZzOBPQUDVXCg@mail.gmail.com>
References: <1501242081-3805-1-git-send-email-ykaneko0929@gmail.com> <1501242081-3805-10-git-send-email-ykaneko0929@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:38454 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751584AbdHPMXt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Aug 2017 08:23:49 -0400
In-Reply-To: <1501242081-3805-10-git-send-email-ykaneko0929@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>

On Fri, Jul 28, 2017 at 1:41 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This is a correction because MOD_SEL register specification for R8A7795
> ES2.0 SoC was changed in R-Car Gen3 Hardware User's Manual Rev.0.54E.
>
> Fixes: 12f5d9a1dc7f ("pinctrl: sh-pfc: r8a7795: Replace for Renesas R8A7795 ES2.0 SoC")
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

i.e. will queue in sh-pfc-for-v4.14 with reference corrected.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
