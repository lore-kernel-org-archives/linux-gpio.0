Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6AD485508;
	Fri, 25 Sep 2026 10:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331202; cv=none; b=YNM8UDNjyAziPJptMaw/oxmiw7lrLIvA6dNyk76q6ZcST4pqgY7Pw+P0JVZnRlIxyujsHjuB9tQrc6xSkeeqCyYPtsdlzTa670J4LwiERvO3BircUz6LKTbnSu+IpJPtGkBYmomuubrjzl2wISZMLbNz7mvMv4oq7cNNcgzOSxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331202; c=relaxed/simple;
	bh=xXNj13k9BPI5Yulyp4V/S6uRD9t2uAkKflpcWHIdkAc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jyGT7NV9ymL6GG96iOPO+RwsXXfsv7yGuo1cn7h8sbwDUXBUibV+F3uSk2Fni+Rp5TW2gBHC0xBweyROHtPYuee1KX7dJWxONR6KAa4h6WK9zaqFzomVN3MCIEdV7DSA2dUNTTxkd6eO8ieIYVV7Iw+HTaC4pVNXcGMmf9xDmgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YznGY/lW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YznGY/lW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790331201; x=1821867201;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=xXNj13k9BPI5Yulyp4V/S6uRD9t2uAkKflpcWHIdkAc=;
  b=YznGY/lW0dVmSEH7+R9WfGx0MvD0m2lubXeFhqGZ//YhCv1Ml5VnhpiN
   EOm5c00IwHOzk0fiAe0uZbDZETLFX3t5S6YO+TxcViFNJFEW/P1cPc6Y8
   BrlT2n2dI55cB+Icz+WUUgLKHDCaXvuyEZkNDZ6f+ggzlnJ7QG8vk7n0T
   XX9XpC7HLdPLnpyNhkzrjjHCMCLklriHTEDJnNYjM4sihgjBSTsqSgJB8
   NOWhQlJTQx+0WRwR7c+13mfbH0OlbKfnz8rg4vVvud3UYTMNck/iPao0W
   CH0YCFoNhDc8ICJ3XKanj3f/CHMSXcal9HRhuEJ4xnQ2om/Bq83yXYg8n
   Q==;
X-CSE-ConnectionGUID: e5gLJdMKT7yI1/bEwqdK+w==
X-CSE-MsgGUID: shkjFOG0SICUrXR/aTnyKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="93833429"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="93833429"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 03:13:20 -0700
X-CSE-ConnectionGUID: Lf8QOV0GQRybF93UeUBYkw==
X-CSE-MsgGUID: nPtxo32zT1ac4eGfelaz1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="277466614"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 25 Sep 2026 03:13:19 -0700
Received: from black.igk.intel.com (localhost [IPv6:::1])
	by black.igk.intel.com (Postfix) with ESMTP id 8511293;
	Fri, 25 Sep 2026 12:13:17 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20260924083512.461838-1-peng.fan@oss.nxp.com>
References: <20260924083512.461838-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH] gpio: wcove: use regmap_assign_bits() for conditional
 set/clear
Message-Id: <179033119753.1442760.6698630023575309776.b4-ty@b4>
Date: Fri, 25 Sep 2026 12:13:17 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Thu, 24 Sep 2026 16:35:11 +0800, Peng Fan (OSS) wrote:
> Replace if/else block using regmap_set_bits()/regmap_clear_bits() with
> the simpler regmap_assign_bits() call.

Applied, thanks!

[1/1] gpio: wcove: use regmap_assign_bits() for conditional set/clear
      commit: 0fc424b6a8ef447450f6087db42abce3a6feb328

Best regards,
-- 
With Best Regards,
Andy Shevchenko




