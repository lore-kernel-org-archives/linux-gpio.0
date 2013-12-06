From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v3 0/4] gpiolib: clean up messaging part
Date: Fri, 6 Dec 2013 10:40:00 +0900
Message-ID: <52A12AF0.1020406@nvidia.com>
References: <1386235586-16713-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:19164 "EHLO
	hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753090Ab3LFBkE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Dec 2013 20:40:04 -0500
In-Reply-To: <1386235586-16713-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

Series looks good to me. Thanks for addressing the issues.

On 12/05/2013 06:26 PM, Andy Shevchenko wrote:
> Compile tested and tested on Medfield with SFI.
>
> Changes since v2:
>   - applied Mika's Reviewed tag (except patch 2/4 as it was modified)
>   - address Alexandre's comments.
>
> [1] http://www.spinics.net/lists/kernel/msg1645907.html
> [2] http://www.spinics.net/lists/linux-acpi/msg47572.html
>
> Andy Shevchenko (4):
>    gpiolib: unify pr_* messages format
>    gpiolib: introduce chip_* to print with chip->label prefix
>    gpiolib: convert gpiod_lookup description to kernel-doc
>    gpiolib: update inline documentation of gpiod_get_index()
>
>   drivers/gpio/gpiolib.c      | 117 ++++++++++++++++++++++++--------------------
>   include/linux/gpio/driver.h |  26 ++++------
>   2 files changed, 73 insertions(+), 70 deletions(-)
>

