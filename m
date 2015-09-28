From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: gpios search behaviour for gpio from _DSD
Date: Mon, 28 Sep 2015 10:30:46 +0300
Message-ID: <20150928073046.GS1536@lahna.fi.intel.com>
References: <5603A552.9020005@schinagl.nl>
 <20150924084324.GK1536@lahna.fi.intel.com>
 <5606F273.6030100@schinagl.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:29035 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754371AbbI1Hav (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 28 Sep 2015 03:30:51 -0400
Content-Disposition: inline
In-Reply-To: <5606F273.6030100@schinagl.nl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Olliver Schinagl <oliver+list@schinagl.nl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Sep 26, 2015 at 09:30:59PM +0200, Olliver Schinagl wrote:
> What i ment is, without strcmp, the loop would test for:
> 
> reset-gpio and then reset-gpios (and then gpio and gpios)
> 
> So why the strcmp at all, Why only reset-gpios? Will the _DSD or acpi break
> and if we probe for reset-gpio (first, instead of reset-gpios)? I'm asking
> because i'm trying some work on gpio lib and this section is getting
> reworked too. While doing that I want to remove the strcmp. Hence, the
> question if things break on the ACPI side (I'm mostly failiar with OF.

I think it is there because we really want to force "-gpios" format for
named gpios (not "-gpio"). DT does not do it because they have lots of
existing "-gpio" users whereas in ACPI there is no such burden.
