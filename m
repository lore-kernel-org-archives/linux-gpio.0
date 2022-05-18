Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1CFC433EF
	for <linux-gpio@archiver.kernel.org>; Wed, 18 May 2022 08:46:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233553AbiERIqP (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 18 May 2022 04:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233522AbiERIqM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 May 2022 04:46:12 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A9C233340;
        Wed, 18 May 2022 01:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652863571; x=1684399571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L/lLZmPJYIUElQLXz0c6cMAmGlkHoAzU1BvepLn3GXQ=;
  b=Q27HzFAzfmVArlPIVnWYqhHPfWCifaCw3HHGT1pw9nxht7ljdjMNn2Yw
   UqeM1PAMFf7eT0867Tw91ECrp0172XGLgfzmCzMNPTchUOUpIEyc/uWQg
   9EWMeXMGWM6OdyxINw4bULnxuIOpb7F62CtVrq3AprGw3KwXOa5RiL9an
   9hhAbfQfv+fjzCrYUyPr3wdVA5Qe5rci9tLX8mHQIQWe/b3ZG6EEEZPBO
   Mo2ZA2oBt5ja4VS3UUCeYriHxzKL+knoqnoEyuKcGJJna6DHhTtgUn6AS
   6yVJqrnzWQ88M70JjKPwYjqhTHixAZzQeEfsGYYz/U324nkUAk99455RU
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="252079130"
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; 
   d="scan'208";a="252079130"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2022 01:46:11 -0700
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; 
   d="scan'208";a="545338044"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2022 01:46:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nrFJm-0008vp-SS;
        Wed, 18 May 2022 11:46:06 +0300
Date:   Wed, 18 May 2022 11:46:06 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] pinctrl: intel: make irq_chip immutable
Message-ID: <YoSyTq2908EptTGd@smile.fi.intel.com>
References: <20220517163820.86768-1-andriy.shevchenko@linux.intel.com>
 <YoR/QXuS+VlLVWto@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoR/QXuS+VlLVWto@lahna>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 18, 2022 at 08:08:17AM +0300, Mika Westerberg wrote:
> On Tue, May 17, 2022 at 07:38:19PM +0300, Andy Shevchenko wrote:
> > +static const struct irq_chip intel_gpio_irq_chip = {
> > +	.name		= "intel-gpio",
> > +	.irq_ack	= intel_gpio_irq_ack,
> > +	.irq_mask	= intel_gpio_irq_mask,
> > +	.irq_unmask	= intel_gpio_irq_unmask,
> > +	.irq_set_type	= intel_gpio_irq_type,
> > +	.irq_set_wake	= intel_gpio_irq_wake,
> > +	.flags		= IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_IMMUTABLE,
> > +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
> > +};
> 
> You still have the inconsistent alignment here.

I'm not sure what problem do you see.

If you are talking about last line, it's special and that's how it's done
in other drivers which have been converted already.

-- 
With Best Regards,
Andy Shevchenko


