From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4] gpio: add Intel WhiskeyCove GPIO driver
Date: Wed, 6 Jul 2016 10:57:19 +0200
Message-ID: <CACRpkdZJ0AUWmxLApzryCZbQcQmwWO1A-NLMP46WsLkJBZgprQ@mail.gmail.com>
References: <20160627235616.GA9303@worksta>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160627235616.GA9303@worksta>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Gao <bin.gao@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Yegnesh S Iyer <yegnesh.s.iyer@intel.com>, Bin Gao <bin.gao@intel.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jun 28, 2016 at 1:56 AM, Bin Gao <bin.gao@linux.intel.com> wrote:

> This patch introduces a separate GPIO driver for Intel WhiskeyCove PMIC.
> This driver is based on gpio-crystalcove.c.
>
> Signed-off-by: Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>
> Signed-off-by: Bin Gao <bin.gao@intel.com>
> ---
> Changes in v4:
>  - Converted CTLI_INTCNT_XX macros to less verbose ones INT_DETECT_XX.
>  - Add comments about why there is no .pm for the driver.
>  - Header files re-ordered.
>  - Various coding style change to address Andy's comments.

Mika can I have your ACK/review tag on this driver so I can merge it?
I prefer to have all Intel stuff bearing your seal of approval.

> +static irqreturn_t wcove_gpio_irq_handler(int irq, void *data)
> +{
> +       int pending;
> +       unsigned int p0, p1, virq, gpio;
> +       struct wcove_gpio *wg = data;
> +
> +       if (regmap_read(wg->regmap, IRQ_STATUS_OFFSET + 0, &p0) ||
> +           regmap_read(wg->regmap, IRQ_STATUS_OFFSET + 1, &p1)) {

Why can't you use regmap_bulk_read() here?

> +               dev_err(wg->chip.parent, "%s(): regmap_read() failed.\n",
> +                                                               __func__);
> +               return IRQ_NONE;
> +       }
> +
> +       pending = p0 | (p1 << 8);
> +
> +       for (gpio = 0; gpio < WCOVE_GPIO_NUM; gpio++) {
> +               if (pending & BIT(gpio)) {
> +                       virq = irq_find_mapping(wg->chip.irqdomain, gpio);
> +                       handle_nested_irq(virq);
> +               }
> +       }
> +
> +       regmap_write(wg->regmap, IRQ_STATUS_OFFSET + 0, p0);
> +       regmap_write(wg->regmap, IRQ_STATUS_OFFSET + 1, p1);

Use regmap_bulk_write()?

Also you're ignoring the return error code. Check it and dev_err() if
it fails.

This loop seems like it could miss interrupts happening while
processing. Especially edge interrupts, and thatr will lead to serious
bugs later.

Please consider the following construction:

1. read status register
2. Any IRQs active?
  2.1 No IRQs active: if this is the FIRST iteration, exit with IRQ_NONE
  2.2 No IRQs active If this the second iteration or later, exit with
IRQ_HANDLED
  2.3 IRQs active, continue
2. Find first active IRQ
3. Handle first active IRQ
4. ACK the first active IRQ by writing the status register
5. Reiterate from 1

This way, if two IRQs happen at the same time, or if a new IRQ appears
while you're inside the interrupt handler, it gets served.

> +static void wcove_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
> +{
> +       struct wcove_gpio *wg = gpiochip_get_data(chip);
> +       int gpio, offset, group;
> +       unsigned int ctlo, ctli, irq_mask, irq_status;
> +
> +       for (gpio = 0; gpio < WCOVE_GPIO_NUM; gpio++) {
> +               group = gpio < GROUP0_NR_IRQS ? 0 : 1;
> +               regmap_read(wg->regmap, to_reg(gpio, CTRL_OUT), &ctlo);
> +               regmap_read(wg->regmap, to_reg(gpio, CTRL_IN), &ctli);
> +               regmap_read(wg->regmap, IRQ_MASK_OFFSET + group, &irq_mask);
> +               regmap_read(wg->regmap, IRQ_STATUS_OFFSET + group, &irq_status);

Ignoring error codes. Fix this.

> +       gpiochip_irqchip_add(&wg->chip, &wcove_irqchip, 0,
> +                            handle_simple_irq, IRQ_TYPE_NONE);

Reexamine the use of handle_simple_irq() here. We have two kinds of
irq hardware: those with one register for ACKing and reading the status
of an IRQ, and those with two registers for it: one where you ACK the
IRQ (so it can immediately re-trigger) and one to read the status of
whether it happened. Sometimes different handling is needed for
levek and edge IRQs even (c.f. gpio-pl061.c).

Only the hardware with just one register for both things should use
handle_simple_irq(). This seems to be the case here but I want you
to verify.

Yours,
Linus Walleij
