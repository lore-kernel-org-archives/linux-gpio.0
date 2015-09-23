From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v3 3/9] gpiolib: Use GPIO name from names array for gpio
 descriptor
Date: Wed, 23 Sep 2015 15:02:37 -0700
Message-ID: <20150923220237.GC19608@localhost>
References: <1439561466-14350-1-git-send-email-mpa@pengutronix.de>
 <1439561466-14350-4-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:34061 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753500AbbIWWBk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2015 18:01:40 -0400
Received: by padhy16 with SMTP id hy16so51881551pad.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2015 15:01:39 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1439561466-14350-4-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de

On Fri, Aug 14, 2015 at 04:11:00PM +0200, Markus Pargmann wrote:
> This patch adds GPIO names to the GPIO descriptors when initializing the
> gpiochip. It also introduces a check whether any of the new names will
> conflict with an existing GPIO name.

And this is why we should not do this. I've said it it before: we need
to consider dynamic buses, not just static device trees.

We have USB and Greybus that will soon be exposing gpiochips and their
line-names can not be globally unique.

Before figuring out what a sane userspace interface should look like we
should not make ABI changes that we need to support indefinitely. The
legacy sysfs interface should instead be frozen.

Exposing a name attribute for a not-necessarily globally unique name
could perhaps be ok, but by enforcing uniqueness at this point we will
then need to come up with another mechanism for naming gpios on dynamic
buses (while maintaining this one indefinitely in parallel).

Linus, please consider dropping these changes for now.

Thanks,
Johan
