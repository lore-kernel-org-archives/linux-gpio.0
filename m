From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: Re: [PATCH] mdio-mux-gpio: Use GPIO descriptor interface and new gpiod_set_array function
Date: Mon, 24 Nov 2014 09:35:02 +0100
Message-ID: <1671914.Rot4bT9ZsP@pcimr>
References: <6441674.xrJo8HXDvD@pcimr> <20141121.151301.477197043372693075.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:34985 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753164AbaKXIfI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Nov 2014 03:35:08 -0500
In-Reply-To: <20141121.151301.477197043372693075.davem@davemloft.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: f.fainelli@gmail.com, netdev@vger.kernel.org, david.daney@cavium.com, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, acourbot@nvidia.com

On Friday 21 November 2014 15:13:01 David Miller wrote:
> From: Rojhalat Ibrahim <imr@rtschenk.de>
> Date: Thu, 20 Nov 2014 13:24:44 +0100
> 
> > Convert mdio-mux-gpio to the GPIO descriptor interface and use the new
> > gpiod_set_array function to set all output signals simultaneously.
> > 
> > Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
> > --
> > This patch depends on the gpiod_set_array function, which is available in
> > the linux-gpio devel tree.
> 
> Then I really can't apply it to the networking GIT tree.
> 

Then maybe you could ack the patch and then Linus Walleij could apply it to
the GPIO tree, right?

   Rojhalat


