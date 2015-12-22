From: David Cohen <david.a.cohen@linux.intel.com>
Subject: Re: [PATCH 05/54] gpio: intel-mid: Be sure to clamp return value
Date: Tue, 22 Dec 2015 14:58:49 -0800
Message-ID: <20151222225849.GA9413@psi-dev26.jf.intel.com>
References: <1450793525-22057-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:37357 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754054AbbLVW6v (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 22 Dec 2015 17:58:51 -0500
Content-Disposition: inline
In-Reply-To: <1450793525-22057-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

On Tue, Dec 22, 2015 at 03:12:05PM +0100, Linus Walleij wrote:
> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret = !!(val) design pattern.
> 
> Cc: David Cohen <david.a.cohen@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Sounds good to me :)
Acked-by: David Cohen <david.a.cohen@linux.intel.com>
 
