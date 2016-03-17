From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH 1/1] gpio: mcp23s08: Fix clearing of interrupt.
Date: Thu, 17 Mar 2016 09:57:49 +0800
Message-ID: <56EA0F1D.3040508@electromag.com.au>
References: <1458027990-128142-1-git-send-email-preid@electromag.com.au>
 <1458027990-128142-2-git-send-email-preid@electromag.com.au>
 <CACRpkdY5UVdWtFTBkkipbqPOV-zd3jsozgLS90+4X13=Z4W8CQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy1.45ru.net.au ([203.30.46.145]:34364 "EHLO
	anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752619AbcCQB57 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Mar 2016 21:57:59 -0400
In-Reply-To: <CACRpkdY5UVdWtFTBkkipbqPOV-zd3jsozgLS90+4X13=Z4W8CQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

G'day Linus,

On 16/03/2016 8:51 PM, Linus Walleij wrote:
> On Tue, Mar 15, 2016 at 8:46 AM, Phil Reid <preid@electromag.com.au> wrote:
>
>> The mcp23s18 is configurable on clearing the interrupt on either reading
>> INTCAP or GPIO. Since driver reads INTCAP in IRQ and not the GPIO reg need
>> to set control byte for this mode.
>>
>> Signed-off-by: Phil Reid <preid@electromag.com.au>
>
> Patch applied.

Thanks.

>
> Is there some way I could convince you to try to convert this driver
> to use GPIOLIB_IRQCHIP in the same manner as other nested
> GPIO irqchips, e.g. drivers/gpio/gpio-stmpe.c (see commit
> fe44e70db0544e24cd1d00fc594b6e5b0afd333b)?
>

I'll have a look into it.


-- 
Regards
Phil Reid

