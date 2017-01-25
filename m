From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH RESEND] pinctrl: intel: Turn Baytrail support to tristate
Date: Wed, 25 Jan 2017 18:15:10 +0200
Message-ID: <CAHp75VfaX=WLc-tLCXOwcs2t5fHfoYHZpeL6CMLKU1xQyBjMRw@mail.gmail.com>
References: <20170125162608.58bfbfb1@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:33638 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750946AbdAYQPL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2017 11:15:11 -0500
In-Reply-To: <20170125162608.58bfbfb1@endymion>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Takashi Iwai <tiwai@suse.de>

On Wed, Jan 25, 2017 at 5:26 PM, Jean Delvare <jdelvare@suse.de> wrote:
> The pinctrl-baytrail driver builds just fine as a module so give
> users this option.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Looks okay to me.
FWIW:
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> ---
> This was discussed almost one year ago, with no clear conclusion, but
> also no evidence that the driver can't be built as a module. Is there
> any way to push this forward?
>
>  drivers/pinctrl/intel/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-4.7-rc7.orig/drivers/pinctrl/intel/Kconfig    2016-07-12 14:35:36.024835842 +0200
> +++ linux-4.7-rc7/drivers/pinctrl/intel/Kconfig 2016-07-12 14:35:44.735904433 +0200
> @@ -3,7 +3,7 @@
>  #
>
>  config PINCTRL_BAYTRAIL
> -       bool "Intel Baytrail GPIO pin control"
> +       tristate "Intel Baytrail GPIO pin control"
>         depends on GPIOLIB && ACPI
>         select GPIOLIB_IRQCHIP
>         select PINMUX
>
>
> --
> Jean Delvare
> SUSE L3 Support



-- 
With Best Regards,
Andy Shevchenko
