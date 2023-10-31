Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C69C4332F
	for <linux-gpio@archiver.kernel.org>; Tue, 31 Oct 2023 13:57:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344672AbjJaN5y (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 31 Oct 2023 09:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344693AbjJaN5x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Oct 2023 09:57:53 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CDAFC1;
        Tue, 31 Oct 2023 06:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698760671; x=1730296671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xrjkkM5VseGPhNi6f9g61bzi+hejON79m3lrkCG62y4=;
  b=JjnzwG32vyO/E5N+hiMjhsZVA1zSJXM455gfEb++WHv5Bxb3d5T+0KbS
   pCVPuYdC2UeL1UprZw4Vvm9Q7sCC32dWaXM3marHonxqIgCtdxtYnyaiB
   M6hv2m0XppELNeL/MJC3cqZf4g1R0SfetQXH53pJszLHtJiCepbWA6dV2
   D8wbUQRK0QRuA0jZVzxVxOuoC3KwKYLYXsdx3gMS6wqRoNMK1y4shgJm7
   wsxX/Wm2k25295hJgx8d83mU7aZLjH1LQ1+nTkkSuEkKS0mTHD2JCaFXm
   TkboTBRgZylqogbkCE8V4tCVvaObOCUgWZK4qN3QqW1jsoXjXEIY88X7t
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="392152856"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="392152856"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 06:57:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="904347301"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="904347301"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 06:57:48 -0700
Date:   Tue, 31 Oct 2023 15:57:46 +0200
From:   Raag Jadav <raag.jadav@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: tangier: Move default strength
 assignment to a switch-case
Message-ID: <ZUEH2gKp2tsNlL4-@black.fi.intel.com>
References: <20231030155340.3468528-1-andriy.shevchenko@linux.intel.com>
 <ZUAcffriaEkNcRH_@black.fi.intel.com>
 <ZUDVdyAXr8SlJlnx@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUDVdyAXr8SlJlnx@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 31, 2023 at 12:22:47PM +0200, Andy Shevchenko wrote:
> On Mon, Oct 30, 2023 at 11:14:11PM +0200, Raag Jadav wrote:
> > On Mon, Oct 30, 2023 at 05:53:40PM +0200, Andy Shevchenko wrote:
> > > iWhen ->pin_config_set() is called from the GPIO library (assumed
> > > GpioIo() ACPI resource), the argument can be 1, when, for example,
> > > PullDefault is provided. In such case we supply sane default in
> > > the driver. Move that default assingment to a switch-case, so
> > > it will be consolidated in one place.
> > 
> > Looks good.
> 
> Thank you for review. Can you give your Rb tag then?

Since I'm not a maintainer, I'm not sure if I qualify.
But anyway, here you go.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

