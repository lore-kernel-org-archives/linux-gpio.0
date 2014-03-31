From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: gpio / ACPI: Add support for ACPI GPIO operation regions
Date: Mon, 31 Mar 2014 17:04:12 +0300
Message-ID: <20140331140412.GK19349@intel.com>
References: <20140328083732.GP25192@mwanda>
 <20140331120525.GF19349@intel.com>
 <20140331121037.GA18506@mwanda>
 <20140331134557.GI19349@intel.com>
 <20140331135124.GB18506@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:59251 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754505AbaCaN4g (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 31 Mar 2014 09:56:36 -0400
Content-Disposition: inline
In-Reply-To: <20140331135124.GB18506@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-gpio@vger.kernel.org

On Mon, Mar 31, 2014 at 04:51:24PM +0300, Dan Carpenter wrote:
> On Mon, Mar 31, 2014 at 04:45:57PM +0300, Mika Westerberg wrote:
> > On Mon, Mar 31, 2014 at 03:11:33PM +0300, Dan Carpenter wrote:
> > > On Mon, Mar 31, 2014 at 03:05:25PM +0300, Mika Westerberg wrote:
> > > > On Fri, Mar 28, 2014 at 11:37:32AM +0300, Dan Carpenter wrote:
> > > > > Hello Mika Westerberg,
> > > > > 
> > > > > The patch 473ed7be0da0: "gpio / ACPI: Add support for ACPI GPIO
> > > > > operation regions" from Mar 14, 2014, leads to the following static
> > > > > checker warning:
> > > > > 
> > > > > 	drivers/gpio/gpiolib-acpi.c:454 acpi_gpio_adr_space_handler()
> > > > > 	warn: should 'gpiod_get_raw_value(desc) << i' be a 64 bit type?
> > > > 
> > > > Thanks for the report. However, I'm not able to reproduce this warning with
> > > > sparse. How did you get this?
> > > 
> > > It's not a Sparse warning.  It's some unreleased stuff (too many false
> > > positives).  I sort through the warnings manually and send the ones
> > > which seem valid.
> > 
> > I see.
> > 
> > What do you think about the patch below? I have to admit that this kind of
> > stuff is in my "gray" area of understanding.
> 
> It looks good to me.  The question, I guess is can pin_table_length ever
> be more than 31.  gpiod_get_raw_value() returns and int of 0-1 so
> if "i" is 31 then *value is an unexpected number because the shift is
> undefined (it wraps around in GCC).

It can be larger than 31 so I guess I'll submit this patch to LinusW.
