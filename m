From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] pinctrl: freescale: avoid overwriting pin config when
 freeing GPIO
Date: Wed, 28 Sep 2016 09:44:51 +0530
Message-ID: <20160928041451.GC2551@vireshk-i7>
References: <20160927002650.4316-1-stefan@agner.ch>
 <17317e62-d9bf-4ab3-35b5-f2f9a4dcbedd@mentor.com>
 <960b299c947424598ec26bfcb36fd96b@agner.ch>
 <e72b95e2-353a-d058-4321-dfbdaac2ba1b@mentor.com>
 <671a23a9ccdbdd6594ad89bf496c1490@agner.ch>
 <20160928020052.GB2551@vireshk-i7>
 <effa1a4d020a1ec6ea43fd5d4f12b89c@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f182.google.com ([209.85.192.182]:32983 "EHLO
        mail-pf0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750765AbcI1EO4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Sep 2016 00:14:56 -0400
Received: by mail-pf0-f182.google.com with SMTP id 21so12858883pfy.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2016 21:14:55 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <effa1a4d020a1ec6ea43fd5d4f12b89c@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, linus.walleij@linaro.org, shawnguo@kernel.org, aalonso@freescale.com, b38343@freescale.com, ldewangan@nvidia.com, van.freenix@gmail.com, p.zabel@pengutronix.de, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On 27-09-16, 20:38, Stefan Agner wrote:
> The i.MX I2C driver touches the pinctrl in its prepare/unprepare
> callbacks.
> 
> So, on a i.MX or Vybrid, the call chain looks like this:
> 
> i2c_generic_gpio_recovery
>     -> i2c_get_gpios_for_recovery
>        -> gpio_request_one
>     -> i2c_generic_recovery
>        -> prepare_recovery (i2c_imx_prepare_recovery)
>           -> pinctrl_select_state [gpio]

Why is this done here? And not in gpio_request_one?

>        -> unprepare_recovery (i2c_imx_unprepare_recovery)
>           -> pinctrl_select_state [default]
>     -> i2c_put_gpios_for_recovery
>        -> gpio_free
> 
> 
> And for the pinctrl/GPIO driver of Vybrid this is actually a problem
> because gpio_free disables the output driver of the pad, and when that
> happens after the (I2C) default pinctrl state gets selected the pad is
> no longer active.
> 
> --
> Stefan

-- 
viresh
