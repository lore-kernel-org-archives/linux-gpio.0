From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH] pinctrl: nsp-gpio: fix non-static functions
Date: Tue, 7 Jun 2016 10:00:57 -0700
Message-ID: <ae0144a6-5cf9-1de5-a3af-4534594a9353@broadcom.com>
References: <1465318695-23348-1-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:36277 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161308AbcFGRBJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jun 2016 13:01:09 -0400
Received: by mail-pa0-f53.google.com with SMTP id b5so19025826pas.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jun 2016 10:01:08 -0700 (PDT)
In-Reply-To: <1465318695-23348-1-git-send-email-ben.dooks@codethink.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-kernel@lists.codethink.co.uk
Cc: Linus Walleij <linus.walleij@linaro.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com

Hi Ben,

On 6/7/2016 9:58 AM, Ben Dooks wrote:
> Fixup warnings from functions that are not exported and
> therefore should be marked static. Fixes:
>
> drivers/pinctrl/bcm/pinctrl-nsp-gpio.c:461:5: warning: symbol 'nsp_pin_config_group_get' was not declared. Should it be static?
> drivers/pinctrl/bcm/pinctrl-nsp-gpio.c:467:5: warning: symbol 'nsp_pin_config_group_set' was not declared. Should it be static?
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: Jon Mason <jonmason@broadcom.com>
> Cc: Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: bcm-kernel-feedback-list@broadcom.com
> ---
>  drivers/pinctrl/bcm/pinctrl-nsp-gpio.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
> index a8b37a9..35783db 100644
> --- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
> +++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
> @@ -458,13 +458,15 @@ static int nsp_gpio_get_strength(struct nsp_gpio *chip, unsigned gpio,
>  	return 0;
>  }
>
> -int nsp_pin_config_group_get(struct pinctrl_dev *pctldev, unsigned selector,
> +static int nsp_pin_config_group_get(struct pinctrl_dev *pctldev,
> +				    unsigned selector,
>  			     unsigned long *config)
>  {
>  	return 0;
>  }
>
> -int nsp_pin_config_group_set(struct pinctrl_dev *pctldev, unsigned selector,
> +static int nsp_pin_config_group_set(struct pinctrl_dev *pctldev,
> +				    unsigned selector,
>  			     unsigned long *configs, unsigned num_configs)
>  {
>  	return 0;
>

Looks good!

Thanks,

Acked-by: Ray Jui <ray.jui@broadcom.com>
