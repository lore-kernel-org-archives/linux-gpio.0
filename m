From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: document how to make combined GPIO+irqchip drivers
Date: Fri, 31 Jan 2014 09:15:05 +0100
Message-ID: <CACRpkdbX4gjXU8R6Zpk9VK3cuZEK1Bh1k7PRZSdevVRwN6UcZQ@mail.gmail.com>
References: <1390399390-9414-1-git-send-email-linus.walleij@linaro.org>
	<20140122185131.GP20094@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:52239 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753874AbaAaIPG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Jan 2014 03:15:06 -0500
Received: by mail-ob0-f182.google.com with SMTP id wm4so4685844obc.13
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jan 2014 00:15:06 -0800 (PST)
In-Reply-To: <20140122185131.GP20094@book.gsilab.sittig.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gerhard Sittig <gsi@denx.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>

On Wed, Jan 22, 2014 at 7:51 PM, Gerhard Sittig <gsi@denx.de> wrote:

> ... with a SoC's primary ... (apostroph instead of colon)

OK

> The two paragraphs refer to different routines (gpiod_to_irq()
> and gpio_to_irq()) -- is this intentional?

No :-)

Fixed up both in the commit in my tree, THANKS!

Yours,
Linus Walleij
