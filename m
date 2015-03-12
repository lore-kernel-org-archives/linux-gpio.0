From: Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: bcm63xx gpio issue on 3.19
Date: Thu, 12 Mar 2015 13:03:39 +0900
Message-ID: <5501101B.1010708@nvidia.com>
References: <54FDDE00.7030100@freebox.fr> <54FFD15E.3040202@nvidia.com> <5500803A.7080409@freebox.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:18029 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751058AbbCLEEE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2015 00:04:04 -0400
In-Reply-To: <5500803A.7080409@freebox.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nicolas Schichan <nschichan@freebox.fr>, linux-mips@linux-mips.org
Cc: Maxime Bizon <mbizon@freebox.fr>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On 03/12/2015 02:49 AM, Nicolas Schichan wrote:
> On 03/11/2015 06:23 AM, Alexandre Courbot wrote:
>>> Could you please advise on how to fix/workaround that ? (ideally while keeping
>>> the possibility to invoke the gpiolib code from the setup/prom code).
>>
>> The only allocation performed by gpiochip_add() is the array of gpio_descs.
>> Having this array pre-allocated in your early code (maybe by using a static
>> array variable) and passing it to a gpiochip_add_early() function would do the
>> trick.
>>
>> However, it is not that simple since gpio_desc is a private structure which
>> details (including its size) are not visible outside of drivers/gpio.
>>
>> Another solution I could see would be to have a kernel config option that
>> would make gpiolib "pre-allocate" a number of gpio descriptors as a static
>> array for such cases - similar to the global GPIO array, but not as big.
>>
>> Finally, we can also restore the global GPIO array as a config option for the
>> few architectures that need it.
>>
>> Of course, I would prefer a solution based on dynamic allocation - is there a
>> kind a primitive memory allocator that we can use at this early stage of boot?
>> I.e. would alloc_pages() maybe work?
>>
>> How do other subsystems that rely on dynamic allocation for registering their
>> resources handle this? I guess regulator must fall in the same use-case,
>> doesn't it?
>
> Hi Alexandre,
>
> Moving the bcm63xx_gpio_init() call from board_prom_init() to
> bcm63xx_register_devices() (an arch_initcall) is enough to get called when
> kmalloc is working. If code poking GPIOs is invoked earlier by a board code,
> it will have to move in the board_register_devices() function though there
> doesn't seem to any problems with the mainline bcm63xx board code in that regard.
>
> I can produce a patch for that if it is an accepted solution. It has the
> advantage of not requiring changes to the gpiolib code.

If that works for you and doesn't break bcm63xx, then yes that would be 
great. GPIO chips are indeed devices, so moving their registration to 
bcm63xx_register_devices() seems to make sense.

The GPIO subsystem might require more dynamic allocations in the near 
future (including maybe when requesting GPIOs), but hopefully all 
consumers will be safe with that. We'll find a solution for early GPIO 
support if they aren't.
