Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794141;
	b=onZ/m9361zxeAT+gDlxdDJxl2w9R9Lip07Sl9Gs69UVJFGUD/XX2Zrb0y6VuPbJhkoPl
	 UByLPwT4Ey1vDH7NAj8cu/rO668X+namxlSK/lG35Vn3RSqdthwzCnBtT0sO22RPjMiiX
	 Z439zeWNsFiqjFU41XIAefirfbXOojUsE26Sxa1RgGzFbX8wxKN/3bPHs6fYxiN0eAlum
	 zrYmQnktQZ2PqLtp3Z/kDTkZyIeCMXkdJz/++/EVsy/ePT19gW7fg6miAxKGewosShw8a
	 c7MqO8WDXMlvAOlgZStm1Sx/gYhS28c4qeWZra1g/gUk4TvjYBwjhek3sRmvpxZSL+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794141;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=AWDDkbO560TdYvEDwhuXWWCutFtRXKXGd8iUFIujle4=;
	b=0BjoPw7BTqlPYvdnxNEBBvu7xkApFHGMIWmg5Wpgzpl3ulFqo7iywqXygGDQ20DWUZfR
	 uGyU80PZvuJeJjQp23WFYYPro0ILtcYr4OyaIN2TTqEeNiVZAQ+V5zdO9M/gKUaoKXlcU
	 pPIbDIeyyazhk2+/VNkHhGuO+aiJZzHoAqdo1XpIoVM4OdckMr/SYKvhbsHBDJMHCKWsF
	 16VKpyJi67FyqwYq+xTvws8u+itxJv7IkFpLOUiz9+lkebhuUfUqJppsgugcwhK2T7SJp
	 LkrCmk+z1qsAZGtBHdg17/QG9wvh8ABPKdrsHFZhogZNzHMCKr47OnuUtFyDLfDS/ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SKf4ICe5;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27AD606A326;
	Wed,  4 Nov 2026 12:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D27AD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SKf4ICe5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793794141; x=1825330141;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FVcmquQaS75QwFam1Wrb6CbPDZc8Lzs2h72lKdAVD88=;
  b=SKf4ICe5GOZpW6Drt70MWHl64a2J8JAw3P8XUVG3qExHMPeBMXT+SSPV
   /FNyHwM/8e2A7iOfz+D05XQPVgVAmtxLkSfOU/lE5oYyY7wp48fuDQYBx
   B9OQBvPUBxNvX9X8UsiMSwFFyoj9sjGuZWsipf75rN6aTB9Hc9I+jUjYK
   0qLIlI4uylz39ynHIy1h/qC9oUc7OM8Cpb5dBKxxcZ7l0hDh4IImKjMNr
   DGISZ24QwKmfWeT0AmehGYF3WQdA/sMkPUIoAIqSFnGZeg6KeDu00O5RC
   wGCmmslRBN7K7rjy0C9Dy53DyCgt4JHHMPzFKFKiMX5ZZv4uPIkDnhhLx
   g==;
X-CSE-ConnectionGUID: xT7ek5xlS3CwanxE/xpEsw==
X-CSE-MsgGUID: oSi2ICtXTFmHd7MjwAOvLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2445889"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2445889"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:09:01 -0800
X-CSE-ConnectionGUID: yP4c09orQGiVRuMBtjfJIg==
X-CSE-MsgGUID: TVXi3EsoQJioaFj5nnntWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7251510"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:08:59 -0800
Date: Wed, 4 Nov 2026 14:08:56 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] gpiolib: fix GPIO descriptor leak in
 gpiod_get_array()
Message-ID: <ausgWIKr7F7J1Ved@ashevche-desk.local>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
 <20261103-b4-gpiolib-free-v2-1-ea46767c9cf8@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103-b4-gpiolib-free-v2-1-ea46767c9cf8@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 03, 2026 at 07:40:29PM -0800, Dmitry Torokhov wrote:
> In gpiod_get_array(), descs->ndescs is used as the loop induction
> variable and is only incremented at the end of each iteration. When
> krealloc() fails on the first iteration (when index is 0), descs->desc[0]
> has already been acquired via gpiod_get_index(), but descs->ndescs is
> still 0. Consequently, gpiod_put_array() frees descs without releasing
> descs->desc[0], leaking the descriptor.
> 
> Fix this by using a dedicated loop induction variable and incrementing
> descs->ndescs immediately upon storing the retrieved descriptor.
> Additionally, since the fast-path array_info setup only executes for
> the first element (index 0), simplify the bitmap_set() calls to start at
> bit 0 for count bits instead of calculating offsets from the loop index.

Independently on the for-loop iterator location
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
(however I do not see the reason why it should be outside right now)

-- 
With Best Regards,
Andy Shevchenko


