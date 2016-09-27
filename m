From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH] pinctrl: freescale: avoid overwriting pin config when
 freeing GPIO
Date: Tue, 27 Sep 2016 23:28:59 +0300
Message-ID: <0787d95f-4b92-ba86-d5b5-d07eed912ca0@mentor.com>
References: <20160927002650.4316-1-stefan@agner.ch>
 <17317e62-d9bf-4ab3-35b5-f2f9a4dcbedd@mentor.com>
 <960b299c947424598ec26bfcb36fd96b@agner.ch>
 <e72b95e2-353a-d058-4321-dfbdaac2ba1b@mentor.com>
 <671a23a9ccdbdd6594ad89bf496c1490@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:51748 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932747AbcI0U3G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2016 16:29:06 -0400
In-Reply-To: <671a23a9ccdbdd6594ad89bf496c1490@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>, viresh.kumar@linaro.org
Cc: linus.walleij@linaro.org, shawnguo@kernel.org, aalonso@freescale.com, b38343@freescale.com, ldewangan@nvidia.com, van.freenix@gmail.com, p.zabel@pengutronix.de, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On 09/27/2016 10:34 PM, Stefan Agner wrote:
> On 2016-09-27 11:17, Vladimir Zapolskiy wrote:
>> Hi Stefan,
>>
>> On 09/27/2016 07:37 PM, Stefan Agner wrote:
>>> On 2016-09-27 05:12, Vladimir Zapolskiy wrote:
>>>> Hi Stefan,
>>>>
>>>> On 09/27/2016 03:26 AM, Stefan Agner wrote:
>>>>> If a GPIO gets freed after selecting a new pinctrl configuration
>>>>> the driver should not change pinctrl anymore. Otherwise this will
>>>>> likely lead to a unusable pin configuration for > the newly selected
>>>>> pinctrl.
>>>>>
>>>>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>>>>> ---
>>>>> This turned out to be problematic when using the I2C GPIO bus recovery
>>>>> functionality. After muxing back to I2C, the GPIO is being freed, which
>>>>> cased I2C to stop working completely.
>>>>
>>>> IMHO this recent "i.MX I2C GPIO bus recovery" feature is kind of a hack,
>>>> for example I believe it breaks I2C bus driver initialization on i.MX31
>>>> boards, where today there is no pinctrl driver at all.
>>>
>>> This has been addressed by Li Yang's patch, already in the next branch:
>>> https://lkml.org/lkml/2016/9/12/1161
>>
>> Nice to know about it, thank you for the link.
>>
>>>>
>>>> IMHO something like I've partially described in the recent "Requesting as
>>>> a GPIO a pin already used through pinctrl" topic should be done here.
>>>> Could you consider to add another pinctrl-1 group with alternative GPIO
>>>> line mux/config settings to an i2c controller device node and apply it,
>>>> when you need a bus recovery? You may find references how this kind of
>>>> dynamic pinctrl management is done within mmc/sd subsystem.
>>>
>>> I don't quite understand, that is already the case. This is what device
>>> tree looks like to get the I2C recovery functionality:
>>>
>>> &i2c1 {
>>> 	pinctrl-names = "default", "gpio";
>>> 	pinctrl-0 = <&pinctrl_i2c1>;
>>> 	pinctrl-1 = <&pinctrl_i2c1_gpio>;
>>> 	scl-gpios = <&gpio1 6 GPIO_ACTIVE_HIGH>;
>>> 	sda-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
>>> 	status = "okay";
>>> };
>>
>> Great, then why do you experience a problem you've described?
>>
>>>>> After muxing back to I2C, the GPIO is being freed, which cased I2C
>>>>> to stop working completely.
>>
>> Release GPIO firstly, then mux back to I2C, that's the correct sequence
>> and I believe it obsoletes this change.
>>
>
> Added Viresh Kumar to the discussion, he implemented the I2C recovery
> functions.
>
> Yes, reordering the pinctrl/gpio_free calls would fix the problem too.
>
> However, I guess there is no explicit rule to that ("request/free GPIOs
> only when they are muxed as GPIO"), so I think of it that the issue is
> actually in the pinctrl driver.

there is a rule applied to strict type pinctrl controllers (and from
the code I see that Vybrid IOMUXC is a strict type pinctrl, the existense
of the problem under discussion testifies that it is strict also) that
pads shall not be requested by GPIO or another controller, when they are
in use by some controller. In your case you have I2C and GPIO controllers
competing for a pad, please manage the resource correctly, request
should be done only after release.

> On top of that it is not entirely trivial to reorder the calls the way
> i2c_generic_gpio_recovery and i2c_generic_recovery are set up right now.
>

Better to fix it earlier than later.

>>>>
>>>> By the way did I miss a patch, which falls back to mux settings on
>>>> .gpio_disable_free call for non-Vybrid platforms?
>>>
>>> Currently only Vybrid makes use of the .gpio_request_enable... and so
>>> should .gpio_disable_free then.
>>>
>>
>> So, I guess this is a change with a runtime difference for Vybrid only.
>
> That is correct.
>
>>
>> I find that it was initially done wrong that a number of Vybrid specific
>> hooks were added to the shared pinctrl-imx.c, in my opinion it is better
>> to make needed abstractions and move all code around SHARE_MUX_CONF_REG
>> to pinctrl-vf610.c:
>>
>> ./pinctrl-imx.c:216:		if (info->flags & SHARE_MUX_CONF_REG) {
>> ./pinctrl-imx.c:317:	if (!(info->flags & SHARE_MUX_CONF_REG))
>> ./pinctrl-imx.c:357:	if (!(info->flags & SHARE_MUX_CONF_REG))
>> ./pinctrl-imx.c:382:	if (!(info->flags & SHARE_MUX_CONF_REG))
>> ./pinctrl-imx.c:425:	if (info->flags & SHARE_MUX_CONF_REG)
>> ./pinctrl-imx.c:450:		if (info->flags & SHARE_MUX_CONF_REG) {
>> ./pinctrl-imx.c:534:	if (info->flags & SHARE_MUX_CONF_REG)
>> ./pinctrl-imx.c:575:		if (info->flags & SHARE_MUX_CONF_REG) {
>>
>> Nevertheless this is not directly related to the change.
>
> Yeah I was really on the fence there. Despite the same name, the IOMUXC
> on Vybrid is quite a bit different than on i.MX. The problem is it is
> not easily possible to factor out the SoC specific stuff into
> pinctrl-vf610.c I would have basically had to add tons of callbacks or
> re-implement lots of functions in pinctrl-vf610.c. Maybe it would have
> probably been better to basically implement Vybrids IOMUXC as its own
> pinctrl driver.

--
With best wishes,
Vladimir
