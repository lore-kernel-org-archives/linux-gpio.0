From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 0/4] use BIT() macro instead manually shifting bits
Date: Sun, 27 Apr 2014 20:16:40 +0900
Message-ID: <CAAVeFuKxzOAQ_Yo16EHLvVaJDPg+A-+GGpjLFb7ETW7aFKiHCA@mail.gmail.com>
References: <1398556850-27751-1-git-send-email-javier@dowhile0.org>
 <CAAVeFu+-XiOGu4Bpm_Naa+GDd4t8xiMwKGQxzpgCKCdmtjOMyA@mail.gmail.com> <CABxcv==uty8xiVp6AF-43dZCrFNY3_0ZenrLb50RML2DMFGEdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f177.google.com ([209.85.128.177]:40949 "EHLO
	mail-ve0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752488AbaD0LRD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Apr 2014 07:17:03 -0400
Received: by mail-ve0-f177.google.com with SMTP id sa20so6671574veb.36
        for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2014 04:17:02 -0700 (PDT)
In-Reply-To: <CABxcv==uty8xiVp6AF-43dZCrFNY3_0ZenrLb50RML2DMFGEdA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Apr 27, 2014 at 7:46 PM, Javier Martinez Canillas
<javier@dowhile0.org> wrote:
> Hello Alexandre,
>
> Thanks a lot for your feedback.
>
> On Sun, Apr 27, 2014 at 12:16 PM, Alexandre Courbot <gnurou@gmail.com> wrote:
>> On Sun, Apr 27, 2014 at 9:00 AM, Javier Martinez Canillas
>> <javier@dowhile0.org> wrote:
>>> Hello Linus and Alexandre,
>>>
>>> While learning coccinelle towards doing the big gpio_chip/gpio_chip_ops
>>> split refactoring I wrote this trivial semantic patch that replaces a
>>> manual bit shift by using the BIT macro from <linux/bitops.h>
>>>
>>>     @hasbitops@
>>>     @@
>>>
>>>     #include <linux/bitops.h>
>>>
>>>     @depends on hasbitops@
>>>     expression E;
>>>     @@
>>>
>>>     - 1 << E
>>>     + BIT(E)
>>>
>>>     @depends on hasbitops@
>>>     expression E;
>>>     @@
>>>
>>>     - BIT((E))
>>>     + BIT(E)
>>>
>>> When applying to the drivers/gpio subdirectory I got
>>> the following clean up patches for some GPIO drivers.
>>
>> I personally find "1 << n" easier to read than a macro, but you are
>> right that the macro is less error-prone. Nice use of Coccinelle btw,
>> I should really spend the time to learn it.
>>
>> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>
> Yes I agree that the readability is a matter of personal taste. Do you
> want me to send a v2 with a better wording on the commit message?

No, I think it's good as it is. Nice usage of Coccinelle btw. I really
should spend some time learning how to use it.
