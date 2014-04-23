From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] gpio: tc3589x: get rid of static IRQ base
Date: Wed, 23 Apr 2014 14:16:26 +0200
Message-ID: <CACRpkda0RdeVcEks8RGk0r3u3m95dtZw4qT0YM2s=tkYkCi89Q@mail.gmail.com>
References: <1397044139-19306-1-git-send-email-linus.walleij@linaro.org>
	<20140417074742.GD28725@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:57048 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751496AbaDWMQ0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Apr 2014 08:16:26 -0400
Received: by mail-ob0-f178.google.com with SMTP id wn1so920133obc.9
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2014 05:16:26 -0700 (PDT)
In-Reply-To: <20140417074742.GD28725@lee--X1>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Samuel Ortiz <sameo@linux.intel.com>

On Thu, Apr 17, 2014 at 9:47 AM, Lee Jones <lee.jones@linaro.org> wrote:

>> The static IRQ base is not used on any platforms with this chip
>> (only Ux500). Get rid of it forever, and rely on dynamic IRQ
>> descriptor allocation.
>>
>> Cc: Samuel Ortiz <sameo@linux.intel.com>
>> Cc: Lee Jones <lee.jones@linaro.org>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
(...)
> Does this actually compile? Does this patch have a dependency?

It actually does compile and has no direct dependencies.

> I see TC3589x_INT_GPIO(x) being used still:
>
>   include/linux/mfd/tc3589x.h:
>     #define TC3589x_NR_IRQS                TC3589x_INT_GPIO(TC3589x_NR_GPIOS)

It compiles because TC3589x_NR_IRQS is not uses anywhere,
so this macro is never put to the test.

I'll respin with a much bigger deletion rooting out not only the
static IRQ but also the static GPIO numbering.

Yours,
Linus Walleij
