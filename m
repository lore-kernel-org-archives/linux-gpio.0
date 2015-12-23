From: Ray Jui <rjui@broadcom.com>
Subject: Re: [PATCH] pinctrl: nsp-gpio: fix type of iterator
Date: Wed, 23 Dec 2015 14:35:57 -0800
Message-ID: <567B21CD.9090900@broadcom.com>
References: <1450867041-729-1-git-send-email-a.hajda@samsung.com>
 <1450867041-729-2-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:46025 "EHLO
	mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934383AbbLWWgA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Dec 2015 17:36:00 -0500
In-Reply-To: <1450867041-729-2-git-send-email-a.hajda@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, "moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:BROADCOM IPROC ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, open list <linux-kernel@vger.kernel.org>, Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>

+ Reddy

On 12/23/2015 2:37 AM, Andrzej Hajda wrote:
> Iterator i declared as unsigned is always non-negative so the
> loop will never end.
>
> The problem has been detected using proposed semantic patch
> scripts/coccinelle/tests/unsigned_lesser_than_zero.cocci [1].
>
> [1]: http://permalink.gmane.org/gmane.linux.kernel/2038576
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>   drivers/pinctrl/bcm/pinctrl-nsp-gpio.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
> index 34648f6..ad5b04c 100644
> --- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
> +++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
> @@ -439,7 +439,8 @@ static int nsp_gpio_set_strength(struct nsp_gpio *chip, unsigned gpio,
>   static int nsp_gpio_get_strength(struct nsp_gpio *chip, unsigned gpio,
>   				 u16 *strength)
>   {
> -	unsigned int i, offset, shift;
> +	unsigned int offset, shift;
> +	int i;
>   	u32 val;
>   	unsigned long flags;
>
>

The fix is a valid fix. And at the same time it exposes other potential 
issues in the driver. I just found the loop used in _set_strength and 
_get_strength is inconsistent:

In _set_strength:

427         for (i = GPIO_DRV_STRENGTH_BITS; i > 0; i--) {

For i to start at GPIO_DRV_STRENGTH_BITS, it seems to be wrong.

428                 val = readl(chip->io_ctrl + offset);
429                 val &= ~BIT(shift);
430                 val |= ((strength >> (i-1)) & 0x1) << shift;
431                 writel(val, chip->io_ctrl + offset);
432                 offset += 4;
433         }

In _get_strength:

451         for (i = (GPIO_DRV_STRENGTH_BITS - 1); i >= 0; i--) {
452                 val = readl(chip->io_ctrl + offset) & BIT(shift);
453                 val >>= shift;
454                 *strength += (val << i);
455                 offset += 4;
456         }

Reddy, could you please review and comment?

Thanks,

Ray


