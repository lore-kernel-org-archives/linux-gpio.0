Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B6EC77B7A
	for <linux-gpio@archiver.kernel.org>; Fri,  2 Jun 2023 01:32:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbjFBBcE (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 1 Jun 2023 21:32:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233139AbjFBBcD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jun 2023 21:32:03 -0400
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F8AEA3
        for <linux-gpio@vger.kernel.org>; Thu,  1 Jun 2023 18:32:03 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id 453e3234-00e5-11ee-abf4-005056bdd08f;
        Fri, 02 Jun 2023 04:32:00 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Fri, 2 Jun 2023 04:32:00 +0300
To:     Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc:     albeu@free.fr, linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: ath79: Add missing check for platform_get_irq
Message-ID: <ZHlGkM0O0IT1U7Fl@surfacebook>
References: <20230601085132.12508-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601085132.12508-1-jiasheng@iscas.ac.cn>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thu, Jun 01, 2023 at 04:51:32PM +0800, Jiasheng Jiang kirjoitti:
> Add the missing check for platform_get_irq and return error
> if it fails.

>  		girq->parents[0] = platform_get_irq(pdev, 0);
> +		if (girq->parents[0] < 0)
> +			return -ENODEV;

Can you elaborate why error code has to be shadowed (overriden)?

-- 
With Best Regards,
Andy Shevchenko


