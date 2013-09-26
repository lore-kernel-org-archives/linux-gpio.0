From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 3/7] misc: ixp4-beeper: use gpiolib strictly
Date: Thu, 26 Sep 2013 08:51:09 -0700
Message-ID: <20130926155109.GB18017@kroah.com>
References: <1378816226-8016-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:58052 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753288Ab3IZPvK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Sep 2013 11:51:10 -0400
Content-Disposition: inline
In-Reply-To: <1378816226-8016-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khc@pm.waw.pl>, Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>

On Tue, Sep 10, 2013 at 02:30:26PM +0200, Linus Walleij wrote:
> Request and free the GPIO line used for the beeper properly.
> Then use the gpiolib API to flip the output of the GPIO pin
> instead of relying on hacks to poke the register bits.
> 
> Cc: Imre Kaloz <kaloz@openwrt.org>
> Cc: Krzysztof Halasa <khc@pm.waw.pl>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Arnd/Greg: seeking your ACK to take this through the GPIO tree
> as part of the attempt at cleaning out custom GPIO implementations.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
