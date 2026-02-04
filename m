Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07A3410D3A;
	Wed,  4 Feb 2026 14:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770215195; cv=none; b=l0H1TANdgRKXVEAcABqyqUBcf2DZB03K1yeFg1o7fYnE9h5IZPEKD9d/7zKWnTNzBHJB1P5Qy3x2RxsmWn7x6Y0TmsL1Dxe1END+0l0N8KkimN5VSB1a5oKq1NVPS0uwi3W/3NLL+cIErWzjfOP9iLzR0WS49+yZZVbExfIkmBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770215195; c=relaxed/simple;
	bh=mfeFe+SWrohiHZ3h2cd0B32iz7YvkWD8TRTYujmvxn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNuVtPgxIm79Ow+oj07OFRnjBWOMREwKDWvPXzxrsgeLt1zfWDMaBKKzHnGOcPbFVNf7BUJkG1zZfdm3RDvko6lU+mohx+JQjFCLKfusDT18uMy+GMokYkVGwiXG+YT10tpNNAsr/B1NAUNnBBqblUwDEL0WfXNhEtcnej0MC70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEKS2C+z; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEKS2C+z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770215195; x=1801751195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mfeFe+SWrohiHZ3h2cd0B32iz7YvkWD8TRTYujmvxn8=;
  b=TEKS2C+zlj/zwti4slUu3272K6L0VKXb52XaBMA1CRq49n5WBthqVpSw
   eBG4Vmgz8ao73barvu97RWcSyWKsS8QvYtv0iSCTq5oE7Spb8MHIJmGGn
   KniZbUA+KwbcVM9q004QDplSU9lc4HtSSwAl4jwjDWfkgO8cwQue1WYuF
   G6jyZ2HwI6ZtRkh3y8/b40NFO7hqtbO+Q02xaaDGl4tEw8Yct+xnOwF5x
   PvRRHCKiq4FZsU7JUqJyWpKMVhzLrGE007VjJ2RMgb/rPEYkyic56fs4L
   cWDVc8kIsymMvOX/6B65D8VY8JjT+sjOgrYONkCnrBdsOqz4XtPMDfM3b
   w==;
X-CSE-ConnectionGUID: NblyfAWYSLSvhTWN2rzJ+A==
X-CSE-MsgGUID: fxRz7fWARE2+ChGkTZOYBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82514319"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="82514319"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 06:26:34 -0800
X-CSE-ConnectionGUID: yCVN0XdJTmOo6WYVcJQQeg==
X-CSE-MsgGUID: ucXzXiRKQQyMgwG4Srt8EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="214712880"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 06:26:31 -0800
Date: Wed, 4 Feb 2026 16:26:29 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] pinctrl: pinconf-generic: move ..dt_node_to_map_pinmux()
 to amlogic-am4 driver
Message-ID: <aYNXFdxZiO2TMwSy@smile.fi.intel.com>
References: <20260203-craftsman-battered-3491ff68f462@spud>
 <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
 <aYL9zgEyCarrluvP@black.igk.intel.com>
 <20260204-crawlers-nacho-d7c9021cdb6f@spud>
 <aYNWMndBWxxoPABG@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aYNWMndBWxxoPABG@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Feb 04, 2026 at 04:22:47PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 04, 2026 at 02:15:10PM +0000, Conor Dooley wrote:
> > On Wed, Feb 04, 2026 at 09:05:34AM +0100, Andy Shevchenko wrote:
> > > On Wed, Feb 04, 2026 at 12:34:36AM +0100, Linus Walleij wrote:
> > > > On Tue, Feb 3, 2026 at 5:17 PM Conor Dooley <conor@kernel.org> wrote:

...

> > > Note, please, remove extra '.' (dot) in the Subject.o
> > 
> > fwiw, the .. was intentional cos I was truncating the pinconf_generic
> > from the function since the subject was really long, not referring to
> > a member of an ops struct.
> 
> Yes, and that's how we refer to the callbacks — with a single dot and parentheses:
> 
> 	.my_cool_cb()
> 
> Alternatively
> 
> 	->my_cool_cb()
> 
> but it one character longer and TBH it slightly less readable (I personally
> used the latter and then switched to the former in the recent years).

Hmm... My memory tricked me, it seems I switched to ->cb() notation, at least
there are patches with that from October last year. Whatever, choose one and
use it :-)

-- 
With Best Regards,
Andy Shevchenko


