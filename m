From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH 1/3] gpio: pl061: lock IRQs when starting them
Date: Wed, 27 Nov 2013 06:20:19 +0200
Message-ID: <20131127042019.GV32436@tarshish>
References: <1385472227-25956-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:33129 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750901Ab3K0EUV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 26 Nov 2013 23:20:21 -0500
Content-Disposition: inline
In-Reply-To: <1385472227-25956-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Deepak Sikri <deepak.sikri@st.com>

Hi Linus,

On Tue, Nov 26, 2013 at 02:23:47PM +0100, Linus Walleij wrote:
> This uses the new API for tagging GPIO lines as in use by
> IRQs. This enforces a few semantic checks on how the underlying
> GPIO line is used.
> 
> Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
> Cc: Baruch Siach <baruch@tkos.co.il>
> Cc: Deepak Sikri <deepak.sikri@st.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-pl061.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> index f22f7f3e2e53..1c37c97acc76 100644
> --- a/drivers/gpio/gpio-pl061.c
> +++ b/drivers/gpio/gpio-pl061.c
> @@ -231,11 +231,33 @@ static void pl061_irq_unmask(struct irq_data *d)
>  	spin_unlock(&chip->lock);
>  }
>  
> +static unsigned int pl061_irq_startup(struct irq_data *d)
> +{
> +	struct pl061_gpio *chip = irq_data_get_irq_chip_data(d);
> +
> +	if (gpio_lock_as_irq(&chip->gc, irqd_to_hwirq(d)))
> +		dev_err(chip->gc.dev,
> +			"unable to lock HW IRQ %lu for IRQ\n",
> +			irqd_to_hwirq(d));

What is this locking good for if locking is not enforced (i.e. error out)?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
