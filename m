Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C3AC7EE25
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Jun 2023 08:12:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233640AbjFHIMW (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 8 Jun 2023 04:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233756AbjFHIMV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jun 2023 04:12:21 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B1F2685;
        Thu,  8 Jun 2023 01:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686211940; x=1717747940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X/RTbyMVicLbRVeWuGjHA4QHLACYgCSRCJ4gsWFDNRw=;
  b=SOtEeoEU/YZxPxbr2ydszlfyDX5v55C4MWC4q9YZh06Q79g4nwBecZAd
   JOQQOVdBATu3yAorLy+CNhK7VYnVVaKHnWLIi9cZWsrXE9A6hZV+xuFOs
   qLYc97Vsx3mPl9s7RjMA0/Q/bNLmNiucwUZk3cPz0INshSY0IVtwN/YT2
   lCp3KOsqr/jdSdAwWSHw7bDfjB2NDRpq4Asz5LPFUJAQe4iMvgLnvgNut
   vXjqNSa4qzlP2iztK7Qhrvhwi/1A1hj+DBlJmRR+q/iNh5GA85xxMcuR0
   UV3hUhv1OWNT3kCknhresCxGVROeWv+aT8vuEKgWwgCGLkh/dKzeGkrfe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="354732271"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="354732271"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 01:12:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="703984658"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="703984658"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 08 Jun 2023 01:12:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 78A9434F; Thu,  8 Jun 2023 11:12:25 +0300 (EEST)
Date:   Thu, 8 Jun 2023 11:12:25 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Raag Jadav <raag.jadav@intel.com>
Cc:     linus.walleij@linaro.org, andriy.shevchenko@linux.intel.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        mallikarjunappa.sangannavar@intel.com, pandith.n@intel.com
Subject: Re: [PATCH v1 0/2] Minor optimizations for Cherryview pinctrl
Message-ID: <20230608081225.GI45886@black.fi.intel.com>
References: <20230608071903.19170-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230608071903.19170-1-raag.jadav@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 08, 2023 at 12:49:01PM +0530, Raag Jadav wrote:
> This series implements minor optimizations for Cherryview pinctrl driver.
> 
> The numbers are as tested with gcc 7.5.0 and may vary with newer versions.

Exactly they may vary and also depending on which compiler options you
pass. Same comments to this series as I gave for the previous one.
