Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE75AC4338F
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Aug 2021 12:40:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D81F61073
	for <linux-gpio@archiver.kernel.org>; Wed, 11 Aug 2021 12:40:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbhHKMkl (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 11 Aug 2021 08:40:41 -0400
Received: from mga02.intel.com ([134.134.136.20]:12540 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229617AbhHKMkl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Aug 2021 08:40:41 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="202299361"
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; 
   d="scan'208";a="202299361"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 05:40:17 -0700
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; 
   d="scan'208";a="503483379"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 05:40:15 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mDnWi-007p8s-SS; Wed, 11 Aug 2021 15:40:08 +0300
Date:   Wed, 11 Aug 2021 15:40:08 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: Re: [RFC PATCH v2 1/1] misc: add sloppy logic analyzer using polling
Message-ID: <YRPFKIF/eW9FBgP1@smile.fi.intel.com>
References: <20210519132528.4394-1-wsa+renesas@sang-engineering.com>
 <20210519132528.4394-2-wsa+renesas@sang-engineering.com>
 <YKUlbsWhT45l5Zm0@smile.fi.intel.com>
 <YQRZkFApESOIMRmv@ninjato>
 <YQRk0vpo1V709z/Z@smile.fi.intel.com>
 <YRI5l+T1o3QXZ9Lo@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRI5l+T1o3QXZ9Lo@ninjato>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 10, 2021 at 10:32:23AM +0200, Wolfram Sang wrote:
> Hi Andy,
> 
> > Nope. Below is the compile-tested one:
> 
> Well, then let's add this incrementally once it has actually been
> tested.

I have no strong opinion here, I just considered that ACPI code is good to have
as well.

> > > I don't understand the first sentence. And we still need it to clean up?
> > 
> > If you know the name of the folder, you may look up it, no need to keep a
> > variable for that.
> 
> I need the dentry twice, subdirs are also created in there. Of course, I
> could look it up twice, but why the computation? The variable seems
> simpler to me, despite it being static. Or is it a debugfs rule to not
> save dentries?

I think the best person to ask is Greg :-)

-- 
With Best Regards,
Andy Shevchenko


