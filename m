From: Haojian Zhuang <haojian.zhuang@linaro.org>
Subject: Re: [PATCH] power/reset: zx: Register restart handler
Date: Mon, 29 Jun 2015 14:32:05 +0800
Message-ID: <1435559525.1744.6.camel@linaro.org>
References: <1435547191-18405-1-git-send-email-jun.nie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:34206 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751159AbbF2GcC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jun 2015 02:32:02 -0400
Received: by pdbep18 with SMTP id ep18so89320764pdb.1
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jun 2015 23:32:02 -0700 (PDT)
In-Reply-To: <1435547191-18405-1-git-send-email-jun.nie@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jun Nie <jun.nie@linaro.org>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, tony@atomide.com, shawn.guo@linaro.org, wan.zhijun@zte.com.cn, jason.liu@linaro.org

On Mon, 2015-06-29 at 11:06 +0800, Jun Nie wrote:
> Register with kernel restart handler instead of setting arm_pm_restart
> directly.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/power/reset/Kconfig     |  7 ++++
>  drivers/power/reset/Makefile    |  1 +
>  drivers/power/reset/zx-reboot.c | 79 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 87 insertions(+)
>  create mode 100644 drivers/power/reset/zx-reboot.c
> 
> diff --git a/drivers/power/reset/zx-reboot.c b/drivers/power/reset/zx-reboot.c
> new file mode 100644
> index 0000000..fbfee0b
> --- /dev/null
> +++ b/drivers/power/reset/zx-reboot.c
> @@ -0,0 +1,79 @@
> +/*
> + * ZTE zx296702 SoC reset code
> + *
> + * Copyright (c) 2015 Linaro Ltd.
> + *
> + * Author: Jun Nie <jun.nie@linaro.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/reboot.h>
> +
> +#include <asm/proc-fns.h>
> +
> +static void __iomem *base;
> +
> +static int zx_restart_handler(struct notifier_block *this,
> +			      unsigned long mode, void *cmd)
> +{
> +	struct device_node *np;
> +	void __iomem *pcu_base;
> +
> +	np = of_find_compatible_node(NULL, NULL, "zte,zx296702-pcu");
> +	pcu_base = of_iomap(np, 0);

Why not move these above code into zx_reboot_probe()? And you can check
the value of pcu_base at there.


