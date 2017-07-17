From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: Re: [PATCH] gpio: altera-a10sr: constify gpio_chip structure
Date: Sun, 16 Jul 2017 23:14:31 -0500
Message-ID: <9167407f-ce82-72dc-e2b2-585fb4ea5b67@embeddedor.com>
References: <20170711221538.GA8001@embeddedgus>
 <b9982b12-1836-8623-c4e0-c0f3c82361b0@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gateway31.websitewelcome.com ([192.185.143.52]:41101 "EHLO
        gateway31.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751253AbdGQEOh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 Jul 2017 00:14:37 -0400
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
        by gateway31.websitewelcome.com (Postfix) with ESMTP id DE54D19E389
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jul 2017 23:14:36 -0500 (CDT)
In-Reply-To: <b9982b12-1836-8623-c4e0-c0f3c82361b0@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: thor.thayer@linux.intel.com, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org



On 07/13/2017 12:41 PM, Thor Thayer wrote:
> On 07/11/2017 05:15 PM, Gustavo A. R. Silva wrote:
>> This structure is only used to copy into another structure, so declare
>> it as const.
>
> <snip>
>
>> Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
>> ---
>>   drivers/gpio/gpio-altera-a10sr.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpio-altera-a10sr.c 
>> b/drivers/gpio/gpio-altera-a10sr.c
>> index 16a8951..6b11f13 100644
>> --- a/drivers/gpio/gpio-altera-a10sr.c
>> +++ b/drivers/gpio/gpio-altera-a10sr.c
>> @@ -71,7 +71,7 @@ static int altr_a10sr_gpio_direction_output(struct 
>> gpio_chip *gc,
>>       return -EINVAL;
>>   }
>>   -static struct gpio_chip altr_a10sr_gc = {
>> +static const struct gpio_chip altr_a10sr_gc = {
>>       .label = "altr_a10sr_gpio",
>>       .owner = THIS_MODULE,
>>       .get = altr_a10sr_gpio_get,
>>
> Reviewed-by: Thor Thayer <thor.thayer@linux.intel.com>

Thank you, Thor.

-- 
Gustavo A. R. Silva

