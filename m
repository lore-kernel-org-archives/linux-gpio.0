From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2][v5] gpiolib: allow simultaneous setting of multiple
 GPIO outputs
Date: Fri, 29 Aug 2014 07:21:15 +0200
Message-ID: <CACRpkdZnzVqNm8EoKDSt_LsP0bta8FQYnif4ou+ngFyD-4x-YQ@mail.gmail.com>
References: <25983307.ZjJOfz2Kpg@pcimr>
	<CAAVeFuJmHkXOa6d8ZN8LBVK=mM_HA_U0QQ0kqbkcaq11ELCrFQ@mail.gmail.com>
	<20140731071235.GH3407@book.gsilab.sittig.org>
	<12452684.GmmEHEPXzu@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:61713 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751161AbaH2FVQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Aug 2014 01:21:16 -0400
Received: by mail-oi0-f49.google.com with SMTP id g201so1277355oib.36
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2014 22:21:15 -0700 (PDT)
In-Reply-To: <12452684.GmmEHEPXzu@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: Gerhard Sittig <gsi@denx.de>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@the-dreams.de>

On Thu, Jul 31, 2014 at 10:42 AM, Rojhalat Ibrahim <imr@rtschenk.de> wrote:
> On Thursday 31 July 2014 09:12:35 Gerhard Sittig wrote:
>> On Thu, 2014-07-31 at 11:35 +0900, Alexandre Courbot wrote:
>> >
>> > I'd be surprised if at least *one* such driver was not in mainline
>> > though. Had a quick look but could not find anything that would be an
>> > obvious candidate to use these new functions.
>>
>> What about drivers/mtd/nand/gpio.c, the GPIO bitbanged NAND
>> controller driver?  Most of the latch, control, and data lines
>> groups are set at the same time.  It should be a perfect example.
>>
>
> Well, not so perfect, since AFAIUI only a few control signals are managed
> by GPIOs (Chip Enable, Command Latch Enable, Address Latch Enable), but not
> the actual data lines. But granted, at least at one place in the driver three
> lines are set at the same time.
>
> There are a few other drivers which also do that:
> - drivers/tty/serial/serial_mctrl_gpio.c controls multiple modem lines via GPIO
> - drivers/net/phy/mdio-mux-gpio.c a GPIO controlled MDIO bus multiplexer driver
> - drivers/regulator/gpio-regulator.c controls voltage regulators
>
> All of the above do set multiple GPIOs at the same time, but in all cases
> performance does not really matter. Moreover they all seem a bit obscure to me.
>
> Nevertheless, IMHO they are still better candidates for using the new functions
> than the i2c-gpio or spi-gpio drivers.
>
> So, Linus, would a patched version of one of the mentioned drivers qualify as
> a user that would allow you to merge my patch?

I think so. My concern is with code that doesn't get exercised, anywhere.

Yours,
Linus Walleij
