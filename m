From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] added ams AS3722 gpio support
Date: Fri, 16 Aug 2013 20:28:08 +0200
Message-ID: <CACRpkdZLuEnYn35GGk-DJSLE64tHzQnRRw-1YmLsC1kcKc+Lcw@mail.gmail.com>
References: <1376492358-16005-1-git-send-email-florian.lobmaier@ams.com>
	<CACRpkdbMUz3ujrb-QP4d_Mrc7SxKUsNLOF9_qsBphfqp5nF76w@mail.gmail.com>
	<20130816182052.GP30073@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:55958 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754147Ab3HPS2J (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2013 14:28:09 -0400
Received: by mail-ob0-f181.google.com with SMTP id dn14so2344637obc.26
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2013 11:28:08 -0700 (PDT)
In-Reply-To: <20130816182052.GP30073@sirena.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Florian Lobmaier <florian.lobmaier@ams.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>

On Fri, Aug 16, 2013 at 8:20 PM, Mark Brown <broonie@kernel.org> wrote:

>> This is definately to be fixed since it's using a new core MFD
>> driver.
>
> It's common to have inline wrappers for the regmap ops which take the
> device specific struct and fish the regmap pointer out of it.

I had no clue ... hm this is another side effect of not getting the
whole patch set I guess.

>> Please use an irqdomain with the handling in the MFD core
>> instead so the driver get a translated IRQ base per AS3722 IRQ passed,
>> and get rid of this clunkiness.
>
>> For example see how we're handling this in ab8500-core.c
>> and abx500-pinctrl.c
>
> This is actually doing the same thing as the ab8500 doing there - all
> regmap_irq_get_virq() is doing is calling irq_create_mapping() on the
> irqdomain to translate a hwirq into a virq.

Hmmm I've been irritated about the "v" in "virq" because these
interrupt numbers are and have always been Linux interrupt
numbers, that they sometimes, on some systems, for the low
IRQs, correspond to the hardware IRQ numbers is pure pattern
matching and luck.

They are no more "virtual" than any other IRQ numbers in the
kernel. They are all "virtual" in a sense.

Well nevermind that, it's probably just another try at tilting
windmills to get it changed anyway.

Yours,
Linus Walleij
