From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 1/5] gpio: pl061: use local state for parent IRQ storage
Date: Thu, 1 Dec 2016 13:48:08 +0000
Message-ID: <be5a081a-24d7-ff50-d8c5-01e02e64a5dc@arm.com>
References: <1480068564-9447-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:44436 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756577AbcLANsL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 1 Dec 2016 08:48:11 -0500
In-Reply-To: <1480068564-9447-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org, Baruch Siach <baruch@tkos.co.il>, Sudeep Holla <sudeep.holla@arm.com>, Haojian Zhuang <haojian.zhuang@gmail.com>



On 25/11/16 10:09, Linus Walleij wrote:
> The driver is poking around in the struct gpio_chip internals,
> which is a no-no. Use a variable in the local state container.
>

The entire series looks good to me. I also gave it a spin on my Juno. So,

Acked-by: Sudeep Holla <sudeep.holla@arm.com>
Tested-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep
