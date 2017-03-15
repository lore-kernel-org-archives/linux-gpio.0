From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2] gpio: acpi: Ignore -EPROBE_DEFER for unselected
 gpioints
Date: Wed, 15 Mar 2017 12:54:07 +0200
Message-ID: <20170315105407.GT2957@lahna.fi.intel.com>
References: <20170313220421.27314-1-hdegoede@redhat.com>
 <CACRpkdb68FrQdx2TL2cRybCWLPvaDjcPNk3VZWGEeAeCWZwBQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:6781 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751694AbdCOKyM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Mar 2017 06:54:12 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdb68FrQdx2TL2cRybCWLPvaDjcPNk3VZWGEeAeCWZwBQg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Mar 15, 2017 at 11:31:36AM +0100, Linus Walleij wrote:
> On Mon, Mar 13, 2017 at 11:04 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> 
> > When acpi_dev_gpio_irq_get gets called with an index of say 2, it should
> > not care if acpi_get_gpiod for index 0 or 1 returns -EPROBE_DEFER.
> >
> > This allows drivers which request a gpioint with index > 0 to function
> > if there is no gpiochip driver (loaded) for gpioints with a lower index.
> >
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> I am dependent on Mika and Rafael to review ACPI/GPIO patches,
> maybe I should just put in a special entry to MAINTAINERS for
> this file... anyway let's see what they say.

Hans, could you in future Cc patches related to ACPI to linux-acpi
mailing list as well? This one I looked up from linux-gpio mail
archives.

The patch looks good to me so,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
