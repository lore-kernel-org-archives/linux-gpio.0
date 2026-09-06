Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4490434F27F;
	Sun,  6 Sep 2026 08:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788683806; cv=none; b=nWUAqyLR/kVaKHMRIIkpaCXyhP+uuzCQgV+PaQ+6zCOi4h7CUmbzvqBEZGqXwsoE9wTa7SBIK0iUlDmCW3xq7s9JcYWUWRfGYebrSb5vvyPfbpX4NmZFAjm0aRh0wkmPWUxzuKR0nBha9toAcgELF/eiKr5whV5ruvwZ2MzSO5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788683806; c=relaxed/simple;
	bh=dM640ChqVk3aGTAC6ppo6nRrh1PWqElhRL7AiXnQ8yU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDcoA3MbDTSeFq2+KjDBO76Z6Bs50FW/GVJUr/xKsSoLlKGV4bve5DyBb+6X5ekLqKrk80OkApGdMpk8vOCUeH5o9y8G8UmIWtTnA2IawNGVS2kkP4KqzhGztwvi5fmJ6Cxo6hAgVY8JTFCzNMW+f26zZFi24bcTBo8vRn9daY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZffKjap; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZffKjap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788683805; x=1820219805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dM640ChqVk3aGTAC6ppo6nRrh1PWqElhRL7AiXnQ8yU=;
  b=iZffKjapTVShjXdXlbvOhcu9KDT40pmtEhfdJydvpZRjx7L3tee13r62
   QbZ5lEQA2WQrdSWCdqTTOwzWE+sbG5ZioP0QBL1g/oLr04b/u0obJiU7A
   5Lp3zQI8Xc+tPoZhauHD22dInS7RcKRTWJiSytqc+cSrTlHtevKvbfIzz
   xsKk7SzmbP2LiUnPAsczZF9mMUrTrL/2nEFy3eLe/LoImqgb4mria+liC
   qVH7mQpFWtcElzEDO/3avzdPvI2vg1UHezwYc0h2BqZAazs8PGVEtImLK
   vKbcrhHuE6NBnK+7BD7wijTE2oKNjzm+uffrVHTVRgFVZaew6E75FdnVl
   w==;
X-CSE-ConnectionGUID: v34uo8KDS4msbSDlAA/1tg==
X-CSE-MsgGUID: ruS+vYM7T9WwCP9ohBYHaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="92817422"
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; 
   d="scan'208";a="92817422"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2026 01:36:45 -0700
X-CSE-ConnectionGUID: fc8ErP5iT5igfixPf1fFnA==
X-CSE-MsgGUID: NuSi/uSGTvqtmroAwCkQYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; 
   d="scan'208";a="266084994"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.140])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2026 01:36:41 -0700
Date: Sun, 6 Sep 2026 11:36:37 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: crystalcove: add missing MODULE_ALIAS()
Message-ID: <ap0mFTYC2ulFuzp7@ashevche-desk.local>
References: <apvciC1NYWyNfseD@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apvciC1NYWyNfseD@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Sep 05, 2026 at 02:12:39AM -0700, Dmitry Torokhov wrote:
> The crystalcove GPIO driver lacks a MODULE_ALIAS() to allow it to be
> auto-loaded.
> 
> Fix this by adding the missing platform alias.

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


