Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C88426693;
	Tue, 14 Jul 2026 08:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784018511; cv=none; b=U2X6tYtXez8SjOzvZLldGPWlF6NO+LqdTiLmVWR8kv66uB2G+u9YpxGQJrH/QjtplVgusDrW/B4BAS1Z1lnm+X0wfw71Zh3omSSY/HDhm2/wkwjwG4YbEHiK+tlMWhjJ2us4mPlpbrpmgTmhJlaLkGCUtPPqgRjlxLWgZqMincU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784018511; c=relaxed/simple;
	bh=12XriuA46Xm1o3Sy3QxMokfAk24n0HbvEzxM1onJtTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+4fZb7KpkZwmyib9T6IuXkRvpqw0TvceNbz5yUqQ2yViTG4ugO7LP5Sm1cyyIPy0xwOryXPM9XCSuukUFlFnZ8GRSZDUl+vO/C9lVJER4pv7g/djim8OGC7/gR8hSeZp5qUayUNZ3o8uUUMFYaNWAGRJGlnYQW1vDKkFD4KQxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lbBQMKnc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lbBQMKnc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784018508; x=1815554508;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=12XriuA46Xm1o3Sy3QxMokfAk24n0HbvEzxM1onJtTU=;
  b=lbBQMKnc6LeFGGF2OAyj+/v8YftofFpyRzWqPTaRJa5FrvHmvfEbg9CD
   TfI9DjXtaUfYXfRLtSAYEkVkiYXcZwP3sSPiXeX9X9XxtC+AqFHbBuihq
   JpJ/0eX9LcKJyhYFClIZlguj2B/FI8p5lS7PYbUSzYbwXrxd/PwQQMicB
   0eoi5AZl3Ws+gR5RT5cxOMerMzJS83C6MFVerHPdFuEPsVDEGhsu0GcaY
   JlJQgtLeMwgi6C75xLXC78BD/jlwe+HCkeWZULf1eEuSKC+Up0kpRW0Dp
   R53uXfFeE0GU0yMPDSghI2jqF8v358gxbNlZumhThpNZP7MfKN87ktUR8
   w==;
X-CSE-ConnectionGUID: XUmo+uphRUq46NXFnUnZ5g==
X-CSE-MsgGUID: g5kVZDqQRXWPFCZ3X/w9ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84599873"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84599873"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:41:43 -0700
X-CSE-ConnectionGUID: B/qpMudUS7eefjjjXcVvjQ==
X-CSE-MsgGUID: QrRciFwdQfuTPBRi9J31eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="257767423"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:41:42 -0700
Date: Tue, 14 Jul 2026 11:41:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: remove trailing comma from sentinel in
 GPIO_LOOKUP_SINGLE
Message-ID: <alX2Q3OcJHVmamWM@ashevche-desk.local>
References: <alV0wIgZAY_InGYV@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alV0wIgZAY_InGYV@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 13, 2026 at 04:29:16PM -0700, Dmitry Torokhov wrote:
> The GPIO_LOOKUP_SINGLE macro defines a lookup table with a single entry

GPIO_LOOKUP_SINGLE()

> followed by an empty sentinel entry. The sentinel entry has a trailing
> comma which is unnecessary. Remove it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


