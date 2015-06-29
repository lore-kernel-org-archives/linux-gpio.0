From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 2/2] gpio: mvebu: kill bogus dependency on GPIO_GENERIC
Date: Mon, 29 Jun 2015 14:25:53 +0200
Message-ID: <55913951.2020401@free-electrons.com>
References: <1434713464-32069-1-git-send-email-yamada.masahiro@socionext.com>	<1434713464-32069-2-git-send-email-yamada.masahiro@socionext.com> <CAK7LNAR_uGLtGYt0ioOwbOA=iAH1dOE4q+TQ2yRuMqf5P242Yg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:46797 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752604AbbF2MZ4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jun 2015 08:25:56 -0400
In-Reply-To: <CAK7LNAR_uGLtGYt0ioOwbOA=iAH1dOE4q+TQ2yRuMqf5P242Yg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Axel Lin <axel.lin@ingics.com>, Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Masahiro,

On 21/06/2015 01:54, Masahiro Yamada wrote:
> Adding more people.
> 
> I'd like them to check if this patch is correct.
> 
> 
> 2015-06-19 20:31 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
>> The driver gpio-mvebu.c does not depend on gpio-generic.c at all.
>> Drop unneeded "select GPIO_GENERIC".
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

This would have come from a wrong copy and paste, because indeed we
have never used the gpio-generic.

Acked-by: Gregory CLEMENT <gregory.clement@free-electrons.com>


Thanks,

Gregory

>> ---
>>
>>  drivers/gpio/Kconfig | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>> index 25c232e..241d441 100644
>> --- a/drivers/gpio/Kconfig
>> +++ b/drivers/gpio/Kconfig
>> @@ -283,7 +283,6 @@ config GPIO_MVEBU
>>         def_bool y
>>         depends on PLAT_ORION
>>         depends on OF
>> -       select GPIO_GENERIC
>>         select GENERIC_IRQ_CHIP
>>
>>  config GPIO_MXC
>> --
>> 1.9.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
>> Please read the FAQ at  http://www.tux.org/lkml/
> 
> 
> 


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
