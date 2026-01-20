Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD8837F0F5;
	Tue, 20 Jan 2026 11:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768908005; cv=none; b=tKfg7LFmjl9b6GZWSFvZXfmSk3AxZFJHxLfUhAFmPUkU4JB0SVcivFLGkwrF7HNbEFHms4Ow6wEOrj2wuMY0NgL2eRB1ZUMnmtUEvR/JSlt0QmlG7rCdC3nQ4rKxDd03RbWHlmJV9Yjs70a1CbDQE+s5pjHxip07GjgwClImteo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768908005; c=relaxed/simple;
	bh=3YKlT/h+DxJLaBffNDx3Q/aGuxwjTJ71ZS1Qx4cQWN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zz04pFwtncdlUHgz2aDravXTtBndoIs8i/wTp/TnEAq5iXtVaHC0CPHkIjK11xdNi9R3LF3167CtI8lK/TbGpxRLLjuOyYR0NmS1p+4Shfznw4rfmtgSth2XdDVY5ZI9A33fam6Dqf39pgqWA/7vXTgcmPDJpQpPJOsOOzX07/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=buGNZcfM; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="buGNZcfM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768908004; x=1800444004;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3YKlT/h+DxJLaBffNDx3Q/aGuxwjTJ71ZS1Qx4cQWN8=;
  b=buGNZcfM0Kd4YmzQ4kndsNDx/fskWczaXiCjmsgTNXsLNR+GkShZ12yO
   jlPYIcI47yq3o0gwk3nsJ/119/K8ViVAMS08rOT4/Aq2+gc0Z8w/Y2EN+
   Xk0SjZd+eRwvTjAEI8BRRa+B8h7nIbsOFhDldKXsghihUawztQqbwlmST
   sKZQLJfT46v1B3M5Jw321wjQBKK2sOWP28Da9X/DARNAh50hJOgOkWHVd
   XoZURDlW/Dg1WGJMsVY1E22gjce8PPnPWIz+F8goHFvmHpqt1KXXf3kF+
   9x7lTacTrRSYUVuBv/FpvsLv+jV+GpBiE6D+73jFwLaDj2AUny9c2lUB0
   g==;
X-CSE-ConnectionGUID: 0Gc+nh3PQmKjqtSoc8Kv+g==
X-CSE-MsgGUID: HhtRqPYNQZqcX1k+8eJyoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69842096"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="69842096"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 03:20:03 -0800
X-CSE-ConnectionGUID: uYf5AtNHQqyiJzC7Byer8g==
X-CSE-MsgGUID: 1XfRVo1oREyKrsKNmhr7gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="205345683"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 20 Jan 2026 03:20:02 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id AB2C499; Tue, 20 Jan 2026 12:20:00 +0100 (CET)
Date: Tue, 20 Jan 2026 12:20:00 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: andriy.shevchenko@linux.intel.com, linusw@kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Guido Trentalancia <guido@trentalancia.com>
Subject: Re: [PATCH] pinctrl: tigerlake: Add Alder Lake-P documentation
Message-ID: <20260120112000.GI2275908@black.igk.intel.com>
References: <20260120110042.1021199-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260120110042.1021199-1-raag.jadav@intel.com>

On Tue, Jan 20, 2026 at 04:30:42PM +0530, Raag Jadav wrote:
> Intel Alder Lake-P PCH reuses pinctrl IP from Tiger Lake-LP. Add user
> friendly documentation for it.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0e793a4e2834 ("pinctrl: tigerlake: Add Alder Lake-P ACPI ID")
> Reported-by: Guido Trentalancia <guido@trentalancia.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220056
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
