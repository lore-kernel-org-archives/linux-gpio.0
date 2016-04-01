From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpiolib: Defer gpio device setup until after gpiolib initialization
Date: Fri, 1 Apr 2016 10:16:29 +0200
Message-ID: <CACRpkdacra5WnWtH7qyuxix3fGBoa+6WZJCU5vusQoAaJGZrfw@mail.gmail.com>
References: <1459437090-10029-1-git-send-email-linux@roeck-us.net>
	<1459437090-10029-2-git-send-email-linux@roeck-us.net>
	<56FDC0D7.5040101@westnet.com.au>
	<20160401005301.GA17066@roeck-us.net>
	<56FDCFDF.2090107@westnet.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:34127 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753197AbcDAIQa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Apr 2016 04:16:30 -0400
Received: by mail-oi0-f54.google.com with SMTP id o62so95578553oig.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Apr 2016 01:16:30 -0700 (PDT)
In-Reply-To: <56FDCFDF.2090107@westnet.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Greg Ungerer <gregungerer@westnet.com.au>
Cc: Guenter Roeck <linux@roeck-us.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Greg Ungerer <gerg@uclinux.org>

On Fri, Apr 1, 2016 at 3:33 AM, Greg Ungerer <gregungerer@westnet.com.au> wrote:
> On 01/04/16 10:53, Guenter Roeck wrote:

>> Probably coldfire ?
>>
>> arch/m68k/coldfire/gpio.c:
>
> Yes, that is the one.
>
>> static struct bus_type mcfgpio_subsys = {
>>         .name           = "gpio",
>>       .dev_name       = "gpio",
>> };
>>
>> No idea what to do about that. Can that bus be renamed ?
>
> Yeah, it could. But is it even necessary at all now?
>
> I am thinking I could remove the subsys_system_register(&mcfgpio_subsys, NULL)
> call from that coldfire/gpio.c. Doing that certainly cleans up the
> boot. There was nothing much under the old coldfire /sys/gpio other than
> the standard devices/drivers/etc. And the new gpio api ofcourse has all
> that as well.

Please kill it if you can. Or are there userspaces for
coldfire that use this? In that case we need some compatibility
shim for them.

I'm trying to pull all needed functionality into the proper gpiolib
so we can get some order around the place...

Yours,
Linus Walleij
