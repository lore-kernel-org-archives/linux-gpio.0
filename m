Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069C3C433F5
	for <linux-gpio@archiver.kernel.org>; Wed, 23 Feb 2022 15:13:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237755AbiBWPNl (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 23 Feb 2022 10:13:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232062AbiBWPNk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Feb 2022 10:13:40 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC37B12E7;
        Wed, 23 Feb 2022 07:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645629193; x=1677165193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a68exJg5PUkXlSFsTW/nFLDiaj4D+gBrJFzqKkgzm1g=;
  b=UW6uz91oDEfFZjFzZCecs7HwTUiTlIlYkhIgykDV7SCj58KJfFU68LiB
   VXdkYMEg+7QPm9EJPkW0C7/xMABvRjDxGxZj21L/CPKhM1v+7OEwCNDzY
   e9Il3x6wq+9nQ/UwGkpgGW7u+rWUYxCkz6Vj8FFPgr+x7p+mOk98OiNtY
   XxjNJ4600Gs7gNHQKJd2VxS0NtO5W79BiVmJWC+VS13ADPfCp+IGOpUVZ
   +aL5hQ6N7VzmEyFYwh0Dqe596/1PsB+ZJ4eG9ClrNB91GMSk280QJmqu6
   lq8cAUliVZulXteOOcRaYvNcnxYYYPL98jYUOG6NpizoWvs1wv16K8UH8
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="250811824"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="250811824"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 07:13:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="491228551"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 07:13:10 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nMtJU-007TEX-Aj;
        Wed, 23 Feb 2022 17:12:20 +0200
Date:   Wed, 23 Feb 2022 17:12:19 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 4/4] pinctrl: icelake: Add Ice Lake-N PCH pin
 controller support
Message-ID: <YhZO021m102OOJsk@smile.fi.intel.com>
References: <20220215152800.21104-1-andriy.shevchenko@linux.intel.com>
 <20220215152800.21104-4-andriy.shevchenko@linux.intel.com>
 <YhOvuFwr2v15zY3u@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhOvuFwr2v15zY3u@lahna>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 21, 2022 at 05:28:56PM +0200, Mika Westerberg wrote:
> On Tue, Feb 15, 2022 at 05:28:00PM +0200, Andy Shevchenko wrote:
> > This adds pinctrl/GPIO support for Intel Ice Lake-N PCH. The Ice Lake-N
> > PCH GPIO is based on the same version of the Intel GPIO hardware than
> > Intel Cannon Lake with different set of pins and ACPI ID.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

All pushed to my review and testing queue, thanks!


-- 
With Best Regards,
Andy Shevchenko


