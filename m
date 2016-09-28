From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] pinctrl: freescale: avoid overwriting pin config when
 freeing GPIO
Date: Wed, 28 Sep 2016 07:30:52 +0530
Message-ID: <20160928020052.GB2551@vireshk-i7>
References: <20160927002650.4316-1-stefan@agner.ch>
 <17317e62-d9bf-4ab3-35b5-f2f9a4dcbedd@mentor.com>
 <960b299c947424598ec26bfcb36fd96b@agner.ch>
 <e72b95e2-353a-d058-4321-dfbdaac2ba1b@mentor.com>
 <671a23a9ccdbdd6594ad89bf496c1490@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:34711 "EHLO
        mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754696AbcI1CA4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2016 22:00:56 -0400
Received: by mail-pa0-f48.google.com with SMTP id gp7so11236447pac.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2016 19:00:56 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <671a23a9ccdbdd6594ad89bf496c1490@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, linus.walleij@linaro.org, shawnguo@kernel.org, aalonso@freescale.com, b38343@freescale.com, ldewangan@nvidia.com, van.freenix@gmail.com, p.zabel@pengutronix.de, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On 27-09-16, 12:34, Stefan Agner wrote:
> Added Viresh Kumar to the discussion, he implemented the I2C recovery
> functions.
> 
> Yes, reordering the pinctrl/gpio_free calls would fix the problem too.
> 
> However, I guess there is no explicit rule to that ("request/free GPIOs
> only when they are muxed as GPIO"), so I think of it that the issue is
> actually in the pinctrl driver.
> 
> On top of that it is not entirely trivial to reorder the calls the way
> i2c_generic_gpio_recovery and i2c_generic_recovery are set up right now.

AFAICT, these routines don't touch the muxing part at all. Perhaps it is done
internally by the GPIO calls. Can you please elaborate the exact change you are
hinting towards here ?

-- 
viresh
