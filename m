From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] gpio: add GPIO support for SMSC SCH311x
Date: Fri, 29 Nov 2013 17:02:38 +0200
Message-ID: <20131129150238.GJ2281@intel.com>
References: <1385597895-26418-1-git-send-email-br1@einfach.org>
 <CACRpkdaXO+tYRq=uyQiAopRDPwKv1_F4yZwCWr4-JL1xnio4Wg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:59812 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756491Ab3K2O4A (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 29 Nov 2013 09:56:00 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdaXO+tYRq=uyQiAopRDPwKv1_F4yZwCWr4-JL1xnio4Wg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bruno Randolf <br1@einfach.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Simon Guinot <simon.guinot@sequanux.org>, Wim Van Sebroeck <wim@iguana.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Nov 29, 2013 at 03:40:01PM +0100, Linus Walleij wrote:
> At the very least I want the driver split up in two files: one that
> adds the GPIO driver for an arbitrary number of pins, and one
> that adds this boards' configuration. You can put the latter in
> drivers/platform/x86 or wherever, just not in drivers/gpio.
> 
> Maybe this leads to another interesting discussion on why
> ACPI is not used for configuring the board...

AFAIK there are not that many systems shipping today that have ACPI 5.0
supported and you need ACPI 5.0 in order to pass GpioIo/GpioInt resources
from a device to the driver.
