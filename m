From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: Add PWM support
Date: Mon, 26 Jun 2017 10:25:27 +0200
Message-ID: <CAMuHMdWXnYMMatb5Uhz=i8n6yA3W=jNBqrbiez=CgDOstbCTBg@mail.gmail.com>
References: <20170624101854.27655-1-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:33356 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751389AbdFZIZ3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jun 2017 04:25:29 -0400
In-Reply-To: <20170624101854.27655-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>

On Sat, Jun 24, 2017 at 12:18 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Add pinctrl support for the PWM[0-6] pins.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. queuing in sh-pfc-for-v4.13.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
