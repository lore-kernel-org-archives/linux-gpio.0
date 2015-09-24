From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/9] gpiolib: Use GPIO name from names array for gpio descriptor
Date: Thu, 24 Sep 2015 14:50:16 -0700
Message-ID: <CACRpkdbUevNvOQta=VDnQh7z8Z6hK4CbskixN+VtRQpwEYboCg@mail.gmail.com>
References: <1439561466-14350-1-git-send-email-mpa@pengutronix.de>
	<1439561466-14350-4-git-send-email-mpa@pengutronix.de>
	<20150923220237.GC19608@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:36537 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753021AbbIXVuR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2015 17:50:17 -0400
Received: by obbmp4 with SMTP id mp4so68973359obb.3
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2015 14:50:16 -0700 (PDT)
In-Reply-To: <20150923220237.GC19608@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Markus Pargmann <mpa@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>

On Wed, Sep 23, 2015 at 3:02 PM, Johan Hovold <johan@kernel.org> wrote:

> Before figuring out what a sane userspace interface should look like we
> should not make ABI changes that we need to support indefinitely. The
> legacy sysfs interface should instead be frozen.
>
> Exposing a name attribute for a not-necessarily globally unique name
> could perhaps be ok, but by enforcing uniqueness at this point we will
> then need to come up with another mechanism for naming gpios on dynamic
> buses (while maintaining this one indefinitely in parallel).
>
> Linus, please consider dropping these changes for now.

I rounded off the series after moving the name attribute to the descriptor
before doing any ABI changes, as it seems we need to discuss this.

This patch concludes that part of the series, sent a separate patch
concluding this first half of the series.

Yours,
Linus Walleij
