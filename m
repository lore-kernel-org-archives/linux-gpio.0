From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: sa1100: remove complex GPIO interface
Date: Tue, 24 Sep 2013 13:13:41 +0100
Message-ID: <20130924121340.GC12758@n2100.arm.linux.org.uk>
References: <1380024219-21790-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:39925 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751138Ab3IXMNy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Sep 2013 08:13:54 -0400
Content-Disposition: inline
In-Reply-To: <1380024219-21790-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org, Kristoffer Ericson <kristoffer.ericson@gmail.com>

On Tue, Sep 24, 2013 at 02:03:39PM +0200, Linus Walleij wrote:
> diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
> index 8ea3b33..5c94a53 100644
> --- a/drivers/gpio/gpio-sa1100.c
> +++ b/drivers/gpio/gpio-sa1100.c
> @@ -10,7 +10,7 @@
>  #include <linux/gpio.h>
>  #include <linux/init.h>
>  #include <linux/module.h>
> -
> +#include <asm/io.h>

How many more times does it need to be said...  I've been saying the same
thing for near on five years now and still this happens...
