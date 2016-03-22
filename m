From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: menz127: Drop lock field from struct men_z127_gpio
Date: Tue, 22 Mar 2016 14:43:17 +0100
Message-ID: <CACRpkdbg0e4DQbtfcNoBSCXQMZfp6TOe+w30UHMYy9mN6mZP3A@mail.gmail.com>
References: <1457527135.720.1.camel@ingics.com>
	<CACRpkdZNrdn0p-usbpFP4OZXCfLRiPdiMR55uqcBnHJcrO429g@mail.gmail.com>
	<CAFRkauD6pMt-paEHwt653C+iDv78Py52pRjHRAxyVp4XyWoBbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:35820 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758354AbcCVNnS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2016 09:43:18 -0400
Received: by mail-oi0-f45.google.com with SMTP id w20so119568130oia.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2016 06:43:18 -0700 (PDT)
In-Reply-To: <CAFRkauD6pMt-paEHwt653C+iDv78Py52pRjHRAxyVp4XyWoBbA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Andreas Werner <andreas.werner@men.de>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Mar 22, 2016 at 11:53 AM, Axel Lin <axel.lin@ingics.com> wrote:
> 2016-03-22 18:31 GMT+08:00 Linus Walleij <linus.walleij@linaro.org>:
>> On Wed, Mar 9, 2016 at 1:38 PM, Axel Lin <axel.lin@ingics.com> wrote:
>>
>>> Current code uses a uninitialized spin lock.
>>> bgpio_init() already initialized a spin lock, so let's switch to use
>>> &gc->bgpio_lock instead and remove the lock from struct men_z127_gpio.
>>>
>>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
>>
>> Patch applied for the v4.7 cycle. Will not appear in -next until
>> after -rc1.
>
> Is it fine to use uninitialized spinlock?
> If not, this one should be for 4.6.

Ah, I see, moving it to fixes, tagging for stable.

When you find stuff like this, put in Cc: stable@vger.kernel.org
please, then I know immediately what to do with it :)

Yours,
Linus Walleij
