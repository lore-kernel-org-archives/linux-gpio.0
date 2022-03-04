Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1480C433F5
	for <linux-gpio@archiver.kernel.org>; Fri,  4 Mar 2022 12:41:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbiCDMmP (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 4 Mar 2022 07:42:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233456AbiCDMmN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Mar 2022 07:42:13 -0500
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8AE51B3A59;
        Fri,  4 Mar 2022 04:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646397685; x=1677933685;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tZrjSMkfDyWAM7wbgcIABphTmPYo+UOvDzf3GPP57ow=;
  b=R+0oKKBCnyJDqjegr5ATZSEOhYBYNz/+bDiXoQ6O+9U5+1KlKP+iXMg3
   cWhcbPOs8G4QTSsrl/l5L6+R4PM42LEWMX2wNBysnWGNiCTfg7V0A8czU
   Kk0HrIW7hC2Twq04bt0PDVT9hxCxdbsOjczekBXPvl89MgprPO9he66Qz
   t2zNW5WNVcIqKibSS62RF9+HBkE9a9DEPuXdLLv9mhSsj4y2vJ/YVK/TM
   1bbx95mlDKbUMQjXokZPeNi+gAC8AOEWwUaZTFP2+ASLbRkydxZMB2qFo
   NukUM/N1PKghDhW9PwS1OFqS1XP7i6l+cPSPsmgjMDlgiAJRMfm2GDaKC
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="314682514"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; 
   d="scan'208";a="314682514"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2022 04:41:25 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; 
   d="scan'208";a="642499892"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2022 04:41:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nQ7Eb-00BDer-WF;
        Fri, 04 Mar 2022 14:40:38 +0200
Date:   Fri, 4 Mar 2022 14:40:37 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, colin.foster@in-advantage.com
Subject: Re: [PATCH 2/2] pinctrl: ocelot: Fix interrupt parsing
Message-ID: <YiIIxXemSB8LIq8L@smile.fi.intel.com>
References: <20220303203716.3012703-1-horatiu.vultur@microchip.com>
 <20220303203716.3012703-3-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303203716.3012703-3-horatiu.vultur@microchip.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 03, 2022 at 09:37:16PM +0100, Horatiu Vultur wrote:
> In the blamed commit, it removes the duplicate of_node assignment in the
> driver. But the driver uses this before calling into of_gpio_dev_init to
> determine if it needs to assign an IRQ chip to the GPIO. The fixes
> consists in using of_node from dev.

...

> -	irq = irq_of_parse_and_map(gc->of_node, 0);
> +	irq = irq_of_parse_and_map(info->dev->of_node, 0);

Why platform_get_irq() can't be used?

-- 
With Best Regards,
Andy Shevchenko


