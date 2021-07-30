Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75FFEC4338F
	for <linux-gpio@archiver.kernel.org>; Fri, 30 Jul 2021 11:30:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BC1C6101C
	for <linux-gpio@archiver.kernel.org>; Fri, 30 Jul 2021 11:30:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238703AbhG3LaJ (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 30 Jul 2021 07:30:09 -0400
Received: from mga05.intel.com ([192.55.52.43]:36740 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238695AbhG3LaI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Jul 2021 07:30:08 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="298667323"
X-IronPort-AV: E=Sophos;i="5.84,281,1620716400"; 
   d="scan'208";a="298667323"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2021 04:30:03 -0700
X-IronPort-AV: E=Sophos;i="5.84,281,1620716400"; 
   d="scan'208";a="476930891"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2021 04:30:01 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1m9QiB-003Mwg-58; Fri, 30 Jul 2021 14:29:55 +0300
Date:   Fri, 30 Jul 2021 14:29:55 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>,
        "Saha, Tamal" <tamal.saha@intel.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: Add bindings for Intel
 Keembay pinctrl driver
Message-ID: <YQPis1mVrVNwplKY@smile.fi.intel.com>
References: <20210716162724.26047-1-lakshmi.sowjanya.d@intel.com>
 <20210716162724.26047-2-lakshmi.sowjanya.d@intel.com>
 <CACRpkdZdK38iwwCQKqUQ1Xbd-5kf8NFjAxT8pvq+e7jT+wiThA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZdK38iwwCQKqUQ1Xbd-5kf8NFjAxT8pvq+e7jT+wiThA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 30, 2021 at 11:05:43AM +0200, Linus Walleij wrote:
> Since this is one of those "Intel but Arm" things I don't know how
> Andy feels about picking up the patch to his Intel pinctrl tree
> (I think we discussed it in the past) so I need to know how to handle
> this. It'd be great if Andy queues "all Intel stuff" but I don't want
> to force unfamiliar stuff on him either.
> 
> Andy? Do you pick this (when finished) or should I?

I think it's for you. Mika and I are about Intel pin controllers on x86.

-- 
With Best Regards,
Andy Shevchenko


