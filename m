From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC 2/5] pinctrl: rz-pfc: Add Renesas RZ/A1 pinctrl driver
Date: Wed, 01 Feb 2017 17:25:41 +0200
Message-ID: <4465909.0WTcfJOPSb@avalon>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org> <1485367787-8109-3-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1485367787-8109-3-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: geert+renesas@glider.be, linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wednesday 25 Jan 2017 19:09:44 Jacopo Mondi wrote:
> Add pin controller driver for Renesas RZ/A1 SoC.
> The SoC driver registers to rz-pfc core module and provides pin
> description array and SoC specific pin mux operation.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/pinctrl/rz-pfc/Kconfig        |   7 +
>  drivers/pinctrl/rz-pfc/Makefile       |   1 +
>  drivers/pinctrl/rz-pfc/pinctrl-rza1.c | 347 +++++++++++++++++++++++++++++++
>  3 files changed, 355 insertions(+)
>  create mode 100644 drivers/pinctrl/rz-pfc/pinctrl-rza1.c
> 
> diff --git a/drivers/pinctrl/rz-pfc/Kconfig b/drivers/pinctrl/rz-pfc/Kconfig
> index 3714c10..2b9c111 100644
> --- a/drivers/pinctrl/rz-pfc/Kconfig
> +++ b/drivers/pinctrl/rz-pfc/Kconfig
> @@ -15,4 +15,11 @@ config PINCTRL_RZ_PINCTRL
>  	help
>  	  This enables pin control drivers for Renesas RZ platforms
> 
> +config PINCTRL_RZA1_PINCTRL
> +    depends on ARCH_R7S72100
> +	select PINCTRL_RZ_PINCTRL
> +	def_bool y
> +	help
> +	  This enables pin control drivers for Renesas RZ/A1 SoC
> +
>  endif
> diff --git a/drivers/pinctrl/rz-pfc/Makefile
> b/drivers/pinctrl/rz-pfc/Makefile index cba8283..e3befa5 100644
> --- a/drivers/pinctrl/rz-pfc/Makefile
> +++ b/drivers/pinctrl/rz-pfc/Makefile
> @@ -1 +1,2 @@
>  obj-$(CONFIG_PINCTRL_RZ_PINCTRL)		+= pinctrl-rz.o
> +obj-$(CONFIG_PINCTRL_RZA1_PINCTRL)		+= pinctrl-rza1.o
> diff --git a/drivers/pinctrl/rz-pfc/pinctrl-rza1.c
> b/drivers/pinctrl/rz-pfc/pinctrl-rza1.c new file mode 100644
> index 0000000..221f048
> --- /dev/null
> +++ b/drivers/pinctrl/rz-pfc/pinctrl-rza1.c
> @@ -0,0 +1,347 @@
> +/*
> + * Pinctrl support for Renesas RZ/A1 SoC
> + *
> + * Copyright (C) 2017 Jacopo Mondi
> + * Copyright (C) 2017 Renesas Electronics Corporation
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2. This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +
> +#include <linux/of.h>
> +#include <linux/of_device.h>

You can move those two lines between module.h and platform_device.h, there's 
no need to keep them separate.

> +
> +#include "pinctrl-rz.h"
> +
> +#define RZA1_REG_DBG
> +
> +/* memory resources indexes */
> +#define MEM_RES_LOW	0 /* PORTn_base */
> +#define MEM_RES_HIGH	1 /* PORTn_base + 0x4000 */
> +
> +/* displacements from PORTn_base */
> +#define PMC_REG		0x400
> +#define PFC_REG		0x500
> +#define PFCE_REG	0x600
> +#define PFCEA_REG	0xA00

The kernel mostly uses lowercase for hex values.

> +
> +/* displacements from PORTn_base + 0x4000 */
> +#define PIBC_REG	0x000
> +#define PBDC_REG	0x100
> +#define PIPC_REG	0x200
> +
> +/* build register address using memory base, offset and bank number */
> +#define RZA1_ADDR(mem_base, reg, bank)	\
> +	((mem_base) + (reg) + (bank * 4))

You should put parentheses around bank:

	((mem_base) + (reg) + (bank) * 4)

to avoid side effects if the bank parameter isn't a constant (that's not the 
case here, but it's a good practice anyway).

> +
> +/* ------------------------------------------------------------------------
> + * pin enumeration
> + */
> +enum rza1_pins {
> +	/* Port 0 */
> +	RZ_PIN_NAME(0, 0) = 0, RZ_PIN_NAME(0, 1), RZ_PIN_NAME(0, 2),

Is there a need for = 0 ?

> +	RZ_PIN_NAME(0, 3), RZ_PIN_NAME(0, 4), RZ_PIN_NAME(0, 5),
> +
> +	/* Port 1 */
> +	RZ_PIN_NAME(1, 0), RZ_PIN_NAME(1, 1), RZ_PIN_NAME(1, 2),
> +	RZ_PIN_NAME(1, 3), RZ_PIN_NAME(1, 4), RZ_PIN_NAME(1, 5),
> +	RZ_PIN_NAME(1, 6), RZ_PIN_NAME(1, 7), RZ_PIN_NAME(1, 8),
> +	RZ_PIN_NAME(1, 9), RZ_PIN_NAME(1, 10), RZ_PIN_NAME(1, 11),
> +	RZ_PIN_NAME(1, 12), RZ_PIN_NAME(1, 13), RZ_PIN_NAME(1, 14),
> +	RZ_PIN_NAME(1, 15),
> +
> +	/* Port 2 */
> +	RZ_PIN_NAME(2, 0), RZ_PIN_NAME(2, 1), RZ_PIN_NAME(2, 2),
> +	RZ_PIN_NAME(2, 3), RZ_PIN_NAME(2, 4), RZ_PIN_NAME(2, 5),
> +	RZ_PIN_NAME(2, 6), RZ_PIN_NAME(2, 7), RZ_PIN_NAME(2, 8),
> +	RZ_PIN_NAME(2, 9), RZ_PIN_NAME(2, 10), RZ_PIN_NAME(2, 11),
> +	RZ_PIN_NAME(2, 12), RZ_PIN_NAME(2, 13), RZ_PIN_NAME(2, 14),
> +	RZ_PIN_NAME(2, 15),
> +
> +	/* Port 3 */
> +	RZ_PIN_NAME(3, 0), RZ_PIN_NAME(3, 1), RZ_PIN_NAME(3, 2),
> +	RZ_PIN_NAME(3, 3), RZ_PIN_NAME(3, 4), RZ_PIN_NAME(3, 5),
> +	RZ_PIN_NAME(3, 6), RZ_PIN_NAME(3, 7), RZ_PIN_NAME(3, 8),
> +	RZ_PIN_NAME(3, 9), RZ_PIN_NAME(3, 10), RZ_PIN_NAME(3, 11),
> +	RZ_PIN_NAME(3, 12), RZ_PIN_NAME(3, 13), RZ_PIN_NAME(3, 14),
> +	RZ_PIN_NAME(3, 15),
> +
> +	/* Port 4 */
> +	RZ_PIN_NAME(4, 0), RZ_PIN_NAME(4, 1), RZ_PIN_NAME(4, 2),
> +	RZ_PIN_NAME(4, 3), RZ_PIN_NAME(4, 4), RZ_PIN_NAME(4, 5),
> +	RZ_PIN_NAME(4, 6), RZ_PIN_NAME(4, 7), RZ_PIN_NAME(4, 8),
> +	RZ_PIN_NAME(4, 9), RZ_PIN_NAME(4, 10), RZ_PIN_NAME(4, 11),
> +	RZ_PIN_NAME(4, 12), RZ_PIN_NAME(4, 13), RZ_PIN_NAME(4, 14),
> +	RZ_PIN_NAME(4, 15),
> +
> +	/* Port 5 */
> +	RZ_PIN_NAME(5, 0), RZ_PIN_NAME(5, 1), RZ_PIN_NAME(5, 2),
> +	RZ_PIN_NAME(5, 3), RZ_PIN_NAME(5, 4), RZ_PIN_NAME(5, 5),
> +	RZ_PIN_NAME(5, 6), RZ_PIN_NAME(5, 7), RZ_PIN_NAME(5, 8),
> +	RZ_PIN_NAME(5, 9), RZ_PIN_NAME(5, 10),
> +
> +	/* Port 6 */
> +	RZ_PIN_NAME(6, 0), RZ_PIN_NAME(6, 1), RZ_PIN_NAME(6, 2),
> +	RZ_PIN_NAME(6, 3), RZ_PIN_NAME(6, 4), RZ_PIN_NAME(6, 5),
> +	RZ_PIN_NAME(6, 6), RZ_PIN_NAME(6, 7), RZ_PIN_NAME(6, 8),
> +	RZ_PIN_NAME(6, 9), RZ_PIN_NAME(6, 10), RZ_PIN_NAME(6, 11),
> +	RZ_PIN_NAME(6, 12), RZ_PIN_NAME(6, 13), RZ_PIN_NAME(6, 14),
> +	RZ_PIN_NAME(6, 15),
> +
> +	/* Port 7 */
> +	RZ_PIN_NAME(7, 0), RZ_PIN_NAME(7, 1), RZ_PIN_NAME(7, 2),
> +	RZ_PIN_NAME(7, 3), RZ_PIN_NAME(7, 4), RZ_PIN_NAME(7, 5),
> +	RZ_PIN_NAME(7, 6), RZ_PIN_NAME(7, 7), RZ_PIN_NAME(7, 8),
> +	RZ_PIN_NAME(7, 9), RZ_PIN_NAME(7, 10), RZ_PIN_NAME(7, 11),
> +	RZ_PIN_NAME(7, 12), RZ_PIN_NAME(7, 13), RZ_PIN_NAME(7, 14),
> +	RZ_PIN_NAME(7, 15),
> +
> +	/* Port 8 */
> +	RZ_PIN_NAME(8, 0), RZ_PIN_NAME(8, 1), RZ_PIN_NAME(8, 2),
> +	RZ_PIN_NAME(8, 3), RZ_PIN_NAME(8, 4), RZ_PIN_NAME(8, 5),
> +	RZ_PIN_NAME(8, 6), RZ_PIN_NAME(8, 7), RZ_PIN_NAME(8, 8),
> +	RZ_PIN_NAME(8, 9), RZ_PIN_NAME(8, 10), RZ_PIN_NAME(8, 11),
> +	RZ_PIN_NAME(8, 12), RZ_PIN_NAME(8, 13), RZ_PIN_NAME(8, 14),
> +	RZ_PIN_NAME(8, 15),
> +
> +	/* Port 9 */
> +	RZ_PIN_NAME(9, 0), RZ_PIN_NAME(9, 1), RZ_PIN_NAME(9, 2),
> +	RZ_PIN_NAME(9, 3), RZ_PIN_NAME(9, 4), RZ_PIN_NAME(9, 5),
> +	RZ_PIN_NAME(9, 6), RZ_PIN_NAME(9, 7),
> +
> +	/* Port 10 */
> +	RZ_PIN_NAME(10, 0), RZ_PIN_NAME(10, 1), RZ_PIN_NAME(10, 2),
> +	RZ_PIN_NAME(10, 3), RZ_PIN_NAME(10, 4), RZ_PIN_NAME(10, 5),
> +	RZ_PIN_NAME(10, 6), RZ_PIN_NAME(10, 7), RZ_PIN_NAME(10, 8),
> +	RZ_PIN_NAME(10, 9), RZ_PIN_NAME(10, 10), RZ_PIN_NAME(10, 11),
> +	RZ_PIN_NAME(10, 12), RZ_PIN_NAME(10, 13), RZ_PIN_NAME(10, 14),
> +	RZ_PIN_NAME(10, 15),
> +
> +	/* Port 10 */

s/Port 10/Port 11/

> +	RZ_PIN_NAME(11, 0), RZ_PIN_NAME(11, 1), RZ_PIN_NAME(11, 2),
> +	RZ_PIN_NAME(11, 3), RZ_PIN_NAME(11, 4), RZ_PIN_NAME(11, 5),
> +	RZ_PIN_NAME(11, 6), RZ_PIN_NAME(11, 7), RZ_PIN_NAME(11, 8),
> +	RZ_PIN_NAME(11, 9), RZ_PIN_NAME(11, 10), RZ_PIN_NAME(11, 11),
> +	RZ_PIN_NAME(11, 12), RZ_PIN_NAME(11, 13), RZ_PIN_NAME(11, 14),
> +	RZ_PIN_NAME(11, 15),
> +};
> +
> +struct rz_pin_desc pins[] = {
> +	/* Port 0 */
> +	RZ_PIN_DESC(0, 0), RZ_PIN_DESC(0, 1), RZ_PIN_DESC(0, 2),
> +	RZ_PIN_DESC(0, 3), RZ_PIN_DESC(0, 4), RZ_PIN_DESC(0, 5),
> +
> +	/* Port 1 */
> +	RZ_PIN_DESC(1, 0), RZ_PIN_DESC(1, 1), RZ_PIN_DESC(1, 2),
> +	RZ_PIN_DESC(1, 3), RZ_PIN_DESC(1, 4), RZ_PIN_DESC(1, 5),
> +	RZ_PIN_DESC(1, 6), RZ_PIN_DESC(1, 7), RZ_PIN_DESC(1, 8),
> +	RZ_PIN_DESC(1, 9), RZ_PIN_DESC(1, 10), RZ_PIN_DESC(1, 11),
> +	RZ_PIN_DESC(1, 12), RZ_PIN_DESC(1, 13), RZ_PIN_DESC(1, 14),
> +	RZ_PIN_DESC(1, 15),
> +
> +	/* Port 2 */
> +	RZ_PIN_DESC(2, 0), RZ_PIN_DESC(2, 1), RZ_PIN_DESC(2, 2),
> +	RZ_PIN_DESC(2, 3), RZ_PIN_DESC(2, 4), RZ_PIN_DESC(2, 5),
> +	RZ_PIN_DESC(2, 6), RZ_PIN_DESC(2, 7), RZ_PIN_DESC(2, 8),
> +	RZ_PIN_DESC(2, 9), RZ_PIN_DESC(2, 10), RZ_PIN_DESC(2, 11),
> +	RZ_PIN_DESC(2, 12), RZ_PIN_DESC(2, 13), RZ_PIN_DESC(2, 14),
> +	RZ_PIN_DESC(2, 15),
> +
> +	/* Port 3 */
> +	RZ_PIN_DESC(3, 0), RZ_PIN_DESC(3, 1), RZ_PIN_DESC(3, 2),
> +	RZ_PIN_DESC(3, 3), RZ_PIN_DESC(3, 4), RZ_PIN_DESC(3, 5),
> +	RZ_PIN_DESC(3, 6), RZ_PIN_DESC(3, 7), RZ_PIN_DESC(3, 8),
> +	RZ_PIN_DESC(3, 9), RZ_PIN_DESC(3, 10), RZ_PIN_DESC(3, 11),
> +	RZ_PIN_DESC(3, 12), RZ_PIN_DESC(3, 13), RZ_PIN_DESC(3, 14),
> +	RZ_PIN_DESC(3, 15),
> +
> +	/* Port 4 */
> +	RZ_PIN_DESC(4, 0), RZ_PIN_DESC(4, 1), RZ_PIN_DESC(4, 2),
> +	RZ_PIN_DESC(4, 3), RZ_PIN_DESC(4, 4), RZ_PIN_DESC(4, 5),
> +	RZ_PIN_DESC(4, 6), RZ_PIN_DESC(4, 7), RZ_PIN_DESC(4, 8),
> +	RZ_PIN_DESC(4, 9), RZ_PIN_DESC(4, 10), RZ_PIN_DESC(4, 11),
> +	RZ_PIN_DESC(4, 12), RZ_PIN_DESC(4, 13), RZ_PIN_DESC(4, 14),
> +	RZ_PIN_DESC(4, 15),
> +
> +	/* Port 5 */
> +	RZ_PIN_DESC(5, 0), RZ_PIN_DESC(5, 1), RZ_PIN_DESC(5, 2),
> +	RZ_PIN_DESC(5, 3), RZ_PIN_DESC(5, 4), RZ_PIN_DESC(5, 5),
> +	RZ_PIN_DESC(5, 6), RZ_PIN_DESC(5, 7), RZ_PIN_DESC(5, 8),
> +	RZ_PIN_DESC(5, 9), RZ_PIN_DESC(5, 10),
> +
> +	/* Port 6 */
> +	RZ_PIN_DESC(6, 0), RZ_PIN_DESC(6, 1), RZ_PIN_DESC(6, 2),
> +	RZ_PIN_DESC(6, 3), RZ_PIN_DESC(6, 4), RZ_PIN_DESC(6, 5),
> +	RZ_PIN_DESC(6, 6), RZ_PIN_DESC(6, 7), RZ_PIN_DESC(6, 8),
> +	RZ_PIN_DESC(6, 9), RZ_PIN_DESC(6, 10), RZ_PIN_DESC(6, 11),
> +	RZ_PIN_DESC(6, 12), RZ_PIN_DESC(6, 13), RZ_PIN_DESC(6, 14),
> +	RZ_PIN_DESC(6, 15),
> +
> +	/* Port 7 */
> +	RZ_PIN_DESC(7, 0), RZ_PIN_DESC(7, 1), RZ_PIN_DESC(7, 2),
> +	RZ_PIN_DESC(7, 3), RZ_PIN_DESC(7, 4), RZ_PIN_DESC(7, 5),
> +	RZ_PIN_DESC(7, 6), RZ_PIN_DESC(7, 7), RZ_PIN_DESC(7, 8),
> +	RZ_PIN_DESC(7, 9), RZ_PIN_DESC(7, 10), RZ_PIN_DESC(7, 11),
> +	RZ_PIN_DESC(7, 12), RZ_PIN_DESC(7, 13), RZ_PIN_DESC(7, 14),
> +	RZ_PIN_DESC(7, 15),
> +
> +	/* Port 8 */
> +	RZ_PIN_DESC(8, 0), RZ_PIN_DESC(8, 1), RZ_PIN_DESC(8, 2),
> +	RZ_PIN_DESC(8, 3), RZ_PIN_DESC(8, 4), RZ_PIN_DESC(8, 5),
> +	RZ_PIN_DESC(8, 6), RZ_PIN_DESC(8, 7), RZ_PIN_DESC(8, 8),
> +	RZ_PIN_DESC(8, 9), RZ_PIN_DESC(8, 10), RZ_PIN_DESC(8, 11),
> +	RZ_PIN_DESC(8, 12), RZ_PIN_DESC(8, 13), RZ_PIN_DESC(8, 14),
> +	RZ_PIN_DESC(8, 15),
> +
> +	/* Port 9 */
> +	RZ_PIN_DESC(9, 0), RZ_PIN_DESC(9, 1), RZ_PIN_DESC(9, 2),
> +	RZ_PIN_DESC(9, 3), RZ_PIN_DESC(9, 4), RZ_PIN_DESC(9, 5),
> +	RZ_PIN_DESC(9, 6), RZ_PIN_DESC(9, 7),
> +
> +	/* Port 10 */
> +	RZ_PIN_DESC(10, 0), RZ_PIN_DESC(10, 1), RZ_PIN_DESC(10, 2),
> +	RZ_PIN_DESC(10, 3), RZ_PIN_DESC(10, 4), RZ_PIN_DESC(10, 5),
> +	RZ_PIN_DESC(10, 6), RZ_PIN_DESC(10, 7), RZ_PIN_DESC(10, 8),
> +	RZ_PIN_DESC(10, 9), RZ_PIN_DESC(10, 10), RZ_PIN_DESC(10, 11),
> +	RZ_PIN_DESC(10, 12), RZ_PIN_DESC(10, 13), RZ_PIN_DESC(10, 14),
> +	RZ_PIN_DESC(10, 15),
> +
> +	/* Port 11 */
> +	RZ_PIN_DESC(11, 0), RZ_PIN_DESC(11, 1), RZ_PIN_DESC(11, 2),
> +	RZ_PIN_DESC(11, 3), RZ_PIN_DESC(11, 4), RZ_PIN_DESC(11, 5),
> +	RZ_PIN_DESC(11, 6), RZ_PIN_DESC(11, 7), RZ_PIN_DESC(11, 8),
> +	RZ_PIN_DESC(11, 9), RZ_PIN_DESC(11, 10), RZ_PIN_DESC(11, 11),
> +	RZ_PIN_DESC(11, 12), RZ_PIN_DESC(11, 13), RZ_PIN_DESC(11, 14),
> +	RZ_PIN_DESC(11, 15),
> +};
> +
> +/* ------------------------------------------------------------------------
> + * SoC operations
> + */
> +
> +static inline void rza1_set_bit(struct rz_pinctrl_res *res, int reg,
> +				int bank, int pin, int set)
> +{
> +	void __iomem *mem = RZA1_ADDR(res->base, reg, bank);
> +	u16 val = set ? ioread16(mem) | 1 << pin :
> +			ioread16(mem) & ~(1 << pin);

Is the compiler smart enough to avoid two calls to ioread16() ? If not, how 
about

	u16 val = ioread16(mem);

	if (set)
		val |= 1 << pin;
	else
		val &= ~(1 << pin);

> +#ifdef RZA1_REG_DBG
> +	u16 temp = ioread16(mem);
> +
> +	pr_err("%p %p %p - %4x %4x\n",
> +	       (void *)res->start, res->base, mem, temp, val);
> +#endif

Do you really need this in the driver, or was it useful during initial 
development only ?

> +	iowrite16(val, mem);

Is there a lock in the call stack that prevents a race condition here ? If not 
I'd add a spinlock around the read and write.

> +}
> +
> +/**
> + * rza1_set_mux() - Configure alternate function settings for the selected
> pin
> + *
> + * @pinctrl: RZ pincontroller
> + * @pin: Pin to configure

The parameter is named pin_desc. 

> + * @mux_mode: Alternate function number
> + *
> + * @return: 0 for success; != 0 otherwise
> + */
> +static int rza1_set_mux(struct rz_pinctrl_dev *pinctrl,
> +			struct rz_pin_desc *pin_desc, unsigned int mux_mode)
> +{
> +	struct rz_pinctrl_res *res;
> +	unsigned int bank = pin_desc->bank,
> +		     pin = pin_desc->pin;

One declaration per line please, especially when initializing the variables at 
declaration time.

	unsigned int bank = pin_desc->bank;
	unsigned int pin = pin_desc->pin;

> +
> +	/*
> +	 * disable input buffer and bi-control direction before entering
> +	 * alternate mode and let alternate function drive the IO mode by
> +	 * setting PIPCn to 1

Sentences start with a capital letter and end with a period. Or a smiley in e-
mails, but usually not in driver code ;-) This comment applies to the whole 
patch series.

> +	 */
> +	res = &pinctrl->res[MEM_RES_HIGH];
> +	rza1_set_bit(res, PIBC_REG, bank, pin, 0);
> +	rza1_set_bit(res, PBDC_REG, bank, pin, 0);
> +	rza1_set_bit(res, PIPC_REG, bank, pin, 1);
> +
> +	/* TODO:
> +	 * all alternate functions except a few (3) need PIPCn = 1;
> +	 * find a way to identify those 3 functions, do not set PIPCn to 1
> +	 * and set PMn according to some flag passed as parameter from DTS

Nitpicking, I'd say "from DT", DTS is the source format.

> +	 */
> +
> +	/*
> +	 * enable alternate function mode and select it.
> +	 *
> +	 * ----------------------------------------------------
> +	 * Alternate mode selection table:
> +	 *
> +	 * PMC	PFC	PFCE	PFCAE	AlternateMode mux_mode
> +	 * 1	0	0	0	1		0
> +	 * 1	1	0	0	2		1
> +	 * 1	0	1	0	3		2
> +	 * 1	1	1	0	4		3
> +	 * 1	0	0	1	5		4
> +	 * 1	1	0	1	6		5
> +	 * 1	0	1	1	7		6
> +	 * 1	1	1	1	8		7
> +	 * ----------------------------------------------------
> +	 */
> +	res = &pinctrl->res[MEM_RES_LOW];
> +	rza1_set_bit(res, PMC_REG, bank, pin, 1);
> +	rza1_set_bit(res, PFC_REG, bank, pin, mux_mode & 0x1);
> +	rza1_set_bit(res, PFCE_REG, bank, pin, mux_mode & 0x2);
> +	rza1_set_bit(res, PFCEA_REG, bank, pin, mux_mode & 0x4);
> +
> +	return 0;
> +}
> +
> +static struct rz_pinctrl_ops rza1_pinctrl_ops = {
> +	.set_mux = rza1_set_mux,
> +};
> +
> +static struct rz_pinctrl_info rza1_info = {
> +	.ops = &rza1_pinctrl_ops,
> +
> +	.npins = ARRAY_SIZE(pins),
> +	.pins = pins,
> +};

You should make those structures static const (which will require updating 
patch 1/5). It's especially important to make ops structures const for 
security reasons.

> +static const struct of_device_id rza1_pinctrl_of_match[] = {
> +	{ .compatible = "renesas,rza1-pinctrl", },
> +	{ }
> +};

Drivers usually have a corresponding MODULE_DEVICE_TABLE(). As this code can't 
be compiled as a module I suppose it doesn't matter much.

> +static int rza1_pinctrl_probe(struct platform_device *pdev)
> +{
> +	return rz_pinctrl_probe(pdev, &rza1_info);
> +}
> +
> +static int rza1_pinctrl_remove(struct platform_device *pdev)
> +{
> +	rz_pinctrl_remove(pdev);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver rza1_pinctrl_driver = {
> +	.driver = {
> +		.name = "rza1_pinctrl_driver",

No need for "_driver" here, "rza1_pinctrl" will do.

I'm also never sure whether we should use _ or - in driver names.

> +		.of_match_table = rza1_pinctrl_of_match,
> +	},
> +	.probe = rza1_pinctrl_probe,
> +	.remove = rza1_pinctrl_remove,
> +};
> +
> +static int __init rza1_pinctrl_init(void)
> +{
> +	return platform_driver_register(&rza1_pinctrl_driver);
> +}
> +core_initcall(rza1_pinctrl_init);
> +
> +MODULE_AUTHOR("Jacopo Mondi <jacopo+renesas@jmondi.org");
> +MODULE_DESCRIPTION("Pinctl driver for Reneas RZ/A1 SoC");

s/Pinctl/Pinctrl/ (or better, "Pin controller" ?)

> +MODULE_LICENSE("GPL v2");

-- 
Regards,

Laurent Pinchart
