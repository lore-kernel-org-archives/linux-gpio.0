From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 2/6] mfd: lpc_ich: Rename lpc-ich driver
Date: Fri, 30 Sep 2016 01:31:19 +0100
Message-ID: <20160930003119.GD13971@dell>
References: <1475056343-31907-1-git-send-email-jui.nee.tan@intel.com>
 <1475056343-31907-3-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1475056343-31907-3-git-send-email-jui.nee.tan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>
Cc: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com
List-Id: linux-gpio@vger.kernel.org

On Wed, 28 Sep 2016, Tan Jui Nee wrote:

> This patch follows the example of mfd/wm831x to rename the driver
> from "lpc_ich" to "lpc_ich-core".
> 
> Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
> ---
> Changes in V7:
> 	- No change
> 
> Changes in V6:
> 	- none, just a subject line and commit message change.
> 
>  drivers/mfd/Makefile                      | 1 +
>  drivers/mfd/{lpc_ich.c => lpc_ich-core.c} | 0
>  2 files changed, 1 insertion(+)
>  rename drivers/mfd/{lpc_ich.c => lpc_ich-core.c} (100%)
> 
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 2ba3ba3..260f46f 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -155,6 +155,7 @@ obj-$(CONFIG_PMIC_ADP5520)	+= adp5520.o
>  obj-$(CONFIG_MFD_KEMPLD)	+= kempld-core.o
>  obj-$(CONFIG_MFD_INTEL_QUARK_I2C_GPIO)	+= intel_quark_i2c_gpio.o
>  obj-$(CONFIG_LPC_SCH)		+= lpc_sch.o
> +lpc_ich-objs		:= lpc_ich-core.o

Please use underscores OR obliques, not both.

>  obj-$(CONFIG_LPC_ICH)		+= lpc_ich.o
>  obj-$(CONFIG_MFD_RDC321X)	+= rdc321x-southbridge.o
>  obj-$(CONFIG_MFD_JANZ_CMODIO)	+= janz-cmodio.o
> diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich-core.c
> similarity index 100%
> rename from drivers/mfd/lpc_ich.c
> rename to drivers/mfd/lpc_ich-core.c

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
