From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH] gpio: thunderx: select IRQ_DOMAIN_HIERARCHY instead of
 depends on
Date: Wed, 6 Sep 2017 18:18:45 -0700
Message-ID: <cdf28d33-03ee-f46f-db3e-de1d8928ea50@caviumnetworks.com>
References: <1504662052-12478-1-git-send-email-yamada.masahiro@socionext.com>
 <32679e9c-7ad7-a632-4842-6e8e8b820d26@caviumnetworks.com>
 <CAK7LNAQeRZZTrX-aOkJ3u+69ZG3+Tgsm=TbKyNb-aqp9=F3Csw@mail.gmail.com>
 <8cfd9a26-39d9-6c1d-3414-e0f5f3123ced@caviumnetworks.com>
 <CAK7LNAQ9kjUKFL6+Hm+XjQvUDTp6aeeCLQJcgin=Fs446cdQRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-by2nam01on0060.outbound.protection.outlook.com ([104.47.34.60]:32999
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751369AbdIGBSv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 Sep 2017 21:18:51 -0400
In-Reply-To: <CAK7LNAQ9kjUKFL6+Hm+XjQvUDTp6aeeCLQJcgin=Fs446cdQRw@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, David Daney <david.daney@cavium.com>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 09/06/2017 06:03 PM, Masahiro Yamada wrote:
> Hi David,
> 
> 
> 2017-09-07 2:36 GMT+09:00 David Daney <ddaney@caviumnetworks.com>:
>> On 09/05/2017 09:20 PM, Masahiro Yamada wrote:
>>>
>>> Hi David,
>>>
>>>
>>> 2017-09-06 11:09 GMT+09:00 David Daney <ddaney@caviumnetworks.com>:
>>>>
>>>> On 09/05/2017 06:40 PM, Masahiro Yamada wrote:
>>>>>
>>>>>
>>>>> IRQ_DOMAIN_HIERARCHY is not user-configurable, but supposed to be
>>>>> selected by drivers that need IRQ domain hierarchy support.
>>>>>
>>>>> GPIO_THUNDERX is the only user of "depends on IRQ_DOMAIN_HIERARCHY".
>>>>> This means, we can not enable GPIO_THUNDERX unless other drivers
>>>>> select IRQ_DOMAIN_HIERARCHY elsewhere.  This is odd.  Flip the logic.
>>>>>
>>>>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>>>
>>>>
>>>>
>>>> IRQ_DOMAIN_HIERARCHY is set as a result of ARCH_THUNDER (this SoC
>>>> hardware),
>>>> so it actually works as-is.
>>>
>>>
>>>
>>> Right, ARCH_THUNDER does not select it directly,
>>> but does it indirectly.  (this is not so clear...)
>>>
>>> ARCH_THUNDER  -> ARM64 -> ARM_GIC -> IRQ_DOMAIN_HIERARCHY
>>>
>>>
>>>
>>>>    That said, this looks like a reasonable
>>>> improvement, and will allow the COMPILE_TEST to enable it, so...
>>>>
>>>> Acked-by: David Daney <david.daney@cavium.com>
>>>
>>>
>>>
>>> BTW, I could not understand your intention of
>>> (64BIT && COMPILE_TEST)
>>>
>>
>> The driver uses readq()/writeq(), which are not available in some 32BIT
>> kernels.  So to ensure that it can build without error we depend on 64BIT as
>> a proxy for the availability of readq()/writeq()
>>
>>
> 
> 
> IMHO, drivers code should not depend on CPU architecture too much.
> 

The CPU and the device are in a SoC (both on the same silicon die), 
there is no way they can be used apart from one another.


> 
> Does the following make sense for your driver?
> 
> 
> - split {read,write}q into two transactions of {read,write}l

No.  The registers must be accessed with 64-bit operations.

We are not going to screw around complicating the driver so that it can 
work on hypothetical non-existent systems.

If we ever put this GPIO hardware unit in a system with a 32-bit CPU, we 
will at that time, and only then, modify it to work with 32-bit operations.

> 
> or
> 
> - include <linux/io-64-nonatomic-hi-lo.h> or
>            <linux-io-64-nonatomic-lo-hi.h>
>     (choose a suitable one for your driver)
> 
> 
> 
> 

