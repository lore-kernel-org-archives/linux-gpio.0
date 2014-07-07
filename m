From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2][v5] gpiolib: allow simultaneous setting of multiple
 GPIO outputs
Date: Mon, 7 Jul 2014 17:23:34 +0200
Message-ID: <CACRpkdYBCHnCRe3sJ5Uf62ZUjZ23wM54nKs6_QwWyswHUsWaEw@mail.gmail.com>
References: <25983307.ZjJOfz2Kpg@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:49066 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751516AbaGGPXf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jul 2014 11:23:35 -0400
Received: by mail-ob0-f174.google.com with SMTP id va2so4821985obc.33
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jul 2014 08:23:34 -0700 (PDT)
In-Reply-To: <25983307.ZjJOfz2Kpg@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Gerhard Sittig <gsi@denx.de>, Wolfram Sang <wsa@the-dreams.de>

On Mon, Jun 16, 2014 at 3:51 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:

> Introduce new functions gpiod_set_array & gpiod_set_raw_array to the consumer
> interface which allow setting multiple outputs with just one function call.
> Also add an optional set_multiple function to the driver interface. Without an
> implementation of that function in the chip driver outputs are set
> sequentially.

Yes this looks good.

Except for one thing I mentioned quite early  I think:

no users!

How am I supposed to test this?

I wanted to see a patch also switching the one in-kernel thing that
really needs this switched over to using this functionality.

That means, a patch to drivers/i2c/busses/i2c-gpio.c
to set scl+sda in one go, for example.

Or a similar patch to drivers/spi/spi-gpio.c I guess?

Something that makes sense. As a bonus you get to rewrite
one of these drivers to use GPIO descriptors ;)

This is not a hard wall, but I highly suspect that there must be
some driver using this if you want to implement it, right? And the
two mentioned drivers will be easy to use to test the feature on
a lot of platforms.

Yours,
Linus Walleij
