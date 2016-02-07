From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 173/182] serial: max310x: use gpiochip data pointer
Date: Sat, 6 Feb 2016 23:20:52 -0800
Message-ID: <20160207072052.GA16215@kroah.com>
References: <1449669016-6882-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:59807 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753354AbcBGHUw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Feb 2016 02:20:52 -0500
Content-Disposition: inline
In-Reply-To: <1449669016-6882-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Jiri Slaby <jslaby@suse.com>

On Wed, Dec 09, 2015 at 02:50:16PM +0100, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jslaby@suse.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Greg, please ACK this so I can take it through the GPIO tree.


Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
