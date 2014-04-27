From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 0/4] use BIT() macro instead manually shifting bits
Date: Sun, 27 Apr 2014 13:48:21 +0200
Message-ID: <CABxcv=mQmEQmsrEb7OVKC7oia6HKSY2GrnLdF6Kq3OM0uZNY6A@mail.gmail.com>
References: <1398556850-27751-1-git-send-email-javier@dowhile0.org>
	<CAAVeFu+-XiOGu4Bpm_Naa+GDd4t8xiMwKGQxzpgCKCdmtjOMyA@mail.gmail.com>
	<CABxcv==uty8xiVp6AF-43dZCrFNY3_0ZenrLb50RML2DMFGEdA@mail.gmail.com>
	<CAAVeFuKxzOAQ_Yo16EHLvVaJDPg+A-+GGpjLFb7ETW7aFKiHCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:54525 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752145AbaD0LsX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Apr 2014 07:48:23 -0400
Received: by mail-wi0-f172.google.com with SMTP id hi2so4474053wib.17
        for <linux-gpio@vger.kernel.org>; Sun, 27 Apr 2014 04:48:21 -0700 (PDT)
In-Reply-To: <CAAVeFuKxzOAQ_Yo16EHLvVaJDPg+A-+GGpjLFb7ETW7aFKiHCA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Apr 27, 2014 at 1:16 PM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Sun, Apr 27, 2014 at 7:46 PM, Javier Martinez Canillas
> <javier@dowhile0.org> wrote:
>> Hello Alexandre,
>>
>> Thanks a lot for your feedback.
>>
>> On Sun, Apr 27, 2014 at 12:16 PM, Alexandre Courbot <gnurou@gmail.com> wrote:
>>> On Sun, Apr 27, 2014 at 9:00 AM, Javier Martinez Canillas
>>> <javier@dowhile0.org> wrote:
>>>> Hello Linus and Alexandre,
>>>>
>>>> While learning coccinelle towards doing the big gpio_chip/gpio_chip_ops
>>>> split refactoring I wrote this trivial semantic patch that replaces a
>>>> manual bit shift by using the BIT macro from <linux/bitops.h>
>>>>
>>>>     @hasbitops@
>>>>     @@
>>>>
>>>>     #include <linux/bitops.h>
>>>>
>>>>     @depends on hasbitops@
>>>>     expression E;
>>>>     @@
>>>>
>>>>     - 1 << E
>>>>     + BIT(E)
>>>>
>>>>     @depends on hasbitops@
>>>>     expression E;
>>>>     @@
>>>>
>>>>     - BIT((E))
>>>>     + BIT(E)
>>>>
>>>> When applying to the drivers/gpio subdirectory I got
>>>> the following clean up patches for some GPIO drivers.
>>>
>>> I personally find "1 << n" easier to read than a macro, but you are
>>> right that the macro is less error-prone. Nice use of Coccinelle btw,
>>> I should really spend the time to learn it.
>>>
>>> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>>
>> Yes I agree that the readability is a matter of personal taste. Do you
>> want me to send a v2 with a better wording on the commit message?
>
> No, I think it's good as it is. Nice usage of Coccinelle btw. I really
> should spend some time learning how to use it.

Thanks, now that I understand the basics I will try to write the
semantic patch for the struct gpio_chip refactoring. I expect that to
be a little trickier :-)

Best regards,
Javier
