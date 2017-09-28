From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: pinctrl/amd: Configure GPIO register using BIOS settings
Date: Wed, 27 Sep 2017 23:58:16 -0700
Message-ID: <20170928065816.GA28901@dtor-ws>
References: <CY1PR12MB0042D650A9FCDC4B1676FB0EDCFA0@CY1PR12MB0042.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:38076 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751276AbdI1G6T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2017 02:58:19 -0400
Received: by mail-pf0-f194.google.com with SMTP id a7so672004pfj.5
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2017 23:58:19 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CY1PR12MB0042D650A9FCDC4B1676FB0EDCFA0@CY1PR12MB0042.namprd12.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Agrawal, Nitesh-kumar" <Nitesh-kumar.Agrawal@amd.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "Sen, Pankaj" <Pankaj.Sen@amd.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Sep 09, 2016 at 03:18:09PM +0000, Agrawal, Nitesh-kumar wrote:
> In the function amd_gpio_irq_set_type, use the settings provided by
> the BIOS,when the LevelTrig is Edge and activeLevel is HIGH, to configure
> the GPIO registers. Ignore the settings from client.
> 
> Reviewed-by: Pankaj Sen <Pankaj.Sen@amd.com>
> Signed-off-by: Nitesh Kumar Agrawal <Nitesh-kumar.Agrawal@amd.com>

Just found this patch in the tree. Can you please explain why it is
needed (the patch description unfortunately tells what the patch does,
but not why).

I would expect that we either allow reprogramming the trigger as client
wishes or would error out and let the upper layers know. Silently
"fixing" the settings is wrong course of action in my opinion.

If this was trying to work around Elan touchpad drivers not working on
AMD platforms it needs to be solved in Elan driver, not here.

Thanks!

> ---
>  drivers/pinctrl/pinctrl-amd.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> index 828148d..6408dda 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -384,6 +384,8 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  {
>  	int ret = 0;
>  	u32 pin_reg;
> +	bool level_trig;
> +	u32 active_level;
>  	unsigned long flags;
>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>  	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
> @@ -391,6 +393,18 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  	spin_lock_irqsave(&gpio_dev->lock, flags);
>  	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
>  
> +	/*
> +	* Use the settings provided by the BIOS, when the LevelTrig is
> +	* EDGE and the activeLevel is HIGH, ignore the settings coming
> +	* from the client to configure the GPIO register.
> +	*/
> +	level_trig = !(pin_reg & (LEVEL_TRIGGER << LEVEL_TRIG_OFF));
> +	active_level = pin_reg & (ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
> +
> +	if (level_trig && ((active_level >> ACTIVE_LEVEL_OFF) == ACTIVE_HIGH)) {
> +		type = IRQ_TYPE_EDGE_FALLING;
> +	}
> +
>  	switch (type & IRQ_TYPE_SENSE_MASK) {
>  	case IRQ_TYPE_EDGE_RISING:
>  		pin_reg &= ~BIT(LEVEL_TRIG_OFF);

-- 
Dmitry
