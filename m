From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/6] gpio: add a userspace chardev ABI for GPIOs
Date: Thu, 28 Jan 2016 12:13:28 +0100
Message-ID: <CACRpkdbizV=gA35AteaSSkgBogo=7mcgW4=r6D93arYq7RPSOw@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
	<1445502750-22672-4-git-send-email-linus.walleij@linaro.org>
	<20151024003010.GA376@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:33565 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964950AbcA1LN3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2016 06:13:29 -0500
Received: by mail-ob0-f175.google.com with SMTP id is5so32542875obc.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jan 2016 03:13:29 -0800 (PST)
In-Reply-To: <20151024003010.GA376@kroah.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Sat, Oct 24, 2015 at 2:30 AM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Thu, Oct 22, 2015 at 10:32:27AM +0200, Linus Walleij wrote:
>> +/**
>> + * struct gpiochip_info - Information about a certain GPIO chip
>> + * @name: the name of this GPIO chip
>> + * @lines: number of GPIO lines on this chip
>> + */
>> +struct gpiochip_info {
>> +     char name[32];
>
> To be pendantic, s/char/__u8/

Thanks, will fix.

> Otherwise, looks good, but I don't see the read/write protocol here, is
> that in a later patch?

I wanted to get the very basic infrastructure in place first
so we can then add a careful selection of ioctl():s one by
one.

get/set is delicate as I want to be able to handle
reading/switching multiple lines at once from day one as
that reduce context switching nicely, and we also have
.set_multiple() in the driver backend for select chips.

Yours,
Linus Walleij
