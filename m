From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH V2 2/2] pinctrl: intel: fix bug of register offset
 calculation
Date: Wed, 25 Nov 2015 10:40:18 +0200
Message-ID: <20151125084018.GT1587@lahna.fi.intel.com>
References: <1448451408-55078-1-git-send-email-qipeng.zha@intel.com>
 <1448451408-55078-2-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:20420 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753738AbbKYIm3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 25 Nov 2015 03:42:29 -0500
Content-Disposition: inline
In-Reply-To: <1448451408-55078-2-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Qipeng Zha <qipeng.zha@intel.com>
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, qi.zheng@intel.com

On Wed, Nov 25, 2015 at 07:36:48PM +0800, Qipeng Zha wrote:
> The group size for registers PADCFGLOCK, HOSTSW_OWN, GPI_IS,
> GPI_IE, are not 24 for Broxton, Add a parameter to allow
> different platform to set correct value.
> 
> Signed-off-by: Qi Zheng <qi.zheng@intel.com>
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-broxton.c      |  1 +
>  drivers/pinctrl/intel/pinctrl-intel.c        | 45 +++++++++++++++-------------
>  drivers/pinctrl/intel/pinctrl-intel.h        |  3 ++
>  drivers/pinctrl/intel/pinctrl-sunrisepoint.c |  1 +
>  4 files changed, 30 insertions(+), 20 deletions(-)
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
> index e3f580b..8b88b60 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -25,9 +25,6 @@
>  
>  #include "pinctrl-intel.h"
>  
> -/* Maximum number of pads in each group */
> -#define NPADS_IN_GPP			24
> -
>  /* Offset from regs */
>  #define PADBAR				0x00c
>  #define GPI_IS				0x100
> @@ -108,6 +105,7 @@ struct intel_pinctrl {
>  
>  #define gpiochip_to_pinctrl(c)	container_of(c, struct intel_pinctrl, chip)
>  #define pin_to_padno(c, p)	((p) - (c)->pin_base)
> +#define npads_in_gpp(c)		((c)->gpp_size)

This is pretty useless macro. You can just use community->gpp_size
everywhere. Up to you.

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
