From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/7] misc: ixp4-beeper: switch to use gpiolib
Date: Thu, 26 Sep 2013 08:50:59 -0700
Message-ID: <20130926155059.GA18017@kroah.com>
References: <1378816210-7977-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:58041 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753314Ab3IZPvA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Sep 2013 11:51:00 -0400
Content-Disposition: inline
In-Reply-To: <1378816210-7977-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khc@pm.waw.pl>, Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>

On Tue, Sep 10, 2013 at 02:30:10PM +0200, Linus Walleij wrote:
> The platform using this beeper has support for gpiolib, so there
> is no point to use the custom gpio_line* API. A strange ambiguity
> where a line was first set as input and then driven high was
> solved by first driving the line high as output and then switch
> it to input.
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
