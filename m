From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: gpio / ACPI: Add support for ACPI GPIO operation regions
Date: Mon, 31 Mar 2014 15:11:33 +0300
Message-ID: <20140331121037.GA18506@mwanda>
References: <20140328083732.GP25192@mwanda>
 <20140331120525.GF19349@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:34584 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752161AbaCaMLa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Mar 2014 08:11:30 -0400
Content-Disposition: inline
In-Reply-To: <20140331120525.GF19349@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org

On Mon, Mar 31, 2014 at 03:05:25PM +0300, Mika Westerberg wrote:
> On Fri, Mar 28, 2014 at 11:37:32AM +0300, Dan Carpenter wrote:
> > Hello Mika Westerberg,
> > 
> > The patch 473ed7be0da0: "gpio / ACPI: Add support for ACPI GPIO
> > operation regions" from Mar 14, 2014, leads to the following static
> > checker warning:
> > 
> > 	drivers/gpio/gpiolib-acpi.c:454 acpi_gpio_adr_space_handler()
> > 	warn: should 'gpiod_get_raw_value(desc) << i' be a 64 bit type?
> 
> Thanks for the report. However, I'm not able to reproduce this warning with
> sparse. How did you get this?

It's not a Sparse warning.  It's some unreleased stuff (too many false
positives).  I sort through the warnings manually and send the ones
which seem valid.

regards,
dan carpenter
