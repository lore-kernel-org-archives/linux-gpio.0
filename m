Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE032C001DF
	for <linux-gpio@archiver.kernel.org>; Mon, 24 Jul 2023 15:23:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjGXPXa (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 24 Jul 2023 11:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjGXPX3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jul 2023 11:23:29 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B76312F;
        Mon, 24 Jul 2023 08:23:28 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="367495892"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="367495892"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 08:23:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="815869624"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="815869624"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Jul 2023 08:23:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1qNxPA-001DIu-21;
        Mon, 24 Jul 2023 18:23:24 +0300
Date:   Mon, 24 Jul 2023 18:23:24 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: linux-next: Tree for Jul 20 (gpio/gpio-ge)
Message-ID: <ZL6XbEI2pxOLDgge@smile.fi.intel.com>
References: <20230720142243.1b463b82@canb.auug.org.au>
 <65b4ac1a-1128-6e2a-92c0-9bbcca4b760a@infradead.org>
 <f1e4938f-ddb8-1301-bd7a-f86679313eee@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1e4938f-ddb8-1301-bd7a-f86679313eee@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 20, 2023 at 12:56:53PM -0700, Randy Dunlap wrote:
> On 7/20/23 12:54, Randy Dunlap wrote:
> > On 7/19/23 21:22, Stephen Rothwell wrote:

> >> Changes since 20230719:

> > @Martyn:
> > Please add a trailing '>' here:
> > MODULE_AUTHOR("Martyn Welch <martyn.welch@ge.com");
> 
> and email to Martyn bounced... :(

Thank you for the report, I'm going to fix it right away.
It also seems to have COMPILE_TEST to be added.

-- 
With Best Regards,
Andy Shevchenko


