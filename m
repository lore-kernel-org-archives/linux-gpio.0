Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B938C433EF
	for <linux-gpio@archiver.kernel.org>; Tue, 17 May 2022 16:33:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350918AbiEQQdK (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 17 May 2022 12:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350912AbiEQQdJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 May 2022 12:33:09 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93F2633358;
        Tue, 17 May 2022 09:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652805188; x=1684341188;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KCbhEy6vdSkzBqE0YJ9VgoWS4GbK8olfcLls77Yab2Q=;
  b=cpDmOzFtqKk7oRfQ2tqaAkO1LIkRkrIac9TfCpTkoHQNfIxFk/hT1b0H
   rDwmM6+9d2PtoL+0vbhuPi1PSkHL13jzcRkZETIigkktcaSIeqfwC8eeA
   t4NWha63RbqF0PXaEggb+XNtlaRyb4+BZAq8bVYsJrBUwm7+UO8cSqCOz
   9VjAmv50HruX+ihzPLTope8nRysrqkkUUuHO3ZWgFOzBHjmhZRb4Kaitx
   LgbTjmjHJJBmcvR34GfNgMwW9YCsegE+2ILvUu8jKxgA1gY/BjwZ/wSBD
   9Tm2VCgs5CAUjUkzu0QBtpTYaGerY0drTsLq9oKr+vmAAF1EEt0uL8Lny
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="334286604"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="334286604"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 09:33:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="523036457"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 09:33:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nr086-0008CP-M7;
        Tue, 17 May 2022 19:33:02 +0300
Date:   Tue, 17 May 2022 19:33:02 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/2] pinctrl: intel: make irq_chip immutable
Message-ID: <YoPOPsmBj8LEZ2uD@smile.fi.intel.com>
References: <20220516185618.32448-1-andriy.shevchenko@linux.intel.com>
 <YoN0cdUdYQotyod9@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoN0cdUdYQotyod9@lahna>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 17, 2022 at 01:09:53PM +0300, Mika Westerberg wrote:
> On Mon, May 16, 2022 at 09:56:17PM +0300, Andy Shevchenko wrote:
> > Since recently, the kernel is nagging about mutable irq_chips:
> > 
> >    "not an immutable chip, please consider fixing it!"
> > 
> > Drop the unneeded copy, flag it as IRQCHIP_IMMUTABLE, add the new
> > helper functions and call the appropriate gpiolib functions.
> > 
> > While at it, align IRQ chip callback names with member names for
> > the sake of consistency.
> 
> Or for the sake of inconsistency? ;-)  All the other structs are not
> using this kind of alignment and I would like to keep this one matching
> the rest too. Also I prefer the format currently used in the driver.

I got your point. I will drop that part from v2.

-- 
With Best Regards,
Andy Shevchenko


