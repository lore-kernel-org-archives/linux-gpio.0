From: Rabin Vincent <rabin@rab.in>
Subject: Re: [PATCH 1/5] gpio: etraxfs: use container_of() to get state
 container
Date: Thu, 27 Aug 2015 19:27:45 +0200
Message-ID: <20150827172745.GB5251@debian>
References: <1440687258-16977-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:35694 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750967AbbH0R1t (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2015 13:27:49 -0400
Received: by lbcbn3 with SMTP id bn3so15778961lbc.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2015 10:27:48 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1440687258-16977-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>

On Thu, Aug 27, 2015 at 04:54:18PM +0200, Linus Walleij wrote:
> The state container of the etraxfs GPIO driver is extracted from
> the gpio_chip exploiting the fact that offsetof() the
> struct gpio_chip inside the struct bgpio_chip are both 0, so
> the container_of() is in practice a noop. However if a member
> is added to struct etraxfs_gpio_chip in front of
> struct bgpio_chip, things will break. Using proper container_of()
> avoids this problem.
> 
> Semantically this is a noop, the compiler will optimize it away,
> but syntactically it makes me happier.
> 
> Cc: Rabin Vincent <rabin@rab.in>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Rabin Vincent <rabin@rab.in>
