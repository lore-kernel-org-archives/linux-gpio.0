Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D17C61DA4
	for <linux-gpio@archiver.kernel.org>; Tue, 14 Feb 2023 10:52:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231611AbjBNKwS (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 14 Feb 2023 05:52:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjBNKwR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Feb 2023 05:52:17 -0500
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC3FEDD
        for <linux-gpio@vger.kernel.org>; Tue, 14 Feb 2023 02:52:16 -0800 (PST)
Received: from localhost (88-113-24-128.elisa-laajakaista.fi [88.113.24.128])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id a3675129-ac55-11ed-bd9b-005056bd6ce9;
        Tue, 14 Feb 2023 12:52:13 +0200 (EET)
From:   andy.shevchenko@gmail.com
Date:   Tue, 14 Feb 2023 12:52:13 +0200
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] gpio: vf610: make irq_chip immutable
Message-ID: <Y+tn3Y+SraIetn5X@surfacebook>
References: <20230214073638.571417-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214073638.571417-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tue, Feb 14, 2023 at 08:36:38AM +0100, Alexander Stein kirjoitti:
> Since recently, the kernel is nagging about mutable irq_chips:
> 
>     "not an immutable chip, please consider fixing it!"
> 
> Drop the unneeded copy, flag it as IRQCHIP_IMMUTABLE, add the new
> helper functions and call the appropriate gpiolib functions.

...

> The overall changes are based on commit f1138dacb7ff
> ("gpio: sch: make irq_chip immutable")

Nice, but you forgot one crucial detail. You need to mark GPIO resuested
whenever it's locked as IRQ and otherwise when unlocked.

-- 
With Best Regards,
Andy Shevchenko


