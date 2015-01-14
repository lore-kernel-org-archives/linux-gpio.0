From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] ARM: sa1100: split irq handling for low GPIOs
Date: Wed, 14 Jan 2015 10:35:29 +0100
Message-ID: <CACRpkdavZdZuYxLW-i4BJM0hFqt73n7AhrSzUynBsuDNj5HKGg@mail.gmail.com>
References: <1419242740-20219-1-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:61569 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753372AbbANJfa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jan 2015 04:35:30 -0500
Received: by mail-ie0-f181.google.com with SMTP id rl12so7774311iec.12
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2015 01:35:29 -0800 (PST)
In-Reply-To: <1419242740-20219-1-git-send-email-dbaryshkov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, Alexandre Courbot <gnurou@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Dec 22, 2014 at 11:05 AM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:

> Low GPIO pins use an interrupt in SC interrupts space. However it's
> possible to handle them as if all the GPIO interrupts are instead tied
> to single GPIO handler, which later decodes GEDR register and
> chain-calls next IRQ handler. So split first 11 interrupts into system
> part (IRQ_GPIO0_SC - IRQ_GPIO10_SC) which work exactly like the rest of
> system controller interrupts and real GPIO interrupts
> (IRQ_GPIO0..IRQ_GPIO10). A single handler sa1100_gpio_handler then
> decodes and calls next handler.
>
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

I applied all 5 patches and tested on the Compaq iPAQ H3600
with some GPIO lines with IRQs and all work as before.

Tested-by: Linus Walleij <linus.walleij@linaro.org>
for all 5 patches.

Yours,
Linus Walleij
