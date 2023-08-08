Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903DCC001B0
	for <linux-gpio@archiver.kernel.org>; Tue,  8 Aug 2023 20:39:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232014AbjHHUjN (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 8 Aug 2023 16:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232449AbjHHUir (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Aug 2023 16:38:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D5E1D440;
        Tue,  8 Aug 2023 10:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691515026; x=1723051026;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=z0djTuDWk/WTSJDq7GK/SXVY7dhJ+rAGjZzYyz+3t38=;
  b=n8Up+kcd74nr/Kkv9dEKky5yYigAGcgk3Dwgsk/ZwiWnmrjJsftI/BHA
   43ttEsA5tQySGj/cAusu1FFKU143+y/6xNf1i78+4x9LpUrhqK/SZgeAH
   6UPz2S6cvxEJ+ll/hakef6fU1P846lFQb34mxgjztaytsMwbAVXRoIG+7
   mgvwrCugoutOnfBg2PqriA2su+rJIbFtiG+5NIdnJyiVj083J9+sfJqPF
   3n8Mj/DRJ9YXSh0f7A7PPJ/eLwgN6YV6ZV2mBqQdPX9Q//VqOab6veNG5
   ydH0jKMwLTa9G97OSatjkkuuS6YCoXpWKqCMDaVtkiPbFKE2Sw5eItJw0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="360920023"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="360920023"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 07:01:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="905221802"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="905221802"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 08 Aug 2023 07:01:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qTNGe-00Asa2-1p;
        Tue, 08 Aug 2023 17:01:00 +0300
Date:   Tue, 8 Aug 2023 17:01:00 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: regression from commit b0ce9ce408b6 ("gpiolib: Do not unexport
 GPIO on freeing")
Message-ID: <ZNJKnLN7qVBacsRk@smile.fi.intel.com>
References: <20230808102828.4a9eac09@dellmb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230808102828.4a9eac09@dellmb>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 08, 2023 at 10:28:28AM +0200, Marek Behún wrote:
> Hi,
> 
> the commit b0ce9ce408b6 ("gpiolib: Do not unexport GPIO on freeing")
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b0ce9ce408b6
> 
> causes a regression on my mvebu arm board (haven't tested on other
> systems), wherein if I export a GPIO to sysfs and then unexport it, it
> does not disasppear from the /sys/class/gpio directory, and subsequent
> writes to the export and unexport files for the gpio fail.

Thank you for the report. I'll look into this ASAP.

-- 
With Best Regards,
Andy Shevchenko


