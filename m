From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 1/1] gpio: merrifield: Introduce GPIO driver to
 support Merrifield
Date: Mon, 11 Jul 2016 07:55:03 +0300
Message-ID: <20160711045503.GF14693@lahna.fi.intel.com>
References: <1467976103-133151-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:30984 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750826AbcGKEzL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 11 Jul 2016 00:55:11 -0400
Content-Disposition: inline
In-Reply-To: <1467976103-133151-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, David Cohen <david.a.cohen@linux.intel.com>, "Wood, Brian J" <brian.j.wood@intel.com>

On Fri, Jul 08, 2016 at 02:08:23PM +0300, Andy Shevchenko wrote:
> +static void mrfld_irq_ack(struct irq_data *d)
> +{
> +	struct mrfld_gpio *priv = irq_data_get_irq_chip_data(d);
> +	u32 gpio = irqd_to_hwirq(d);
> +	void __iomem *gisr = gpio_reg(&priv->chip, gpio, GISR);
> +
> +	writel(BIT(gpio % 32), gisr);

It just occured me that you actually need to take the lock here. If
another thread is doing series of updates on the same register this
might step over what the other thread is doing.
