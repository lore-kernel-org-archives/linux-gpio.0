Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7083EEB64D7
	for <linux-gpio@archiver.kernel.org>; Fri, 16 Jun 2023 14:13:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbjFPONp (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 16 Jun 2023 10:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbjFPONp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2023 10:13:45 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6546526BA;
        Fri, 16 Jun 2023 07:13:44 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="445603729"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="445603729"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 07:13:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="690256318"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="690256318"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 16 Jun 2023 07:13:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1qAACp-004Ihg-34;
        Fri, 16 Jun 2023 17:13:39 +0300
Date:   Fri, 16 Jun 2023 17:13:39 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Michael Walle <mwalle@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiawen Wu <jiawenwu@trustnetic.com>
Subject: Re: [PATCH] gpiolib: Fix irq_domain resource tracking for
 gpiochip_irqchip_add_domain()
Message-ID: <ZIxuExRypHsUejFI@smile.fi.intel.com>
References: <20230616-fixes-gpiolib-irq-domain-v1-1-27fe870db961@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616-fixes-gpiolib-irq-domain-v1-1-27fe870db961@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 16, 2023 at 09:30:06AM +0200, Michael Walle wrote:
> Up until commit 6a45b0e2589f ("gpiolib: Introduce
> gpiochip_irqchip_add_domain()") all irq_domains were allocated
> by gpiolib itself and thus gpiolib also takes care of freeing it.
> 
> With gpiochip_irqchip_add_domain() a user of gpiolib can associate an
> irq_domain with the gpio_chip. This irq_domain is not managed by
> gpiolib and therefore must not be freed by gpiolib.

With or without below nit-pick
Reviewed-by: Andy Shevchenko <andy@kernel.org>

...

>  	/* Remove all IRQ mappings and delete the domain */
> -	if (gc->irq.domain) {
> +	if (!gc->irq.domain_is_ext && gc->irq.domain) {

Looking at this, perhaps positive about allocation?

	domain_is_allocated?

-- 
With Best Regards,
Andy Shevchenko


