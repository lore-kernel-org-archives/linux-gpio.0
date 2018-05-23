From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] pinctrl: cherryview: limit Strago DMI workarounds to
 version 1.0
Date: Wed, 23 May 2018 11:54:43 +0300
Message-ID: <c0daaf807c557063afe8f2caaedb502ddb8e6296.camel@linux.intel.com>
References: <20180522204753.GA260493@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180522204753.GA260493@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, 2018-05-22 at 13:47 -0700, Dmitry Torokhov wrote:
> As Google/Intel will fix the BIOS/Coreboot issues with hardcoding
> virtual interrupt numbers for keyboard/touchpad/touchscreen
> controllers
> in ACPI tables, they will also update BOARD version number from 1.0
> to 1.1. Let's limit the DMI quirks that try to preserve virtual IRQ
> numbers on Strago boards to those that still carry older BIOSes.
> 
> Note that ideally not BOARD but BIOS version should have been updated.
> However the BIOS version used by Chrome devices has format of
> Google_BUILD.BRANCH.PATCH which is not well suited for DMI matching as
> we do not have "less than" match mode for DMI data.
> 

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=197953
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> 
> v1->v2:
> 
> - switch from matching on DMI_BIOS_VERSION to DMI_BOARD_VERSION
> 
> 
>  drivers/pinctrl/intel/pinctrl-cherryview.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c
> b/drivers/pinctrl/intel/pinctrl-cherryview.c
> index b1ae1618fefea..44133e6846303 100644
> --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
> @@ -1527,6 +1527,7 @@ static const struct dmi_system_id
> chv_no_valid_mask[] = {
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
>  			DMI_MATCH(DMI_PRODUCT_FAMILY,
> "Intel_Strago"),
> +			DMI_MATCH(DMI_BOARD_VERSION, "1.0"),
>  		},
>  	},
>  	{
> @@ -1534,6 +1535,7 @@ static const struct dmi_system_id
> chv_no_valid_mask[] = {
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Setzer"),
> +			DMI_MATCH(DMI_BOARD_VERSION, "1.0"),
>  		},
>  	},
>  	{
> @@ -1541,6 +1543,7 @@ static const struct dmi_system_id
> chv_no_valid_mask[] = {
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Cyan"),
> +			DMI_MATCH(DMI_BOARD_VERSION, "1.0"),
>  		},
>  	},
>  	{
> @@ -1548,6 +1551,7 @@ static const struct dmi_system_id
> chv_no_valid_mask[] = {
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Celes"),
> +			DMI_MATCH(DMI_BOARD_VERSION, "1.0"),
>  		},
>  	},
>  	{}
> -- 
> 2.17.0.441.gb46fe60e1d-goog
> 
> 

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
