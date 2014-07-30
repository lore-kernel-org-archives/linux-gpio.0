From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: Re: [PATCH 1/2][v5] gpiolib: allow simultaneous setting of multiple GPIO outputs
Date: Wed, 30 Jul 2014 11:12:30 +0200
Message-ID: <5291550.Rzt9KR357U@pcimr>
References: <25983307.ZjJOfz2Kpg@pcimr> <3862339.n8jYhAjBf6@pcimr> <CACRpkdY0Dm9RFx61KR2CZ4YGfr8cZRg2rtq_jWpmkqoHZSUB=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:54244 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751848AbaG3JMe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Jul 2014 05:12:34 -0400
In-Reply-To: <CACRpkdY0Dm9RFx61KR2CZ4YGfr8cZRg2rtq_jWpmkqoHZSUB=Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Gerhard Sittig <gsi@denx.de>, Wolfram Sang <wsa@the-dreams.de>

On Wednesday 09 July 2014 12:17:13 Linus Walleij wrote:
> On Mon, Jul 7, 2014 at 6:12 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> > On Monday 07 July 2014 17:23:34 Linus Walleij wrote:
> >> On Mon, Jun 16, 2014 at 3:51 PM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> >>
> >> > Introduce new functions gpiod_set_array & gpiod_set_raw_array to the consumer
> >> > interface which allow setting multiple outputs with just one function call.
> >> > Also add an optional set_multiple function to the driver interface. Without an
> >> > implementation of that function in the chip driver outputs are set
> >> > sequentially.
> >>
> >> Yes this looks good.
> >>
> >> Except for one thing I mentioned quite early  I think:
> >>
> >> no users!
> >
> > I'm pretty sure you did _not_ mention this before.
> 
> I'm not referring to your patch set specifically. The idea of array handling
> has been proposed something like three times, I cannot tell these discussion
> threads apart in my head.
> 
> But it's a reasonable request don't you think?
> 

The request might be reasonable.

But after taking a look at the i2c-gpio and spi-gpio drivers, I do not think they
would benefit from the new feature. In both cases there are only two GPIO lines.
And they have to be set separately at least half of the time.

I could not find any other in-kernel driver that might benefit from the new feature, either.

So I guess you are right: There are no users for this.

For my use-case the feature is very beneficial, but of course only in combination
with an out-of-kernel driver module for configuring the FPGA on my custom board.
I posted the patch because I expected similar use-cases to exist for other people
out there. If you think that's not the case, there is nothing I can do about it.

   Rojhalat

