From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] pinctrl: freescale: avoid overwriting pin config when
 freeing GPIO
Date: Fri, 30 Sep 2016 07:52:40 +0530
Message-ID: <20160930022240.GE14138@vireshk-i7>
References: <20160927002650.4316-1-stefan@agner.ch>
 <17317e62-d9bf-4ab3-35b5-f2f9a4dcbedd@mentor.com>
 <960b299c947424598ec26bfcb36fd96b@agner.ch>
 <e72b95e2-353a-d058-4321-dfbdaac2ba1b@mentor.com>
 <671a23a9ccdbdd6594ad89bf496c1490@agner.ch>
 <20160928020052.GB2551@vireshk-i7>
 <effa1a4d020a1ec6ea43fd5d4f12b89c@agner.ch>
 <1a113c0f-4ee3-e61a-8927-b5e8b558822c@mentor.com>
 <20160929064605.GB14138@vireshk-i7>
 <77b229dc-3fce-b953-b53b-a94a1fb0e109@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:32963 "EHLO
        mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750850AbcI3CWo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Sep 2016 22:22:44 -0400
Received: by mail-pa0-f50.google.com with SMTP id cd13so30128190pac.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Sep 2016 19:22:44 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <77b229dc-3fce-b953-b53b-a94a1fb0e109@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Stefan Agner <stefan@agner.ch>, shawnguo@kernel.org, aalonso@freescale.com, b38343@freescale.com, ldewangan@nvidia.com, van.freenix@gmail.com, p.zabel@pengutronix.de, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On 29-09-16, 15:16, Vladimir Zapolskiy wrote:
> If you look at the top I agree that this solution may be only one platform
> specific, but it fixes the broken driver of i.MX I2C bus controller.

Yeah, I saw that..

> Why do you get an impression that it looks like a hack?

Because we have to reorder things to make it work on a platform. This may break
things on other platforms and we don't know about it yet.

> Why pinctrl_select_state() is not done in gpio_request_one()? Because
> the first function gets pin mux/config setting and the second does not.
> How do you intend to get pin mux/config setting in gpio_request_one()?

Lets see what Linus has to say on this..

> Anyway I don't see any problems in pinctrl or gpio subsystems, the bugs
> must be addressed and fixed in i2c.

I think it can be a gpio driver specific thing as well and not really subsystem
level one.

-- 
viresh
