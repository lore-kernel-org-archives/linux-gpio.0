From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Turn Baytrail support to tristate
Date: Tue, 16 Feb 2016 12:34:35 +0200
Message-ID: <20160216103435.GG1742@lahna.fi.intel.com>
References: <20160211120551.4d8224a4@endymion>
 <20160211112317.GT16826@lahna.fi.intel.com>
 <CACRpkdaBBeZbbZGduHOJKuqQmCdyXaMatFt97Bjxsbfdf6V3Rw@mail.gmail.com>
 <20160216085346.GA1742@lahna.fi.intel.com>
 <20160216101543.7602d9e8@endymion>
 <20160216094954.GF1742@lahna.fi.intel.com>
 <20160216112555.79aa1837@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:13547 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754741AbcBPKej (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 16 Feb 2016 05:34:39 -0500
Content-Disposition: inline
In-Reply-To: <20160216112555.79aa1837@endymion>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>

On Tue, Feb 16, 2016 at 11:25:55AM +0100, Jean Delvare wrote:
> Can you describe the respective roles of acpi_lpss and pinctrl-baytrail
> in this process? Both reference ACPI devices "INT33B2" and "INT33FC".
> Who instantiates these devices? Who pulls GPIO 12 low? Who detects when
> this happens? Who triggers the event that leads to _L12 being executed?

acpi_lpss enumerates the ACPI devices and creates platform devices from
them. pinctrl-baytrail binds to the platform device.

Hardware pulls down the GPIO 12. For example when the power adapter is
connected. This is detected by the GPIO hardware and the driver
(pinctrl-baytrail) that then executes the method (based on the code in
gpiolib-acpi.c::acpi_gpiochip_request_interrupt()).

> > I'm not opposing turning this driver to a module. If it breaks things we
> > can always revert the patch ;-)
> 
> ... or try to solve the problem cleanly, if that is possible.

Sure.
