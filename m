Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3FEEB64D9
	for <linux-gpio@archiver.kernel.org>; Thu, 15 Jun 2023 11:17:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241638AbjFOLR5 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 15 Jun 2023 07:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343773AbjFOLRy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jun 2023 07:17:54 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34B95268C;
        Thu, 15 Jun 2023 04:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686827873; x=1718363873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hnlWnFgVThUFXWgEDt/gfZMVF79mIwmPpAPRvoKzkRw=;
  b=YqTPMA7YTBDyQumA7KBUq8vNyLOOiWXTQ8zy0hMuGj+Po5LmcsoTJPEm
   JVGnkHt9xtYrAXwc6qJ/8KAblXYQht8nlrQWoF0tNOD2yMmDwA8TCMoN4
   uGJeMPalBDqhiRzRlp98PUZzcSuu2+gsZhHESSpMth+ZL52ev4K7KSiTp
   Nyng91uvczaZLtkyTNtwdgOwNAtpGZHNlHsKkaax2gQxEGxCpWWeWbnyr
   3GvKppSIeLnsY3iDwGxqBtOH+pRVeaqciJDkcZ+0WBolcE8quE9q9L+lg
   61iQtUzXoUWgD4/if3M2j/Lk2jyMYqF1W4mbEW6s86e0Gn1sI2Xor6OcJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="348552650"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="348552650"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 04:17:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="712420453"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="712420453"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 15 Jun 2023 04:17:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1q9kyo-003vVz-37;
        Thu, 15 Jun 2023 14:17:30 +0300
Date:   Thu, 15 Jun 2023 14:17:30 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Jadav, Raag" <raag.jadav@intel.com>
Cc:     "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Sangannavar, Mallikarjunappa" 
        <mallikarjunappa.sangannavar@intel.com>,
        "N, Pandith" <pandith.n@intel.com>
Subject: Re: [PATCH v3 2/3] pinctrl: intel: refine ->irq_set_type() hook
Message-ID: <ZIrzSoEW7dinDZoi@smile.fi.intel.com>
References: <20230613085054.10976-1-raag.jadav@intel.com>
 <20230613085054.10976-3-raag.jadav@intel.com>
 <ZInpT0dUUVUcKdqv@smile.fi.intel.com>
 <DM6PR11MB2779F9C28712D7C25F9FB3768C5BA@DM6PR11MB2779.namprd11.prod.outlook.com>
 <20230615095517.GV45886@black.fi.intel.com>
 <ZIrs2YSEUbPyvZWE@smile.fi.intel.com>
 <DM6PR11MB2779664C590484A1601A93298C5BA@DM6PR11MB2779.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB2779664C590484A1601A93298C5BA@DM6PR11MB2779.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 15, 2023 at 11:08:38AM +0000, Jadav, Raag wrote:

...

> Should I add all of this in original patch or send this as a separate patch
> on top this series?

Always base the changes on the respective subsystem tree, don't forget to use
--base when formatting patch with Git tools. Then send it separately. The 3rd
patch in the series is questionable to me. I would like to look into it later
on separately.

(The first implies that there is no changes as per this series in that
 function).

-- 
With Best Regards,
Andy Shevchenko


