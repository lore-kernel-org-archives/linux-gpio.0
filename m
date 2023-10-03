Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6579E75435
	for <linux-gpio@archiver.kernel.org>; Tue,  3 Oct 2023 08:59:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbjJCI7l (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 3 Oct 2023 04:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231228AbjJCI7l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 04:59:41 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ACB9AB;
        Tue,  3 Oct 2023 01:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696323578; x=1727859578;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xIDK+C23+3Nrlv2X3L1ZA2/XMLRtjH25dFaOH0K3hW8=;
  b=K4lNAM9o5io4PyMbHVQIjksCQwkOJXwz9BUv5Z3cpHb02yI3//fqIvVW
   R0Sp6walX6PnMc9M25tuUPTmmhXFyHzkEzx1CNaMd4FkGchXH1nDa8fLB
   OcDHCLcUGUKTs/5/B4KlOS4v5YMqJ9qEWn4WYBrOJKO89FkBcER1nmhwl
   FpdaFZCa8LJJCUrB2Np8AXQngsmBSoNI0blythYVmih/KwswgP+jwopVw
   IFruRex/abaD4HB2oOiORPQXXfQASsgvkvmDB4QuEi+LfVlxnVe0GMexT
   Cc4UnirtmLCap4XuKUsluBvrsx7SmKHKPGXgTwkDJM095vSNVZXz+UZaI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="363095049"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="363095049"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 01:59:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="700631932"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="700631932"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 01:59:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qnbFd-00000002RJA-0fL1;
        Tue, 03 Oct 2023 11:59:33 +0300
Date:   Tue, 3 Oct 2023 11:59:32 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Raag Jadav <raag.jadav@intel.com>
Cc:     linus.walleij@linaro.org, mika.westerberg@linux.intel.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        mallikarjunappa.sangannavar@intel.com, bala.senthil@intel.com
Subject: Re: [PATCH v1 1/2] pinctrl: baytrail: drop runtime PM support
Message-ID: <ZRvX9GUXbJksmSIP@smile.fi.intel.com>
References: <20231003081519.27524-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003081519.27524-1-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 03, 2023 at 01:45:18PM +0530, Raag Jadav wrote:
> Since Baytrail pinctrl device is not attached to acpi_lpss_pm_domain,
> runtime PM serves no purpose here. Drop it and switch to pm_sleep_ptr()
> as now we only have suspend and resume handles in place.
> 
> No functional impact.

> TODO:
> Consider moving to DEFINE_LATE_DEV_PM_OPS() in the future once we have
> enough users to account for its introduction.

This is not related to the commit message.
I'll drop it.

-- 
With Best Regards,
Andy Shevchenko


