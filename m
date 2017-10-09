From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH] pinctrl: cherryview: fix issues caused by dynamic gpio
 irqs mapping
Date: Mon, 9 Oct 2017 13:04:41 -0500
Message-ID: <39deecb5-4dd4-6c45-7f93-278fd213b360@ti.com>
References: <20171003170049.24480-1-grygorii.strashko@ti.com>
 <CACRpkda3vBORtJPU=Y88TXukY=XbfmTau7GMSky98p63fhmfpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fllnx209.ext.ti.com ([198.47.19.16]:62272 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752206AbdJISFa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2017 14:05:30 -0400
In-Reply-To: <CACRpkda3vBORtJPU=Y88TXukY=XbfmTau7GMSky98p63fhmfpw@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Chris Gorman <chrisjohgorman@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>



On 10/07/2017 07:42 PM, Linus Walleij wrote:
> On Tue, Oct 3, 2017 at 7:00 PM, Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
> 
>> New GPIO IRQs are allocated and mapped dynamically by default when
>> GPIO IRQ infrastructure is used by cherryview-pinctrl driver.
>> This causes issues on some Intel platforms [1][2] with broken BIOS which
>> hardcodes Linux IRQ numbers in their ACPI tables.
>>
>> On such platforms cherryview-pinctrl driver should allocate and map all
>> GPIO IRQs at probe time.
>> Side effect - "Cannot allocate irq_descs @ IRQ%d, assuming pre-allocated\n"
>> can be seen at boot log.
>>
>> NOTE. It still may fail if boot sequence will changed and some interrupt
>> controller will be probed before cherryview-pinctrl which will shift Linux IRQ
>> numbering (expected with CONFIG_SPARCE_IRQ enabled).
>>
>> [1] https://bugzilla.kernel.org/show_bug.cgi?id=194945
>> [2] https://lkml.org/lkml/2017/9/28/153
>> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Cc: Chris Gorman <chrisjohgorman@gmail.com>
>> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
>> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
>> Reported-by: Chris Gorman <chrisjohgorman@gmail.com>
>> Reported-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> OK patch applied for fixes.
> 
> But I'mm still very sceptical about this.
> 
> Look at the following (just from grep irq_base drivers/gpio/):
> 
> drivers/gpio/gpio-ml-ioh.c:
> 
> static int ioh_gpio_to_irq(struct gpio_chip *gpio, unsigned offset)
> {
>          struct ioh_gpio *chip = gpiochip_get_data(gpio);

It is ioh_gpio - not  gpio_chip ;)

>          return chip->irq_base + offset;
> }
> 
> (...)
>          ch = irq - chip->irq_base;
>          if (irq <= chip->irq_base + 7) {
>                  im_reg = &chip->reg->regs[chip->ch].im_0;
>                  im_pos = ch;
> (...)

not an issue gpio-ml-ioh.c:
ioh_gpio_probe()
 		irq_base = devm_irq_alloc_descs(&pdev->dev, -1, IOH_IRQ_BASE,
						num_ports[j], NUMA_NO_NODE);
...
		chip->irq_base = irq_base;
 


> 
> drivers/gpio/gpio-sta2x11.c:
> 
> static int gsta_gpio_to_irq(struct gpio_chip *gpio, unsigned offset)
> {
>          struct gsta_gpio *chip = gpiochip_get_data(gpio);
>          return chip->irq_base + offset;

same. It is gsta_gpio - not  gpio_chip ;)

> }
> 
> (etc)
> 
> The thing is that the lines you deleted from gpiolib were the only
> thing ever assigning chip->irq_base. This patch, if performed
> properly should have removed the .irq_base field from struct
> gpio_chip altogether without regressions.
> 
> As it is not, anything using .irq_base is regressing.
> 
> Either you need to convince me you can quickfix all of these
> users, or we need to simply revert this change.



-- 
regards,
-grygorii
