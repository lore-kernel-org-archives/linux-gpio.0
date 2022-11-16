Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E505C4332F
	for <linux-gpio@archiver.kernel.org>; Wed, 16 Nov 2022 13:28:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbiKPN2L (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 16 Nov 2022 08:28:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233260AbiKPN1o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 08:27:44 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50E5145EE0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 05:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668605254; x=1700141254;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fX08OjnF5j+VinCAJYhyUbYh0qdU2CTZ8twCktLxRp0=;
  b=FghEKXdizxbZ+xXCXM/MC/mKTtUQbBD0FZtq6Fo+RZuKUd9YHItjJ1Rw
   FGnm6nQf7uPUWKUdei29Nk7+sqFPQJj51FzJ92amUYpYo8jv/KMVLox4E
   pTuEdDdIcZUvLsMg+TE/lc9lXUufXTSbHlZ93HB/bTfKT0V5YsKDoLO5v
   P17jFlW6vNT9+xGUa/vJQH/9v28YGoWn/ULhTQ2/M8Zp2r4tBRW7sw0x7
   pifL4SeUDyho03R1aM1jx6OlrvCGOT4oyuJ5KOYmaPddJdFg7EmOFnMJh
   CkNZYugho0b95Vw0Y4ynFZvcYBOW0G055J39/HZiyMmU/Gwf0rWPOaD0Y
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="314356042"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="314356042"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 05:27:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="672391170"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="672391170"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 16 Nov 2022 05:27:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ovIRu-00D8q5-1F;
        Wed, 16 Nov 2022 15:27:30 +0200
Date:   Wed, 16 Nov 2022 15:27:29 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH RFC v2 0/3] pinctrl: add ACPI support to pin controller
Message-ID: <Y3TlQYcLHjA23iRL@smile.fi.intel.com>
References: <20221115175415.650690-1-niyas.sait@linaro.org>
 <Y3PWjZb9Jci1oXyM@smile.fi.intel.com>
 <3766343a-ce40-10aa-99dc-2ea94bc1ffbd@linaro.org>
 <Y3Pexz7tLrAP05uY@smile.fi.intel.com>
 <c9eb64c4-4cb3-b25c-df04-97da24a595fd@linaro.org>
 <Y3Sz32+4uuynGeAy@smile.fi.intel.com>
 <05f3c105-12f8-1fd5-0e6c-1ab7e24a01df@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05f3c105-12f8-1fd5-0e6c-1ab7e24a01df@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 16, 2022 at 10:40:19AM +0000, Niyas Sait wrote:
> On 16/11/2022 09:56, Andy Shevchenko wrote:
> > The GPIO to pin mapping is done by GPIO ranges. This can be made up in the
> > driver or, IIRC, in DT (so in ACPI) by already registered properties).
> > 
> > Not sure, why you don't use them.
> 
> OK. I might have missed it.
> 
> In DT, gpio-ranges property is used to describe the mapping, I could not
> find equivalent property in GPIO ACPI properties -
> https://www.kernel.org/doc/html/latest/firmware-guide/acpi/gpio-properties.html

It's the same. You just need to check the code of GPIO library to make sure
that it uses fwnode / device property APIs, so it will be parsed in ACPI case
as well.

-- 
With Best Regards,
Andy Shevchenko


