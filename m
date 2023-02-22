Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14544C636D6
	for <linux-gpio@archiver.kernel.org>; Wed, 22 Feb 2023 12:25:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjBVMZm (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 22 Feb 2023 07:25:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231691AbjBVMZk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Feb 2023 07:25:40 -0500
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB9B13B216
        for <linux-gpio@vger.kernel.org>; Wed, 22 Feb 2023 04:25:06 -0800 (PST)
Received: from localhost (88-113-24-128.elisa-laajakaista.fi [88.113.24.128])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id ff9e884c-b2aa-11ed-bd9b-005056bd6ce9;
        Wed, 22 Feb 2023 14:18:22 +0200 (EET)
From:   andy.shevchenko@gmail.com
Date:   Wed, 22 Feb 2023 14:18:22 +0200
To:     Keguang Zhang <keguang.zhang@gmail.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 2/4] gpio: loongson1: Introduce ls1x_gpio_chip struct
Message-ID: <Y/YIDobQW8W3QAAh@surfacebook>
References: <20230222111213.2241633-1-keguang.zhang@gmail.com>
 <20230222111213.2241633-3-keguang.zhang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222111213.2241633-3-keguang.zhang@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Wed, Feb 22, 2023 at 07:12:11PM +0800, Keguang Zhang kirjoitti:
> Introduce and allocate ls1x_gpio_chip struct containing
> gpio_chip and reg_base to avoid global gpio_reg_base.
> 
> Use readl() & writel() instead of __raw_readl() & __raw_writel().

Please, split this to two pathes.

-- 
With Best Regards,
Andy Shevchenko


