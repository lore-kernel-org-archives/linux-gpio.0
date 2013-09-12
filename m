From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 5/7] staging: media/lirc: switch to use gpiolib
Date: Thu, 12 Sep 2013 15:18:51 -0700
Message-ID: <20130912221851.GC11463@kroah.com>
References: <1378816283-8164-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:59447 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755221Ab3ILWSx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2013 18:18:53 -0400
Content-Disposition: inline
In-Reply-To: <1378816283-8164-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khc@pm.waw.pl>, Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org

On Tue, Sep 10, 2013 at 02:31:23PM +0200, Linus Walleij wrote:
> The lirc serial module has special hooks to work with NSLU2,
> switch these over to use gpiolib, as that is available on the
> ixp4 platform.
> 
> Not even compile tested as there is no way to select this
> driver from menuconfig on the ixp4 platform.
> 
> Cc: Imre Kaloz <kaloz@openwrt.org>
> Cc: Krzysztof Halasa <khc@pm.waw.pl>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Hi Greg: I'm seeking an ACK on this patch to take it through
> the GPIO tree as part of a clean-up attempt to remove custom
> GPIO APIs.

I'm not the one responsible for drivers/staging/media/ sorry, that's
Mauro.

greg k-h
