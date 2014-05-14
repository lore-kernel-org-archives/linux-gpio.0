From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: make of_get_named_gpiod_flags() private
Date: Wed, 14 May 2014 11:11:46 +0900
Message-ID: <CAAVeFu+Rh-AtqfvcoVE6tz3PPvvwVZcxM11dxO4zuDXdMyxnrg@mail.gmail.com>
References: <1399175125-6430-1-git-send-email-acourbot@nvidia.com>
 <CACRpkdYM5W2oVT0y25u+BhWHpVma5fRP8MgmEH46dAyu8L8-2g@mail.gmail.com> <CAAVeFuLqF6d+-BHhFzL+w9bFNxbxWV97dsx1Kbd2GD1PNf3UFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f180.google.com ([209.85.128.180]:43918 "EHLO
	mail-ve0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752231AbaENCMI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 13 May 2014 22:12:08 -0400
In-Reply-To: <CAAVeFuLqF6d+-BHhFzL+w9bFNxbxWV97dsx1Kbd2GD1PNf3UFg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 13, 2014 at 10:23 PM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Tue, May 13, 2014 at 10:17 PM, Linus Walleij
> <linus.walleij@linaro.org> wrote:
>> On Sun, May 4, 2014 at 5:45 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:
>>
>>> of_get_named_gpiod_flags() is visible and directly usable by GPIO
>>> consumers, but it really should not as the gpiod interface relies
>>> on the simpler gpiod_get() to provide properly-configured GPIOs.
>>>
>>> of_get_named_gpiod_flags() is just used internally by gpiolib to
>>> implement gpiod_get(), and by the old of_get_named_gpio_flags()
>>> function, therefore it makes sense to make it gpiolib-private.
>>>
>>> As a side-effect, the unused (and unneeded) of_get_gpiod_flags()
>>> inline function is also removed, and of_get_named_gpio_flags() is moved
>>> from a static inline function to a regular one in gpiolib-of.c
>>>
>>> This results in all references to gpiod_* functions in of_gpio.h being
>>> gone, which is the way it should be since this file is part of the old
>>> integer GPIO interface.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>
>> This patch broke a lot of drivers so I had to take it out again...
>
> That's unexpected - what happens with it?

I double-checked the patch and tested it on some ARM boards, couldn't
find anything wrong during compilation and runtime. Would appreciate
some specifics about what broke so I can address the issue.

Thanks,
Alex.
