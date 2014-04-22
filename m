From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/6] gpio: rcar: Add optional functional clock to bindings
Date: Tue, 22 Apr 2014 23:34:18 +0200
Message-ID: <CACRpkda=-nViAw7WYjYHVHGwiYgHYKzmk6-nYvm46E5366GMiA@mail.gmail.com>
References: <1397500397-12607-1-git-send-email-geert@linux-m68k.org>
	<1397500397-12607-2-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:33866 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758878AbaDVVeT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Apr 2014 17:34:19 -0400
Received: by mail-ob0-f179.google.com with SMTP id vb8so78917obc.38
        for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2014 14:34:18 -0700 (PDT)
In-Reply-To: <1397500397-12607-2-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Mon, Apr 14, 2014 at 8:33 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> From: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> ---
> v2:
>   - Functional clock is mandatory depending on hardware (thanks, Laurent)

This v2 version applied with Laurent's ACK.

Yours,
Linus Walleij
