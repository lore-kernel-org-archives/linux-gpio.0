From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: keep the GPIO line names internal
Date: Thu, 24 Sep 2015 09:47:07 -0700
Message-ID: <CACRpkdaMnKQZ7+aZqwmQaWAvRJEQUPTwe_FTX1Jmj2g2_ZnYFA@mail.gmail.com>
References: <1443050853-24601-1-git-send-email-linus.walleij@linaro.org>
	<20150924074051.GY32203@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:35584 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752805AbbIXQrH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2015 12:47:07 -0400
Received: by obbzf10 with SMTP id zf10so62527425obb.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2015 09:47:07 -0700 (PDT)
In-Reply-To: <20150924074051.GY32203@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>

On Thu, Sep 24, 2015 at 12:40 AM, Markus Pargmann <mpa@pengutronix.de> wrote:
> On Wed, Sep 23, 2015 at 04:27:33PM -0700, Linus Walleij wrote:
>> This refactors the changes to the GPIO line naming mechanism to
>> not have so widespread effects, instead we conclude the patch series
>> by having created a name attribute in the GPIO descriptor, that need
>> not be globally unique, and it will be initialized from the old
>> .names array in struct gpio_chip if it exists, then used in the legacy
>> sysfs code like the array was used previously.
>>
>> The associated changes to name lines from the device tree are
>> controversial and need to stand alone from this. Resulting changes:
>>
>> 1. Remove the export and the header for the gpio_name_to_desc() as so
>> far the only use is inside gpiolib.c. Staticize gpio_name_to_desc()
>> and move it above the only function using it.
>
> It is used in gpiolib-of.c as well. So I think it should be in
> drivers/gpio/gpiolib.h.

It's not, since I only merged patches 1,2,3,4.

So far, all that has changed is that the descriptor has a name property
and this is used by sysfs instead of the gc->names[] array.

Now the addition of setting names from device tree is controversial
and Johan is opposed to it, so we need to discuss more before
applying the rest of the patches, and therefore this patch puts in
a break after the refactorings (which are anyways very nice).

>> 2. Only print a warning if there are two GPIO lines with the same name.
>> The reason is to preserve current behaviour: before the previous
>> changes to the naming mechanism this would not reject probing the
>> driver, instead the error would occur when trying to export the line
>> in sysfs, so restore this behaviour, but print a friendly warning
>> if names collide.
>
> In gpiolib-of.c is the codepath that adds descriptor names from DT. That
> uses a warning currently but does not assign the name.

In later patches. But I do not apply them now. As per above.

Yours,
Linus Walleij
