Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73295C4332F
	for <linux-gpio@archiver.kernel.org>; Wed,  1 Nov 2023 11:03:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234338AbjKALDJ (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 1 Nov 2023 07:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbjKALDI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Nov 2023 07:03:08 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C7C78F;
        Wed,  1 Nov 2023 04:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698836586; x=1730372586;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e0vtCLCws68oXzhRsWHgHg4wfN1zXcyHMQ5YIkViTLY=;
  b=NCgxpQgGhlFoD3C1plo+DS9ASPGme9ABDjDyFLuat/8lrOuWENw/nkhC
   9M2IN1xEeORYXO5IjB72bGuesy5eg9AALVnPkJeeagwdsNphCTVsP5KHk
   FRKq2QXuD3WpDKTW/HNCVIqKbgN5pwuUdzMrkiZ8SPbP7XQg2QST8p0hS
   ANed5qzS6wCS2yDa4A/hlawY4YHplEhPSepv4X0stBEai05/cyPjTQ3ui
   81S5kQyepd2Hj+MOOAP0k6sZwQ82+CPW7uuam10doUvY3G8tTq8j6u/aX
   MavXzxj4GzgztD/UQP5sfJt15DpNxoeyP5xpme6VV9+vVvKypgCFtVvpK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="385652015"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="385652015"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 04:03:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="884530395"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="884530395"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 01 Nov 2023 04:03:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 2A21551D; Wed,  1 Nov 2023 12:44:06 +0200 (EET)
Date:   Wed, 1 Nov 2023 12:44:06 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Raag Jadav <raag.jadav@intel.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: tangier: Move default strength
 assignment to a switch-case
Message-ID: <20231101104406.GG17433@black.fi.intel.com>
References: <20231030155340.3468528-1-andriy.shevchenko@linux.intel.com>
 <20231101063520.GC17433@black.fi.intel.com>
 <ZUIbwtXmmTCHO9lf@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZUIbwtXmmTCHO9lf@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 01, 2023 at 11:34:58AM +0200, Andy Shevchenko wrote:
> On Wed, Nov 01, 2023 at 08:35:20AM +0200, Mika Westerberg wrote:
> > On Mon, Oct 30, 2023 at 05:53:40PM +0200, Andy Shevchenko wrote:
> 
> ...
> 
> > > +		case 1: /* Set default strength value in case none is given */
> > 
> > The comment is good but I think would it make sense to have constant for
> > this instead?
> 
> If so, it makes sense to get it via entire GPIO library, and not locally for
> Intel stuff. That said, I prefer to do that separately. Do you agree?

Yes, agree.
