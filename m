From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] gpio: merrifield: Add support of ACPI enabled
 platforms
Date: Thu, 04 Jan 2018 14:38:39 +0200
Message-ID: <1515069519.7000.664.camel@linux.intel.com>
References: <20180103173240.45755-1-andriy.shevchenko@linux.intel.com>
         <20180104093604.GL27654@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:35180 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752413AbeADMim (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Jan 2018 07:38:42 -0500
In-Reply-To: <20180104093604.GL27654@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Thu, 2018-01-04 at 11:36 +0200, Mika Westerberg wrote:
> On Wed, Jan 03, 2018 at 07:32:40PM +0200, Andy Shevchenko wrote:
> > The driver needs the pin control device name for ACPI.
> > 
> > We are looking through ACPI namespace and return first found device
> > based on ACPI HID for Intel Merrifield FLIS.

> > +static const struct acpi_device_id mrfld_pinctrl_acpi_ids[] = {
> > +	{"INTC1002"},
> > +	{}
> > +};

...

> > +static const char *mrfld_acpi_get_pinctrl_dev_name(const char
> > *fallback)
> > +{
> > +	const char *pinctrl_dev_name = fallback;
> > +
> > +	acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
> > +			    ACPI_UINT32_MAX,
> > mrfld_acpi_find_pinctrl, NULL,
> > +			    &pinctrl_dev_name, NULL);
> > +	return pinctrl_dev_name;
> > +}
> 
> I wonder if there is a better way to "connect" these things without
> need
> to walk ACPI namespace in GPIO drivers?

I would lovely use that if there is any.

>  How does DT handle handle
> separated GPIO and pinctrl drivers? Maybe there is a binding that we
> could reuse in ACPI side.

Do they need it?

The problem here is in GPIO <-> pin mapping which requires instance name
of the device to be supplied.

AFAIU (perhaps missed something) in DT pinctrl device directly has this
mapping in the DTS, so, no need to call gpiochip_add_pin_range().

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
