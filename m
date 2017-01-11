From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 2/3] gpiolib: Update documentation of struct
 acpi_gpio_info
Date: Wed, 11 Jan 2017 13:42:57 +0200
Message-ID: <1484134977.2133.49.camel@linux.intel.com>
References: <20170109140228.47613-1-andriy.shevchenko@linux.intel.com>
         <20170109140228.47613-3-andriy.shevchenko@linux.intel.com>
         <CACRpkdZytHGor3XxSGYFthdfht8o=aO5iGzCxV6xMm61E4Q-1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:62480 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752617AbdAKLoc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Jan 2017 06:44:32 -0500
In-Reply-To: <CACRpkdZytHGor3XxSGYFthdfht8o=aO5iGzCxV6xMm61E4Q-1Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Christophe RICARD <christophe.ricard@gmail.com>

On Wed, 2017-01-11 at 12:11 +0100, Linus Walleij wrote:
> On Mon, Jan 9, 2017 at 3:02 PM, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > It seems the code had been changed, but description left untouched.
> > 
> > Update description of the struct acpi_gpio_info and relative
> > comments
> > accordingly.
> > 
> > Fixes: commit 52044723cd27 ("ACPI / gpio: Add irq_type when a GPIO
> > is used as an interrupt")
> > Cc: Christophe RICARD <christophe.ricard@gmail.com>
> > Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> This too seems identical to v1.

Yes, and patch 3 after discussion stays same.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
