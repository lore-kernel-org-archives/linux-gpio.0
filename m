From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH][V2] pinctrl: ti-iodelay: remove redundant pin < 0 check
 on unsigned int
Date: Sat, 14 Jan 2017 10:48:56 -0600
Message-ID: <d160aa29-1f5f-3aee-e577-1c175fb4be22@ti.com>
References: <20170113210636.5173-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fllnx210.ext.ti.com ([198.47.19.17]:9469 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751389AbdANQtB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 14 Jan 2017 11:49:01 -0500
In-Reply-To: <20170113210636.5173-1-colin.king@canonical.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Colin King <colin.king@canonical.com>, Linus Walleij <linus.walleij@linaro.org>, Lokesh Vutla <lokeshvutla@ti.com>, Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On 01/13/2017 03:06 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> pin is an unsigned int and therefore can never be < 0 so
> this check is redundant. Remove the check and the associated
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

Acked-by: Nishanth Menon <nm@ti.com>

-- 
Regards,
Nishanth Menon
