From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/4] pinctrl: sh-pfc: Update info pointer after
 SoC-specific init
Date: Wed, 22 Mar 2017 14:25:49 +0100
Message-ID: <CAMuHMdUYr8BTLdSLV=_JUJVvtDL0dc0PGq0M98Gf=6NtwdiL_w@mail.gmail.com>
References: <1489425167-22711-1-git-send-email-geert+renesas@glider.be> <1489425167-22711-2-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:33485 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934474AbdCVNZ5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Mar 2017 09:25:57 -0400
In-Reply-To: <1489425167-22711-2-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Mon, Mar 13, 2017 at 6:12 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Update the sh_pfc_soc_info pointer after calling the SoC-specific
> initialization function, as it may have been updated to e.g. handle
> different SoC revisions.  This makes sure the correct subdriver name is
> printed later.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Queued in sh-pfc-for-v4.12 with
Fixes: 0c151062f32c9db8 ("sh-pfc: Add support for SoC-specific initialization")
as this has been reported independently afterwards.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
