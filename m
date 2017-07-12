From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] pinctrl: baytrail: Do not call WARN_ON for a firmware bug
Date: Wed, 12 Jul 2017 14:44:14 +0200
Message-ID: <f38c9f73-c2ba-a119-0d4b-ba812ad40682@redhat.com>
References: <20170712123101.26996-1-hdegoede@redhat.com>
 <1499863132.22624.361.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:42506 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751265AbdGLMo1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Jul 2017 08:44:27 -0400
In-Reply-To: <1499863132.22624.361.camel@linux.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

Hi,

On 12-07-17 14:38, Andy Shevchenko wrote:
> On Wed, 2017-07-12 at 14:31 +0200, Hans de Goede wrote:
>> WARN_ON causes a backtrace to get logged which is only useful for
>> kernel bugs. For signalling a firmware bug dev_warn(dev, FW_BUG "...")
>> should be used.
>>
>> This fixes users running userspace software to monitor kernel oopses
>> getting a false positive bug-report every boot because of the wrong
>> use of WARN_ON.
> 
> I'm not against the patch, looks good to me, though can you shed a bit
> of light what is the FW bug you are experiencing?

The bug is the code path which has the WARN_ON triggering, which means
that the ACPI tables / or a driver want to use a pin as gpio and it has
been setup differently (as a special function) by the firmware.

Regards,

Hans



> 
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/pinctrl/intel/pinctrl-baytrail.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c
>> b/drivers/pinctrl/intel/pinctrl-baytrail.c
>> index fa3c5758ac67..0f3a02495aeb 100644
>> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
>> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
>> @@ -981,12 +981,12 @@ static int byt_gpio_request_enable(struct
>> pinctrl_dev *pctl_dev,
>>   	 */
>>   	value = readl(reg) & BYT_PIN_MUX;
>>   	gpio_mux = byt_get_gpio_mux(vg, offset);
>> -	if (WARN_ON(gpio_mux != value)) {
>> +	if (gpio_mux != value) {
>>   		value = readl(reg) & ~BYT_PIN_MUX;
>>   		value |= gpio_mux;
>>   		writel(value, reg);
>>   
>> -		dev_warn(&vg->pdev->dev,
>> +		dev_warn(&vg->pdev->dev, FW_BUG
>>   			 "pin %u forcibly re-configured as GPIO\n",
>> offset);
>>   	}
>>   
> 
