From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH RESEND] gpio: (gpio-pca953x) move header to
 linux/platform_data/
Date: Thu, 29 Aug 2013 12:35:21 -0700
Message-ID: <20130829193521.GJ18542@quad.lixom.net>
References: <1377804254-15955-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:51517 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754384Ab3H2TgB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2013 15:36:01 -0400
Received: by mail-pa0-f48.google.com with SMTP id kp13so1328125pab.7
        for <linux-gpio@vger.kernel.org>; Thu, 29 Aug 2013 12:36:00 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1377804254-15955-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: arm@kernel.org, Kevin Hilman <khilman@deeprootsystems.com>, linux-gpio@vger.kernel.org, kernel@savoirfairelinux.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, H Hartley Sweeten <hsweeten@visionengravers.com>

On Thu, Aug 29, 2013 at 03:24:14PM -0400, Vivien Didelot wrote:
> This patch moves the pca953x.h header from include/linux/i2c to
> include/linux/platform_data and updates existing support accordingly.
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: H Hartley Sweeten <hsweeten@visionengravers.com>
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>

Thanks, applied.


-Olof
