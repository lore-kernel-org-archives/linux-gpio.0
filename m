From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 32/54] ARM: scoop: Be sure to clamp return value
Date: Tue, 22 Dec 2015 14:57:42 -0800
Message-ID: <20151222225742.GM30172@localhost>
References: <1450794947-27040-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:34251 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754054AbbLVW62 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 17:58:28 -0500
Received: by mail-pa0-f43.google.com with SMTP id uo6so18645921pac.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 14:58:28 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1450794947-27040-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, arm@kernel.org, Richard Purdie <rpurdie@rpsys.net>

On Tue, Dec 22, 2015 at 03:35:47PM +0100, Linus Walleij wrote:
> As we want gpio_chip .get() calls to be able to return negative
> error codes and propagate to drivers, we need to go over all
> drivers and make sure their return values are clamped to [0,1].
> We do this by using the ret = !!(val) design pattern.
> 
> Cc: arm@kernel.org
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ARM SoC folks: as mentioned in 00/54: either apply this directly
> or ACK it and I will take it into the GPIO tree.

Applied to next/fixes-non-critical for v4.5. Thanks!


-Olof

