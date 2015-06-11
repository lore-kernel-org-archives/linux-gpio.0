From: Tobias Diedrich <ranma+kernel@tdiedrich.de>
Subject: Re: [PATCH] gpio / ACPI: Return -EPROBE_DEFER if the gpiochip was
 not found
Date: Thu, 11 Jun 2015 02:11:29 +0200
Message-ID: <20150611001129.GB21213@yumi.tdiedrich.de>
References: <1433941505-135180-1-git-send-email-mika.westerberg@linux.intel.com>
 <5235346.FKkPIUuDpF@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from yumi.uguu.de ([85.10.200.126]:55103 "EHLO mx.tdiedrich.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751631AbbFKARF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 10 Jun 2015 20:17:05 -0400
Content-Disposition: inline
In-Reply-To: <5235346.FKkPIUuDpF@vostro.rjw.lan>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Rafael J. Wysocki wrote:
> On Wednesday, June 10, 2015 04:05:05 PM Mika Westerberg wrote:
> > If a driver requests a GPIO described in its _CRS but the GPIO host
> > controller (gpiochip) driver providing the GPIO has not been loaded yet
> > acpi_get_gpiod() returns -ENODEV which causes the calling driver to fail.
> > 
> > If the gpiochip driver is loaded afterwards the driver requesting the GPIO
> > will not notice this.
> > 
> > Better approach is to return -EPROBE_DEFER in such case. Then when the
> > gpiochip driver appears the driver requesting the GPIO will be probed
> > again. This also aligns ACPI GPIO lookup code closer to DT as it does
> > pretty much the same when no gpiochip driver was found.
> > 
> > Reported-by: Tobias Diedrich <tobiasdiedrich@gmail.com>
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Makes sense to me.
> 
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Signed-off-by: Tobias Diedrich <ranma+kernel@tdiedrich.de>

-- 
Tobias						PGP: http://8ef7ddba.uguu.de
