From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 8/9] pinctrl: sh-pfc: r8a7795: Rename CS1# pin function definitions
Date: Wed, 16 Aug 2017 14:20:50 +0200
Message-ID: <CAMuHMdWhi7Fnikj9eL=zT7G73Vnj3vZc3=+784r+gt++6JrVUA@mail.gmail.com>
References: <1501242081-3805-1-git-send-email-ykaneko0929@gmail.com> <1501242081-3805-9-git-send-email-ykaneko0929@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:33907 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751287AbdHPMUv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Aug 2017 08:20:51 -0400
In-Reply-To: <1501242081-3805-9-git-send-email-ykaneko0929@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>

On Fri, Jul 28, 2017 at 1:41 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch renames the pin function macro definitions of the GPSR1 and
> IPSR4 registers value for the CS1# pin.
>
> This is a correction because GPSR and IPSR register specification for
> R8A7795 ES2.0 SoC was changed in R-Car Gen3 Hardware User's Manual
> Rev.0.54E.
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
