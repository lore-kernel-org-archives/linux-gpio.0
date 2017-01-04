From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 2/3] gpiolib: Update documentation of struct
 acpi_gpio_info
Date: Wed, 4 Jan 2017 14:37:32 +0200
Message-ID: <20170104123732.GS3353@lahna.fi.intel.com>
References: <20170103170119.35950-1-andriy.shevchenko@linux.intel.com>
 <20170103170119.35950-2-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:45951 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932322AbdADMhl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Jan 2017 07:37:41 -0500
Content-Disposition: inline
In-Reply-To: <20170103170119.35950-2-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Christophe RICARD <christophe.ricard@gmail.com>

On Tue, Jan 03, 2017 at 07:01:18PM +0200, Andy Shevchenko wrote:
> It seems the code had been changed, but description left untouched.
> 
> Update description of the struct acpi_gpio_info and relative comments
> accordingly.
> 
> Fixes: commit 52044723cd27 ("ACPI / gpio: Add irq_type when a GPIO is used as an interrupt")
> Cc: Christophe RICARD <christophe.ricard@gmail.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
