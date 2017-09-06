From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] gpio: thunderx: select IRQ_DOMAIN_HIERARCHY instead of
 depends on
Date: Wed, 6 Sep 2017 13:20:11 +0900
Message-ID: <CAK7LNAQeRZZTrX-aOkJ3u+69ZG3+Tgsm=TbKyNb-aqp9=F3Csw@mail.gmail.com>
References: <1504662052-12478-1-git-send-email-yamada.masahiro@socionext.com> <32679e9c-7ad7-a632-4842-6e8e8b820d26@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:28023 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750786AbdIFEU6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Sep 2017 00:20:58 -0400
In-Reply-To: <32679e9c-7ad7-a632-4842-6e8e8b820d26@caviumnetworks.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: linux-gpio@vger.kernel.org, David Daney <david.daney@cavium.com>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi David,


2017-09-06 11:09 GMT+09:00 David Daney <ddaney@caviumnetworks.com>:
> On 09/05/2017 06:40 PM, Masahiro Yamada wrote:
>>
>> IRQ_DOMAIN_HIERARCHY is not user-configurable, but supposed to be
>> selected by drivers that need IRQ domain hierarchy support.
>>
>> GPIO_THUNDERX is the only user of "depends on IRQ_DOMAIN_HIERARCHY".
>> This means, we can not enable GPIO_THUNDERX unless other drivers
>> select IRQ_DOMAIN_HIERARCHY elsewhere.  This is odd.  Flip the logic.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
>
> IRQ_DOMAIN_HIERARCHY is set as a result of ARCH_THUNDER (this SoC hardware),
> so it actually works as-is.


Right, ARCH_THUNDER does not select it directly,
but does it indirectly.  (this is not so clear...)

ARCH_THUNDER  -> ARM64 -> ARM_GIC -> IRQ_DOMAIN_HIERARCHY



>  That said, this looks like a reasonable
> improvement, and will allow the COMPILE_TEST to enable it, so...
>
> Acked-by: David Daney <david.daney@cavium.com>


BTW, I could not understand your intention of
(64BIT && COMPILE_TEST)

Why can COMPILE_TEST be enabled when 64BIT?


-- 
Best Regards
Masahiro Yamada
