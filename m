From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [patch 15/22] pinctrl: Use irq_desc_get_xxx() to avoid redundant
 lookup of irq_desc
Date: Mon, 31 Aug 2015 17:28:46 -0400
Message-ID: <CAP=VYLrx3rJSvCEgZz47Ka1fye5EK6yetQKna=7fMGn3kOwiLg@mail.gmail.com>
References: <20150713072703.919712512@linutronix.de> <20150713072815.548358316@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150713072815.548358316@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jul 13, 2015 at 4:47 PM, Thomas Gleixner <tglx@linutronix.de> wrote:
> From: Jiang Liu <jiang.liu@linux.intel.com>
>
> Use irq_desc_get_xxx() to avoid redundant lookup of irq_desc while we
> already have a pointer to corresponding irq_desc.

Hi Linus,

It seems that linux-next has this copy of the patch as 5663bb27dec1, which
has a stray irq_desc_get_irq_chip in s3c24xx ; (2nd instance of "irq" is
bogus looking.)   I first assumed it was from tglx since it did not have any
additional SOB lines, but on further investigation I traced it back to sfr's
merge of pinctrl/for-next.

Anyway, it doesn't compile with the extra irq in the name like that, and
that SHA isn't in tip, so it appears to be manually applied to pinctrl vs
merged in.

Paul.
--


>
> Signed-off-by: Jiang Liu <jiang.liu@linux.intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  drivers/pinctrl/intel/pinctrl-cherryview.c    |    2 +-
>  drivers/pinctrl/intel/pinctrl-intel.c         |    2 +-
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c |    4 ++--
>  drivers/pinctrl/nomadik/pinctrl-nomadik.c     |   12 +++++-------
>  drivers/pinctrl/pinctrl-amd.c                 |    2 +-
>  drivers/pinctrl/pinctrl-at91.c                |    2 +-
>  drivers/pinctrl/pinctrl-coh901.c              |    4 ++--
>  drivers/pinctrl/pinctrl-rockchip.c            |    4 ++--
>  drivers/pinctrl/pinctrl-single.c              |    2 +-
>  drivers/pinctrl/pinctrl-st.c                  |    6 +++---
>  drivers/pinctrl/qcom/pinctrl-msm.c            |    2 +-
>  drivers/pinctrl/samsung/pinctrl-exynos.c      |    8 ++++----
>  drivers/pinctrl/samsung/pinctrl-s3c24xx.c     |   18 +++++++++---------
>  drivers/pinctrl/samsung/pinctrl-s3c64xx.c     |   22 ++++++++++------------
>  drivers/pinctrl/sirf/pinctrl-sirf.c           |    2 +-
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c         |    4 ++--
>  16 files changed, 46 insertions(+), 50 deletions(-)
>
> Index: tip/drivers/pinctrl/intel/pinctrl-cherryview.c
> ===================================================================
> --- tip.orig/drivers/pinctrl/intel/pinctrl-cherryview.c
> +++ tip/drivers/pinctrl/intel/pinctrl-cherryview.c
> @@ -1412,7 +1412,7 @@ static void chv_gpio_irq_handler(unsigne
>  {
>         struct gpio_chip *gc = irq_desc_get_handler_data(desc);
>         struct chv_pinctrl *pctrl = gpiochip_to_pinctrl(gc);
> -       struct irq_chip *chip = irq_get_chip(irq);
> +       struct irq_chip *chip = irq_desc_get_chip(desc);
>         unsigned long pending;
>         u32 intr_line;
>
> Index: tip/drivers/pinctrl/intel/pinctrl-intel.c
> ===================================================================
> --- tip.orig/drivers/pinctrl/intel/pinctrl-intel.c
> +++ tip/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -840,7 +840,7 @@ static void intel_gpio_irq_handler(unsig
>  {
>         struct gpio_chip *gc = irq_desc_get_handler_data(desc);
>         struct intel_pinctrl *pctrl = gpiochip_to_pinctrl(gc);
> -       struct irq_chip *chip = irq_get_chip(irq);
> +       struct irq_chip *chip = irq_desc_get_chip(desc);
>         int i;
>
>         chained_irq_enter(chip, desc);
> Index: tip/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> ===================================================================
> --- tip.orig/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ tip/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -1118,8 +1118,8 @@ mtk_eint_debounce_process(struct mtk_pin
>
>  static void mtk_eint_irq_handler(unsigned irq, struct irq_desc *desc)
>  {
> -       struct irq_chip *chip = irq_get_chip(irq);
> -       struct mtk_pinctrl *pctl = irq_get_handler_data(irq);
> +       struct irq_chip *chip = irq_desc_get_chip(desc);
> +       struct mtk_pinctrl *pctl = irq_desc_get_handler_data(desc);
>         unsigned int status, eint_num;
>         int offset, index, virq;
>         const struct mtk_eint_offsets *eint_offsets =
> Index: tip/drivers/pinctrl/nomadik/pinctrl-nomadik.c
> ===================================================================
> --- tip.orig/drivers/pinctrl/nomadik/pinctrl-nomadik.c
> +++ tip/drivers/pinctrl/nomadik/pinctrl-nomadik.c
> @@ -843,10 +843,9 @@ static void nmk_gpio_irq_shutdown(struct
>         clk_disable(nmk_chip->clk);
>  }
>
> -static void __nmk_gpio_irq_handler(unsigned int irq, struct irq_desc *desc,
> -                                  u32 status)
> +static void __nmk_gpio_irq_handler(struct irq_desc *desc, u32 status)
>  {
> -       struct irq_chip *host_chip = irq_get_chip(irq);
> +       struct irq_chip *host_chip = irq_desc_get_chip(desc);
>         struct gpio_chip *chip = irq_desc_get_handler_data(desc);
>
>         chained_irq_enter(host_chip, desc);
> @@ -871,17 +870,16 @@ static void nmk_gpio_irq_handler(unsigne
>         status = readl(nmk_chip->addr + NMK_GPIO_IS);
>         clk_disable(nmk_chip->clk);
>
> -       __nmk_gpio_irq_handler(irq, desc, status);
> +       __nmk_gpio_irq_handler(desc, status);
>  }
>
> -static void nmk_gpio_latent_irq_handler(unsigned int irq,
> -                                          struct irq_desc *desc)
> +static void nmk_gpio_latent_irq_handler(unsigned int irq, struct irq_desc *desc)
>  {
>         struct gpio_chip *chip = irq_desc_get_handler_data(desc);
>         struct nmk_gpio_chip *nmk_chip = container_of(chip, struct nmk_gpio_chip, chip);
>         u32 status = nmk_chip->get_latent_status(nmk_chip->bank);
>
> -       __nmk_gpio_irq_handler(irq, desc, status);
> +       __nmk_gpio_irq_handler(desc, status);
>  }
>
>  /* I/O Functions */
> Index: tip/drivers/pinctrl/pinctrl-amd.c
> ===================================================================
> --- tip.orig/drivers/pinctrl/pinctrl-amd.c
> +++ tip/drivers/pinctrl/pinctrl-amd.c
> @@ -501,7 +501,7 @@ static void amd_gpio_irq_handler(unsigne
>         u64 reg64;
>         int handled = 0;
>         unsigned long flags;
> -       struct irq_chip *chip = irq_get_chip(irq);
> +       struct irq_chip *chip = irq_desc_get_chip(desc);
>         struct gpio_chip *gc = irq_desc_get_handler_data(desc);
>         struct amd_gpio *gpio_dev = to_amd_gpio(gc);
>
> Index: tip/drivers/pinctrl/pinctrl-at91.c
> ===================================================================
> --- tip.orig/drivers/pinctrl/pinctrl-at91.c
> +++ tip/drivers/pinctrl/pinctrl-at91.c
> @@ -1596,7 +1596,7 @@ static struct irq_chip gpio_irqchip = {
>
>  static void gpio_irq_handler(unsigned irq, struct irq_desc *desc)
>  {
> -       struct irq_chip *chip = irq_get_chip(irq);
> +       struct irq_chip *chip = irq_desc_get_chip(desc);
>         struct gpio_chip *gpio_chip = irq_desc_get_handler_data(desc);
>         struct at91_gpio_chip *at91_gpio = container_of(gpio_chip,
>                                            struct at91_gpio_chip, chip);
> Index: tip/drivers/pinctrl/pinctrl-coh901.c
> ===================================================================
> --- tip.orig/drivers/pinctrl/pinctrl-coh901.c
> +++ tip/drivers/pinctrl/pinctrl-coh901.c
> @@ -521,8 +521,8 @@ static struct irq_chip u300_gpio_irqchip
>
>  static void u300_gpio_irq_handler(unsigned irq, struct irq_desc *desc)
>  {
> -       struct irq_chip *parent_chip = irq_get_chip(irq);
> -       struct gpio_chip *chip = irq_get_handler_data(irq);
> +       struct irq_chip *parent_chip = irq_desc_get_chip(desc);
> +       struct gpio_chip *chip = irq_desc_get_handler_data(desc);
>         struct u300_gpio *gpio = to_u300_gpio(chip);
>         struct u300_gpio_port *port = &gpio->ports[irq - chip->base];
>         int pinoffset = port->number << 3; /* get the right stride */
> Index: tip/drivers/pinctrl/pinctrl-rockchip.c
> ===================================================================
> --- tip.orig/drivers/pinctrl/pinctrl-rockchip.c
> +++ tip/drivers/pinctrl/pinctrl-rockchip.c
> @@ -1471,8 +1471,8 @@ static const struct gpio_chip rockchip_g
>
>  static void rockchip_irq_demux(unsigned int irq, struct irq_desc *desc)
>  {
> -       struct irq_chip *chip = irq_get_chip(irq);
> -       struct rockchip_pin_bank *bank = irq_get_handler_data(irq);
> +       struct irq_chip *chip = irq_desc_get_chip(desc);
> +       struct rockchip_pin_bank *bank = irq_desc_get_handler_data(desc);
>         u32 pend;
>
>         dev_dbg(bank->drvdata->dev, "got irq for bank %s\n", bank->name);
> Index: tip/drivers/pinctrl/pinctrl-single.c
> ===================================================================
> --- tip.orig/drivers/pinctrl/pinctrl-single.c
> +++ tip/drivers/pinctrl/pinctrl-single.c
> @@ -1684,7 +1684,7 @@ static void pcs_irq_chain_handler(unsign
>         struct pcs_soc_data *pcs_soc = irq_desc_get_handler_data(desc);
>         struct irq_chip *chip;
>
> -       chip = irq_get_chip(irq);
> +       chip = irq_desc_get_chip(desc);
>         chained_irq_enter(chip, desc);
>         pcs_irq_handle(pcs_soc);
>         /* REVISIT: export and add handle_bad_irq(irq, desc)? */
> Index: tip/drivers/pinctrl/pinctrl-st.c
> ===================================================================
> --- tip.orig/drivers/pinctrl/pinctrl-st.c
> +++ tip/drivers/pinctrl/pinctrl-st.c
> @@ -1463,7 +1463,7 @@ static void __gpio_irq_handler(struct st
>  static void st_gpio_irq_handler(unsigned irq, struct irq_desc *desc)
>  {
>         /* interrupt dedicated per bank */
> -       struct irq_chip *chip = irq_get_chip(irq);
> +       struct irq_chip *chip = irq_desc_get_chip(desc);
>         struct gpio_chip *gc = irq_desc_get_handler_data(desc);
>         struct st_gpio_bank *bank = gpio_chip_to_bank(gc);
>
> @@ -1474,8 +1474,8 @@ static void st_gpio_irq_handler(unsigned
>
>  static void st_gpio_irqmux_handler(unsigned irq, struct irq_desc *desc)
>  {
> -       struct irq_chip *chip = irq_get_chip(irq);
> -       struct st_pinctrl *info = irq_get_handler_data(irq);
> +       struct irq_chip *chip = irq_desc_get_chip(desc);
> +       struct st_pinctrl *info = irq_desc_get_handler_data(desc);
>         unsigned long status;
>         int n;
>
> Index: tip/drivers/pinctrl/qcom/pinctrl-msm.c
> ===================================================================
> --- tip.orig/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ tip/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -769,7 +769,7 @@ static void msm_gpio_irq_handler(unsigne
>         struct gpio_chip *gc = irq_desc_get_handler_data(desc);
>         const struct msm_pingroup *g;
>         struct msm_pinctrl *pctrl = to_msm_pinctrl(gc);
> -       struct irq_chip *chip = irq_get_chip(irq);
> +       struct irq_chip *chip = irq_desc_get_chip(desc);
>         int irq_pin;
>         int handled = 0;
>         u32 val;
> Index: tip/drivers/pinctrl/samsung/pinctrl-exynos.c
> ===================================================================
> --- tip.orig/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ tip/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -422,9 +422,9 @@ static const struct of_device_id exynos_
>  /* interrupt handler for wakeup interrupts 0..15 */
>  static void exynos_irq_eint0_15(unsigned int irq, struct irq_desc *desc)
>  {
> -       struct exynos_weint_data *eintd = irq_get_handler_data(irq);
> +       struct exynos_weint_data *eintd = irq_desc_get_handler_data(desc);
>         struct samsung_pin_bank *bank = eintd->bank;
> -       struct irq_chip *chip = irq_get_chip(irq);
> +       struct irq_chip *chip = irq_desc_get_chip(desc);
>         int eint_irq;
>
>         chained_irq_enter(chip, desc);
> @@ -454,8 +454,8 @@ static inline void exynos_irq_demux_eint
>  /* interrupt handler for wakeup interrupt 16 */
>  static void exynos_irq_demux_eint16_31(unsigned int irq, struct irq_desc *desc)
>  {
> -       struct irq_chip *chip = irq_get_chip(irq);
> -       struct exynos_muxed_weint_data *eintd = irq_get_handler_data(irq);
> +       struct irq_chip *chip = irq_desc_get_chip(desc);
> +       struct exynos_muxed_weint_data *eintd = irq_desc_get_handler_data(desc);
>         struct samsung_pinctrl_drv_data *d = eintd->banks[0]->drvdata;
>         unsigned long pend;
>         unsigned long mask;
> Index: tip/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
> ===================================================================
> --- tip.orig/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
> +++ tip/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
> @@ -243,7 +243,7 @@ static struct irq_chip s3c2410_eint0_3_c
>  static void s3c2410_demux_eint0_3(unsigned int irq, struct irq_desc *desc)
>  {
>         struct irq_data *data = irq_desc_get_irq_data(desc);
> -       struct s3c24xx_eint_data *eint_data = irq_get_handler_data(irq);
> +       struct s3c24xx_eint_data *eint_data = irq_desc_get_handler_data(desc);
>         unsigned int virq;
>
>         /* the first 4 eints have a simple 1 to 1 mapping */
> @@ -297,9 +297,9 @@ static struct irq_chip s3c2412_eint0_3_c
>
>  static void s3c2412_demux_eint0_3(unsigned int irq, struct irq_desc *desc)
>  {
> -       struct irq_chip *chip = irq_get_chip(irq);
> +       struct s3c24xx_eint_data *eint_data = irq_desc_get_handler_data(desc);
>         struct irq_data *data = irq_desc_get_irq_data(desc);
> -       struct s3c24xx_eint_data *eint_data = irq_get_handler_data(irq);
> +       struct irq_chip *chip = irq_data_get_irq_chip(data);
>         unsigned int virq;
>
>         chained_irq_enter(chip, desc);
> @@ -357,11 +357,11 @@ static struct irq_chip s3c24xx_eint_chip
>         .irq_set_type   = s3c24xx_eint_type,
>  };
>
> -static inline void s3c24xx_demux_eint(unsigned int irq, struct irq_desc *desc,
> +static inline void s3c24xx_demux_eint(struct irq_desc *desc,
>                                       u32 offset, u32 range)
>  {
> -       struct irq_chip *chip = irq_get_chip(irq);
> -       struct s3c24xx_eint_data *data = irq_get_handler_data(irq);
> +       struct s3c24xx_eint_data *data = irq_desc_get_handler_data(desc);
> +       struct irq_chip *chip = irq_desc_get_irq_chip(desc);
>         struct samsung_pinctrl_drv_data *d = data->drvdata;
>         unsigned int pend, mask;
>
> @@ -374,7 +374,7 @@ static inline void s3c24xx_demux_eint(un
>         pend &= range;
>
>         while (pend) {
> -               unsigned int virq;
> +               unsigned int virq, irq;
>
>                 irq = __ffs(pend);
>                 pend &= ~(1 << irq);
> @@ -390,12 +390,12 @@ static inline void s3c24xx_demux_eint(un
>
>  static void s3c24xx_demux_eint4_7(unsigned int irq, struct irq_desc *desc)
>  {
> -       s3c24xx_demux_eint(irq, desc, 0, 0xf0);
> +       s3c24xx_demux_eint(desc, 0, 0xf0);
>  }
>
>  static void s3c24xx_demux_eint8_23(unsigned int irq, struct irq_desc *desc)
>  {
> -       s3c24xx_demux_eint(irq, desc, 8, 0xffff00);
> +       s3c24xx_demux_eint(desc, 8, 0xffff00);
>  }
>
>  static irq_flow_handler_t s3c2410_eint_handlers[NUM_EINT_IRQ] = {
> Index: tip/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
> ===================================================================
> --- tip.orig/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
> +++ tip/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
> @@ -410,8 +410,8 @@ static const struct irq_domain_ops s3c64
>
>  static void s3c64xx_eint_gpio_irq(unsigned int irq, struct irq_desc *desc)
>  {
> -       struct irq_chip *chip = irq_get_chip(irq);
> -       struct s3c64xx_eint_gpio_data *data = irq_get_handler_data(irq);
> +       struct irq_chip *chip = irq_desc_get_chip(desc);
> +       struct s3c64xx_eint_gpio_data *data = irq_desc_get_handler_data(desc);
>         struct samsung_pinctrl_drv_data *drvdata = data->drvdata;
>
>         chained_irq_enter(chip, desc);
> @@ -599,11 +599,10 @@ static struct irq_chip s3c64xx_eint0_irq
>         .irq_set_type   = s3c64xx_eint0_irq_set_type,
>  };
>
> -static inline void s3c64xx_irq_demux_eint(unsigned int irq,
> -                                       struct irq_desc *desc, u32 range)
> +static inline void s3c64xx_irq_demux_eint(struct irq_desc *desc, u32 range)
>  {
> -       struct irq_chip *chip = irq_get_chip(irq);
> -       struct s3c64xx_eint0_data *data = irq_get_handler_data(irq);
> +       struct irq_chip *chip = irq_desc_get_chip(desc);
> +       struct s3c64xx_eint0_data *data = irq_desc_get_handler_data(desc);
>         struct samsung_pinctrl_drv_data *drvdata = data->drvdata;
>         unsigned int pend, mask;
>
> @@ -616,11 +615,10 @@ static inline void s3c64xx_irq_demux_ein
>         pend &= range;
>
>         while (pend) {
> -               unsigned int virq;
> +               unsigned int virq, irq;
>
>                 irq = fls(pend) - 1;
>                 pend &= ~(1 << irq);
> -
>                 virq = irq_linear_revmap(data->domains[irq], data->pins[irq]);
>                 /*
>                  * Something must be really wrong if an unmapped EINT
> @@ -636,22 +634,22 @@ static inline void s3c64xx_irq_demux_ein
>
>  static void s3c64xx_demux_eint0_3(unsigned int irq, struct irq_desc *desc)
>  {
> -       s3c64xx_irq_demux_eint(irq, desc, 0xf);
> +       s3c64xx_irq_demux_eint(desc, 0xf);
>  }
>
>  static void s3c64xx_demux_eint4_11(unsigned int irq, struct irq_desc *desc)
>  {
> -       s3c64xx_irq_demux_eint(irq, desc, 0xff0);
> +       s3c64xx_irq_demux_eint(desc, 0xff0);
>  }
>
>  static void s3c64xx_demux_eint12_19(unsigned int irq, struct irq_desc *desc)
>  {
> -       s3c64xx_irq_demux_eint(irq, desc, 0xff000);
> +       s3c64xx_irq_demux_eint(desc, 0xff000);
>  }
>
>  static void s3c64xx_demux_eint20_27(unsigned int irq, struct irq_desc *desc)
>  {
> -       s3c64xx_irq_demux_eint(irq, desc, 0xff00000);
> +       s3c64xx_irq_demux_eint(desc, 0xff00000);
>  }
>
>  static irq_flow_handler_t s3c64xx_eint0_handlers[NUM_EINT0_IRQ] = {
> Index: tip/drivers/pinctrl/sirf/pinctrl-sirf.c
> ===================================================================
> --- tip.orig/drivers/pinctrl/sirf/pinctrl-sirf.c
> +++ tip/drivers/pinctrl/sirf/pinctrl-sirf.c
> @@ -552,7 +552,7 @@ static void sirfsoc_gpio_handle_irq(unsi
>         struct sirfsoc_gpio_bank *bank;
>         u32 status, ctrl;
>         int idx = 0;
> -       struct irq_chip *chip = irq_get_chip(irq);
> +       struct irq_chip *chip = irq_desc_get_chip(desc);
>         int i;
>
>         for (i = 0; i < SIRFSOC_GPIO_NO_OF_BANKS; i++) {
> Index: tip/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> ===================================================================
> --- tip.orig/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ tip/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -711,8 +711,8 @@ static struct irq_chip sunxi_pinctrl_lev
>
>  static void sunxi_pinctrl_irq_handler(unsigned irq, struct irq_desc *desc)
>  {
> -       struct irq_chip *chip = irq_get_chip(irq);
> -       struct sunxi_pinctrl *pctl = irq_get_handler_data(irq);
> +       struct irq_chip *chip = irq_desc_get_chip(desc);
> +       struct sunxi_pinctrl *pctl = irq_desc_get_handler_data(desc);
>         unsigned long bank, reg, val;
>
>         for (bank = 0; bank < pctl->desc->irq_banks; bank++)
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
