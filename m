From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: check ops->pin_config_set in
 pinconf_set_config()
Date: Fri, 4 Aug 2017 13:12:02 +0300
Message-ID: <20170804101202.GW2369@lahna.fi.intel.com>
References: <1501815572-2792-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:34739 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751285AbdHDKMG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 4 Aug 2017 06:12:06 -0400
Content-Disposition: inline
In-Reply-To: <1501815572-2792-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

On Fri, Aug 04, 2017 at 11:59:32AM +0900, Masahiro Yamada wrote:
> pinconf_set_config() is called by pinctrl_gpio_set_config().
> If a GPIO driver is backed by a pinctrl driver and it does not
> support .pin_config_set() hook, it causes NULL pointer dereference.
> 
> Fixes: 15381bc7c7f5 ("pinctrl: Allow configuration of pins from gpiolib based drivers")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
