From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 4/8] drivers/mfd: Add PWM cell device for Crystalcove PMIC
Date: Wed, 29 Apr 2015 15:25:27 +0100
Message-ID: <20150429142527.GT9169@x1>
References: <1430316005-16480-1-git-send-email-shobhit.kumar@intel.com>
 <1430316005-16480-5-git-send-email-shobhit.kumar@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:36754 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966117AbbD2OZd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Apr 2015 10:25:33 -0400
Received: by wgen6 with SMTP id n6so30177316wge.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2015 07:25:32 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1430316005-16480-5-git-send-email-shobhit.kumar@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Shobhit Kumar <shobhit.kumar@intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>, linux-pwm <linux-pwm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Samuel Ortiz <sameo@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, Jani Nikula <jani.nikula@intel.com>, Povilas Staniulis <wdmonster@gmail.com>, Chih-Wei Huang <cwhuang@android-x86.org>

On Wed, 29 Apr 2015, Shobhit Kumar wrote:

> Needed for PWM control suuported by the PMIC
>=20
> CC: Samuel Ortiz <sameo@linux.intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Shobhit Kumar <shobhit.kumar@intel.com>
> ---
>  drivers/mfd/intel_soc_pmic_crc.c | 3 +++
>  1 file changed, 3 insertions(+)

=46or my own reference:
  Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mfd/intel_soc_pmic_crc.c b/drivers/mfd/intel_soc=
_pmic_crc.c
> index 4cc1b32..8839e25 100644
> --- a/drivers/mfd/intel_soc_pmic_crc.c
> +++ b/drivers/mfd/intel_soc_pmic_crc.c
> @@ -109,6 +109,9 @@ static struct mfd_cell crystal_cove_dev[] =3D {
>  	{
>  		.name =3D "crystal_cove_pmic",
>  	},
> +	{
> +		.name =3D "crystal_cove_pwm",
> +	},
>  };
> =20
>  static const struct regmap_config crystal_cove_regmap_config =3D {

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
