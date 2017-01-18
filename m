From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/8] gpio: gpio-rz: GPIO driver for Renesas RZ series
Date: Wed, 18 Jan 2017 14:58:32 +0100
Message-ID: <CACRpkdaghtD3DUEECVAy=MLHx=KX-Ty=AJva2=MPyFQMTGMOLg@mail.gmail.com>
References: <1484568772-18137-1-git-send-email-jacopo+renesas@jmondi.org> <1484568772-18137-4-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1484568772-18137-4-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, chris.brandt@renesas.com, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 16, 2017 at 1:12 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:

> From: Magnus Damm <damm@opensource.se>
>
> This commit combines Magnus' original driver and minor fixes to
> forward-port it to a more recent kernel version (v4.10).
>
> Compared to the original driver the set of registers used to set/get
> direction is changed to extend compatibility with other RZ-Series
> processors.
>
> Signed-off-by: Magnus Damm <damm@opensource.se>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Sorry for not noting all you can do on first iteration... :/

> +config GPIO_RZ
> +       tristate "Renesas RZ GPIO"
> +       depends on ARCH_RENESAS

select GPIO_GENERIC

Trust me. It's gonna be real nice.

> +static inline struct rz_gpio_priv *gpio_to_priv(struct gpio_chip *chip)
> +{
> +       return gpiochip_get_data(chip);
> +}
> +
> +static inline u16 rz_gpio_read(struct  gpio_chip *chip, int reg)
> +{
> +       return ioread16(gpio_to_priv(chip)->io[reg]);
> +}
> +
> +static inline void rz_gpio_write(struct gpio_chip *chip, int reg, u16 val)
> +{
> +       iowrite16(val, gpio_to_priv(chip)->io[reg]);
> +}
> +
> +static int rz_gpio_get(struct gpio_chip *chip, unsigned gpio)
> +{
> +       u16 tmp = rz_gpio_read(chip, REG_PPR);
> +
> +       return tmp & BIT(gpio);
> +}
> +
> +static void rz_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
> +{
> +       u16 tmp;
> +
> +       if (gpio_to_priv(chip)->nreg == PORT0_NUM_REGS)
> +               return;
> +
> +       tmp = rz_gpio_read(chip, REG_P);
> +
> +       if (value)
> +               rz_gpio_write(chip, REG_P, tmp | BIT(gpio));
> +       else
> +               rz_gpio_write(chip, REG_P, tmp & ~BIT(gpio));
> +}
> +
> +static int rz_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
> +{
> +       /* Set bit in PM register (input buffer enabled by PFC for the pin) */
> +       rz_gpio_write(chip, REG_PM, rz_gpio_read(chip, REG_PM) | BIT(gpio));
> +
> +       return 0;
> +}
> +
> +static int rz_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
> +                                  int value)
> +{
> +
> +       if (gpio_to_priv(chip)->nreg == PORT0_NUM_REGS)
> +               return -EINVAL;
> +
> +       /* Write GPIO value before selecting output mode of pin */
> +       rz_gpio_set(chip, gpio, value);
> +
> +       /* Clear bit in PM register to enable output */
> +       rz_gpio_write(chip, REG_PM, rz_gpio_read(chip, REG_PM) & BIT(gpio));
> +
> +       return 0;
> +}
> +
> +static int rz_gpio_get_direction(struct gpio_chip *chip, unsigned gpio)
> +{
> +       if (gpio_to_priv(chip)->nreg == PORT0_NUM_REGS)
> +               return 1;
> +
> +       return rz_gpio_read(chip, REG_PM) & BIT(gpio);
> +}


Delete ALL the above functions.

> +static int rz_gpio_request(struct gpio_chip *chip, unsigned gpio)
> +{
> +       return gpiochip_generic_request(chip, gpio);
> +}
> +
> +static void rz_gpio_free(struct gpio_chip *chip, unsigned gpio)
> +{
> +       gpiochip_generic_free(chip, gpio);
> +
> +       /* Set the GPIO as an input to ensure that the next GPIO request won't
> +        * drive the GPIO pin as an output.
> +        */
> +       rz_gpio_direction_input(chip, gpio);

Change this line to:
chip->direction_input(chip, gpio);

> +static int rz_gpio_probe(struct platform_device *pdev)
> +{
> +       struct rz_gpio_priv *p;
> +       struct resource *io[REG_NR - 1];
> +       struct gpio_chip *gpio_chip;
> +       struct device_node *np = pdev->dev.of_node;
> +       struct of_phandle_args args;
> +       int ret, k;
> +
> +       p = devm_kzalloc(&pdev->dev, sizeof(*p), GFP_KERNEL);
> +       if (!p) {
> +               dev_err(&pdev->dev, "failed to allocate driver data\n");
> +               return -ENOMEM;
> +       }
> +
> +       /* As registers for each port instance are scattered in the same
> +        * address space, we have to map them singularly */
> +       for (k = 0; k < REG_NR; k++) {
> +               io[k] = platform_get_resource(pdev, IORESOURCE_MEM, k);
> +
> +               /* Port0 and JP0 are inuput only: has REG_PPR only */
> +               if (!io[k])
> +                       break;
> +
> +               p->io[k] = devm_ioremap_resource(&pdev->dev, io[k]);
> +               if (IS_ERR(p->io[k]))
> +                       return PTR_ERR(p->io[k]);
> +
> +               p->nreg++;
> +       }
> +
> +       /* move REG_PPR in correct position for Port0 and JP0 */
> +       if (p->nreg == PORT0_NUM_REGS) {
> +               p->io[REG_PPR] = p->io[REG_P];
> +               p->io[REG_P] = p->io[REG_PM] = NULL;
> +       }
> +
> +       ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, 0, &args);
> +
> +       gpio_chip = &p->gpio_chip;

Replace from here:

> +       gpio_chip->get = rz_gpio_get;
> +       gpio_chip->set = rz_gpio_set;
> +       gpio_chip->direction_input = rz_gpio_direction_input;
> +       gpio_chip->direction_output = rz_gpio_direction_output;
> +       gpio_chip->get_direction = rz_gpio_get_direction;

To here with:

ret = bgpio_init(gpio_chip, &pdev->dev, 2,
                       p->io[REG_PPR], p->io[REG_P], NULL,
                       NULL, p->io[REG_PM], 0);
if (ret)
    return ret;

This might need some flags or I screwed something up, but I'm
convinced you can use GENERIC_GPIO like this.

The generic accessors also sets the value before switching
direction.

If you're uncertain about the sematics, read drivers/gpio/gpio-mmio.c.

> +       gpio_chip->request = rz_gpio_request;
> +       gpio_chip->free = rz_gpio_free;
> +       gpio_chip->label = dev_name(&pdev->dev);
> +       gpio_chip->parent = &pdev->dev;
> +       gpio_chip->owner = THIS_MODULE;
> +       gpio_chip->base = -1;
> +       gpio_chip->ngpio = ret == 0 ? args.args[2] : RZ_GPIOS_PER_PORT;

bgpio_init() will have already set this up to 16 (RZ_GPIOS_PER_PORT)
as we pass width 2 bytes.

Yours,
Linus Walleij
