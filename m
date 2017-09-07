From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] gpio: thunderx: select IRQ_DOMAIN_HIERARCHY instead of
 depends on
Date: Thu, 7 Sep 2017 10:03:51 +0900
Message-ID: <CAK7LNAQ9kjUKFL6+Hm+XjQvUDTp6aeeCLQJcgin=Fs446cdQRw@mail.gmail.com>
References: <1504662052-12478-1-git-send-email-yamada.masahiro@socionext.com>
 <32679e9c-7ad7-a632-4842-6e8e8b820d26@caviumnetworks.com> <CAK7LNAQeRZZTrX-aOkJ3u+69ZG3+Tgsm=TbKyNb-aqp9=F3Csw@mail.gmail.com>
 <8cfd9a26-39d9-6c1d-3414-e0f5f3123ced@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:25355 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750944AbdIGBEo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Sep 2017 21:04:44 -0400
In-Reply-To: <8cfd9a26-39d9-6c1d-3414-e0f5f3123ced@caviumnetworks.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: linux-gpio@vger.kernel.org, David Daney <david.daney@cavium.com>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi David,


2017-09-07 2:36 GMT+09:00 David Daney <ddaney@caviumnetworks.com>:
> On 09/05/2017 09:20 PM, Masahiro Yamada wrote:
>>
>> Hi David,
>>
>>
>> 2017-09-06 11:09 GMT+09:00 David Daney <ddaney@caviumnetworks.com>:
>>>
>>> On 09/05/2017 06:40 PM, Masahiro Yamada wrote:
>>>>
>>>>
>>>> IRQ_DOMAIN_HIERARCHY is not user-configurable, but supposed to be
>>>> selected by drivers that need IRQ domain hierarchy support.
>>>>
>>>> GPIO_THUNDERX is the only user of "depends on IRQ_DOMAIN_HIERARCHY".
>>>> This means, we can not enable GPIO_THUNDERX unless other drivers
>>>> select IRQ_DOMAIN_HIERARCHY elsewhere.  This is odd.  Flip the logic.
>>>>
>>>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>>
>>>
>>>
>>> IRQ_DOMAIN_HIERARCHY is set as a result of ARCH_THUNDER (this SoC
>>> hardware),
>>> so it actually works as-is.
>>
>>
>>
>> Right, ARCH_THUNDER does not select it directly,
>> but does it indirectly.  (this is not so clear...)
>>
>> ARCH_THUNDER  -> ARM64 -> ARM_GIC -> IRQ_DOMAIN_HIERARCHY
>>
>>
>>
>>>   That said, this looks like a reasonable
>>> improvement, and will allow the COMPILE_TEST to enable it, so...
>>>
>>> Acked-by: David Daney <david.daney@cavium.com>
>>
>>
>>
>> BTW, I could not understand your intention of
>> (64BIT && COMPILE_TEST)
>>
>
> The driver uses readq()/writeq(), which are not available in some 32BIT
> kernels.  So to ensure that it can build without error we depend on 64BIT as
> a proxy for the availability of readq()/writeq()
>
>


IMHO, drivers code should not depend on CPU architecture too much.


Does the following make sense for your driver?


- split {read,write}q into two transactions of {read,write}l

or

- include <linux/io-64-nonatomic-hi-lo.h> or
          <linux-io-64-nonatomic-lo-hi.h>
   (choose a suitable one for your driver)




-- 
Best Regards
Masahiro Yamada
