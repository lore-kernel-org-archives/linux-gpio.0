From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [Resend PATCH] gpio/davinci: add interrupt support for GPIOs
 16-31
Date: Thu, 2 Jul 2015 16:03:30 +0530
Message-ID: <5595137A.6010605@ti.com>
References: <1435772480-928-1-git-send-email-vitalya@ti.com> <55950EE7.2040405@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:48018 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752876AbbGBKde (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jul 2015 06:33:34 -0400
In-Reply-To: <55950EE7.2040405@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>, Vitaly Andrianov <vitalya@ti.com>, linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday 02 July 2015 03:43 PM, Grygorii Strashko wrote:
> On 07/01/2015 08:41 PM, Vitaly Andrianov wrote:
>> Interrupts for GPIOs 16 through 31 are enabled by bit 1 in the
>> "binten" register (offset 8). Previous versions of GPIO only
>> used bit 0, which enables GPIO 0-15 interrupts.
> 
> Cc: Sekhar Nori
> 
>>
>> Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
> 
> Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
> 
>> ---
>> I posted this patch on 06/18/15 and didn't get any response.
>> Please, could you review the patch.
>>
>>   drivers/gpio/gpio-davinci.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
>> index c5e05c8..c90629f 100644
>> --- a/drivers/gpio/gpio-davinci.c
>> +++ b/drivers/gpio/gpio-davinci.c
>> @@ -546,6 +546,8 @@ static int davinci_gpio_irq_setup(struct
>> platform_device *pdev)
>>           chips[0].gpio_irq = bank_irq;
>>           chips[0].gpio_unbanked = pdata->gpio_unbanked;
>>           binten = BIT(0);
>> +        if (pdata->gpio_unbanked > 16)
>> +            binten |= BIT(1);

Or

	binten = GENMASK(pdata->gpio_unbanked / 16, 0);

?

Thanks,
Sekhar

