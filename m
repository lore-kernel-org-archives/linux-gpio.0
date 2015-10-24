From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 3/6] gpio: add a userspace chardev ABI for GPIOs
Date: Fri, 23 Oct 2015 17:30:10 -0700
Message-ID: <20151024003010.GA376@kroah.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <1445502750-22672-4-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:47401 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751010AbbJXAaL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Oct 2015 20:30:11 -0400
Content-Disposition: inline
In-Reply-To: <1445502750-22672-4-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Thu, Oct 22, 2015 at 10:32:27AM +0200, Linus Walleij wrote:
> +/**
> + * struct gpiochip_info - Information about a certain GPIO chip
> + * @name: the name of this GPIO chip
> + * @lines: number of GPIO lines on this chip
> + */
> +struct gpiochip_info {
> +	char name[32];

To be pendantic, s/char/__u8/

Otherwise, looks good, but I don't see the read/write protocol here, is
that in a later patch?

thanks,

greg k-h
