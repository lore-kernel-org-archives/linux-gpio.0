From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a7790: Remove non existing GPIO pins
Date: Mon, 16 Feb 2015 20:48:51 +0100
Message-ID: <CAMuHMdUMizkzR9dDiHEwvaKBHdT9VNG1FGLvKEaX4PSFzP+6mw@mail.gmail.com>
References: <1424115661-21928-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:33792 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750942AbbBPTsw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Feb 2015 14:48:52 -0500
In-Reply-To: <1424115661-21928-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-sh list <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On Mon, Feb 16, 2015 at 8:41 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> GPIO banks 1 and 2 are missing pins 30 and 31. Remove them.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
