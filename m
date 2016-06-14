From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] gpio: add Intel WhiskeyCove GPIO driver
Date: Tue, 14 Jun 2016 13:09:31 +0300
Message-ID: <20160614100931.GJ1740@lahna.fi.intel.com>
References: <20160611060150.GA88066@worksta>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:7039 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751371AbcFNKJf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 14 Jun 2016 06:09:35 -0400
Content-Disposition: inline
In-Reply-To: <20160611060150.GA88066@worksta>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bin Gao <bin.gao@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Bin Gao <bin.gao@intel.com>

On Fri, Jun 10, 2016 at 11:01:51PM -0700, Bin Gao wrote:
> +static const struct platform_device_id pmic_gpio_id_table[] = {
> +	{ "bxt_wcove_gpio", },
> +};

Do you really need this?

> +
> +static struct platform_driver wcove_gpio_driver = {
> +	.probe = wcove_gpio_probe,
> +	.remove = wcove_gpio_remove,
> +	.driver = {
> +		.name = "wcove_gpio",
> +	},
> +	.id_table = pmic_gpio_id_table,

and this?

> +};
> +
> +module_platform_driver(wcove_gpio_driver);
> +
> +MODULE_AUTHOR("Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>");
> +MODULE_DESCRIPTION("Intel Whiskey Cove GPIO Driver");
> +MODULE_LICENSE("GPL v2");

You can add

MODULE_ALIAS("platform:wcove_gpio");

to get the module loaded automatically.
