From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] pinctrl: freescale: avoid overwriting pin config when
 freeing GPIO
Date: Tue, 27 Sep 2016 09:37:49 -0700
Message-ID: <960b299c947424598ec26bfcb36fd96b@agner.ch>
References: <20160927002650.4316-1-stefan@agner.ch>
 <17317e62-d9bf-4ab3-35b5-f2f9a4dcbedd@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:55327 "EHLO
        mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935158AbcI0Qnb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2016 12:43:31 -0400
In-Reply-To: <17317e62-d9bf-4ab3-35b5-f2f9a4dcbedd@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: linus.walleij@linaro.org, shawnguo@kernel.org, aalonso@freescale.com, b38343@freescale.com, ldewangan@nvidia.com, van.freenix@gmail.com, p.zabel@pengutronix.de, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On 2016-09-27 05:12, Vladimir Zapolskiy wrote:
> Hi Stefan,
> 
> On 09/27/2016 03:26 AM, Stefan Agner wrote:
>> If a GPIO gets freed after selecting a new pinctrl configuration
>> the driver should not change pinctrl anymore. Otherwise this will
>> likely lead to a unusable pin configuration for > the newly selected
>> pinctrl.
>>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> ---
>> This turned out to be problematic when using the I2C GPIO bus recovery
>>functionality. After muxing back to I2C, the GPIO is being freed, which
>> cased I2C to stop working completely.
> 
> IMHO this recent "i.MX I2C GPIO bus recovery" feature is kind of a hack,
> for example I believe it breaks I2C bus driver initialization on i.MX31
> boards, where today there is no pinctrl driver at all.

This has been addressed by Li Yang's patch, already in the next branch:
https://lkml.org/lkml/2016/9/12/1161

> 
> IMHO something like I've partially described in the recent "Requesting as
> a GPIO a pin already used through pinctrl" topic should be done here.
> Could you consider to add another pinctrl-1 group with alternative GPIO
> line mux/config settings to an i2c controller device node and apply it,
> when you need a bus recovery? You may find references how this kind of
> dynamic pinctrl management is done within mmc/sd subsystem.

I don't quite understand, that is already the case. This is what device
tree looks like to get the I2C recovery functionality:

&i2c1 {
	pinctrl-names = "default", "gpio";
	pinctrl-0 = <&pinctrl_i2c1>;
	pinctrl-1 = <&pinctrl_i2c1_gpio>;
	scl-gpios = <&gpio1 6 GPIO_ACTIVE_HIGH>;
	sda-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
	status = "okay";
};

> 
> By the way did I miss a patch, which falls back to mux settings on
> .gpio_disable_free call for non-Vybrid platforms?

Currently only Vybrid makes use of the .gpio_request_enable... and so
should .gpio_disable_free then.

--
Stefan
