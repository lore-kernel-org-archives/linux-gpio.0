From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] gpio: rcar: Add support for DT IRQ flags
Date: Wed, 02 Jul 2014 16:37:38 +0200
Message-ID: <2822093.Rul4y5g8OD@avalon>
References: <1396349886-26663-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([95.142.166.194]:48871 "EHLO
	perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753928AbaGBOgo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jul 2014 10:36:44 -0400
In-Reply-To: <1396349886-26663-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-sh@vger.kernel.org, Magnus Damm <damm@opensource.se>

Hi Linus,

Could you please pick this patch up for v3.17 ?

On Tuesday 01 April 2014 12:58:06 Laurent Pinchart wrote:
> The gpio-rcar driver has no IRQ domain OF xlate function and thus
> ignores IRQ flags specified in DT. Fix this by using the two-cell xlate
> function.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpio/gpio-rcar.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
> index ca76ce7..c9edcc9 100644
> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -283,6 +283,7 @@ static int gpio_rcar_irq_domain_map(struct irq_domain
> *h, unsigned int irq,
> 
>  static struct irq_domain_ops gpio_rcar_irq_domain_ops = {
>  	.map	= gpio_rcar_irq_domain_map,
> +	.xlate	= irq_domain_xlate_twocell,
>  };
> 
>  struct gpio_rcar_info {

-- 
Regards,

Laurent Pinchart

