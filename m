From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/7] misc: ixp4-beeper: use gpiolib strictly
Date: Tue, 10 Sep 2013 23:47:14 +0200
Message-ID: <201309102347.14920.arnd@arndb.de>
References: <1378816226-8016-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:51141 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753027Ab3IJVsJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Sep 2013 17:48:09 -0400
In-Reply-To: <1378816226-8016-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khc@pm.waw.pl>, Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Tuesday 10 September 2013, Linus Walleij wrote:
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


Acked-by: Arnd Bergmann <arnd@arndb.de>
