From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH] gpio: group port-mapped I/O drivers in a menu
Date: Fri, 30 Oct 2015 10:47:27 +0100
Message-ID: <20151030094727.GG4665@kw.sim.vm.gnt>
References: <1446197896-5383-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BzCohdixPhurzSK4"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:39229 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1030642AbbJ3Jpz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 30 Oct 2015 05:45:55 -0400
Content-Disposition: inline
In-Reply-To: <1446197896-5383-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, William Breathitt Gray <vilhelm.gray@gmail.com>, Andreas Bofjall <andreas@gazonk.org>, Diego Elio =?utf-8?Q?Petten=C3=B2?= <flameeyes@flameeyes.eu>, Daniel Krueger <daniel.krueger@systec-electronic.com>, Bruno Randolf <br1@einfach.org>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>


--BzCohdixPhurzSK4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2015 at 10:38:16AM +0100, Linus Walleij wrote:
> Create a Kconfig submenu for drivers using X86 port-mapped I/O
> and depend on X86 for this.
>=20
> Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: William Breathitt Gray <vilhelm.gray@gmail.com>
> Cc: Andreas Bofjall <andreas@gazonk.org>
> Cc: Simon Guinot <simon.guinot@sequanux.org>
> Cc: Diego Elio Petten=C3=B2 <flameeyes@flameeyes.eu>
> Cc: Daniel Krueger <daniel.krueger@systec-electronic.com>
> Cc: Bruno Randolf <br1@einfach.org>
> Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/Kconfig | 155 ++++++++++++++++++++++++++-------------------=
------
>  1 file changed, 78 insertions(+), 77 deletions(-)

Hi Linus,

Acked-by: Simon Guinot <simon.guinot@sequanux.org>

Simon

>=20
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index dbb171d46a48..d20644b9e5b9 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -183,16 +183,6 @@ config GPIO_ETRAXFS
>  	help
>  	  Say yes here to support the GPIO controller on Axis ETRAX FS SoCs.
> =20
> -config GPIO_F7188X
> -	tristate "F71869, F71869A, F71882FG and F71889F GPIO support"
> -	depends on X86
> -	help
> -	  This option enables support for GPIOs found on Fintek Super-I/O
> -	  chips F71869, F71869A, F71882FG and F71889F.
> -
> -	  To compile this driver as a module, choose M here: the module will
> -	  be called f7188x-gpio.
> -
>  config GPIO_GE_FPGA
>  	bool "GE FPGA based GPIO"
>  	depends on GE_FPGA
> @@ -242,18 +232,6 @@ config GPIO_IOP
> =20
>  	  If unsure, say N.
> =20
> -config GPIO_IT87
> -	tristate "IT87xx GPIO support"
> -	depends on X86 # unconditional access to IO space.
> -	help
> -	  Say yes here to support GPIO functionality of IT87xx Super I/O chips.
> -
> -	  This driver is tested with ITE IT8728 and IT8732 Super I/O chips, and
> -	  supports the IT8761E Super I/O chip as well.
> -
> -	  To compile this driver as a module, choose M here: the module will
> -	  be called gpio_it87
> -
>  config GPIO_LOONGSON
>  	bool "Loongson-2/3 GPIO support"
>  	depends on CPU_LOONGSON2 || CPU_LOONGSON3
> @@ -373,42 +351,6 @@ config GPIO_SAMSUNG
>  	  Legacy GPIO support. Use only for platforms without support for
>  	  pinctrl.
> =20
> -config GPIO_SCH
> -	tristate "Intel SCH/TunnelCreek/Centerton/Quark X1000 GPIO"
> -	depends on PCI && X86
> -	select MFD_CORE
> -	select LPC_SCH
> -	help
> -	  Say yes here to support GPIO interface on Intel Poulsbo SCH,
> -	  Intel Tunnel Creek processor, Intel Centerton processor or
> -	  Intel Quark X1000 SoC.
> -
> -	  The Intel SCH contains a total of 14 GPIO pins. Ten GPIOs are
> -	  powered by the core power rail and are turned off during sleep
> -	  modes (S3 and higher). The remaining four GPIOs are powered by
> -	  the Intel SCH suspend power supply. These GPIOs remain
> -	  active during S3. The suspend powered GPIOs can be used to wake the
> -	  system from the Suspend-to-RAM state.
> -
> -	  The Intel Tunnel Creek processor has 5 GPIOs powered by the
> -	  core power rail and 9 from suspend power supply.
> -
> -	  The Intel Centerton processor has a total of 30 GPIO pins.
> -	  Twenty-one are powered by the core power rail and 9 from the
> -	  suspend power supply.
> -
> -	  The Intel Quark X1000 SoC has 2 GPIOs powered by the core
> -	  power well and 6 from the suspend power well.
> -
> -config GPIO_SCH311X
> -	tristate "SMSC SCH311x SuperI/O GPIO"
> -	help
> -	  Driver to enable the GPIOs found on SMSC SMSC SCH3112, SCH3114 and
> -	  SCH3116 "Super I/O" chipsets.
> -
> -	  To compile this driver as a module, choose M here: the module will
> -	  be called gpio-sch311x.
> -
>  config GPIO_SPEAR_SPICS
>  	bool "ST SPEAr13xx SPI Chip Select as GPIO support"
>  	depends on PLAT_SPEAR
> @@ -445,15 +387,6 @@ config GPIO_TB10X
>  	select GENERIC_IRQ_CHIP
>  	select OF_GPIO
> =20
> -config GPIO_TS5500
> -	tristate "TS-5500 DIO blocks and compatibles"
> -	depends on TS5500 || COMPILE_TEST
> -	help
> -	  This driver supports Digital I/O exposed by pin blocks found on some
> -	  Technologic Systems platforms. It includes, but is not limited to, 3
> -	  blocks of the TS-5500: DIO1, DIO2 and the LCD port, and the TS-5600
> -	  LCD port.
> -
>  config GPIO_TZ1090
>  	bool "Toumaz Xenif TZ1090 GPIO support"
>  	depends on SOC_TZ1090
> @@ -552,6 +485,84 @@ config GPIO_ZYNQ
> =20
>  endmenu
> =20
> +menu "Port-mapped I/O GPIO drivers"
> +	depends on X86
> +
> +config GPIO_104_IDIO_16
> +	tristate "ACCES 104-IDIO-16 GPIO support"
> +	depends on X86
> +	help
> +	  Enables GPIO support for the ACCES 104-IDIO-16 family.
> +
> +config GPIO_F7188X
> +	tristate "F71869, F71869A, F71882FG and F71889F GPIO support"
> +	depends on X86
> +	help
> +	  This option enables support for GPIOs found on Fintek Super-I/O
> +	  chips F71869, F71869A, F71882FG and F71889F.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called f7188x-gpio.
> +
> +config GPIO_IT87
> +	tristate "IT87xx GPIO support"
> +	depends on X86 # unconditional access to IO space.
> +	help
> +	  Say yes here to support GPIO functionality of IT87xx Super I/O chips.
> +
> +	  This driver is tested with ITE IT8728 and IT8732 Super I/O chips, and
> +	  supports the IT8761E Super I/O chip as well.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called gpio_it87
> +
> +config GPIO_SCH
> +	tristate "Intel SCH/TunnelCreek/Centerton/Quark X1000 GPIO"
> +	depends on PCI && X86
> +	select MFD_CORE
> +	select LPC_SCH
> +	help
> +	  Say yes here to support GPIO interface on Intel Poulsbo SCH,
> +	  Intel Tunnel Creek processor, Intel Centerton processor or
> +	  Intel Quark X1000 SoC.
> +
> +	  The Intel SCH contains a total of 14 GPIO pins. Ten GPIOs are
> +	  powered by the core power rail and are turned off during sleep
> +	  modes (S3 and higher). The remaining four GPIOs are powered by
> +	  the Intel SCH suspend power supply. These GPIOs remain
> +	  active during S3. The suspend powered GPIOs can be used to wake the
> +	  system from the Suspend-to-RAM state.
> +
> +	  The Intel Tunnel Creek processor has 5 GPIOs powered by the
> +	  core power rail and 9 from suspend power supply.
> +
> +	  The Intel Centerton processor has a total of 30 GPIO pins.
> +	  Twenty-one are powered by the core power rail and 9 from the
> +	  suspend power supply.
> +
> +	  The Intel Quark X1000 SoC has 2 GPIOs powered by the core
> +	  power well and 6 from the suspend power well.
> +
> +config GPIO_SCH311X
> +	tristate "SMSC SCH311x SuperI/O GPIO"
> +	help
> +	  Driver to enable the GPIOs found on SMSC SMSC SCH3112, SCH3114 and
> +	  SCH3116 "Super I/O" chipsets.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called gpio-sch311x.
> +
> +config GPIO_TS5500
> +	tristate "TS-5500 DIO blocks and compatibles"
> +	depends on TS5500 || COMPILE_TEST
> +	help
> +	  This driver supports Digital I/O exposed by pin blocks found on some
> +	  Technologic Systems platforms. It includes, but is not limited to, 3
> +	  blocks of the TS-5500: DIO1, DIO2 and the LCD port, and the TS-5600
> +	  LCD port.
> +
> +endmenu
> +
>  menu "I2C GPIO expanders"
>  	depends on I2C
> =20
> @@ -689,16 +700,6 @@ config GPIO_SX150X
> =20
>  endmenu
> =20
> -menu "ISA GPIO drivers"
> -
> -config GPIO_104_IDIO_16
> -	tristate "ACCES 104-IDIO-16 GPIO support"
> -	depends on X86
> -	help
> -	  Enables GPIO support for the ACCES 104-IDIO-16 family.
> -
> -endmenu
> -
>  menu "MFD GPIO expanders"
> =20
>  config GPIO_ADP5520
> --=20
> 2.4.3

--BzCohdixPhurzSK4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlYzPK8ACgkQgtp0PDeOcDoTewCgkK6X/LcTlTEmH4GIsmAlW0ku
A7gAoIizr3YYM0itp5ybYb2wWh/3uH8O
=/eGF
-----END PGP SIGNATURE-----

--BzCohdixPhurzSK4--
