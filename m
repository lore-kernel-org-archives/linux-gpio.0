From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v10 2/6] mfd: lpc_ich: Rename lpc-ich driver
Date: Thu, 10 Nov 2016 18:01:05 +0200
Message-ID: <1478793665.5295.127.camel@linux.intel.com>
References: <1478768430-13422-1-git-send-email-jui.nee.tan@intel.com>
         <1478768430-13422-3-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <1478768430-13422-3-git-send-email-jui.nee.tan@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>, mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, tglx@linutronix.de, dvhart@infradead.org, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com, yunying.sun@intel.com
List-Id: linux-gpio@vger.kernel.org

On Thu, 2016-11-10 at 17:00 +0800, Tan Jui Nee wrote:
> This patch follows the example of mfd/wm831x to rename the driver
> from "lpc_ich" to "lpc_ich_core".
> 
> Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
> Changes in V10:
> 	- No change
> 
> Changes in V9:
> 	- Remove the filename from the header of lpc_ich_core.c
> (suggested by Lee).
> 
> Changes in V8:
> 	- Update new file name with lpc_ich_core.c at description of
> source file.
> 	- Rework Makefile with new source file name lpc_ich_apl.c.
> 
> Changes in V7:
> 	- No change
> 
> Changes in V6:
> 	- none, just a subject line and commit message change.
> 
>  drivers/mfd/Makefile                      | 1 +
>  drivers/mfd/{lpc_ich.c => lpc_ich_core.c} | 2 --
>  2 files changed, 1 insertion(+), 2 deletions(-)
>  rename drivers/mfd/{lpc_ich.c => lpc_ich_core.c} (99%)
> 
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 9834e66..06a91ea 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -159,6 +159,7 @@ obj-$(CONFIG_PMIC_ADP5520)	+= adp5520.o
>  obj-$(CONFIG_MFD_KEMPLD)	+= kempld-core.o
>  obj-$(CONFIG_MFD_INTEL_QUARK_I2C_GPIO)	+=
> intel_quark_i2c_gpio.o
>  obj-$(CONFIG_LPC_SCH)		+= lpc_sch.o

> +lpc_ich-objs		:= lpc_ich_core.o

Put this line after...

>  obj-$(CONFIG_LPC_ICH)		+= lpc_ich.o

...this one. And you will easily see the issue in next patch.

>  obj-$(CONFIG_MFD_RDC321X)	+= rdc321x-southbridge.o
>  obj-$(CONFIG_MFD_JANZ_CMODIO)	+= janz-cmodio.o

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
