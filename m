Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34634E36DD
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 11:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408516; cv=none; b=NvrQf45ecRpv9ecM9b2fgjQhmpkFJCRy1MAbmXa4NvCLKVbH/6s4per2+R4BBRzwU0a56QzJsCG7XtUuJJcgkJY6Hr6uTXcgIs/7wwxj1kfjRAaGBbdLVNgik4+oEBiH9UY/Cm27m4BkTKhci1ELQltMdUIqTvOas/gKxL1w5h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408516; c=relaxed/simple;
	bh=pLe4jhT6xKcSDKkosONYkNT8dydYRVH+lVvKCJWp54s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tq9yzT4Z5Owzf//8HYnO5oUZAFpSeZyVdLCBCnSgWK+Xj2Gq6s6C4TjCKwFpqmwuRGMpVwe/gNgNJSIwy//Kp0RqCLhTqJzhMledjtuBJjW1pkUUMjYsEHbm86/6YSczlBfe6xnGSMRksRTFKe/GByr5hR4O9eoEWX/vCkPenmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gqcAalZy; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gqcAalZy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792408514; x=1823944514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pLe4jhT6xKcSDKkosONYkNT8dydYRVH+lVvKCJWp54s=;
  b=gqcAalZyAHfqe62gz7xnmWcnGfs2Wgj4E2on3MEGbsSW3YkIyHgxrpBx
   5dsP9f/7sxW6XtjEJL4xWRrEK6daleSGJGQ/qU9vLm9taXdv8vombr+no
   FsZs+kv/jHwWoa2Ahii9mar3ZfCSpGV+9v2k5Tal4ZU7J3BGphnWrFwjF
   KJ/5mpwkghEXTHAt4sMBLTmeDoEuaBm96FnPU4vSYsNEwbzsYyvxweg8u
   pEqq05phCoRxkQTwjxEFH0vowklR4JvGTXjasA8CY3ebqEMd1JNtUVNVQ
   opA9x+4g5z2YCl//viFZlUqh4HdqEf5v0i/wNCGWCWnl4aSoUIL3Idr50
   w==;
X-CSE-ConnectionGUID: jJJBWjWvQ722AMyYn3Wwhw==
X-CSE-MsgGUID: WCNoJTHmS3SuE45N3iSb8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="971743"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="971743"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 04:15:13 -0700
X-CSE-ConnectionGUID: TwGqxVBcQ5eegjc83EgqKA==
X-CSE-MsgGUID: LI4lwBhoRtWdtPmkWQT27Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2393911"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 04:15:11 -0700
Date: Mon, 19 Oct 2026 14:15:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Vincent Fazio <vfazio@xes-inc.com>, linux-gpio@vger.kernel.org,
	brgl@kernel.org
Subject: Re: [PATCH RFC libgpiod 3/3] tools: implement gpioctl
Message-ID: <atX7veSMB-TPDQ0o@ashevche-desk.local>
References: <20261016-gpioctl-v1-0-8770622679b8@oss.qualcomm.com>
 <20261016-gpioctl-v1-3-8770622679b8@oss.qualcomm.com>
 <CAD++jLn86Xuv++nMO7BT0spXaw5NFbU4jZfS7++NWkgy0OG5kQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLn86Xuv++nMO7BT0spXaw5NFbU4jZfS7++NWkgy0OG5kQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 16, 2026 at 08:00:38PM +0200, Linus Walleij wrote:
> On Fri, Oct 16, 2026 at 4:21 PM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> 
> > Provide gpioctl, a new command-line tool for persistent GPIO line control.
> > Unlike gpioget and gpioset which release lines on exit, gpioctl holds
> > requested lines in a background daemon so their state survives across
> > multiple client invocations.
> >
> > The client auto-spawns the daemon on first use. Communication uses a
> > per-user abstract Unix-domain socket, providing automatic cleanup and
> > per-user isolation without filesystem artifacts.
> >
> > Each set of lines requested through the tool is assigned a unique ID and
> > referred to as a "request". The following sub-commands are provided:
> >
> >   request      - Request a set of GPIO lines by offset or name. The daemon
> >                  holds them after the client exits.
> >   release      - Release a previously made request by ID.
> >   requests     - List all requests currently held by the daemon.
> >   get          - Read values of requested lines.
> >   set          - Set the output values of requested lines.
> >   monitor      - Subscribe to edge events on a held request.
> >   reconfigure  - Change the settings of a held request in-place without
> >                  releasing it (e.g. switch direction, add edge detection).
> >
> > There are also "hidden" sub-commands that are not documented in the help
> > text but can be used for debugging purposes:
> >
> >   ping         - Verify the daemon is running (spawns it if not).
> >   stop         - Ask the daemon to exit, releasing all held lines.
> >   debug        - Run the daemon in the foreground with logging enabled.
> >
> > The wire protocol is intentionally private and unstable: only gpioctl
> > itself speaks it, so no ABI commitment is made.
> >
> > Also add test-cases covering all sub-commands and configuration options.
> > Update documentation, man page generation (main page plus one page per
> > sub-command), and mark the persistent-daemon TODO item as complete.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> A big Acked-by: Linus Walleij <linusw@kernel.org> for the entire
> idea and approach.

Seconded here. But the amount is simply unreviewable by a human.

> I can't claim to have read the code in any detail, because it
> is quite a lot. I can run it through Sashiko if you want, hehe :D
> 
> I think this will be very helpful when doing automation using
> different AI tools, but also for pretty elaborate scripting.

-- 
With Best Regards,
Andy Shevchenko


