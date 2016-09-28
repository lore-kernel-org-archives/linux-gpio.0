From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] pinctrl: freescale: avoid overwriting pin config when
 freeing GPIO
Date: Tue, 27 Sep 2016 20:38:16 -0700
Message-ID: <effa1a4d020a1ec6ea43fd5d4f12b89c@agner.ch>
References: <20160927002650.4316-1-stefan@agner.ch>
 <17317e62-d9bf-4ab3-35b5-f2f9a4dcbedd@mentor.com>
 <960b299c947424598ec26bfcb36fd96b@agner.ch>
 <e72b95e2-353a-d058-4321-dfbdaac2ba1b@mentor.com>
 <671a23a9ccdbdd6594ad89bf496c1490@agner.ch>
 <20160928020052.GB2551@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:42173 "EHLO
        mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750751AbcI1Dnx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2016 23:43:53 -0400
In-Reply-To: <20160928020052.GB2551@vireshk-i7>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, linus.walleij@linaro.org, shawnguo@kernel.org, aalonso@freescale.com, b38343@freescale.com, ldewangan@nvidia.com, van.freenix@gmail.com, p.zabel@pengutronix.de, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On 2016-09-27 19:00, Viresh Kumar wrote:
> On 27-09-16, 12:34, Stefan Agner wrote:
>> Added Viresh Kumar to the discussion, he implemented the I2C recovery
>> functions.
>>
>> Yes, reordering the pinctrl/gpio_free calls would fix the problem too.
>>
>> However, I guess there is no explicit rule to that ("request/free GPIOs
>> only when they are muxed as GPIO"), so I think of it that the issue is
>> actually in the pinctrl driver.
>>
>> On top of that it is not entirely trivial to reorder the calls the way
>> i2c_generic_gpio_recovery and i2c_generic_recovery are set up right now.
> 
> AFAICT, these routines don't touch the muxing part at all. Perhaps it is done
> internally by the GPIO calls. Can you please elaborate the exact change you are
> hinting towards here ?

The i.MX I2C driver touches the pinctrl in its prepare/unprepare
callbacks.

So, on a i.MX or Vybrid, the call chain looks like this:

i2c_generic_gpio_recovery
    -> i2c_get_gpios_for_recovery
       -> gpio_request_one
    -> i2c_generic_recovery
       -> prepare_recovery (i2c_imx_prepare_recovery)
          -> pinctrl_select_state [gpio]
       -> unprepare_recovery (i2c_imx_unprepare_recovery)
          -> pinctrl_select_state [default]
    -> i2c_put_gpios_for_recovery
       -> gpio_free


And for the pinctrl/GPIO driver of Vybrid this is actually a problem
because gpio_free disables the output driver of the pad, and when that
happens after the (I2C) default pinctrl state gets selected the pad is
no longer active.

--
Stefan
