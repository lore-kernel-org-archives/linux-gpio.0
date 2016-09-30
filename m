From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] pinctrl: freescale: avoid overwriting pin config when
 freeing GPIO
Date: Fri, 30 Sep 2016 07:42:08 +0530
Message-ID: <20160930021208.GC14138@vireshk-i7>
References: <20160927002650.4316-1-stefan@agner.ch>
 <17317e62-d9bf-4ab3-35b5-f2f9a4dcbedd@mentor.com>
 <960b299c947424598ec26bfcb36fd96b@agner.ch>
 <e72b95e2-353a-d058-4321-dfbdaac2ba1b@mentor.com>
 <671a23a9ccdbdd6594ad89bf496c1490@agner.ch>
 <20160928020052.GB2551@vireshk-i7>
 <effa1a4d020a1ec6ea43fd5d4f12b89c@agner.ch>
 <20160928041451.GC2551@vireshk-i7>
 <1478f2c1989ab735b0f86d2fe579f94f@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:34684 "EHLO
        mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935235AbcI3CMN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Sep 2016 22:12:13 -0400
Received: by mail-pa0-f53.google.com with SMTP id dw4so19585502pac.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Sep 2016 19:12:13 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1478f2c1989ab735b0f86d2fe579f94f@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, Stefan Agner <stefan@agner.ch>
Cc: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, shawnguo@kernel.org, aalonso@freescale.com, b38343@freescale.com, ldewangan@nvidia.com, van.freenix@gmail.com, p.zabel@pengutronix.de, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On 29-09-16, 09:33, Stefan Agner wrote:
> You need to differentiate between Vybrid and i.MX:
> 
> Vybrid muxes a pin to GPIO on gpio_request_one (via .gpio_request_enable
> callback)
> i.MX does not mux a pin as GPIO on its own, but needs to be muxed
> explicitly. That has been always the case...
> 
> I don't know what behavior is right, it is just "different"...

Hmm, I think What Vybrid and Tegra have done is better, but it would be better
to get inputs from Linus, which you already asked for :)

-- 
viresh
