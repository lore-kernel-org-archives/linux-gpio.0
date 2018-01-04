From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] gpio: merrifield: Add support of ACPI enabled
 platforms
Date: Thu, 04 Jan 2018 18:32:39 +0200
Message-ID: <1515083559.7000.686.camel@linux.intel.com>
References: <20180103173240.45755-1-andriy.shevchenko@linux.intel.com>
         <20180104093604.GL27654@lahna.fi.intel.com>
         <1515069519.7000.664.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:48615 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752704AbeADQek (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Jan 2018 11:34:40 -0500
In-Reply-To: <1515069519.7000.664.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Thu, 2018-01-04 at 14:38 +0200, Andy Shevchenko wrote:
> On Thu, 2018-01-04 at 11:36 +0200, Mika Westerberg wrote:
> > On Wed, Jan 03, 2018 at 07:32:40PM +0200, Andy Shevchenko wrote:
> > > The driver needs the pin control device name for ACPI.
> > > 
> > > We are looking through ACPI namespace and return first found
> > > device
> > > based on ACPI HID for Intel Merrifield FLIS.
> > > +static const struct acpi_device_id mrfld_pinctrl_acpi_ids[] = {
> > > +	{"INTC1002"},
> > > +	{}
> > > +};
> 
> ...
> 
> > > +static const char *mrfld_acpi_get_pinctrl_dev_name(const char
> > > *fallback)
> > > +{
> > > +	const char *pinctrl_dev_name = fallback;
> > > +
> > > +	acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
> > > +			    ACPI_UINT32_MAX,
> > > mrfld_acpi_find_pinctrl, NULL,
> > > +			    &pinctrl_dev_name, NULL);
> > > +	return pinctrl_dev_name;
> > > +}
> > 
> > I wonder if there is a better way to "connect" these things without
> > need
> > to walk ACPI namespace in GPIO drivers?
> 
> I would lovely use that if there is any.

It appears there is another user of this, i.e. ASoC Intel, which needs
same.

Moreover, we can avoid scan entire ACPI namespace and narrow to scan
only registered ACPI devices on ACPI bus in Linux (see
acpi_dev_present() for example).

I'm about to send patch (series) v2 utilizing that.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
