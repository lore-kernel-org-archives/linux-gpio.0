From: Michael Welling <mwelling@ieee.org>
Subject: Re: [PATCH 3/6] gpio: add a userspace chardev ABI for GPIOs
Date: Thu, 22 Oct 2015 15:35:57 -0500
Message-ID: <20151022203557.GB8584@deathstar>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <1445502750-22672-4-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f176.google.com ([209.85.223.176]:33772 "EHLO
	mail-io0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752035AbbJVUgE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Oct 2015 16:36:04 -0400
Received: by iodv82 with SMTP id v82so104083131iod.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2015 13:36:02 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1445502750-22672-4-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Markus Pargmann <mpa@pengutronix.de>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Thu, Oct 22, 2015 at 10:32:27AM +0200, Linus Walleij wrote:
> - Hotpluggable GPIO controllers can come and go, as this
>   kind of problem has been know to userspace for character

.. has been known ..

