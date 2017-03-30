From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: Add a driver for Cadence GPIO controller
Date: Thu, 30 Mar 2017 11:03:45 +0200
Message-ID: <CACRpkdZ6w_tuzSNmFE=2BpeASNOSq0cV4fYM6F8-57Q2+3n-aQ@mail.gmail.com>
References: <1490803459-29697-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1490803459-29697-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Simon Hatliff <hatliff@cadence.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Mar 29, 2017 at 6:04 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:

> Add a driver for Cadence GPIO controller.

IIUC Cadence do a lot of things. Are there variants of this controller?
Thinking whether it should have several compatible strings, and
whether it needs SoC-specific bindings too.

> Even though this driver is pretty simple, I was not able to use the
> generic GPIO infrastructure because it needs custom ->request()/->free()
> implementation and ->direction_output() requires modifying 2 different
> registers while the generic implementation only modifies the dirin (or
> dirout) register. Other than that, the implementation is rather
> straightforward.
>
> Note that irq support has not been tested.

That's cool, kudos for doing it anyway, I will see if I can spot some
weirdness there.

> +#include <linux/clk.h>
> +#include <linux/gpio.h>

Just
#include <linux/gpio/driver.h>

It should work else something is wrong with the driver.

> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#define CDNS_GPIO_BYPASS_MODE          0x0
> +#define CDNS_GPIO_DIRECTION_MODE       0x4
> +#define CDNS_GPIO_OUTPUT_EN            0x8
> +#define CDNS_GPIO_OUTPUT_VALUE         0xc
> +#define CDNS_GPIO_INPUT_VALUE          0x10
> +#define CDNS_GPIO_IRQ_MASK             0x14
> +#define CDNS_GPIO_IRQ_EN               0x18
> +#define CDNS_GPIO_IRQ_DIS              0x1c
> +#define CDNS_GPIO_IRQ_STATUS           0x20
> +#define CDNS_GPIO_IRQ_TYPE             0x24
> +#define CDNS_GPIO_IRQ_VALUE            0x28
> +#define CDNS_GPIO_IRQ_ANY_EDGE         0x2c

Seems simple.

> +struct cdns_gpio_chip {
> +       struct gpio_chip base;

-EALLYOURBASE;
That is a really confusing name for a GPIO chip. "base" is usually used
to name register base, i.e. what you call "regs".

Can you name it "chip" or "gc" or something?

> +static inline struct cdns_gpio_chip *to_cdns_gpio(struct gpio_chip *chip)
> +{
> +       return container_of(chip, struct cdns_gpio_chip, base);
> +}

Please use gpiochip_get_data(gc); instead at all sites, and use
devm_gpiochip_add() to get the data associated to the chip.

> +static int cdns_gpio_request(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct cdns_gpio_chip *cgpio = to_cdns_gpio(chip);
> +
> +       iowrite32(ioread32(cgpio->regs + CDNS_GPIO_BYPASS_MODE) & ~BIT(offset),
> +                 cgpio->regs + CDNS_GPIO_BYPASS_MODE);
> +
> +       return 0;
> +}

Two days ago I was adding exactly the same lines of code to
the Faraday driver (another IP vendor). So to me it seems you are doing
the right thing here. But add some comments as to what is going
on: is this as with the Faraday part: you disable any other
IO connected to the pad?

> +static void cdns_gpio_free(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct cdns_gpio_chip *cgpio = to_cdns_gpio(chip);
> +
> +       iowrite32(ioread32(cgpio->regs + CDNS_GPIO_BYPASS_MODE) | BIT(offset),
> +                 cgpio->regs + CDNS_GPIO_BYPASS_MODE);
> +}

Is it really correct to *force* the bypass mode when free:ing the GPIO?

Isn't it more appropriate to copy this bitmask into a state variable
and restore whatever mode it was in *before* you requested the
GPIO?

> +static int cdns_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
> +static int cdns_gpio_direction_in(struct gpio_chip *chip, unsigned int offset)
> +static int cdns_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +static void cdns_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
> +static void cdns_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +static int cdns_gpio_direction_out(struct gpio_chip *chip, unsigned int offset,

These are so simple. Which is why we have the generic GPIO driver :)

select GPIO_GENERIC in Kconfig

#

then in your dynamic gpiochip something like

        ret = bgpio_init(&g->gc, dev, 4,
                         g->base + GPIO_DATA_IN,
                         g->base + GPIO_DATA_SET,
                         g->base + GPIO_DATA_CLR,
                         g->base + GPIO_DIR,
                         NULL,
                         0);

There are flags and stuff for how  the bits get set and cleared
on various variants, check it out. It all comes in through
<linux/gpio/driver.h>.

You can still assign the .request and .free callbacks and
the irqchip after this, that is fine.
See drivers/gpio/gpio-gemini.c for my example

> +static void cdns_gpio_irq_mask(struct irq_data *d)
> +static void cdns_gpio_irq_unmask(struct irq_data *d)

All good.

> +static int cdns_gpio_irq_set_type(struct irq_data *d, unsigned int type)
> +{
> +       struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
> +       struct cdns_gpio_chip *cgpio = to_cdns_gpio(chip);
> +       u32 int_type = ioread32(cgpio->regs + CDNS_GPIO_IRQ_TYPE);
> +       u32 int_value = ioread32(cgpio->regs + CDNS_GPIO_IRQ_VALUE);
> +       u32 mask = BIT(d->hwirq);
> +
> +       int_type &= ~mask;
> +       int_value &= ~mask;
> +
> +       if (type == IRQ_TYPE_LEVEL_HIGH) {
> +               int_type |= mask;
> +               int_value |= mask;
> +       } else if (type == IRQ_TYPE_LEVEL_LOW) {
> +               int_type |= mask;
> +       } else if (type & IRQ_TYPE_EDGE_BOTH) {
> +               u32 any_edge;
> +
> +               int_type &= ~mask;
> +
> +               any_edge = ioread32(cgpio->regs + CDNS_GPIO_IRQ_ANY_EDGE);
> +               any_edge &= ~mask;
> +
> +               if (type == IRQ_TYPE_EDGE_BOTH)
> +                       any_edge |= mask;
> +               else if (IRQ_TYPE_EDGE_RISING)
> +                       int_value |= mask;
> +
> +               iowrite32(any_edge, cgpio->regs + CDNS_GPIO_IRQ_ANY_EDGE);
> +       } else {
> +               return -EINVAL;
> +       }
> +
> +       iowrite32(int_type, cgpio->regs + CDNS_GPIO_IRQ_TYPE);
> +       iowrite32(int_value, cgpio->regs + CDNS_GPIO_IRQ_VALUE);
> +
> +       return 0;
> +}

I see that Cadence don't have a separare ACK register and instead
all IRQs get cleared when reading the status register. Not good,
so no separate edge and level handling. What were they thinking...
well not much to do about that.

> +static irqreturn_t cdns_gpio_irq_handler(int irq, void *dev)
> +{
> +       struct cdns_gpio_chip *cgpio = dev;
> +       unsigned long status;
> +       int hwirq;
> +
> +       /*
> +        * FIXME: If we have an edge irq that is masked we might lose it
> +        * since reading the STATUS register clears all IRQ flags.
> +        * We could store the status of all masked IRQ in the cdns_gpio_chip
> +        * struct but we then have no way to re-trigger the interrupt when
> +        * it is unmasked.
> +        */

It is marked FIXME but do you think it can even be fixed? It seems
like a hardware flaw. :(

Controllers that handle this properly have a separate ACK register,
usually.

> +       status = ioread32(cgpio->regs + CDNS_GPIO_IRQ_STATUS) &
> +                ioread32(cgpio->regs + CDNS_GPIO_IRQ_MASK);
> +
> +       for_each_set_bit(hwirq, &status, 32) {
> +               int irq = irq_find_mapping(cgpio->base.irqdomain, hwirq);
> +
> +               handle_nested_irq(irq);

I don't understand this nested business. Why are you making this
a nested IRQ when it seems to be just doing register writes into
IO space?

Why not use a chained interrupt handler?

Again look at the Gemini driver or pl061 for an example.

> +static int cdns_gpio_probe(struct platform_device *pdev)
> +{
> +       struct cdns_gpio_chip *cgpio;
> +       struct resource *res;
> +       int ret, irq;
> +
> +       cgpio = devm_kzalloc(&pdev->dev, sizeof(*cgpio), GFP_KERNEL);
> +       if (!cgpio)
> +               return -ENOMEM;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       cgpio->regs = devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(cgpio->regs))
> +               return PTR_ERR(cgpio->regs);
> +
> +       cgpio->base.label = dev_name(&pdev->dev);
> +       cgpio->base.ngpio = 32;
> +       cgpio->base.parent = &pdev->dev;
> +       cgpio->base.base = -1;
> +       cgpio->base.owner = THIS_MODULE;
> +       cgpio->base.request = cdns_gpio_request;
> +       cgpio->base.free = cdns_gpio_free;
> +       cgpio->base.get_direction = cdns_gpio_get_direction;
> +       cgpio->base.direction_input = cdns_gpio_direction_in;
> +       cgpio->base.get = cdns_gpio_get;
> +       cgpio->base.direction_output = cdns_gpio_direction_out;
> +       cgpio->base.set = cdns_gpio_set;
> +       cgpio->base.set_multiple = cdns_gpio_set_multiple;

So a bunch of these could be handled with generic GPIO so
we can focus on the meat.

> +       ret = devm_gpiochip_add_data(&pdev->dev, &cgpio->base, cgpio);
> +       if (ret < 0) {
> +               dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
> +               goto err_disable_clk;
> +       }

Hey you add the data, but don't get it with gpiochip_get_data().
Use the accessor, it's nice.

> +       irq = platform_get_irq(pdev, 0);
> +       if (irq >= 0) {
> +               cgpio->irqchip.name = dev_name(&pdev->dev);
> +               cgpio->irqchip.irq_mask = cdns_gpio_irq_mask;
> +               cgpio->irqchip.irq_unmask = cdns_gpio_irq_unmask;
> +               cgpio->irqchip.irq_set_type = cdns_gpio_irq_set_type;
> +
> +               ret = gpiochip_irqchip_add_nested(&cgpio->base,
> +                                                 &cgpio->irqchip, 0,
> +                                                 handle_simple_irq,
> +                                                 IRQ_TYPE_NONE);
> +               if (ret) {
> +                       dev_err(&pdev->dev,
> +                               "Could not connect irqchip to gpiochip, %d\n",
> +                               ret);
> +                       goto err_disable_clk;
> +               }
> +
> +               ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
> +                                               cdns_gpio_irq_handler,
> +                                               IRQF_ONESHOT,
> +                                               dev_name(&pdev->dev), cgpio);
> +               if (ret < 0) {
> +                       dev_err(&pdev->dev,
> +                               "Failed to register irq handler, %d\n", ret);
> +                       goto err_disable_clk;
> +               }
> +       }
>
And as mentioned I don't get this nested IRQ business.

Have you tried to use a chained interrupt? Like gpio-pl061 does?
You can just copy/paste and try it. Don't miss the chained_irq_enter()
and friends.

Yours,
Linus Walleij
