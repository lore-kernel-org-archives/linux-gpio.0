From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH] pinctrl: intel: fix bug of register offset calculation
Date: Mon, 23 Nov 2015 10:17:55 +0200
Message-ID: <20151123081755.GS1604@lahna.fi.intel.com>
References: <1448278093-16515-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:59660 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753499AbbKWISN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 23 Nov 2015 03:18:13 -0500
Content-Disposition: inline
In-Reply-To: <1448278093-16515-1-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Qipeng Zha <qipeng.zha@intel.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, qi.zheng@intel.com

On Mon, Nov 23, 2015 at 07:28:13PM +0800, Qipeng Zha wrote:
> From: zhengq <qi.zheng@intel.com>
> 
> The group size for registers PADCFGLOCK, HOSTSW_OWN,
> GPI_IS, GPI_IE, are not always 24. Add a parameter to let
> the platform has the chance to reset the value.
> Also fix the bug of register PAD_OWN offset calculation.

Should that be a separate patch?

> 
> Signed-off-by: Qi Zheng <qi.zheng@intel.com>
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-broxton.c |  1 +
>  drivers/pinctrl/intel/pinctrl-intel.c   | 57 +++++++++++++++++++++------------
>  drivers/pinctrl/intel/pinctrl-intel.h   |  3 ++
>  3 files changed, 40 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-broxton.c b/drivers/pinctrl/intel/pinctrl-broxton.c
> index e42d5d4..5979d38 100644
> --- a/drivers/pinctrl/intel/pinctrl-broxton.c
> +++ b/drivers/pinctrl/intel/pinctrl-broxton.c
> @@ -28,6 +28,7 @@
>  		.padcfglock_offset = BXT_PADCFGLOCK,	\
>  		.hostown_offset = BXT_HOSTSW_OWN,	\
>  		.ie_offset = BXT_GPI_IE,		\
> +		.gpp_size = 32,                         \
>  		.pin_base = (s),			\
>  		.npins = ((e) - (s) + 1),		\
>  	}
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 392e28d..d1e790a 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -37,6 +37,7 @@
>  #define PADOWN_BITS			4
>  #define PADOWN_SHIFT(p)			((p) % 8 * PADOWN_BITS)
>  #define PADOWN_MASK(p)			(0xf << PADOWN_SHIFT(p))
> +#define PADOWN_GPP(p)			((p)/8)

Make that ((p) / 8).

>  
>  /* Offset from pad_regs */
>  #define PADCFG0				0x000
> @@ -108,6 +109,14 @@ struct intel_pinctrl {
>  #define gpiochip_to_pinctrl(c)	container_of(c, struct intel_pinctrl, chip)
>  #define pin_to_padno(c, p)	((p) - (c)->pin_base)
>  
> +static unsigned intel_npads_in_gpp(const struct intel_community *community)
> +{
> +	if (!community || !community->gpp_size)
> +		return NPADS_IN_GPP;
> +	else
> +		return community->gpp_size;
> +}

Instead of this, let's just add correct gpp_size to sunrisepoint part
and drop the above function and NPADS_IN_GPP macro.

Otherwise this looks good to me, thanks.
