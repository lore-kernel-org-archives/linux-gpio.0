From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 5/5] pinctrl: cherryview: restore padctrl1 reg when gpio
 is disabled
Date: Mon, 6 Jun 2016 13:40:52 +0300
Message-ID: <20160606104052.GX1743@lahna.fi.intel.com>
References: <1464904543-4094-1-git-send-email-dan@emutex.com>
 <1464904543-4094-6-git-send-email-dan@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:45210 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750764AbcFFKk4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 6 Jun 2016 06:40:56 -0400
Content-Disposition: inline
In-Reply-To: <1464904543-4094-6-git-send-email-dan@emutex.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan O'Donovan <dan@emutex.com>
Cc: linus.walleij@linaro.org, heikki.krogerus@linux.intel.com, linux-gpio@vger.kernel.org

On Thu, Jun 02, 2016 at 10:55:43PM +0100, Dan O'Donovan wrote:
> chv_gpio_request_enable() clears some bits in the padctrl1 register
> when GPIO mode is selected, but these bits are not restored by
> chv_gpio_disable_free() when GPIO mode is unselected and this can
> prevent other pin modes (e.g. I2C) from functioning correctly
> thereafter on that pin.  This patch adds saving/restoring of those
> bits.

Not sure how useful this is. If you want to mux I2C out of pins (even if
they were previosly configured as GPIO), you should call pinctrl to do
that (or let the core to do that automatically). Expecting that certain
(possibly unknown state) is restored does seem fragile to me.

Also what happens if the pin was originally muxed as GPIO?
