From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: Re: [PATCH 1/2][v5] gpiolib: allow simultaneous setting of multiple GPIO outputs
Date: Mon, 07 Jul 2014 18:12:32 +0200
Message-ID: <3862339.n8jYhAjBf6@pcimr>
References: <25983307.ZjJOfz2Kpg@pcimr> <CACRpkdYBCHnCRe3sJ5Uf62ZUjZ23wM54nKs6_QwWyswHUsWaEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:42722 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751931AbaGGQMf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jul 2014 12:12:35 -0400
In-Reply-To: <CACRpkdYBCHnCRe3sJ5Uf62ZUjZ23wM54nKs6_QwWyswHUsWaEw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Gerhard Sittig <gsi@denx.de>, Wolfram Sang <wsa@the-dreams.de>

On Monday 07 July 2014 17:23:34 Linus Walleij wrote:
> On Mon, Jun 16, 2014 at 3:51 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> 
> > Introduce new functions gpiod_set_array & gpiod_set_raw_array to the consumer
> > interface which allow setting multiple outputs with just one function call.
> > Also add an optional set_multiple function to the driver interface. Without an
> > implementation of that function in the chip driver outputs are set
> > sequentially.
> 
> Yes this looks good.
> 
> Except for one thing I mentioned quite early  I think:
> 
> no users!
> 

I'm pretty sure you did _not_ mention this before.

> How am I supposed to test this?
> 
> I wanted to see a patch also switching the one in-kernel thing that
> really needs this switched over to using this functionality.
> 
> That means, a patch to drivers/i2c/busses/i2c-gpio.c
> to set scl+sda in one go, for example.
> 
> Or a similar patch to drivers/spi/spi-gpio.c I guess?
> 
> Something that makes sense. As a bonus you get to rewrite
> one of these drivers to use GPIO descriptors ;)
> 
> This is not a hard wall, but I highly suspect that there must be
> some driver using this if you want to implement it, right? And the
> two mentioned drivers will be easy to use to test the feature on
> a lot of platforms.
> 

I'll take a look at those drivers and hopefully come back with an extended
patch set.

   Rojhalat

