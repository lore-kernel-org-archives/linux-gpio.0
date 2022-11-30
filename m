Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF42BC352A1
	for <linux-gpio@archiver.kernel.org>; Wed, 30 Nov 2022 15:43:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbiK3Pn7 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 30 Nov 2022 10:43:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbiK3Pn6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 10:43:58 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DBBA8139E
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 07:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669823037; x=1701359037;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MCDqxMCWijeQqLk9K8bfAbmtuDV5Bu0dRRw8HSgMWp8=;
  b=m4Zub+cNGrN/jQe/HgnczWG2UH69L3cr+X45DwRwjX9SQMMRJh+us5Bn
   OcInGhSCX5VPL+65DKoL8xIBuAFlM0Ldmkec6j/i69trxL/3nB8+frdKm
   phLKXHYHWyJyf95J4DcbX2A9QPgK6SNTfxYatSbWaHO2iNDXkdFjA7xz8
   ywhePE0DdVYqkNHncSLkSiQpM5A+pMWoR1+monBCCKtT05JfnRsMY7pfc
   0ykTBrQXncQWsj8GtM6eCo+pYQnZeIQpxb1fCnFjj/wBWPJy52L6mFjD8
   IPvLzur0iBwNrWVL2RtvAIyjkSAEX3rgMr+oObYvVQjkvgEnBw9TV3myz
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="342349586"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="342349586"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 07:43:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="973145705"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="973145705"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 30 Nov 2022 07:43:56 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1p0PFb-002KeB-04;
        Wed, 30 Nov 2022 17:43:55 +0200
Date:   Wed, 30 Nov 2022 17:43:54 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "Kiszka, Jan" <jan.kiszka@siemens.com>
Subject: Re: Question regarding runtime pinctrl (2nd try)
Message-ID: <Y4d6OosnHIDB2h6s@smile.fi.intel.com>
References: <7abfb823b92a4451d442b001ea7e49017ff3a3c8.camel@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7abfb823b92a4451d442b001ea7e49017ff3a3c8.camel@siemens.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 30, 2022 at 03:09:50PM +0000, Niedermayr, BENEDIKT wrote:
> Hello,
> 
> I got no response since last time so I try it again, but with a bit more
> knowledge this time.
> 
> After carefully reading the pinctrl documentation
> (driver-api/pin-control.rst) it was very clear for me that such an interface
> already exists and is accessable via debugfs. The documentation is very clear
> and self-explanatory. Thanks for that!
> At the time of writing my last email [1] I took a look into an older BSP
> kernel where this feature has not been implemented, yet. I must apologize for
> that...
> 
> Now my last concern is using debugfs on a productive system. IMHO debugfs is
> not the right interface to interact on a productive system.

And this is a point. No-one should try it on the production systems.

> Especially when
> when a unprivileged process wants to interact with an interface offered by
> debugfs. It's possible to change
> permissions on files and folders there but nevertheless I think that this is
> not the way to go, since debugfs was designed to offer interfaces to
> privileged processes only.

Correct.

> My proposal would be to implement an chardev interface for that and using
> udev rules to assign correct permissions to that. With this interface I can
> then select the active pinctrl-groups which have been defined in the device
> tree before.
> I could also imagine to put the interface into the sysfs (that would be very
> close to the debugfs implementation I think).
> 
> What do you think about it? Am I still missing something?

In my opinion -- no go.

The platform description (ACPI, DT, or board files) should know what they are
doing. If something missing to achieve what you need via existing interfaces
we rather think about that, but no, the debugfs stays and only for the purposes
of development on the "I know what I'm doing" basis.

> [1] https://marc.info/?l=linux-gpio&m=166850640920120

-- 
With Best Regards,
Andy Shevchenko


