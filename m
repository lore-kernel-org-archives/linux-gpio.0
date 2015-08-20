From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: max732x: Add missing dev reference to gpiochip
Date: Thu, 20 Aug 2015 10:23:36 +0200
Message-ID: <CACRpkdboL+oPL-h9s-JEM+iqEKD+LOJKpT_Yf+FpT=9mDOVJEA@mail.gmail.com>
References: <1435687458-4671-1-git-send-email-marex@denx.de>
	<CACRpkdZ_MWwfjExjvW59+dQ=E2rv4c9_MsSsjNwO5M8yM+j9fg@mail.gmail.com>
	<201508142310.58606.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:32781 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751022AbbHTIXh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Aug 2015 04:23:37 -0400
Received: by obbhe7 with SMTP id he7so26213381obb.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2015 01:23:36 -0700 (PDT)
In-Reply-To: <201508142310.58606.marex@denx.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Marek Vasut <marex@denx.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Mans Rullgard <mans@mansr.com>, Olaf Mandel <o.mandel@menlosystems.com>, Semen Protsenko <semen.protsenko@globallogic.com>

On Fri, Aug 14, 2015 at 11:10 PM, Marek Vasut <marex@denx.de> wrote:
> On Thursday, July 16, 2015 at 01:43:13 PM, Linus Walleij wrote:
>> On Tue, Jun 30, 2015 at 8:04 PM, Marek Vasut <marex@denx.de> wrote:
>> > In case the gpiochip doesn't have the .dev field set, as is the case
>> > in here, it is not possible to reference this device in DT as a GPIO
>> > controller. A good example of this problem is that gpio-leds can not
>> > be used when connected to this chip, the gpio-leds driver bails out
>> > with -EPROBE_DEFER.
>> >
>> > Fix this problem by setting the .dev field of the gpio_chip to the
>> > parent i2c device.
>> >
>> > Signed-off-by: Marek Vasut <marex@denx.de>
>> > Cc: Alexandre Courbot <gnurou@gmail.com>
>> > Cc: Linus Walleij <linus.walleij@linaro.org>
>> > Cc: Mans Rullgard <mans@mansr.com>
>> > Cc: Olaf Mandel <o.mandel@menlosystems.com>
>> > Cc: Semen Protsenko <semen.protsenko@globallogic.com>
>>
>> Patch applied for fixes.
>
> Hi,
>
> I don't see this one in -next , did it get lost or something please ?

I have no clue what you're looking at, its
commit 34ab54edbef902f31842b428dce9530f3283847c
In Torvald's tree and will be in v4.2.

Yours,
Linus Walleij
