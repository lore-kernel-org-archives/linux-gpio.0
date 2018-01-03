From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] DEBUG: BT
Date: Wed, 03 Jan 2018 19:32:08 +0200
Message-ID: <1515000728.7000.599.camel@linux.intel.com>
References: <20180103173055.45679-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:40873 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750819AbeACRcM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Jan 2018 12:32:12 -0500
In-Reply-To: <20180103173055.45679-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Wed, 2018-01-03 at 19:30 +0200, Andy Shevchenko wrote:

Sorry for the noise and happy New Year!

Wrong patch.

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/bluetooth/Makefile  | 2 ++
>  drivers/bluetooth/btbcm.c   | 2 ++
>  drivers/bluetooth/hci_bcm.c | 2 ++
>  3 files changed, 6 insertions(+)
> 
> diff --git a/drivers/bluetooth/Makefile b/drivers/bluetooth/Makefile
> index 4e4e44d09796..2b4d3ab1972e 100644
> --- a/drivers/bluetooth/Makefile
> +++ b/drivers/bluetooth/Makefile
> @@ -44,3 +44,5 @@ hci_uart-$(CONFIG_BT_HCIUART_QCA)	+=
> hci_qca.o
>  hci_uart-$(CONFIG_BT_HCIUART_AG6XX)	+= hci_ag6xx.o
>  hci_uart-$(CONFIG_BT_HCIUART_MRVL)	+= hci_mrvl.o
>  hci_uart-objs				:= $(hci_uart-y)
> +
> +ccflags-y	+= -DDEBUG
> diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
> index afa4cb3b16e3..fb0371a935b1 100644
> --- a/drivers/bluetooth/btbcm.c
> +++ b/drivers/bluetooth/btbcm.c
> @@ -21,6 +21,8 @@
>   *
>   */
>  
> +#define DEBUG
> +
>  #include <linux/module.h>
>  #include <linux/firmware.h>
>  #include <asm/unaligned.h>
> diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
> index 1fc604a0d870..dedbafb4e38f 100644
> --- a/drivers/bluetooth/hci_bcm.c
> +++ b/drivers/bluetooth/hci_bcm.c
> @@ -21,6 +21,8 @@
>   *
>   */
>  
> +#define DEBUG
> +
>  #include <linux/kernel.h>
>  #include <linux/errno.h>
>  #include <linux/skbuff.h>

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
