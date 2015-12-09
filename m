From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH 141/182] MIPS: txx9: iocled: use gpiochip data pointer
Date: Wed, 9 Dec 2015 14:57:19 +0100
Message-ID: <20151209135719.GO4722@linux-mips.org>
References: <1449668409-4738-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from eddie.linux-mips.org ([148.251.95.138]:42832 "EHLO
	cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751151AbbLIN5W (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:57:22 -0500
Received: from localhost.localdomain ([127.0.0.1]:39620 "EHLO linux-mips.org"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27013577AbbLIN5VsMvN9 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 14:57:21 +0100
Content-Disposition: inline
In-Reply-To: <1449668409-4738-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, linux-mips@linux-mips.org

On Wed, Dec 09, 2015 at 02:40:09PM +0100, Linus Walleij wrote:
> Date:   Wed,  9 Dec 2015 14:40:09 +0100
> From: Linus Walleij <linus.walleij@linaro.org>
> To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre
>  Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus
>  Pargmann <mpa@pengutronix.de>, Ralf Baechle <ralf@linux-mips.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mips@linux-mips.org
> Subject: [PATCH 141/182] MIPS: txx9: iocled: use gpiochip data pointer
> 
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
> 
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: linux-mips@linux-mips.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Ralf: please ACK this so I can take it through the GPIO tree.
> BTW: would be nice if the MIPS GPIO drivers could move down
> to drivers/gpio in the long run. This should compile with
> just #include <linux/gpio/driver.h>, I hope that works.

Acked-by: Ralf Baechle <ralf@linux-mips.org>

  Ralf
