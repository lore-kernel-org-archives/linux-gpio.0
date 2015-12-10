From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 117/182] pinctrl: spear-plgpio: use gpiochip data pointer
Date: Thu, 10 Dec 2015 07:24:49 +0530
Message-ID: <20151210015449.GA29459@ubuntu>
References: <1449668028-3340-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:35513 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750715AbbLJByx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 20:54:53 -0500
Received: by pacej9 with SMTP id ej9so38977388pac.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 17:54:52 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1449668028-3340-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Viresh Kumar <vireshk@kernel.org>, spear-devel@list.st.com

On 09-12-15, 14:33, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
> 
> Cc: Viresh Kumar <vireshk@kernel.org>
> Cc: spear-devel@list.st.com
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/spear/pinctrl-plgpio.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
