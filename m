Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A9541C2F8;
	Tue,  9 Jun 2026 12:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009248; cv=none; b=GMs3MWt182A7UIhDRTs+QPQy6qwZ2FddB3vVhZRVMEi7jPsnx8ynOP0uaExWtsH6gcgp+NrElbdMdrtg60V9HezJGOmzYcShnWrE/v10wSb9R89oI5HmLTVA5taH1Ig9ebioNzXolXjqZnrNznoYlVNcNeUZ4zjPz76RotRRKeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009248; c=relaxed/simple;
	bh=9yWYhCA4CTnY346QRX9mXw73mLmI/SyPt5hOvUNmqSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRUHZdYc6tQE3Hdv57AFPUjyNbCn7dAeWjiWMra4CHxpwv5oEfMT9tgNlzLj3xbyJrtyThPRLjdyQsFbnfEcO1waf3VbfKxRpMwd2ck89JPTA9+Yh7rcCjFlOgCb0WspeJLQ7HR7jOC0n+Cx4pEZVmF2A9/Vp2RK4leNsZV2R2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bVgXxoTX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bVgXxoTX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781009247; x=1812545247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9yWYhCA4CTnY346QRX9mXw73mLmI/SyPt5hOvUNmqSU=;
  b=bVgXxoTXJ87eD44qaA1OrAbv64FElTAEjW/of3yxGQfQF/wTDJs2MzhV
   /rf/dOXl5V6zN//jxzzB+FPAvPRdgMg5rQ/Ju8q/qxJjWM1fWnp3xAGyv
   qS4Ee55eCDnm+wHb7p4x6DvXQilwXgSqxi2zz8VJ7Vzzu5/bl+jr/4OBj
   U8ZGdRFXLhRH34fPdrYGTV3RjMFgHR001RJ05CdAzscTEAI7aJdc8H2nw
   +8MoDJBezo8QIrYl8y+1cX5Qj27oprDdV5PQ9jjkf+o8k/2ZXcEFfBDQO
   ibSULx/TqX9hxqESPDFE28b8Ph/a5n9t6m7zUp5GD0G9sFAPqrZPCiajB
   g==;
X-CSE-ConnectionGUID: DUk8vKpGQqmeuoAEHtI64Q==
X-CSE-MsgGUID: V62Rg0rsTiGBbxsyZ2llpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81832301"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="81832301"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 05:47:26 -0700
X-CSE-ConnectionGUID: dcWF9QiOTPae6V4QhbmQPQ==
X-CSE-MsgGUID: bAcypSC4SuO3cuPM0iaK4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="245004364"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 09 Jun 2026 05:47:24 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A55AA95; Tue, 09 Jun 2026 14:47:23 +0200 (CEST)
Date: Tue, 9 Jun 2026 14:47:23 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] gpio: fix regressions in GPIO hogs after the code
 refactoring
Message-ID: <20260609124723.GO2990@black.igk.intel.com>
References: <20260609-gpio-hogs-fixes-v1-0-b4064f8070e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609-gpio-hogs-fixes-v1-0-b4064f8070e7@oss.qualcomm.com>

On Tue, Jun 09, 2026 at 02:17:48PM +0200, Bartosz Golaszewski wrote:
> Fix issues pointed out by sashiko.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Bartosz Golaszewski (2):
>       gpio: don't process hogs on disabled nodes
>       gpio: fix cleanup path on hog failure

Both,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
