From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: gpios search behaviour for gpio from _DSD
Date: Thu, 24 Sep 2015 11:43:24 +0300
Message-ID: <20150924084324.GK1536@lahna.fi.intel.com>
References: <5603A552.9020005@schinagl.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:48329 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751043AbbIXIn2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 24 Sep 2015 04:43:28 -0400
Content-Disposition: inline
In-Reply-To: <5603A552.9020005@schinagl.nl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Olliver Schinagl <oliver+list@schinagl.nl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Sep 24, 2015 at 09:25:06AM +0200, Olliver Schinagl wrote:
> Hey list, Mika,
> 
> With commit 0d9a693cc86 the following snippet of code was added:
> 
> +       /* Try first from _DSD */
> +       for (i = 0; i < ARRAY_SIZE(suffixes); i++) {
> +               if (con_id && strcmp(con_id, "gpios")) {
> +                       snprintf(propname, sizeof(propname), "%s-%s",
> +                                con_id, suffixes[i]);
> 
> and I was wondering why the gpios suffix is singled out. Are we not allowed
> to check for all the strings in the suffixes array? Is gpios special or is
> gpio simply not allowed. If that strcmp check would be removed, would bad
> things happen?

We default to "gpios". So if you pass "reset" we actually look for
proprerty "reset-gpios". This is the recommend syntax AFAIK.

> Also, just to educate myself, isn't relying on left to right parsing
> complier specifc? E.g. if con_id is null, we end up passing NULL to strcmp
> and atleast for libc can cause segfaults iirc.

'&&' is so called short circuit operator so if we already know that
con_id is NULL we never evaluate the remaining conditions.
