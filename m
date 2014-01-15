From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pxa: fix bug when get gpio value
Date: Wed, 15 Jan 2014 08:55:35 +0100
Message-ID: <CACRpkdZxHPEHqPA5WQzfS722q7f0cVbJAOvd9xK-rKZKaEk6mg@mail.gmail.com>
References: <1389259557-1731-1-git-send-email-zhangwm@marvell.com>
	<20140109104604.GT20094@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:51013 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750856AbaAOHzf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2014 02:55:35 -0500
Received: by mail-oa0-f52.google.com with SMTP id o6so824683oag.11
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2014 23:55:35 -0800 (PST)
In-Reply-To: <20140109104604.GT20094@book.gsilab.sittig.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gerhard Sittig <gsi@denx.de>
Cc: Neil Zhang <zhangwm@marvell.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jan 9, 2014 at 11:46 AM, Gerhard Sittig <gsi@denx.de> wrote:

> Here is why I'm asking:  Is there a need from GPIO get_value()
> routines to return normalized values,

That totally depends.

All drivers calling gpio[d]_get_value() will be returned the
value directly from the driver without any clamping to [0,1] in
gpiolib. These are 496 occurences in the kernel, you'd have
to check them all to see if they expect this or not.

Hm. Maybe we should clamp it in gpiolib...

> and if so should not more
> drivers receive an update?

Probably. But on my part I want that more as a code
readability and maintenance hygiene thing, it gives a clear
sign that the driver author think about details.

(Possibly it gives the compiler a chance to optimize stuff
also, I don't quite know that.)

> If the GPIO subsystem's API wants to guarantee values of 0 and 1
> (which I think it doesn't), then I feel the adjustment should be
> done in the gpio_get_value() routines (in all its public
> variants, or a common routine which all of them pass through),
> and certainly not in individual chip drivers.

One does not exclude the other.

Yours,
Linus Walleij
