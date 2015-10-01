From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH v2 2/8] mfd: core: redo ACPI matching of the children devices
Date: Thu, 01 Oct 2015 23:59:07 +0200
Message-ID: <3274512.nm3FJOJWnt@vostro.rjw.lan>
References: <1443698430-74415-1-git-send-email-andriy.shevchenko@linux.intel.com> <1443698430-74415-3-git-send-email-andriy.shevchenko@linux.intel.com> <20151001145436.GD3214@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:49165 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1750795AbbJAVap (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Oct 2015 17:30:45 -0400
In-Reply-To: <20151001145436.GD3214@x1>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@intel.com>, "Puustinen, Ismo" <ismo.puustinen@intel.com>, "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>, linux-kernel@vger.kernel.org

On Thursday, October 01, 2015 03:54:36 PM Lee Jones wrote:
> On Thu, 01 Oct 2015, Andy Shevchenko wrote:
> 
> > There is at least one board on the market, i.e. Intel Galileo Gen2, that uses
> > _ADR to distinguish the devices under one actual device. Due to this we have to
> > improve the quirk in the MFD core to handle that board.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  Documentation/acpi/enumeration.txt | 11 +++++---
> >  drivers/mfd/mfd-core.c             | 52 ++++++++++++++++++++++++++------------
> >  include/linux/mfd/core.h           | 10 ++++++--
> >  3 files changed, 52 insertions(+), 21 deletions(-)
> 
> This whole patch still needs an ACPI Ack.

I'll take care of it shortly.

Thanks,
Rafael

