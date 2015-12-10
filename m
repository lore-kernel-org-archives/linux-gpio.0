From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 093/182] pinctrl: cherryview: use gpiochip data pointer
Date: Thu, 10 Dec 2015 09:50:54 +0200
Message-ID: <20151210075054.GB4884@kuha.fi.intel.com>
References: <1449667843-1997-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:45337 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750990AbbLJHu7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 10 Dec 2015 02:50:59 -0500
Content-Disposition: inline
In-Reply-To: <1449667843-1997-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Wed, Dec 09, 2015 at 02:30:43PM +0100, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
> 
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Thanks,

-- 
heikki
