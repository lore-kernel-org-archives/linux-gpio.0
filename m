From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: gpio / ACPI: Add support for ACPI GPIO operation regions
Date: Mon, 31 Mar 2014 16:45:57 +0300
Message-ID: <20140331134557.GI19349@intel.com>
References: <20140328083732.GP25192@mwanda>
 <20140331120525.GF19349@intel.com>
 <20140331121037.GA18506@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:12776 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754150AbaCaNjR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 31 Mar 2014 09:39:17 -0400
Content-Disposition: inline
In-Reply-To: <20140331121037.GA18506@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-gpio@vger.kernel.org

On Mon, Mar 31, 2014 at 03:11:33PM +0300, Dan Carpenter wrote:
> On Mon, Mar 31, 2014 at 03:05:25PM +0300, Mika Westerberg wrote:
> > On Fri, Mar 28, 2014 at 11:37:32AM +0300, Dan Carpenter wrote:
> > > Hello Mika Westerberg,
> > > 
> > > The patch 473ed7be0da0: "gpio / ACPI: Add support for ACPI GPIO
> > > operation regions" from Mar 14, 2014, leads to the following static
> > > checker warning:
> > > 
> > > 	drivers/gpio/gpiolib-acpi.c:454 acpi_gpio_adr_space_handler()
> > > 	warn: should 'gpiod_get_raw_value(desc) << i' be a 64 bit type?
> > 
> > Thanks for the report. However, I'm not able to reproduce this warning with
> > sparse. How did you get this?
> 
> It's not a Sparse warning.  It's some unreleased stuff (too many false
> positives).  I sort through the warnings manually and send the ones
> which seem valid.

I see.

What do you think about the patch below? I have to admit that this kind of
stuff is in my "gray" area of understanding.

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index d5be56fe689e..401add28933f 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -451,7 +451,7 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
 		if (function == ACPI_WRITE)
 			gpiod_set_raw_value(desc, !!((1 << i) & *value));
 		else
-			*value |= gpiod_get_raw_value(desc) << i;
+			*value |= (u64)gpiod_get_raw_value(desc) << i;
 	}
 
 out:
