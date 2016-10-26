From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v8 2/6] mfd: lpc_ich: Rename lpc-ich driver
Date: Wed, 26 Oct 2016 14:02:40 +0100
Message-ID: <20161026130240.GC12618@dell>
References: <1476255066-22653-1-git-send-email-jui.nee.tan@intel.com>
 <1476255066-22653-3-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:38815 "EHLO
        mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932488AbcJZNAI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2016 09:00:08 -0400
Received: by mail-wm0-f41.google.com with SMTP id d128so84117278wmf.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2016 06:00:07 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1476255066-22653-3-git-send-email-jui.nee.tan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>
Cc: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com

On Wed, 12 Oct 2016, Tan Jui Nee wrote:

> This patch follows the example of mfd/wm831x to rename the driver
> from "lpc_ich" to "lpc_ich_core".
> 
> Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
> ---
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
>  drivers/mfd/{lpc_ich.c => lpc_ich_core.c} | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>  rename drivers/mfd/{lpc_ich.c => lpc_ich_core.c} (99%)
> 
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
> index c8dee47..01d8d9e 100644
> --- a/drivers/mfd/lpc_ich.c
> +++ b/drivers/mfd/lpc_ich_core.c
> @@ -1,5 +1,5 @@
>  /*
> - *  lpc_ich.c - LPC interface for Intel ICH
> + *  lpc_ich_core.c - LPC interface for Intel ICH

Please take the opportunity to remove the filename from this header.

They have not purpose and have a habit of becoming out dated.

>   *  LPC bridge function of the Intel ICH contains many other
>   *  functional units, such as Interrupt controllers, Timers,

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
