From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: max77620: Implement gpio_get_direction callback
Date: Mon, 30 May 2016 17:03:35 +0200
Message-ID: <CACRpkdbM=Ew6sPzGYFSst8p8AtaLAeDTxOaXUMBS8Qj2=HcuRA@mail.gmail.com>
References: <1464095626-28424-1-git-send-email-ldewangan@nvidia.com>
	<1464095626-28424-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:33772 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754964AbcE3PDg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 May 2016 11:03:36 -0400
Received: by mail-oi0-f52.google.com with SMTP id k23so272353812oih.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 May 2016 08:03:36 -0700 (PDT)
In-Reply-To: <1464095626-28424-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 24, 2016 at 3:13 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> Implement gpio_get_direction() callback for MAX77620 GPIO.
> This is useful for debugfs and the userspace ABI.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

>  #include <linux/gpio/driver.h>
> +#include <linux/gpio.h>

No. This is a sign that something is wrong, no driver should include
this unless it is using GPIOs as a resource itself.

> +       return (val & MAX77620_CNFG_GPIO_DIR_MASK) ?
> +               GPIOF_DIR_IN : GPIOF_DIR_OUT;

Just return 0 or 1. The driver-internal API isn't smarter than that.

Yours,
Linus Walleij
