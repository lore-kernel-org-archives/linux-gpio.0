From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] pinctrl: broxton: Rename apl-pinctrl driver
Date: Wed, 25 Jan 2017 22:43:07 +0200
Message-ID: <1485376987.2133.337.camel@linux.intel.com>
References: <20170125202934.146544-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:25362 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750880AbdAYUnK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 25 Jan 2017 15:43:10 -0500
In-Reply-To: <20170125202934.146544-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>

On Wed, 2017-01-25 at 22:29 +0200, Andy Shevchenko wrote:
> While we have no users yet rename the platform driver to use the same
> pattern as the rest of Intel SoCs, i.e. use full SoC name in
> 'apollolake-pinctrl'.

Just a side note.

There will be more patches coming depending on this one, so, that's why
I decided to send it separately, that will prevent potential users to
use wrong name of the driver.

So, I'm also okay to send this as a first one in series, but it will
take time to prepare that.

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-broxton.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-broxton.c
> b/drivers/pinctrl/intel/pinctrl-broxton.c
> index 8ec2b6a77745..21bff8cca3ed 100644
> --- a/drivers/pinctrl/intel/pinctrl-broxton.c
> +++ b/drivers/pinctrl/intel/pinctrl-broxton.c
> @@ -1004,7 +1004,7 @@ static const struct acpi_device_id
> bxt_pinctrl_acpi_match[] = {
>  MODULE_DEVICE_TABLE(acpi, bxt_pinctrl_acpi_match);
>  
>  static const struct platform_device_id bxt_pinctrl_platform_ids[] = {
> -	{ "apl-pinctrl", (kernel_ulong_t)&apl_pinctrl_soc_data },
> +	{ "apollolake-pinctrl", (kernel_ulong_t)&apl_pinctrl_soc_data
> },
>  	{ "broxton-pinctrl", (kernel_ulong_t)&bxt_pinctrl_soc_data },
>  	{ },
>  };

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
