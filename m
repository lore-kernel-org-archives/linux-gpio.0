From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 24/54] pinctrl: baytrail: Be sure to clamp return value
Date: Wed, 23 Dec 2015 10:53:14 +0200
Message-ID: <20151223085314.GI1758@lahna.fi.intel.com>
References: <1450794528-23650-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:30653 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932962AbbLWI4K (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 23 Dec 2015 03:56:10 -0500
Content-Disposition: inline
In-Reply-To: <1450794528-23650-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>

On Tue, Dec 22, 2015 at 03:28:48PM +0100, Linus Walleij wrote:
> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret = !!(val) design pattern.
> 
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
