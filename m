From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 092/182] pinctrl: bcm2835: use gpiochip data pointer
Date: Thu, 10 Dec 2015 22:20:48 -0700
Message-ID: <566A5D30.2040401@wwwdotorg.org>
References: <1449667836-1932-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:46499 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754063AbbLKFUu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2015 00:20:50 -0500
In-Reply-To: <1449667836-1932-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Eric Anholt <eric@anholt.net>

On 12/09/2015 06:30 AM, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().

This looks like it's fine, but I wonder what is the justification for
the change? It might be good to mention that in the commit description.
