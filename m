Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B47CEB64DC
	for <linux-gpio@archiver.kernel.org>; Mon, 17 Jul 2023 14:07:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232038AbjGQOHP (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 17 Jul 2023 10:07:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232043AbjGQOHC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jul 2023 10:07:02 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51FEA1BE;
        Mon, 17 Jul 2023 07:06:53 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="346243288"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="346243288"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 07:05:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="700504043"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="700504043"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 17 Jul 2023 07:05:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1qLOrJ-00HTZK-34;
        Mon, 17 Jul 2023 17:05:53 +0300
Date:   Mon, 17 Jul 2023 17:05:53 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Andrei Coardos <aboutphysycs@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        zhang.lyra@gmail.com, baolin.wang@linux.alibaba.com,
        orsonzhai@gmail.com, brgl@bgdev.pl, linus.walleij@linaro.org,
        Alexandru Ardelean <alex@shruggie.ro>
Subject: Re: [PATCH] gpio: eic-sprd:  remove unneeded platform_set_drvdata()
 call
Message-ID: <ZLVKwadaVM+0kxWw@smile.fi.intel.com>
References: <20230717121004.5205-1-aboutphysycs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717121004.5205-1-aboutphysycs@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 17, 2023 at 03:10:04PM +0300, Andrei Coardos wrote:
> The platform_set_drvdata() call was never used, ever since the driver was
> originally added.
> It looks like this copy+paste left-over. Possibly the author copied from a
> driver that had this line, but also had a remove hook.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko


