Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0523C77B78
	for <linux-gpio@archiver.kernel.org>; Wed, 26 Apr 2023 14:42:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241449AbjDZOmo (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 26 Apr 2023 10:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241276AbjDZOmn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Apr 2023 10:42:43 -0400
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A97F81B0
        for <linux-gpio@vger.kernel.org>; Wed, 26 Apr 2023 07:42:42 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id 9869c317-e440-11ed-a9de-005056bdf889;
        Wed, 26 Apr 2023 17:42:40 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Wed, 26 Apr 2023 17:42:40 +0300
To:     Yan Wang <rk.code@outlook.com>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] gpio: gpiolib: clear the array_info's memory space
Message-ID: <ZEk4YNQeYohEwnSg@surfacebook>
References: <202304232146.7M89pwCz-lkp@intel.com>
 <KL1PR01MB5448327326B6EDA8001AF714E6669@KL1PR01MB5448.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <KL1PR01MB5448327326B6EDA8001AF714E6669@KL1PR01MB5448.apcprd01.prod.exchangelabs.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sun, Apr 23, 2023 at 09:59:43PM +0800, Yan Wang kirjoitti:
> if hardware number different to array index,it needs to clear to points
> memory space if the array_info have been assigned a value.

Can you explain a bit more what's going on there?

...

>  			if (bitmap_full(array_info->get_mask, descs->ndescs)) {
> +				/*clear descs->info*/
> +				memset(array_info, 0, sizeof(struct gpio_array));
>  				array_info = NULL;

...

>  			}

-- 
With Best Regards,
Andy Shevchenko


