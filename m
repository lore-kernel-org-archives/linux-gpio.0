From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: switch drivers to use new callback
Date: Tue, 18 Mar 2014 10:53:03 +0100
Message-ID: <CACRpkdY3sYvCsJ=L9MqRTsUQKvyBX=RBHUwcqUc_-UjiDCx49A@mail.gmail.com>
References: <1395128912-3370-1-git-send-email-linus.walleij@linaro.org>
	<alpine.DEB.2.02.1403181023090.18573@ionos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:37612 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754359AbaCRJxE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Mar 2014 05:53:04 -0400
Received: by mail-vc0-f174.google.com with SMTP id ld13so6786893vcb.19
        for <linux-gpio@vger.kernel.org>; Tue, 18 Mar 2014 02:53:03 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1403181023090.18573@ionos.tec.linutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>

On Tue, Mar 18, 2014 at 10:34 AM, Thomas Gleixner <tglx@linutronix.de> wrote:

> So you need a per chip function because all chips have their own
> private data struct in irq_chip_data. Sigh.

Yeah that's it basically.

I was trying to think of a way to proceed to push the irqchip
handling into some generic functions in the gpiolib core
as you suggested but haven't come up with a good way yet.

> It'd be nice if we'd have gpio in the data, so you could have a
> generic function which does the right thing.
>
> In principle it'd be simple.
>
>    struct gpio *gpio = irq_data_get_irq_chip_data(data);
>    struct adnp *adnp = container_of(gpio, struct adnp, gpio);
>
> Ditto for all other drivers. But that requires a major overhaul.

But hm, it could save a lot of code in single lines all over
the place still. Let me try this on one driver and see how
this looks. As it seems it can be done in a one-at-a-time
manner it should be doable, just some work.

> I wonder if it'd be worth to add another pointer to irq_data for such
> purposes.

The worrying thing would be that .chip_data can
easily be confused for this pointer so it needs a catchy
name so it's intuitive to see what it is for. But the above solution
is probably more elegant so let's try that first.

Yours,
Linus Walleij
