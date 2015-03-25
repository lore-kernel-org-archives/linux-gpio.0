From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: gpio-tb10x: remove incorrect __exit markup
Date: Wed, 25 Mar 2015 16:32:13 +0100
Message-ID: <CACRpkdZ_092Gd62ef1bvp=c5WX3LXTB6W5ZrA260V1Q4Hi3UGg@mail.gmail.com>
References: <20150309180409.GA24645@dtor-ws>
	<CACRpkdaUMDZYmK6t5S7LZcmZw6e-viTd0Z4d2UtXZCvEX9RSWQ@mail.gmail.com>
	<20150318165527.GB11485@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:33685 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754288AbbCYPcO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Mar 2015 11:32:14 -0400
Received: by obcxo2 with SMTP id xo2so22455177obc.0
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2015 08:32:13 -0700 (PDT)
In-Reply-To: <20150318165527.GB11485@dtor-ws>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Mar 18, 2015 at 5:55 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Tue, Mar 17, 2015 at 01:30:15PM +0100, Linus Walleij wrote:
>> On Mon, Mar 9, 2015 at 7:04 PM, Dmitry Torokhov
>> <dmitry.torokhov@gmail.com> wrote:
>>
>> > Even if bus is not hot-pluggable, the devices can be unbound from the
>> > driver via sysfs, so we should not be using __exit annotations on
>> > remove() methods. The only exception is drivers registered with
>> > platform_driver_probe() which specifically disables sysfs bind/unbind
>> > attributes.
>> >
>> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>
>> I prefer to have this fixed by setting
>> .suppress_bind_attrs = true
>> in the struct device_driver .drv portion of the device driver,
>> so the driver cannot be removed from sysfs.
>>
>> So platform_driver_probe() isn't really the only exception,
>> there is a way to do the same supression on ordinary drivers
>> if we know we won't fiddle with them from sysfs.
>
> Yes, you are right, setting suppress_bind_attrs will work too.
>
>>
>> Can you make a patch as per above (alternatively tell me
>> how wrong I am...)
>
> Unfortunately I won't be able to do that as I can't provide
> justification for such change (i.e. I do not know why you want to
> disable unbinding while still keeping the remove() implementation.

You are right, I want a patch deleting the remove() implementation
and setting the .suppress_bind_attrs = true at the same time.

For a bool driver of this type (typically compiled in and probed
at boot) that makes most sense to me.

Well I guess there are a ton of drivers that should be done like
that ... just wanna start somewhere.

Yours,
Linus Walleij
