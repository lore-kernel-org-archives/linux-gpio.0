From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 08/14] pinctrl: sh-pfc: r8a7796: Fix MSIOF3_{SS1,SS2}_E
 pins function definitions
Date: Thu, 13 Jul 2017 11:39:09 +0200
Message-ID: <CAMuHMdVb9Gxc0OJqg8p=x0NyBMQV=SsuicmbobcumL58MrSQ2A@mail.gmail.com>
References: <1499878547-3452-1-git-send-email-ykaneko0929@gmail.com> <1499878547-3452-9-git-send-email-ykaneko0929@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:34560 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750854AbdGMJjL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Jul 2017 05:39:11 -0400
In-Reply-To: <1499878547-3452-9-git-send-email-ykaneko0929@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>

On Wed, Jul 12, 2017 at 6:55 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch fixes the implementation incorrect of IPSR register value
> definitions for MSIOF3_{SS1,SS2}_E pins function.
>
> This is a correction to the incorrect implementation of IPSR register
> pin assignment for R8A7796 SoC specification of R-Car Gen3 Hardware
> User's Manual Rev.0.51E or later.
>
> Fixes: f9aece7344bd ("pinctrl: sh-pfc: Initial R8A7796 PFC support")
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Identical to "[PATCH 3/5] pinctrl: sh-pfc: r8a7796: Fix MSIOF3_{SS1,SS2}_E pin
 function definitions" I sent yesterday.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
