From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a7795: Add drive strength support
Date: Wed, 23 Mar 2016 11:14:04 +0100
Message-ID: <CAMuHMdUbUCe-HWEVQmV+uBonL_w8bW65Wh9ofpTXKxSnbPEB1A@mail.gmail.com>
References: <1458516819-3928-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
	<1458516819-3928-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:36139 "EHLO
	mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754463AbcCWKOF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Mar 2016 06:14:05 -0400
In-Reply-To: <1458516819-3928-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

Hi Laurent,

On Mon, Mar 21, 2016 at 12:33 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Define the drive strength registers for the R8A7795. As the PFC driver
> for the SoC only defines GPIO pins at the moment, limit drive strength
> support to those pins. Pins without GPIO capabilities will be supported
> later.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
