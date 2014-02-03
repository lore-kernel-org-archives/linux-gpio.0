From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [patch] gpio: davinci: signedness bug in davinci_gpio_irq_setup()
Date: Mon, 3 Feb 2014 13:30:06 +0200
Message-ID: <52EF7DBE.3000201@ti.com>
References: <20140109052803.GA1265@elgon.mountain> <CACRpkdbSKE=d=_oxk+Nh8g3hAjr++ukvrh4nVujupqHk_xH-uw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:44614 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751114AbaBCKel (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 3 Feb 2014 05:34:41 -0500
In-Reply-To: <CACRpkdbSKE=d=_oxk+Nh8g3hAjr++ukvrh4nVujupqHk_xH-uw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Dan Carpenter <dan.carpenter@oracle.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@linaro.org>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>

Hi Linus, Sekhar,

On 01/15/2014 09:21 AM, Linus Walleij wrote:
> On Thu, Jan 9, 2014 at 6:28 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
>> "irq" needs to be signed for the error handling to work.
>>
>> Fixes: 6075a8b2b6c3 ('gpio: davinci: don't create irq_domain in case of unbanked irqs')
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
>> index 7629b4f12b7f..b0e98d379217 100644
>> --- a/drivers/gpio/gpio-davinci.c
>> +++ b/drivers/gpio/gpio-davinci.c
>> @@ -423,7 +423,7 @@ static const struct irq_domain_ops davinci_gpio_irq_ops = {
>>
>>   static int davinci_gpio_irq_setup(struct platform_device *pdev)
>>   {
>> -       unsigned        gpio, irq, bank;
>> +       unsigned        gpio, bank;
>>          struct clk      *clk;
>>          u32             binten = 0;
>>          unsigned        ngpio, bank_irq;
>> @@ -433,6 +433,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
>>          struct davinci_gpio_platform_data *pdata = dev->platform_data;
>>          struct davinci_gpio_regs __iomem *g;
>>          struct irq_domain       *irq_domain = NULL;
>> +       int             irq;
>>
>>          ngpio = pdata->ngpio;
>>          res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> This merge window the DaVinci GPIO changes are queued by the DaVinci
> maintainers (this patch does not even apply to my tree) so DaVinci guys:
> please pick up this patch.

This patch is not in 3.14 yet. Are there any chances to have it in 3.14, 
as it introduces merge conflicts with future patches?

Also, this is a fix.

Regards,
-grygorii
