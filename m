From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v2] gpio: omap: Give unique labels to each GPIO bank/chip
Date: Fri, 12 Jan 2018 14:43:37 -0600
Message-ID: <10eba220-e357-5ec2-5134-6da84873ef6d@ti.com>
References: <20180102103248.15803-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:10275 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964844AbeALUnk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Jan 2018 15:43:40 -0500
In-Reply-To: <20180102103248.15803-1-linus.walleij@linaro.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, linux-omap@vger.kernel.org



On 01/02/2018 04:32 AM, Linus Walleij wrote:
> As we need to add GPIO lookup tables to the OMAP platforms, we
> need to reference each GPIO chip with a unique label. Use the GPIO
> base to name each chip, "gpio-0-31", "gpio-32-63" etc.
> 
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: Santosh Shilimkar <ssantosh@kernel.org>
> Cc: Kevin Hilman <khilman@kernel.org>
> Cc: linux-omap@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Break out errorpath fix to a separate patch.
> ---
>   drivers/gpio/gpio-omap.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 

Acked-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
regards,
-grygorii
