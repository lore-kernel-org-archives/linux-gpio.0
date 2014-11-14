From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: baytrail: show output gpio state correctly on
 Intel Baytrail
Date: Fri, 14 Nov 2014 10:40:55 +0100
Message-ID: <CACRpkdZ_iEy8_LbbjYm7Rp5=WeuhAwRH3Rv8GFBKOpC=ikVcZw@mail.gmail.com>
References: <20141103152743.GB1618@lahna.fi.intel.com>
	<20141103154207.GC1618@lahna.fi.intel.com>
	<20141103155011.GH27425@saruman>
	<20141103184247.GD1618@lahna.fi.intel.com>
	<20141103221903.GA20305@psi-dev26.jf.intel.com>
	<20141104075936.GF1618@lahna.fi.intel.com>
	<20141104180526.GB2224@psi-dev26.jf.intel.com>
	<20141104185702.GR1618@lahna.fi.intel.com>
	<20141104191115.GC2224@psi-dev26.jf.intel.com>
	<20141104193424.GT1618@lahna.fi.intel.com>
	<20141104215153.GA25606@psi-dev26.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:45030 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754747AbaKNJk4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Nov 2014 04:40:56 -0500
Received: by mail-ie0-f177.google.com with SMTP id tp5so17540766ieb.36
        for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2014 01:40:55 -0800 (PST)
In-Reply-To: <20141104215153.GA25606@psi-dev26.jf.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Cohen <david.a.cohen@linux.intel.com>, Greg Kroah-Hartman <greg@kroah.com>, Grant Likely <grant.likely@linaro.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Felipe Balbi <balbi@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, stable <stable@vger.kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>

On Tue, Nov 4, 2014 at 10:51 PM, David Cohen
<david.a.cohen@linux.intel.com> wrote:
> On Tue, Nov 04, 2014 at 09:34:24PM +0200, Mika Westerberg wrote:

>> to a list of devices we depend on, we can defer this particular driver
>> going further in probe until all the dependencies listed in _DEP are
>> resolved.
>
> That's the best way to prevent this issue IMHO, but looks like it's
> already being addressed:
> https://lkml.org/lkml/2014/10/27/455

-EPROVE_DEFER will solve (hackishly) the probing problem.

It will not solve remove() or power up/down sequencing.

Yours,
Linus Walleij
