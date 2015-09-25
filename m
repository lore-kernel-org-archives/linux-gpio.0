From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7794: Remove bogus SCIF0 SCK pin data
Date: Fri, 25 Sep 2015 09:06:46 -0700
Message-ID: <CACRpkdZEOnBp7HkmU0XaB2ybxvF5XbKoYkC0UW0KTwcjGzrDtw@mail.gmail.com>
References: <1440611638-16256-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:36643 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752898AbbIYQGq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2015 12:06:46 -0400
Received: by oibi136 with SMTP id i136so60886934oib.3
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2015 09:06:46 -0700 (PDT)
In-Reply-To: <1440611638-16256-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Aug 26, 2015 at 10:53 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> SCIF0 on R-Car E2 does not have an SCK pin.
>
> "SCIF_CLK" is the (H)SCIF baud rate generation clock pin, which is not
> yet supported.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

This goes for the rest of the PFC patches as well, I'll just
glance over it and trust you to pile up the stuff nicely.

Yours,
Linus Walleij
