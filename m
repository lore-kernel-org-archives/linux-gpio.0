From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] gpiolib: unexport requested gpios on gpiochip removal
Date: Wed, 10 Jun 2015 19:29:49 +0200
Message-ID: <20150610172949.GA4668@localhost>
References: <1433946861-22371-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:36490 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932793AbbFJR3n (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2015 13:29:43 -0400
Content-Disposition: inline
In-Reply-To: <1433946861-22371-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Patrick Titiano <ptitiano@baylibre.com>, Benoit Cousson <bcousson@baylibre.com>

Hi Bartosz,

On Wed, Jun 10, 2015 at 04:34:21PM +0200, Bartosz Golaszewski wrote:
> When a GPIO expander device is removed - e.g. via i2c-adapter
> new_device/delete_device interface - with some GPIOs still requested,
> gpiochip_remove() function will emit a warning but remove the chip
> anyway.
> 
> If we then reinstantiate this device and try to export any of the GPIOs
> still requested on gpiochip deletion the following warning will be
> emitted:

For GPIOs exported through sysfs, this has already been fixed by commit
483d82110879 ("gpio: sysfs: fix memory leaks and device hotplug"), which
has also been backported to stable.

Thanks,
Johan
