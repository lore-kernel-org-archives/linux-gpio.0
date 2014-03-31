From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: gpio / ACPI: Add support for ACPI GPIO operation regions
Date: Mon, 31 Mar 2014 15:05:25 +0300
Message-ID: <20140331120525.GF19349@intel.com>
References: <20140328083732.GP25192@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:46424 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751703AbaCaL6H (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 31 Mar 2014 07:58:07 -0400
Content-Disposition: inline
In-Reply-To: <20140328083732.GP25192@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-gpio@vger.kernel.org

On Fri, Mar 28, 2014 at 11:37:32AM +0300, Dan Carpenter wrote:
> Hello Mika Westerberg,
> 
> The patch 473ed7be0da0: "gpio / ACPI: Add support for ACPI GPIO
> operation regions" from Mar 14, 2014, leads to the following static
> checker warning:
> 
> 	drivers/gpio/gpiolib-acpi.c:454 acpi_gpio_adr_space_handler()
> 	warn: should 'gpiod_get_raw_value(desc) << i' be a 64 bit type?

Thanks for the report. However, I'm not able to reproduce this warning with
sparse. How did you get this?
