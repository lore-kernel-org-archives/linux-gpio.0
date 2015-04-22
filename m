From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] Documentation: gpiolib: sysfs: high can be any nonzero
 value
Date: Wed, 22 Apr 2015 19:10:24 +0200
Message-ID: <20150422171024.GF16828@localhost>
References: <1429720786-6277-1-git-send-email-dirk.behme@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:36450 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966252AbbDVRKY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Apr 2015 13:10:24 -0400
Received: by lagv1 with SMTP id v1so180044638lag.3
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2015 10:10:23 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1429720786-6277-1-git-send-email-dirk.behme@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dirk Behme <dirk.behme@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>

On Wed, Apr 22, 2015 at 06:39:46PM +0200, Dirk Behme wrote:
> With the commit 79a9becda8940d ("gpiolib: export descriptor-based
> GPIO interface") the gpiolib can return any nonzero value for high.
> Not only 1. Correct this in the documentation.

As _gpiod_get_raw_value returns a bool, I fail to see how that could
happen.

Ah, that was fixed by commit 23600969ff13 ("gpio: clamp returned values
to the boolean range") in 3.15.

Looks like that one should be backported to 3.14 instead.

Thanks,
Johan
