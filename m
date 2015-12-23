From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 24/54] pinctrl: baytrail: Be sure to clamp return value
Date: Wed, 23 Dec 2015 11:12:02 +0200
Message-ID: <20151223091202.GA31437@kuha.fi.intel.com>
References: <1450794528-23650-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:33492 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752244AbbLWJMp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 23 Dec 2015 04:12:45 -0500
Content-Disposition: inline
In-Reply-To: <1450794528-23650-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>

On Tue, Dec 22, 2015 at 03:28:48PM +0100, Linus Walleij wrote:
> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret = !!(val) design pattern.
> 
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

-- 
heikki
