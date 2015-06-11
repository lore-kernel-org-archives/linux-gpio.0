From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio / ACPI: Return -EPROBE_DEFER if the gpiochip was not found
Date: Thu, 11 Jun 2015 10:18:34 +0200
Message-ID: <CACRpkdZVUaT4-C--Q7N8Teq1mQchYBYB95_Z1sJrjTXeh17MOg@mail.gmail.com>
References: <1433941505-135180-1-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:35529 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750752AbbFKISe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Jun 2015 04:18:34 -0400
Received: by obbgp2 with SMTP id gp2so50049819obb.2
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2015 01:18:34 -0700 (PDT)
In-Reply-To: <1433941505-135180-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Tobias Diedrich <tobiasdiedrich@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jun 10, 2015 at 3:05 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> If a driver requests a GPIO described in its _CRS but the GPIO host
> controller (gpiochip) driver providing the GPIO has not been loaded yet
> acpi_get_gpiod() returns -ENODEV which causes the calling driver to fail.
>
> If the gpiochip driver is loaded afterwards the driver requesting the GPIO
> will not notice this.
>
> Better approach is to return -EPROBE_DEFER in such case. Then when the
> gpiochip driver appears the driver requesting the GPIO will be probed
> again. This also aligns ACPI GPIO lookup code closer to DT as it does
> pretty much the same when no gpiochip driver was found.
>
> Reported-by: Tobias Diedrich <tobiasdiedrich@gmail.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied with the ACKs etc.

Yours,
Linus Walleij
