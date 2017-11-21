From: Chris Chiu <chiu@endlessm.com>
Subject: Re: [PATCH] pinctrl: intel: Initialize GPIO properly when used
 through irqchip
Date: Tue, 21 Nov 2017 11:18:04 +0800
Message-ID: <CAB4CAwchVf2G0N+OtAxbHR0+Gwd2a8otM7PKyXykGuksV68Wuw@mail.gmail.com>
References: <20171120151936.68726-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:43573 "EHLO
        mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752265AbdKUDSG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Nov 2017 22:18:06 -0500
Received: by mail-wm0-f53.google.com with SMTP id x63so370144wmf.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Nov 2017 19:18:05 -0800 (PST)
In-Reply-To: <20171120151936.68726-1-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Daniel Drake <drake@endlessm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>

On Mon, Nov 20, 2017 at 11:19 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> When a GPIO is requested using gpiod_get_* APIs the intel pinctrl driver
> switches the pin to GPIO mode and makes sure interrupts are routed to
> the GPIO hardware instead of IOAPIC. However, if the GPIO is used
> directly through irqchip, as is the case with many I2C-HID devices where
> I2C core automatically configures interrupt for the device, the pin is
> not initialized as GPIO. Instead we rely that the BIOS configures the
> pin accordingly which seems not to be the case at least in Asus X540NA
> SKU3 with Focaltech touchpad.
>
> When the pin is not properly configured it might result weird behaviour
> like interrupts suddenly stop firing completely and the touchpad stops
> responding to user input.
>
> Fix this by properly initializing the pin to GPIO mode also when it is
> used directly through irqchip.
>
> Reported-by: Daniel Drake <drake@endlessm.com>
> Reported-by: Chris Chiu <chiu@endlessm.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
> Chris, Daniel,
>
> Could you check that this still solves the issue and maybe provide your
> Tested-by? Thanks!
>

I've verified on X540NA here and it's working fine w/o any abnormal touchpad
stop.

Tested-by: Chris Chiu <chiu@endlessm.com>
