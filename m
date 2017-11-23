From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: Fix to delete A20..A25 pins
 function definitions
Date: Thu, 23 Nov 2017 11:32:12 +0100
Message-ID: <CAMuHMdW5HFaE2jTDZr53kYrHhgZbGLiopnC5npsNdzrS-xq9wg@mail.gmail.com>
References: <1510802208-30703-1-git-send-email-ykaneko0929@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:36088 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751998AbdKWKcO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Nov 2017 05:32:14 -0500
In-Reply-To: <1510802208-30703-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>

On Thu, Nov 16, 2017 at 4:16 AM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch fixes the macro definitions of A20..A25 pins function deleted.
>
> This is a correction because IPSR register specification for R8A7795 ES2.0
> SoC was changed in R-Car Gen3 Hardware User's Manual Rev.0.53E.
>
> Fixes: b205914c8f82 ("pinctrl: sh-pfc: r8a7795: Add support for R-Car H3 ES2.0")
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
