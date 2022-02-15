Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A79C433FE
	for <linux-gpio@archiver.kernel.org>; Tue, 15 Feb 2022 17:14:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236215AbiBOROS (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 15 Feb 2022 12:14:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242316AbiBOROP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Feb 2022 12:14:15 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D0B11ADD1;
        Tue, 15 Feb 2022 09:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644945245; x=1676481245;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LCApQiubLMYDIIz9b4/VMCuMNN4EWjcVcJag/HJNFrY=;
  b=Jd9le88tjVnn10+EuE9RXK1BJv5Utl0X4o1cyx96gPPbZtLTbl1NyifN
   phSPDs4DinvBDs8ckOBv1EhjemHll6c4IwTFT7jC0ZtQEhWdhD/Cqat15
   w59jDFaVk/7cDS0ZlZdZE8ouhbiWjLGWOpgpD2itKNSHJ3DbKp06hUrlF
   6XHvPxQCTxjm2AISsy7W7XiOQ87o/Eh8pTe9wiTt62e1HqVumT/41ZT1C
   vu0GC/OvBWFWTjQ1hc/g1zln6xw52ocqmC8P4QutCksLRzxZbF8I63REp
   KdB4CcT3h23nwW9ZpGF8OXTNxTLhMwCsZ3Xd3kVQKF4u2RGwMVUqCy2LN
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="250344198"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="250344198"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 09:08:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="636007518"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 09:08:37 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nK1Ik-0050M2-A1;
        Tue, 15 Feb 2022 19:07:42 +0200
Date:   Tue, 15 Feb 2022 19:07:41 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/4] pinctrl: tigerlake: Revert "Add Alder Lake-M ACPI
 ID"
Message-ID: <Ygvd3Z5k+e/8DqND@smile.fi.intel.com>
References: <20220215152800.21104-1-andriy.shevchenko@linux.intel.com>
 <YgvYeJSvwaCXzISF@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgvYeJSvwaCXzISF@lahna>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 15, 2022 at 06:44:40PM +0200, Mika Westerberg wrote:
> On Tue, Feb 15, 2022 at 05:27:57PM +0200, Andy Shevchenko wrote:
> > It appears that last minute change moved ACPI ID of Alder Lake-M
> > to the INTC1055, which is already in the driver.
> > 
> > This ID on the other hand will be used elsewhere.
> > 
> > This reverts commit 258435a1c8187f559549e515d2f77fa0b57bcd27.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Thanks!

I have sent a PR to the Linus W. with this one patch.

> Please mark this for stable too as discussed.

-- 
With Best Regards,
Andy Shevchenko


