From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] gpiolib-acpi: Duplicate con_id string when adding it to
 the crs lookup list
Date: Thu, 14 Apr 2016 15:27:49 +0300
Message-ID: <20160414122749.GV1714@lahna.fi.intel.com>
References: <1460563836-1899-1-git-send-email-ville.syrjala@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:59299 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754063AbcDNM2A (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 14 Apr 2016 08:28:00 -0400
Content-Disposition: inline
In-Reply-To: <1460563836-1899-1-git-send-email-ville.syrjala@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: ville.syrjala@linux.intel.com
Cc: linux-gpio@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, stable@vger.kernel.org

On Wed, Apr 13, 2016 at 07:10:36PM +0300, ville.syrjala@linux.intel.com wrote:
> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> index 682070d20f00..6238ddb81709 100644
> --- a/drivers/gpio/gpiolib-acpi.c
> +++ b/drivers/gpio/gpiolib-acpi.c
> @@ -950,7 +950,7 @@ int acpi_gpio_count(struct device *dev, const char *con_id)
>  struct acpi_crs_lookup {
>  	struct list_head node;
>  	struct acpi_device *adev;
> -	const char *con_id;
> +	char *con_id;

Why it cannot be left as const?

>  };
>  
>  static DEFINE_MUTEX(acpi_crs_lookup_lock);
> @@ -977,7 +977,7 @@ bool acpi_can_fallback_to_crs(struct acpi_device *adev, const char *con_id)
>  		lookup = kmalloc(sizeof(*lookup), GFP_KERNEL);
>  		if (lookup) {
>  			lookup->adev = adev;
> -			lookup->con_id = con_id;
> +			lookup->con_id = kstrdup(con_id, GFP_KERNEL);
>  			list_add_tail(&lookup->node, &acpi_crs_lookup_list);
>  		}
>  	}
> -- 
> 2.7.4
