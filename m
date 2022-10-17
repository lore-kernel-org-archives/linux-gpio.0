Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C70CC433FE
	for <linux-gpio@archiver.kernel.org>; Mon, 17 Oct 2022 12:20:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbiJQMUE (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 17 Oct 2022 08:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230322AbiJQMTt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 08:19:49 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0C81CC;
        Mon, 17 Oct 2022 05:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666009159; x=1697545159;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ubsHRCPNG7fg9+JWl23B1z7nIDyQTwNySmlULZGo6J0=;
  b=fXVA/zcvyZte+vE4tlRLceDCMFGQmbWgDmnH/xVi44mPveWF91Cfgp9s
   0xxmixm5i8ADmfnuOC1XiPal1jLIwKNzFiGzhLI0zpvOcGKZMBlK0s6iq
   aSNX8VsPq7xJ9eOF+nd9R06Cfg33Y2XoPak/6ezv/tNUswaURwFNu3ZOg
   cTbHkHXm8QzhWf3AU+ZiOw9mS/xEepZUinaJOt5dGW/BeUsyGWl9Vb0N3
   S6KgNStsM/9hz7qbobnDCc0dE/y/s834SdywO9jWKj9FRK6i3R0RxgZ/S
   nTdXiaWhz2Lrrn0F2Fn80kaHWSXV/G3NiRbNabzjRrpFFuafbOW3JcIeK
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="293148327"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; 
   d="scan'208";a="293148327"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2022 05:17:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="661465525"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; 
   d="scan'208";a="661465525"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 17 Oct 2022 05:17:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1okP3a-008mht-3B;
        Mon, 17 Oct 2022 15:17:22 +0300
Date:   Mon, 17 Oct 2022 15:17:22 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] pinctrl: cy8c95x0: Implement
 ->gpio_request_enable() and ->gpio_set_direction()
Message-ID: <Y01H0rBSD3jGbqWb@smile.fi.intel.com>
References: <20221010125221.28275-1-andriy.shevchenko@linux.intel.com>
 <20221010125221.28275-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdan+xdcEdXz96Hm2dYWtQdEEqFGQazMYK1_9nonSCsnJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdan+xdcEdXz96Hm2dYWtQdEEqFGQazMYK1_9nonSCsnJw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 17, 2022 at 11:55:07AM +0200, Linus Walleij wrote:
> On Mon, Oct 10, 2022 at 2:52 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Without ->gpio_request_enable() and ->gpio_set_direction()
> > callbacks it's not possible to mux GPIO via standard GPIO
> > interfaces (like `gpioget` or `gpioset` tools in user space).
> >
> > Implement those functions to fill the above mentioned gap.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Patch applied, it looked a bit scary but I realize you probably
> have tested it on the hardware and made sure it works.

Yes, exactly. The problem the driver had (before this series) I realised is
that the switching to function won't make it GPIO request and GPIO request
didn't switch function.

-- 
With Best Regards,
Andy Shevchenko


