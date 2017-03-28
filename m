From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] ACPI / gpio: do not fall back to parsing _CRS when we
 get a deferral
Date: Tue, 28 Mar 2017 18:04:02 +0300
Message-ID: <1490713442.708.33.camel@linux.intel.com>
References: <20170323202138.GA11912@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170323202138.GA11912@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Hans de Goede <hdegoede@redhat.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, 2017-03-23 at 13:21 -0700, Dmitry Torokhov wrote:
> If, while locating GPIOs by name, we get probe deferral, we should
> immediately report it to caller rather than trying to fall back to
> parsing
> unnamed GPIOs from _CRS block.

+Cc: Hans.

Hans, do have any objections on this? Would you ideally give your
Tested-by?

> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/gpio/gpiolib-acpi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> index a3faefa44f68..d3f9f028a37b 100644
> --- a/drivers/gpio/gpiolib-acpi.c
> +++ b/drivers/gpio/gpiolib-acpi.c
> @@ -572,8 +572,10 @@ struct gpio_desc *acpi_find_gpio(struct device
> *dev,
>  		}
>  
>  		desc = acpi_get_gpiod_by_index(adev, propname, idx,
> &info);
> -		if (!IS_ERR(desc) || (PTR_ERR(desc) ==
> -EPROBE_DEFER))
> +		if (!IS_ERR(desc))
>  			break;
> +		if (PTR_ERR(desc) == -EPROBE_DEFER)
> +			return ERR_CAST(desc);
>  	}
>  
>  	/* Then from plain _CRS GPIOs */
> -- 
> 2.12.1.500.gab5fba24ee-goog
> 
> 

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
