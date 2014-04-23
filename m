From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/6] gpio: rcar: Add minimal runtime PM support
Date: Wed, 23 Apr 2014 09:03:16 +0200
Message-ID: <CACRpkdbfKmpykqZGj64QzZ-FAq+vXC5DbhOiL=iDvbt6U8U8yw@mail.gmail.com>
References: <1397500397-12607-1-git-send-email-geert@linux-m68k.org>
	<1397500397-12607-3-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f51.google.com ([209.85.219.51]:54168 "EHLO
	mail-oa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756206AbaDWHDR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Apr 2014 03:03:17 -0400
Received: by mail-oa0-f51.google.com with SMTP id i4so575168oah.24
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2014 00:03:16 -0700 (PDT)
In-Reply-To: <1397500397-12607-3-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Apr 14, 2014 at 8:33 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> From: Geert Uytterhoeven <geert+renesas@glider.be>
>
> This is just enough to automatically enable the functional clock, if
> present. Clock management during suspend/resume is still to be added.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: linux-gpio@vger.kernel.org
> ---
> v2:
>   - Use pm_runtime_put() instead of pm_runtime_put_sync()

This v2 version applied with Laurent's ACK. I guess you wanted it
applied to the GPIO tree, I don't see the other patches.

Yours,
Linus Walleij
