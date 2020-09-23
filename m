Return-Path: <SRS0=iP7n=DA=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B696C2D0A8
	for <linux-gpio@archiver.kernel.org>; Wed, 23 Sep 2020 10:42:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5952B21D7D
	for <linux-gpio@archiver.kernel.org>; Wed, 23 Sep 2020 10:42:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgIWKmr (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 23 Sep 2020 06:42:47 -0400
Received: from mga05.intel.com ([192.55.52.43]:10005 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbgIWKmr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 23 Sep 2020 06:42:47 -0400
IronPort-SDR: kyITzvJDl/2dDOclJFE7n0HY5VD41oZNqB6sCdEiH52+hjpuaNOArJnLSS60tl6g1ZnQTiC22p
 IgIuCJcEmk/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="245690338"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; 
   d="scan'208";a="245690338"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2020 03:42:46 -0700
IronPort-SDR: 2A8kvuUZfohQuU6hvYwwRu75CmF5dom8h2WimO2bBs9aarQfyybJ4atkT6cV94cPsGihnbf/fp
 UHNPO+92vLlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; 
   d="scan'208";a="338615377"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 23 Sep 2020 03:42:45 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kL2AH-001MhQ-Qd; Wed, 23 Sep 2020 13:38:21 +0300
Date:   Wed, 23 Sep 2020 13:38:21 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Ye Li <ye.li@nxp.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: pca953x: Fix uninitialized pending variable
Message-ID: <20200923103821.GD3956970@smile.fi.intel.com>
References: <1600851824-4608-1-git-send-email-ye.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600851824-4608-1-git-send-email-ye.li@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 23, 2020 at 02:03:44AM -0700, Ye Li wrote:
> When pca953x_irq_pending returns false, the pending parameter won't
> be set. But pca953x_irq_handler continues using this uninitialized
> variable as pending irqs and will cause problem.
> Fix the issue by initializing pending to 0.

Oops, seems you are right. Thanks!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Fixes: 064c73afe738 ("gpio: pca953x: Synchronize interrupt handler properly")
> Signed-off-by: Ye Li <ye.li@nxp.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index b5c3e566..0a49ab6 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -814,7 +814,7 @@ static irqreturn_t pca953x_irq_handler(int irq, void *devid)
>  {
>  	struct pca953x_chip *chip = devid;
>  	struct gpio_chip *gc = &chip->gpio_chip;
> -	DECLARE_BITMAP(pending, MAX_LINE);
> +	DECLARE_BITMAP(pending, MAX_LINE) = {};
>  	int level;
>  	bool ret;
>  
> -- 
> 2.7.4
> 

-- 
With Best Regards,
Andy Shevchenko


