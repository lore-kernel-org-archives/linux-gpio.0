From: Calvin Johnson <linux.cj@gmail.com>
Subject: Re: [PATCH] pinctrl: intel: add blacklist list for XPS machines
Date: Wed, 5 Oct 2016 13:27:31 +0530
Message-ID: <CAEhpT-WvLqfzfxrsRB_+tifq4tESnz_HqdaFb=0VUjff2=3-mg@mail.gmail.com>
References: <1475647025-25617-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:33143 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752105AbcJEH5c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Oct 2016 03:57:32 -0400
Received: by mail-it0-f66.google.com with SMTP id o21so3062261itb.0
        for <linux-gpio@vger.kernel.org>; Wed, 05 Oct 2016 00:57:32 -0700 (PDT)
In-Reply-To: <1475647025-25617-1-git-send-email-acelan.kao@canonical.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Wed, Oct 5, 2016 at 11:27 AM, AceLan Kao <acelan.kao@canonical.com> wrote:
> The touchscreen on some Dell machines stop working after
> closing and opening the lid after this driver is introduced.
> So, I add a dmi list to black out those machines that doesn't
> work well with this driver.

Why don't you find out what in the driver is causing this problem,
instead of avoiding the driver  loading altogether?

>
> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> ---
>  drivers/pinctrl/intel/pinctrl-sunrisepoint.c | 33 ++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/drivers/pinctrl/intel/pinctrl-sunrisepoint.c b/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
> index c725a53..f0e6c97 100644
> --- a/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
> +++ b/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
> @@ -15,6 +15,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
>  #include <linux/pinctrl/pinctrl.h>
> +#include <linux/dmi.h>
>
>  #include "pinctrl-intel.h"
>
> @@ -554,6 +555,35 @@ static const struct acpi_device_id spt_pinctrl_acpi_match[] = {
>  };
>  MODULE_DEVICE_TABLE(acpi, spt_pinctrl_acpi_match);
>
> +static int pinctrl_blacklist_callback(const struct dmi_system_id *id)
> +{
> +       pr_info("Blacklisted pinctrl-sunrisepoint for %s\n", id->ident);
> +       return 1;
> +}
> +
> +static const struct dmi_system_id pinctrl_blacklist[] = {
> +       /* This driver leads to XPS(2015/2016) touchscreen failed to work
> +        * after lid close/open, so try not to load this module
> +        */
> +       {
> +               .callback = pinctrl_blacklist_callback,
> +               .ident = "Dell XPS 13",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "XPS 13 9350"),
> +               },
> +       },
> +       {
> +               .callback = pinctrl_blacklist_callback,
> +               .ident = "Dell XPS 13",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "XPS 13 9360"),
> +               },
> +       },
> +       { }     /* terminating entry */
> +};
> +
>  static int spt_pinctrl_probe(struct platform_device *pdev)
>  {
>         const struct intel_pinctrl_soc_data *soc_data;
> @@ -563,6 +593,9 @@ static int spt_pinctrl_probe(struct platform_device *pdev)
>         if (!id || !id->driver_data)
>                 return -ENODEV;
>
> +       if (dmi_check_system(pinctrl_blacklist))
> +               return -ENODEV;
> +
>         soc_data = (const struct intel_pinctrl_soc_data *)id->driver_data;
>         return intel_pinctrl_probe(pdev, soc_data);
>  }
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
