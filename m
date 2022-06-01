Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6134C433EF
	for <linux-gpio@archiver.kernel.org>; Wed,  1 Jun 2022 16:05:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355210AbiFAQFX (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 1 Jun 2022 12:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242784AbiFAQFW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 12:05:22 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E780AA5A94;
        Wed,  1 Jun 2022 09:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654099521; x=1685635521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xDqz+zeD59WcYzE7cfdioIRHyhOeYFOdYrSIqs+P4JA=;
  b=Z5g3gkShprXqm1Oq+sjuwXJ6JtfAKou+Z//gZeGr44BlpsYGgmkJK3Gu
   kDZywk1WQE2WPlojXlBbfDlHukYcyM5rT/WmsRrabZ57yMdnFjwHcubm0
   l4sp0+MZWFdesBQYKNk96ultUbloLRYXlr0Z0U7WFA3ZK49oyRpUYuJ99
   YYhm2AegL5+S99iEkLfrjGHaiRi+2G9qWhAzkHbLAo/HfKbyrJyvM6Y69
   qDiwShz1g1xJTPwHGopt4L/GJJcG8LAwCRsKZ5iTLhe+1wKhSQukkh3hz
   LJRhOb+yO0jk4pIFvQivpCpL/KbipfS9lbRV+EgIjd06W5DYgAi/1D02/
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="275648799"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="275648799"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 09:05:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="562864057"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 09:05:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nwQqT-000QnX-3c;
        Wed, 01 Jun 2022 19:05:17 +0300
Date:   Wed, 1 Jun 2022 19:05:16 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        dave.hansen@linux.intel.com
Subject: Re: [PATCH v1 1/1] MAINTAINERS: Update Intel pin control to Supported
Message-ID: <YpeOPI3fPODh97YD@smile.fi.intel.com>
References: <20220530115750.70470-1-andriy.shevchenko@linux.intel.com>
 <YpTDBAyBhr/z9z4X@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YpTDBAyBhr/z9z4X@lahna>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 30, 2022 at 04:13:40PM +0300, Mika Westerberg wrote:
> On Mon, May 30, 2022 at 02:57:50PM +0300, Andy Shevchenko wrote:
> > The actual status of the code is Supported.
> > 
> > Reported-by: dave.hansen@linux.intel.com
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


