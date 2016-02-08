From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 172/182] staging: vme: use gpiochip data pointer
Date: Sun, 7 Feb 2016 20:08:12 -0800
Message-ID: <20160208040812.GA30116@kroah.com>
References: <1449669005-6835-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:58623 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753255AbcBHEIN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Feb 2016 23:08:13 -0500
Content-Disposition: inline
In-Reply-To: <1449669005-6835-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Martyn Welch <martyn@welchs.me.uk>, Manohar Vanga <manohar.vanga@gmail.com>, devel@driverdev.osuosl.org

On Wed, Dec 09, 2015 at 02:50:05PM +0100, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Martyn Welch <martyn@welchs.me.uk>
> Cc: Manohar Vanga <manohar.vanga@gmail.com>
> Cc: devel@driverdev.osuosl.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Greg, please ACK this so I can take this through the GPIO tree.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
