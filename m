From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v11 2/6] mfd: lpc_ich: Rename lpc-ich driver
Date: Mon, 21 Nov 2016 10:13:02 +0000
Message-ID: <20161121101302.GC32509@dell>
References: <1479446550-28677-1-git-send-email-jui.nee.tan@intel.com>
 <1479446550-28677-3-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:34828 "EHLO
        mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751264AbcKUKKC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Nov 2016 05:10:02 -0500
Received: by mail-wm0-f41.google.com with SMTP id a197so137234011wmd.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2016 02:10:02 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1479446550-28677-3-git-send-email-jui.nee.tan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>
Cc: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, dvhart@infradead.org, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com, yunying.sun@intel.com

On Fri, 18 Nov 2016, Tan Jui Nee wrote:

> This patch follows the example of mfd/wm831x to rename the driver
> from "lpc_ich" to "lpc_ich_core".
> 
> Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
> Changes in V11:
> 	- No change
> 
> Changes in V10:
> 	- No change
> 
> Changes in V9:
> 	- Remove the filename from the header of lpc_ich_core.c (suggested by Lee).
> 
> Changes in V8:
> 	- Update new file name with lpc_ich_core.c at description of source file.
> 	- Rework Makefile with new source file name lpc_ich_apl.c.
> 
> Changes in V7:
> 	- No change
> 
> Changes in V6:
> 	- none, just a subject line and commit message change.
> 
>  drivers/mfd/Makefile                      | 1 +
>  drivers/mfd/{lpc_ich.c => lpc_ich_core.c} | 2 --
>  2 files changed, 1 insertion(+), 2 deletions(-)
>  rename drivers/mfd/{lpc_ich.c => lpc_ich_core.c} (99%)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 9834e66..06a91ea 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -159,6 +159,7 @@ obj-$(CONFIG_PMIC_ADP5520)	+= adp5520.o
>  obj-$(CONFIG_MFD_KEMPLD)	+= kempld-core.o
>  obj-$(CONFIG_MFD_INTEL_QUARK_I2C_GPIO)	+= intel_quark_i2c_gpio.o
>  obj-$(CONFIG_LPC_SCH)		+= lpc_sch.o
> +lpc_ich-objs		:= lpc_ich_core.o
>  obj-$(CONFIG_LPC_ICH)		+= lpc_ich.o
>  obj-$(CONFIG_MFD_RDC321X)	+= rdc321x-southbridge.o
>  obj-$(CONFIG_MFD_JANZ_CMODIO)	+= janz-cmodio.o
> diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich_core.c
> similarity index 99%
> rename from drivers/mfd/lpc_ich.c
> rename to drivers/mfd/lpc_ich_core.c
> index c8dee47..7cbe037 100644
> --- a/drivers/mfd/lpc_ich.c
> +++ b/drivers/mfd/lpc_ich_core.c
> @@ -1,6 +1,4 @@
>  /*
> - *  lpc_ich.c - LPC interface for Intel ICH
> - *
>   *  LPC bridge function of the Intel ICH contains many other
>   *  functional units, such as Interrupt controllers, Timers,
>   *  Power Management, System Management, GPIO, RTC, and LPC

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
