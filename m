From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: sa1100: remove complex GPIO interface
Date: Tue, 24 Sep 2013 14:21:40 +0200
Message-ID: <CACRpkdZamhbLCw0Uu66qac+4f9Vu7mJiBd_=2AdTcaG4ORi0VA@mail.gmail.com>
References: <1380024219-21790-1-git-send-email-linus.walleij@linaro.org>
	<20130924121340.GC12758@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f50.google.com ([209.85.219.50]:64561 "EHLO
	mail-oa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751297Ab3IXMVl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Sep 2013 08:21:41 -0400
Received: by mail-oa0-f50.google.com with SMTP id j1so1969431oag.23
        for <linux-gpio@vger.kernel.org>; Tue, 24 Sep 2013 05:21:40 -0700 (PDT)
In-Reply-To: <20130924121340.GC12758@n2100.arm.linux.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kristoffer Ericson <kristoffer.ericson@gmail.com>

On Tue, Sep 24, 2013 at 2:13 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Tue, Sep 24, 2013 at 02:03:39PM +0200, Linus Walleij wrote:
>> diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
>> index 8ea3b33..5c94a53 100644
>> --- a/drivers/gpio/gpio-sa1100.c
>> +++ b/drivers/gpio/gpio-sa1100.c
>> @@ -10,7 +10,7 @@
>>  #include <linux/gpio.h>
>>  #include <linux/init.h>
>>  #include <linux/module.h>
>> -
>> +#include <asm/io.h>
>
> How many more times does it need to be said...  I've been saying the same
> thing for near on five years now and still this happens...

Argh I see it, sorry... will repost.

Yours,
Linus Walleij
