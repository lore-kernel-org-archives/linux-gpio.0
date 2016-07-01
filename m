From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: Add bias pinconf support
Date: Fri, 1 Jul 2016 09:45:11 +0200
Message-ID: <CAMuHMdVh3E3qf7q0T1A3stVtbgA4m_FBwRz_KFTNE4HpeObG4Q@mail.gmail.com>
References: <1467216364-27235-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:32890 "EHLO
	mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751994AbcGALlG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2016 07:41:06 -0400
In-Reply-To: <1467216364-27235-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Ulrich,

On Wed, Jun 29, 2016 at 6:06 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Implements pull-up and pull-down. On this SoC there is no simple mapping of
> GP pins to bias register bits, so we need a table.

Thanks for your patch!

This covers bias for pins that can be used as a GPIO only, just like the
existing drive strength support, right?

> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
