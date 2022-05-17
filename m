Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6DBC433F5
	for <linux-gpio@archiver.kernel.org>; Tue, 17 May 2022 10:08:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245616AbiEQKIB (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 17 May 2022 06:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343866AbiEQKHf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 May 2022 06:07:35 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF3631CB35;
        Tue, 17 May 2022 03:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652782052; x=1684318052;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IJ2e0bHcymHypRBWw4N3tfS2H54h0ez0vXwzpdUU3zc=;
  b=a+gWhzyYeqEy9oHHHjsIL48Kge6uck03qnqPLAbCL83et6eINLMbo66P
   mwtK6QtLIAAH6RlklR4hSFOhot6sSyi28pmGbVXLteAtjedM+JUoqVa3f
   xaWeF6WNcYws3qhpT5lFMi/64FhlHTC/kQqiPZgGuMZmZyT+8XgbbywoY
   fuuFQITYuKpPbrYfGR9wy/treZX+uGeHgvXeltSnBdsvdsyyX9/i8/3XR
   6xWGeEDhmx9+XUSa1nmbMSe1zMRVrGngHr4Lmaumgxz8an890ye2uSjTE
   X6Rb7Oc0mB/tqm6KVjyQsRThjbDqmFfDANgcL5Vn3TWxuVA5joKB7/3o3
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="271077023"
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; 
   d="scan'208";a="271077023"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 03:07:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; 
   d="scan'208";a="522891092"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 03:07:30 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 17 May 2022 13:07:27 +0300
Date:   Tue, 17 May 2022 13:07:27 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: cherryview: Use GPIO chip pointer in
 chv_gpio_irq_mask_unmask()
Message-ID: <YoNz34dfCIrKYn6n@lahna>
References: <20220516185500.32304-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516185500.32304-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 16, 2022 at 09:55:00PM +0300, Andy Shevchenko wrote:
> The callers already have dereferenced pointer to GPIO chip, no need to
> do it again in chv_gpio_irq_mask_unmask(). Hence, replace IRQ data pointer
> by GPIO chip pointer.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
