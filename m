From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 2/7] input: misc: ixp4-beeper: switch to use gpiolib
Date: Tue, 17 Sep 2013 12:01:45 -0700
Message-ID: <20130917190144.GB6894@core.coreip.homeip.net>
References: <1379061102-22279-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:58518 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753492Ab3IQTBt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Sep 2013 15:01:49 -0400
Received: by mail-pd0-f174.google.com with SMTP id y13so6023802pdi.33
        for <linux-gpio@vger.kernel.org>; Tue, 17 Sep 2013 12:01:49 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1379061102-22279-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khc@pm.waw.pl>, Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org

On Fri, Sep 13, 2013 at 10:31:42AM +0200, Linus Walleij wrote:
> The platform using this beeper has support for gpiolib, so there
> is no point to use the custom gpio_line* API. A strange ambiguity
> where a line was first set as input and then driven high was
> solved by first driving the line high as output and then switch
> it to input.
> 
> Cc: Imre Kaloz <kaloz@openwrt.org>
> Cc: Krzysztof Halasa <khc@pm.waw.pl>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
> Hi Dmitry, requesting an ACK for this to take it through the
> GPIO tree as part of an IXP4 clean-up attempt.

Sorry for the delay, I missed the fact that you wanted an ask and not
merge and was waiting for rc1 to be cut...

Thanks.

-- 
Dmitry
