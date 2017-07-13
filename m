From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 11/14] pinctrl: sh-pfc: r8a7796: Fix to delete
 SATA_DEVSLP_B pins function definitions
Date: Thu, 13 Jul 2017 11:46:11 +0200
Message-ID: <CAMuHMdW5xSMAD+sMRqAChWgTz=Fu374Zs=v0nTXL1TE8BK+QUQ@mail.gmail.com>
References: <1499878547-3452-1-git-send-email-ykaneko0929@gmail.com> <1499878547-3452-12-git-send-email-ykaneko0929@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:35721 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750949AbdGMJqN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Jul 2017 05:46:13 -0400
In-Reply-To: <1499878547-3452-12-git-send-email-ykaneko0929@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>

On Wed, Jul 12, 2017 at 6:55 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch fixes the macro definitions of SATA_DEVSLP_B pins function
> deleted.
>
> This is a correction to the incorrect implementation of IPSR register
> pin assignment for R8A7796 SoC specification of R-Car Gen3 Hardware
> User's Manual Rev.0.51E or later.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

i.e. will queue in sh-pfc-for-v4.14.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
