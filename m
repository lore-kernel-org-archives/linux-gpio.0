From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 01/33] gpio: sa1100: fix irq probing for ucb1x00
Date: Thu, 8 Sep 2016 00:25:48 +0200
Message-ID: <CACRpkdbuU4uE-OYNhK4Pk+nwQO2r9BW5m0cM_qGx6KrYTxQVsw@mail.gmail.com>
References: <20160829102328.GA28796@n2100.armlinux.org.uk> <E1beJje-0000lm-Ei@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:33003 "EHLO
        mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750823AbcIGWZt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2016 18:25:49 -0400
Received: by mail-oi0-f46.google.com with SMTP id y2so46776057oie.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Sep 2016 15:25:49 -0700 (PDT)
In-Reply-To: <E1beJje-0000lm-Ei@rmk-PC.armlinux.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-pcmcia@lists.infradead.org, Alexandre Courbot <gnurou@gmail.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>

On Mon, Aug 29, 2016 at 12:24 PM, Russell King
<rmk+kernel@armlinux.org.uk> wrote:

> ucb1x00 has used IRQ probing since it's dawn to find the GPIO interrupt
> that it's connected to.  However, commit 23393d49fb75 ("gpio: kill off
> set_irq_flags usage") broke this by disabling IRQ probing on GPIO
> interrupts.  Fix this.
>
> Fixes: 23393d49fb75 ("gpio: kill off set_irq_flags usage")
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Patch applied per Russell's request. Trying to get this tested
and upstream ASAP.

Yours,
Linus Walleij
