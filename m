From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH] gpio: better lookup method for platform GPIOs
Date: Mon, 2 Dec 2013 19:33:35 +0900
Message-ID: <529C61FF.4020802@nvidia.com>
References: <1385628388-23827-1-git-send-email-acourbot@nvidia.com> <20131129115748.GB3942@xps8300>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:2564 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753071Ab3LBKdj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Dec 2013 05:33:39 -0500
In-Reply-To: <20131129115748.GB3942@xps8300>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rhyland Klein <rklein@nvidia.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 11/29/2013 08:57 PM, Heikki Krogerus wrote:
> Hi,
>
> On Thu, Nov 28, 2013 at 05:46:28PM +0900, Alexandre Courbot wrote:
>> @@ -88,16 +89,20 @@ Note that GPIO_LOOKUP() is just a shortcut to GPIO_LOOKUP_IDX() where idx = 0.
>>
>>   A lookup table can then be defined as follows:
>>
>> -	struct gpiod_lookup gpios_table[] = {
>> -	GPIO_LOOKUP_IDX("gpio.0", 15, "foo.0", "led", 0, GPIO_ACTIVE_HIGH),
>> -	GPIO_LOOKUP_IDX("gpio.0", 16, "foo.0", "led", 1, GPIO_ACTIVE_HIGH),
>> -	GPIO_LOOKUP_IDX("gpio.0", 17, "foo.0", "led", 2, GPIO_ACTIVE_HIGH),
>> -	GPIO_LOOKUP("gpio.0", 1, "foo.0", "power", GPIO_ACTIVE_LOW),
>> -	};
>> +struct gpiod_lookup_table gpios_table = {
>> +	.dev_id = "foo.0",
>> +	.size = 4,
>> +	.table = {
>> +	GPIO_LOOKUP_IDX("gpio.0", 15, "led", 0, GPIO_ACTIVE_HIGH),
>> +	GPIO_LOOKUP_IDX("gpio.0", 16, "led", 1, GPIO_ACTIVE_HIGH),
>> +	GPIO_LOOKUP_IDX("gpio.0", 17, "led", 2, GPIO_ACTIVE_HIGH),
>> +	GPIO_LOOKUP("gpio.0", 1, "power", GPIO_ACTIVE_LOW),
>> +	},
>> +};
>
> Instead of using the size variable, wouldn't it be more clear to
> expect the array to be null terminated?

This is a zero-length array, its entries are not pointers but flattened 
lookup entries. Thus you cannot simply null-terminate it. It would be 
possible to use { NULL } as a terminator, but this would expand into a 
whole gpiod_lookup and is not very pleasant esthetically-speaking. So I 
think the size member is maybe better suited here.
