From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] pinctrl: freescale: avoid overwriting pin config when
 freeing GPIO
Date: Thu, 29 Sep 2016 09:33:53 -0700
Message-ID: <1478f2c1989ab735b0f86d2fe579f94f@agner.ch>
References: <20160927002650.4316-1-stefan@agner.ch>
 <17317e62-d9bf-4ab3-35b5-f2f9a4dcbedd@mentor.com>
 <960b299c947424598ec26bfcb36fd96b@agner.ch>
 <e72b95e2-353a-d058-4321-dfbdaac2ba1b@mentor.com>
 <671a23a9ccdbdd6594ad89bf496c1490@agner.ch>
 <20160928020052.GB2551@vireshk-i7>
 <effa1a4d020a1ec6ea43fd5d4f12b89c@agner.ch>
 <20160928041451.GC2551@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:54246 "EHLO
        mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932469AbcI2Qjc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Sep 2016 12:39:32 -0400
In-Reply-To: <20160928041451.GC2551@vireshk-i7>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, linus.walleij@linaro.org, shawnguo@kernel.org, aalonso@freescale.com, b38343@freescale.com, ldewangan@nvidia.com, van.freenix@gmail.com, p.zabel@pengutronix.de, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On 2016-09-27 21:14, Viresh Kumar wrote:
> On 27-09-16, 20:38, Stefan Agner wrote:
>> The i.MX I2C driver touches the pinctrl in its prepare/unprepare
>> callbacks.
>>
>> So, on a i.MX or Vybrid, the call chain looks like this:
>>
>> i2c_generic_gpio_recovery
>>     -> i2c_get_gpios_for_recovery
>>        -> gpio_request_one
>>     -> i2c_generic_recovery
>>        -> prepare_recovery (i2c_imx_prepare_recovery)
>>           -> pinctrl_select_state [gpio]
> 
> Why is this done here? And not in gpio_request_one?
> 

You need to differentiate between Vybrid and i.MX:

Vybrid muxes a pin to GPIO on gpio_request_one (via .gpio_request_enable
callback)
i.MX does not mux a pin as GPIO on its own, but needs to be muxed
explicitly. That has been always the case...

I don't know what behavior is right, it is just "different"...

In Vybrid I did it that way because I knew that was the behavior of
another SoC I worked on (namely a Tegra)... And I had to touch the
pinctrl register anyway (using gpio_set_direction, to set the
direction).


I guess in the end it boils down to one question: Is the GPIO and
pinctrl API ment to be orthogonal? If so, then we probably should select
the GPIO via pinctrl in the i.MX I2C driver but mux the pin in
gpio_request_one similar as we do it on Vybrid... But that would be
rather invasive change...

@Shawn, Linus Walleij, others, what is your take on that?



>>        -> unprepare_recovery (i2c_imx_unprepare_recovery)
>>           -> pinctrl_select_state [default]
>>     -> i2c_put_gpios_for_recovery
>>        -> gpio_free

Currently free does not restore the last pinmux, so if the API's are
meant to be completely orthogonal we need to store the pinmux in
gpio_request_one so we can restore it in gpio_free.

--
Stefan
