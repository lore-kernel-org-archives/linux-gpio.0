From: Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC PATCH] gpiolib: fix oops, if gpio name is NULL
Date: Tue, 17 Nov 2015 13:20:40 +0200
Message-ID: <564B0D88.4000301@mleia.com>
References: <1447245413-32209-1-git-send-email-vz@mleia.com> <35337129.pBjQytIvzF@adelgunde>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mleia.com ([178.79.152.223]:60628 "EHLO mail.mleia.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752162AbbKQLUo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 17 Nov 2015 06:20:44 -0500
In-Reply-To: <35337129.pBjQytIvzF@adelgunde>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

Hi Markus,

On 17.11.2015 11:24, Markus Pargmann wrote:
> Hi,
> 
> On Wednesday 11 November 2015 14:36:53 Vladimir Zapolskiy wrote:
>> Commit c0017ed71966 ("gpio: Introduce gpio descriptor 'name'") causes
>> OOPS on boot on LPC32xx boards:
>>
>>     Unable to handle kernel NULL pointer dereference at virtual address 00000000
>>     CPU: 0 PID: 1 Comm: swapper Not tainted 4.3.0+ #707
>>     Hardware name: LPC32XX SoC (Flattened Device Tree)
>>     task: c381baa0 ti: c381e000 task.ti: c381e000
>>     PC is at strcmp+0x10/0x40
>>     LR is at gpiochip_add+0x3d0/0x4d4
>>     pc : [<>]    lr : [<>]    psr: a0000093
>>     sp : c381fd60  ip : c381fd70  fp : c381fd6c
>>
>>     [snip]
>>
>>     Backtrace:
>>     [<>] (strcmp) from [<>] (gpiochip_add+0x3d0/0x4d4)
>>     [<>] (gpiochip_add) from [<>] (lpc32xx_gpio_probe+0x44/0x60)
>>     [<>] (lpc32xx_gpio_probe) from [<>] (platform_drv_probe+0x40/0x8c)
>>     [<>] (platform_drv_probe) from [<>] (driver_probe_device+0x110/0x294)
>>     [<>] (driver_probe_device) from [<>] (__driver_attach+0x70/0x94)
>>     [<>] (__driver_attach) from [<>] (bus_for_each_dev+0x74/0x98)
>>     [<>] (bus_for_each_dev) from [<>] (driver_attach+0x20/0x28)
>>     [<>] (driver_attach) from [<>] (bus_add_driver+0xd4/0x1f0)
>>     [<>] (bus_add_driver) from [<>] (driver_register+0xa4/0xe8)
>>     [<>] (driver_register) from [<>] (__platform_driver_register+0x38/0x4c)
>>     [<>] (__platform_driver_register) from [<>] (lpc32xx_gpio_driver_init+0x18/0x20)
>>     [<>] (lpc32xx_gpio_driver_init) from [<>] (do_one_initcall+0x108/0x1c8)
>>     [<>] (do_one_initcall) from [<>] (kernel_init_freeable+0x10c/0x1d4)
>>     [<>] (kernel_init_freeable) from [<>] (kernel_init+0x10/0xec)
>>     [<>] (kernel_init) from [<>] (ret_from_fork+0x14/0x24)
>>
>> This is caused by the fact that at the moment some GPIO names are set
>> to NULL, there is a hole in linear representation of one GPI bank, see
>> drivers/gpio/gpio-lpc32xx.c / gpi_p3_names[] for details.
>>
>> The same problem most probably affects also gpio-cs5535.c, see
>> cs5535_gpio_names[].
>>
>> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
>> ---
>> Linus, Markus,
>>
>> I understand that LPC32xx GPIO driver is ugly (hopefully this
>> will be changed in future), but please account this problem.
>>
>> I don't ask for inclusion of this change, because my own analysis is
>> not done completely.
>>
>> Also please review, the same problem probably affects gpio-cs5535.c
>> as well, see cs5535_gpio_names[].
> 
> Thanks for this hint. But I think these patches for gpio_name_to_desc won't get
> mainline any time soon as this depends on the chardev interface and how it will
> look like.
> 

sorry for misunderstanding, what do mean by "these patches"?

I see two options here, one is to fix or revert your c0017ed71966 due to
caused regressions, another one is to update affected GPIO drivers
removing discontinuity in GPIO enumeration inside a bank.

With best wishes,
Vladimir

>>
>>  drivers/gpio/gpiolib.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index a18f00f..2a91f32 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -233,7 +233,7 @@ static struct gpio_desc *gpio_name_to_desc(const char * const name)
>>  		for (i = 0; i != chip->ngpio; ++i) {
>>  			struct gpio_desc *gpio = &chip->desc[i];
>>  
>> -			if (!gpio->name)
>> +			if (!gpio->name || !name)
>>  				continue;
>>  
>>  			if (!strcmp(gpio->name, name)) {
>>
> 
