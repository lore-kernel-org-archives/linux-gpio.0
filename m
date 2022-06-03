Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C6FC43334
	for <linux-gpio@archiver.kernel.org>; Fri,  3 Jun 2022 17:28:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243101AbiFCR2Q (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 3 Jun 2022 13:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235576AbiFCR2P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jun 2022 13:28:15 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A52DFF8;
        Fri,  3 Jun 2022 10:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654277295; x=1685813295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aqTdvCdhbd6MUKmaxiP+UahPXjI0zjjVlad/cYW8qMg=;
  b=e/IcF4ihHaeiwDpjWy9NfGRKhCl9EBFKv+D3FJplw/qx4ca5d9zGmZ7c
   JQLNg6oVlgURhABLVUTmTYzD3k6XLwZGDhxMm9YTBJW4Q8wHf4rQab9EP
   XDoirGTtPA0rnIcAFL6H6/00sHvXdXeZOKApXOc0drL6mPJUrIAj981Wh
   Klkp2BQrsRCNXG5w855jb4WHaWJZbgvEJ7bMufur1aOUprgL10bAOpX9t
   feoj4JsAFwnGWnCZe6oUzCwu3fHN04p0UZc5LkkbvdlHdGsMhOyalrrln
   qBWKMMyO3+5W+25f0lFkXJQbX9PmHNjyjxzzEgtOzEI4prjBbVS4QJ/Hx
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10367"; a="276051385"
X-IronPort-AV: E=Sophos;i="5.91,275,1647327600"; 
   d="scan'208";a="276051385"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 10:28:14 -0700
X-IronPort-AV: E=Sophos;i="5.91,275,1647327600"; 
   d="scan'208";a="757568114"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 10:28:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nxB5l-000SdY-IO;
        Fri, 03 Jun 2022 20:28:09 +0300
Date:   Fri, 3 Jun 2022 20:28:09 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, thierry.reding@gmail.com
Subject: Re: [PATCH v1 1/1] gpiolib: cdev: Fix kernel doc for struct line
Message-ID: <YppEqYTZyWaulKjI@smile.fi.intel.com>
References: <20220520164726.60638-1-andriy.shevchenko@linux.intel.com>
 <d796b54d-7559-f9ff-bb4b-4e75a707db2d@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d796b54d-7559-f9ff-bb4b-4e75a707db2d@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 20, 2022 at 10:10:49AM -0700, Dipen Patel wrote:
> Acked-by: Dipen Patel <dipenp@nvidia.com>

Thanks!

Bart, this can be applied, I think.

-- 
With Best Regards,
Andy Shevchenko


