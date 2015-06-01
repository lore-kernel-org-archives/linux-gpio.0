From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pcf857x: Check for irq_set_irq_wake() failures
Date: Mon, 1 Jun 2015 16:56:31 +0200
Message-ID: <CACRpkdZPxBL24V=D_5OwEWSAHgnrwqU-zGG6OebXSB3Q7sYZNw@mail.gmail.com>
References: <1432640042-16650-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:33784 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751503AbbFAO4c (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jun 2015 10:56:32 -0400
Received: by oiww2 with SMTP id w2so103310317oiw.0
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2015 07:56:31 -0700 (PDT)
In-Reply-To: <1432640042-16650-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>

On Tue, May 26, 2015 at 1:34 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> If an interrupt controller doesn't support wake-up configuration,
> irq_set_irq_wake() returns an error code.  Then any subsequent call
> trying to deconfigure wake-up will cause an imbalance, and a warning
> will be printed:
>
>     WARNING: CPU: 1 PID: 1341 at kernel/irq/manage.c:540 irq_set_irq_wake+0x
>     Unbalanced IRQ 26 wake disable
>
> To fix this, refrain from any further parent interrupt controller
> (de)configuration if irq_set_irq_wake() failed.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Argh how hacky. Still I have no better ideas :(

Patch applied.

Yours,
Linus Walleij
