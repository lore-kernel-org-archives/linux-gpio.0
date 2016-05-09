From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake
 GPIO pinctrl in non-ACPI system
Date: Mon, 9 May 2016 13:25:06 +0100
Message-ID: <20160509122506.GI8324@dell>
References: <1461650991-15185-1-git-send-email-jui.nee.tan@intel.com>
 <1461650991-15185-4-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461650991-15185-4-git-send-email-jui.nee.tan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>
Cc: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, weifeng.voon@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com
List-Id: linux-gpio@vger.kernel.org

On Tue, 26 Apr 2016, Tan Jui Nee wrote:

> This driver uses the P2SB hide/unhide mechanism cooperatively
> to pass the PCI BAR address to the gpio platform driver.
>=20
> Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
> ---
>  drivers/mfd/Kconfig   |   3 +-
>  drivers/mfd/lpc_ich.c | 128 ++++++++++++++++++++++++++++++++++++++++=
++++++++++
>  2 files changed, 130 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index eea61e3..54e595c 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -359,8 +359,9 @@ config MFD_INTEL_QUARK_I2C_GPIO
> =20
>  config LPC_ICH
>  	tristate "Intel ICH LPC"
> -	depends on PCI
> +	depends on X86 && PCI
>  	select MFD_CORE
> +	select P2SB if X86_INTEL_NON_ACPI
>  	help
>  	  The LPC bridge function of the Intel ICH provides support for
>  	  many functional units. This driver provides needed support for
> diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
> index bd3aa45..5d0cc9b 100644
> --- a/drivers/mfd/lpc_ich.c
> +++ b/drivers/mfd/lpc_ich.c
> @@ -68,6 +68,10 @@
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/lpc_ich.h>
>  #include <linux/platform_data/itco_wdt.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/types.h>
> +
> +#include <asm/p2sb.h>
> =20
>  #define ACPIBASE		0x40
>  #define ACPIBASE_GPE_OFF	0x28
> @@ -94,6 +98,19 @@
>  #define wdt_mem_res(i) wdt_res(ICH_RES_MEM_OFF, i)
>  #define wdt_res(b, i) (&wdt_ich_res[(b) + (i)])
> =20
> +/* Offset data for Apollo Lake GPIO communities */
> +#define APL_GPIO_SOUTHWEST_OFFSET	0xc0
> +#define APL_GPIO_NORTHWEST_OFFSET	0xc4
> +#define APL_GPIO_NORTH_OFFSET		0xc5
> +#define APL_GPIO_WEST_OFFSET		0xc7
> +
> +#define APL_GPIO_SOUTHWEST_END		(43 * 0x8)
> +#define APL_GPIO_NORTHWEST_END		(77 * 0x8)
> +#define APL_GPIO_NORTH_END		(90 * 0x8)
> +#define APL_GPIO_WEST_END		(47 * 0x8)
> +
> +#define APL_GPIO_IRQ 14
> +
>  struct lpc_ich_priv {
>  	int chipset;
> =20
> @@ -133,6 +150,50 @@ static struct resource gpio_ich_res[] =3D {
>  	},
>  };
> =20
> +#ifdef CONFIG_X86_INTEL_NON_ACPI

No, thank you.  No unnecessary #ifery.

> +static struct resource apl_gpio_io_res[][2] =3D {

The "[][2]" is a warning sign to me.

> +	{
> +		{
> +			.start =3D APL_GPIO_NORTH_OFFSET << 16,
> +			.end =3D (APL_GPIO_NORTH_OFFSET << 16)
> +				+ APL_GPIO_NORTH_END,

This is a strange (and complicated) way of calculating register
addresses.  Please simplify.  If in doubt, check out how other
drivers/platforms handle it.

> +		},
> +	},
> +	{
> +		{
> +			.start =3D APL_GPIO_NORTHWEST_OFFSET << 16,
> +			.end =3D (APL_GPIO_NORTHWEST_OFFSET << 16)
> +				+ APL_GPIO_NORTHWEST_END,
> +		},
> +	},
> +	{
> +		{
> +			.start =3D APL_GPIO_WEST_OFFSET << 16,
> +			.end =3D (APL_GPIO_WEST_OFFSET << 16)
> +				+ APL_GPIO_WEST_END,
> +		},
> +	},
> +	{
> +		{
> +			.start =3D APL_GPIO_SOUTHWEST_OFFSET << 16,
> +			.end =3D (APL_GPIO_SOUTHWEST_OFFSET << 16)
> +				+ APL_GPIO_SOUTHWEST_END,
> +		},
> +	},
> +};

Use the DEFINE_RES_* defines from include/linux/ioport.h.

> +static struct pinctrl_pin_desc apl_pinctrl_pdata;

No externs.  Have you ran this through checkpatch.pl?

I don't even see this struct.  Where is it?

> +static struct mfd_cell apl_gpio_devices =3D {
> +	.name =3D "apl-pinctrl",
> +	.num_resources =3D ARRAY_SIZE(apl_gpio_io_res),
> +	.resources =3D apl_gpio_io_res[1],
> +	.pdata_size =3D sizeof(apl_pinctrl_pdata),
> +	.platform_data =3D &apl_pinctrl_pdata,
> +	.ignore_resource_conflicts =3D true,
> +};
> +#endif /* CONFIG_X86_INTEL_NON_ACPI */
> +
>  static struct mfd_cell lpc_ich_wdt_cell =3D {
>  	.name =3D "iTCO_wdt",
>  	.num_resources =3D ARRAY_SIZE(wdt_ich_res),
> @@ -216,6 +277,7 @@ enum lpc_chipsets {
>  	LPC_BRASWELL,	/* Braswell SoC */
>  	LPC_LEWISBURG,	/* Lewisburg */
>  	LPC_9S,		/* 9 Series */
> +	LPC_APL,	/* Apollo Lake SoC */
>  };
> =20
>  static struct lpc_ich_info lpc_chipset_info[] =3D {
> @@ -531,6 +593,10 @@ static struct lpc_ich_info lpc_chipset_info[] =3D=
 {
>  		.name =3D "9 Series",
>  		.iTCO_version =3D 2,
>  	},
> +	[LPC_APL]  =3D {
> +		.name =3D "Apollo Lake SoC",
> +		.iTCO_version =3D 5,
> +	},
>  };
> =20
>  /*
> @@ -679,6 +745,7 @@ static const struct pci_device_id lpc_ich_ids[] =3D=
 {
>  	{ PCI_VDEVICE(INTEL, 0x3b14), LPC_3420},
>  	{ PCI_VDEVICE(INTEL, 0x3b16), LPC_3450},
>  	{ PCI_VDEVICE(INTEL, 0x5031), LPC_EP80579},
> +	{ PCI_VDEVICE(INTEL, 0x5ae8), LPC_APL},
>  	{ PCI_VDEVICE(INTEL, 0x8c40), LPC_LPT},
>  	{ PCI_VDEVICE(INTEL, 0x8c41), LPC_LPT},
>  	{ PCI_VDEVICE(INTEL, 0x8c42), LPC_LPT},
> @@ -1050,6 +1117,64 @@ wdt_done:
>  	return ret;
>  }
> =20
> +#ifdef CONFIG_X86_INTEL_NON_ACPI
> +static int lpc_ich_misc(struct pci_dev *dev, enum lpc_chipsets chips=
et)
> +{
> +	unsigned int apl_p2sb =3D PCI_DEVFN(0x0d, 0);

No magic numbers?  Please define them.

> +	unsigned int i;
> +	int ret;
> +
> +	switch (chipset) {

Why a switch?  This would look better if you:

if (chipset !=3D LPC_APL)
   return -ENODEV;

=2E.. until you actually *need* a switch.

> +	case LPC_APL:
> +		/*
> +		 * Apollo lake, has not 1, but 4 gpio controllers,
> +		 * handle it a bit differently.
> +		 */
> +
> +		for (i =3D 0; i < ARRAY_SIZE(apl_gpio_io_res); i++) {
> +			struct resource *res =3D apl_gpio_io_res[i];
> +
> +			apl_gpio_devices.resources =3D res;
> +
> +			/* Fill MEM resource */
> +			ret =3D p2sb_bar(dev, apl_p2sb, res++);
> +			if (ret)
> +				goto warn_continue;

What does this do?

> +			/* Fill IRQ resource */
> +			res->start =3D APL_GPIO_IRQ;
> +			res->end =3D res->start;
> +			res->flags =3D IORESOURCE_IRQ;
> +
> +			apl_pinctrl_pdata.name =3D kasprintf(GFP_KERNEL, "%u",
> +				i + 1);

All this to call a device "1", "2", etc?

> +			if (apl_pinctrl_pdata.name)
> +				ret =3D mfd_add_devices(&dev->dev, i,
> +					&apl_gpio_devices, 1, NULL, 0, NULL);

mfd_add_devices() is designed to take a group of devices and register
them all for you.  Calling it once for each separate device you have
is not correct.

> +			else
> +				ret =3D -ENOMEM;
> +
> +warn_continue:
> +			if (ret)
> +				dev_warn(&dev->dev,
> +					"Failed to add Apollo Lake GPIO %s: %d\n",
> +						apl_pinctrl_pdata.name, ret);
> +
> +			kfree(apl_pinctrl_pdata.name);
> +		}

This code just looks like one big hack to me.

Why don't you just declare the correct amount of resources in
apl_gpio_devices instead of this hodge-podge?

> +		break;
> +	default:
> +		return -ENODEV;
> +	}
> +	return 0;
> +}
> +#else
> +static inline int lpc_ich_misc(struct pci_dev *dev, enum lpc_chipset=
s chipset)
> +{
> +	return -ENODEV;
> +}
> +#endif /* CONFIG_X86_INTEL_NON_ACPI */

Don't do this in drivers.

>  static int lpc_ich_probe(struct pci_dev *dev,
>  				const struct pci_device_id *id)
>  {
> @@ -1093,6 +1218,9 @@ static int lpc_ich_probe(struct pci_dev *dev,
>  			cell_added =3D true;
>  	}
> =20
> +	if (!lpc_ich_misc(dev, priv->chipset))
> +		cell_added =3D true;
> +
>  	/*
>  	 * We only care if at least one or none of the cells registered
>  	 * successfully.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
