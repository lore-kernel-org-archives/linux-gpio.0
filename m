From: Axel Lin <axel.lin@ingics.com>
Subject: Re: [PATCH 1/2] gpio: menz127: Drop lock field from struct men_z127_gpio
Date: Tue, 22 Mar 2016 18:53:55 +0800
Message-ID: <CAFRkauD6pMt-paEHwt653C+iDv78Py52pRjHRAxyVp4XyWoBbA@mail.gmail.com>
References: <1457527135.720.1.camel@ingics.com>
	<CACRpkdZNrdn0p-usbpFP4OZXCfLRiPdiMR55uqcBnHJcrO429g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f194.google.com ([209.85.217.194]:35785 "EHLO
	mail-lb0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758905AbcCVKx5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2016 06:53:57 -0400
Received: by mail-lb0-f194.google.com with SMTP id wn5so14018091lbb.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2016 03:53:56 -0700 (PDT)
In-Reply-To: <CACRpkdZNrdn0p-usbpFP4OZXCfLRiPdiMR55uqcBnHJcrO429g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andreas Werner <andreas.werner@men.de>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

2016-03-22 18:31 GMT+08:00 Linus Walleij <linus.walleij@linaro.org>:
> On Wed, Mar 9, 2016 at 1:38 PM, Axel Lin <axel.lin@ingics.com> wrote:
>
>> Current code uses a uninitialized spin lock.
>> bgpio_init() already initialized a spin lock, so let's switch to use
>> &gc->bgpio_lock instead and remove the lock from struct men_z127_gpio.
>>
>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
>
> Patch applied for the v4.7 cycle. Will not appear in -next until
> after -rc1.

Is it fine to use uninitialized spinlock?
If not, this one should be for 4.6.

Regards,
Axel
