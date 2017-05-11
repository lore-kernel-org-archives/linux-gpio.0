From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: aspeed: Don't attempt to debounce if disabled
Date: Thu, 11 May 2017 13:32:20 +0200
Message-ID: <CACRpkdZwf2feNGCn6RNOXK82PeMXmxJ1MBL=0aBajLHTZ_WP_Q@mail.gmail.com>
References: <20170502060824.6457-1-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f170.google.com ([209.85.223.170]:36617 "EHLO
        mail-io0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751208AbdEKLcV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 May 2017 07:32:21 -0400
Received: by mail-io0-f170.google.com with SMTP id o12so19261889iod.3
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2017 04:32:21 -0700 (PDT)
In-Reply-To: <20170502060824.6457-1-joel@jms.id.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>

On Tue, May 2, 2017 at 8:08 AM, Joel Stanley <joel@jms.id.au> wrote:

> We warn the user at driver probe time that debouncing is disabled.
> However, if they request debouncing later on we print a confusing error
> message:
>
>  gpio_aspeed 1e780000.gpio: Failed to convert 5000us to cycles at 0Hz: -524
>
> Instead bail out when the clock is not present.
>
> Fixes: 5ae4cb94b3133 (gpio: aspeed: Add debounce support)
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Patch applied for fixes.

Yours,
Linus Walleij
