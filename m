From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH] pinctrl: remove redundant pin < 0 check on unsigned int
Date: Fri, 13 Jan 2017 14:41:50 -0600
Message-ID: <081d1a28-9324-7e61-e667-3bd1bc443a04@ti.com>
References: <20170113132039.19830-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fllnx209.ext.ti.com ([198.47.19.16]:10867 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751013AbdAMUmk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jan 2017 15:42:40 -0500
In-Reply-To: <20170113132039.19830-1-colin.king@canonical.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Colin King <colin.king@canonical.com>, Linus Walleij <linus.walleij@linaro.org>, Lokesh Vutla <lokeshvutla@ti.com>, Tony Lindgren <tony@atomide.com>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On 01/13/2017 07:20 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> pin is an unsigned int and therefore can never be < 0 so
> this check is redudant. Remove the check and the associated
s/redudant/redundant/

> dev_err error message.
>
> Fixes CoverityScan CID#1396438 ("Unsigned compared against 0")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> index 3b86d3d..a345166 100644
> --- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> +++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> @@ -665,12 +665,6 @@ static void ti_iodelay_pin_dbg_show(struct pinctrl_dev *pctldev,
>  	r = iod->reg_data;
>
>  	offset = ti_iodelay_pin_to_offset(iod, pin);
> -	if (pin < 0) {
> -		dev_err(iod->dev, "invalid pin offset for pin%i\n", pin);
> -
> -		return;
> -	}
> -
>  	pd = &iod->pa[pin];
>  	cfg = pd->drv_data;
>
>

Thanks.

just the $subject could probably be "pinctrl: ti-iodelay:..."

Other than these:

Acked-by: Nishanth Menon <nm@ti.com>

-- 
Regards,
Nishanth Menon
