From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 11/27] mfd: Allow compile test of GPIO consumers if
 !GPIOLIB
Date: Thu, 7 May 2015 08:37:36 +0100
Message-ID: <20150507073736.GB12484@x1>
References: <1430836404-15513-1-git-send-email-geert@linux-m68k.org>
 <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
 <1430843563-18615-11-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1430843563-18615-11-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, 05 May 2015, Geert Uytterhoeven wrote:

> The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB =
is
> not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consu=
mer
> functionality only, can still be compiled if GPIOLIB is not enabled.
>=20
> Relax the dependency on GPIOLIB if COMPILE_TEST is enabled, where
> appropriate.
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Samuel Ortiz <sameo@linux.intel.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/mfd/Kconfig | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied, thanks.

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 7eaa5488892524ba..3ee86248aa7cad8b 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -52,7 +52,8 @@ config PMIC_ADP5520
>  config MFD_AAT2870_CORE
>  	bool "AnalogicTech AAT2870"
>  	select MFD_CORE
> -	depends on I2C=3Dy && GPIOLIB
> +	depends on I2C=3Dy
> +	depends on GPIOLIB || COMPILE_TEST
>  	help
>  	  If you say yes here you get support for the AAT2870.
>  	  This driver provides common support for accessing the device,
> @@ -1115,7 +1116,8 @@ config MFD_TPS6586X
> =20
>  config MFD_TPS65910
>  	bool "TI TPS65910 Power Management chip"
> -	depends on I2C=3Dy && GPIOLIB
> +	depends on I2C=3Dy
> +	depends on GPIOLIB || COMPILE_TEST
>  	select MFD_CORE
>  	select REGMAP_I2C
>  	select REGMAP_IRQ

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
