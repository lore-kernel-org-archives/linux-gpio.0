From: Anders Berg <anders.berg@avagotech.com>
Subject: Re: [PATCH 1/2] gpio: Add driver for AXM55xx SSP chip selects
Date: Fri, 5 Sep 2014 11:05:37 +0200
Message-ID: <CAE0=X_3QO5p26M=FS7joKS3zD6LAM_moFutHNcyE1-CjauL3Rw@mail.gmail.com>
References: <1409576021-24828-1-git-send-email-anders.berg@avagotech.com>
	<1409576021-24828-2-git-send-email-anders.berg@avagotech.com>
	<CACRpkdby4H-fivNn_kG2uL0EjsCGAc+t6OyFi0+VcNGf2Z9NQA@mail.gmail.com>
	<20140904170630.GL29327@sirena.org.uk>
	<CACRpkdZEoBan=Lqr1T-iY41U9NfMA_MCLX3LA=juw7X4pmRvSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from exprod7og127.obsmtp.com ([64.18.2.210]:56947 "EHLO
	exprod7og127.obsmtp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753636AbaIEJFn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Sep 2014 05:05:43 -0400
Received: by mail-vc0-f170.google.com with SMTP id la4so12170951vcb.29
        for <linux-gpio@vger.kernel.org>; Fri, 05 Sep 2014 02:05:37 -0700 (PDT)
In-Reply-To: <CACRpkdZEoBan=Lqr1T-iY41U9NfMA_MCLX3LA=juw7X4pmRvSQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> On Thu, Sep 4, 2014 at 7:06 PM, Mark Brown <broonie@kernel.org> wrote:
>> On Thu, Sep 04, 2014 at 07:04:44PM +0200, Linus Walleij wrote:
>>> I need an ACK from Mark Brown on this before I apply.
>>> The driver seems to do what it should, but I need Mark to
>>> be OK with exporting the CS signals from an SSP/SPI block
>>> to be exposed to Linux as GPIOs.
>>>
>>> (Top-posting and quoting patch verbatim so Mark gets it.)
>>
>> I don't see any sort of reasoning for this?
>
> Maybe there was some earlier, but this is an excellent opportunity
> to repeat it... So Anders: why do you want to do this?
>

Well, the problem with adding this to the spi-pl022 driver (as a
vendor specific extension) is that this IP block unfortunately isn't
distinguishable from the standard ARM PL022 implementation (same
values in the PrimeCell identification registers). That's why I went
down the GPIO path...

/Anders
