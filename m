Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587E1C88CB2
	for <linux-gpio@archiver.kernel.org>; Fri, 25 Aug 2023 02:01:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbjHYCAa (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 24 Aug 2023 22:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240495AbjHYCAL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Aug 2023 22:00:11 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F96B1BF2;
        Thu, 24 Aug 2023 18:59:49 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="372006101"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="372006101"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 18:59:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="911123185"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="911123185"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 24 Aug 2023 18:59:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1qZM6x-00DDnp-0r;
        Fri, 25 Aug 2023 04:59:43 +0300
Date:   Fri, 25 Aug 2023 04:59:43 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Liam Beguin <liambeguin@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: pca953x: add support for TCA9538
Message-ID: <ZOgLD2N9eoPQ7+yW@smile.fi.intel.com>
References: <20230824-tca9538-v1-0-ee3bf2065065@gmail.com>
 <20230824-tca9538-v1-1-ee3bf2065065@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824-tca9538-v1-1-ee3bf2065065@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 24, 2023 at 07:16:25PM -0400, Liam Beguin wrote:
> The TCA9538 is an 8 bit version of the already supported TCA9539.
> This chip also has interrupt support.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko


