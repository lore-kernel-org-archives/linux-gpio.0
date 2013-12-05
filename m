From: David Cohen <david.a.cohen@intel.com>
Subject: Re: [PATCH v1 0/3]
Date: Thu, 05 Dec 2013 14:46:11 -0800
Message-ID: <52A10233.8030102@intel.com>
References: <1386261409-13850-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:27660 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750920Ab3LEWl2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 5 Dec 2013 17:41:28 -0500
In-Reply-To: <1386261409-13850-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>, Len Brown <lenb@kernel.org>

Hi Andy,

On 12/05/2013 08:36 AM, Andy Shevchenko wrote:
> Here is a third [1] version of the SFI GPIO helpers. This series contains SFI

Your patch set subject says it's the first version :)

> GPIO helpers along with the update of GPIO library to lookup for SFI resources.
>
> It has been tested on Medfield device on top of v3.13-rc2 + Alexandre's GPIO
> descriptor API update [2], Mika's ACPI gpio patches [3] and my GPIO library
> clean up [4].

Good test case. I'm able to extend it to Merrifield.

Br, David

>
> [1] https://lkml.org/lkml/2013/6/5/316
> [2] http://www.spinics.net/lists/kernel/msg1645907.html
> [3] http://www.spinics.net/lists/linux-acpi/msg47572.html
> [4] https://www.mail-archive.com/linux-gpio@vger.kernel.org/msg01515.html
>
> Andy Shevchenko (3):
>   SFI: fix compiler warnings
>   SFI: store GPIO table and export lookup function
>   gpiolib: append SFI helpers for GPIO API
>
>  drivers/gpio/Kconfig       |   4 ++
>  drivers/gpio/Makefile      |   1 +
>  drivers/gpio/gpiolib-sfi.c |  28 +++++++++++
>  drivers/gpio/gpiolib.c     |   3 ++
>  drivers/gpio/gpiolib.h     |  13 +++++
>  drivers/sfi/Makefile       |   2 +-
>  drivers/sfi/sfi_acpi.c     |   9 ++--
>  drivers/sfi/sfi_core.c     |  10 +++-
>  drivers/sfi/sfi_core.h     |   3 ++
>  drivers/sfi/sfi_gpio.c     | 123 +++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/sfi.h        |   8 +++
>  11 files changed, 197 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/gpio/gpiolib-sfi.c
>  create mode 100644 drivers/sfi/sfi_gpio.c
>

