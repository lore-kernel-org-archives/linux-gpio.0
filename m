From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/7] misc: ixp4-beeper: switch to use gpiolib
Date: Fri, 13 Sep 2013 10:21:42 +0200
Message-ID: <CACRpkdYOM=q5C0P+3SYwdGFwMe=0yzPSfG0BYT7p61MahAskZw@mail.gmail.com>
References: <1378816210-7977-1-git-send-email-linus.walleij@linaro.org>
	<201309102348.55478.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:50607 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755072Ab3IMIVn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2013 04:21:43 -0400
Received: by mail-oa0-f44.google.com with SMTP id l17so876463oag.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Sep 2013 01:21:42 -0700 (PDT)
In-Reply-To: <201309102348.55478.arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khc@pm.waw.pl>, Alexandre Courbot <acourbot@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Tue, Sep 10, 2013 at 11:48 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tuesday 10 September 2013, Linus Walleij wrote:

>> Arnd/Greg: seeking your ACK to take this through the GPIO tree
>> as part of the attempt at cleaning out custom GPIO implementations.
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Thanks!

>> +     if (count) {
>> +             gpio_direction_output(pin, 0);
>>               *IXP4XX_OSRT2 = (count & ~IXP4XX_OST_RELOAD_MASK) | IXP4XX_OST_ENABLE;
>>       } else {
>
> Too bad we can't just clean up all the open-coded mmio accesses as well. It shouldn't
> be hard, but some platforms are full of them, and there is definitely some regression
> potential.

Yeah :-/

I'm poking the IXP4 people a bit, it seems to have a large hobbyist
following due to all the NSLU2 hackers out there so lets see if someone
picks up the challenge to go and clean up this stuff.

Yours,
Linus Walleij
