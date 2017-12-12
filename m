From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 2/4] [v2] gpiolib: add bitmask for valid GPIO lines
Date: Tue, 12 Dec 2017 14:16:54 -0600
Message-ID: <80f8ed45-4b74-b132-26c0-ecf6a0c4ccda@codeaurora.org>
References: <1512170904-4749-1-git-send-email-timur@codeaurora.org>
 <1512170904-4749-3-git-send-email-timur@codeaurora.org>
 <1513072725.25007.614.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:54942 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752247AbdLLUQ5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Dec 2017 15:16:57 -0500
In-Reply-To: <1513072725.25007.614.camel@linux.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, thierry.reding@gmail.com, Stephen Boyd <sboyd@codeaurora.org>, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Varadarajan Narayanan <varada@codeaurora.org>, Archit Taneja <architt@codeaurora.org>

On 12/12/2017 03:58 AM, Andy Shevchenko wrote:
> On Fri, 2017-12-01 at 17:28 -0600, Timur Tabi wrote:
>> Add support for specifying that some GPIOs within a range are
>> unavailable.
>> Some systems have a sparse list of GPIOs, where a range of GPIOs is
>> specified (usually 0 to n-1), but some subset within that range is
>> absent or unavailable for whatever reason.
>>
>> To support this, allow drivers to specify a bitmask of GPIOs that
>> are present or absent.  Gpiolib will then block access to those that
>> are absent.
>   
>> -	status = gpiochip_irqchip_init_valid_mask(chip);
>> +	status = gpiochip_init_valid_mask(chip);
>>   	if (status)
>>   		goto err_remove_from_list;
>>   
>> +	status = gpiochip_irqchip_init_valid_mask(chip);
>> +	if (status)
>> +		goto err_remove_valid_mask;
> 
> Yes, this way it looks good!

I've discovered that I can remove all this code.  I don't need a valid 
mask, all I need to do is block the request properly.

>> +static bool gpiochip_available(const struct gpio_chip *gpiochip,
>> +			   unsigned int offset)
>> +{
> 
>> +	pr_info("%s:%u offset=%u\n", __func__, __LINE__, offset);
> 
> Debug leftover?

Fixed, thanks.

> 
>> +
>> +	/* No mask means all valid */
>> +	if (likely(!gpiochip->valid_mask))
>> +		return true;
>> +
>> +	return test_bit(offset, gpiochip->valid_mask);
> 
> Not sure which one is better
>   return test_bit();
> or
>   return !!test_bit();

I've removed this function also.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
