Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CD344C4E2;
	Mon, 31 Aug 2026 14:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186540; cv=none; b=Udh5vtKiHB+vWB3I4jhHAg3w6FqxY3CwQaSd1ayqHOk5DEMTwTz5WBXpTQv3SZpHSBAL4G/djFBuwIZjWbB1eWHQGBZb5OpjwQoYW3SRMmECs3Pl76eOyODSYrpUyrpDNbtd15s2THrvGH0u64H3cHvKztj9ieAA++0t1XLzHuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186540; c=relaxed/simple;
	bh=P81HKc2C6673VEqSGIDSb0h0Wx+TejJgC+43S5746cI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mp4qbeznyGcoYELo1PXgCbcSgkjZ1h7MH/0l83djBy1wHrXlEEaU2FjE9E+kCaVdY+15h5KBby9RRT/c6mWi6yxoScOCoKGnVT/SJq3bSG9+JseLubHjRJA+tFrDeD8a5IKhtoGozaRYmv6OeneqDoJnb9ZsF+cL9F5ovD8EwHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UQrmRefu; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQrmRefu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788186539; x=1819722539;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=P81HKc2C6673VEqSGIDSb0h0Wx+TejJgC+43S5746cI=;
  b=UQrmRefumohgJxYJNoI65VWveZywQZDSDIm0em1ncU2ngHjyKH6ZoM1t
   Vq4Z+W9F0+eahEqA27r3iTlTfAUVnO0FquZ4Z44wlCj2qpBfYBtIO9e13
   ei+YkZjjtgqPB2PUowVcj2nByN5G6gJMEmUvD5iTkeUZR197YihNJjEAk
   4K7ZuxCqHLsjta/u1HAWQGMCSNtc89rgqAhlh6TtxKFB39hEeIx0DY2yl
   5I8se4+gUGsnP0q0UI+MftTl5J7DEgLxrOHEwn9zWi4fTinyha1L6hbQH
   0vMZZejggRQz+Ov44WfR6fXAodDYXAfdZUlsxCd0XXyykB+Re1U6heQCF
   A==;
X-CSE-ConnectionGUID: GWu3mADdRiOA/rROWnbpaQ==
X-CSE-MsgGUID: e9XZlhweTLiVooEP9nWxOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99945723"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="99945723"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 07:28:57 -0700
X-CSE-ConnectionGUID: 64R0t9bKQvuVodx8oIvWcg==
X-CSE-MsgGUID: 8AVwbokNQkCgkECs01xoiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="267480381"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 31 Aug 2026 07:28:55 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 6EADC99; Mon, 31 Aug 2026 16:28:54 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	=?UTF-8?q?Radek=20V=C3=A1lko?= <rvalko@lipicko.cz>
Subject: [PATCH v1 0/2] pinctrl: intel: retrieve pure platform driver data as well
Date: Mon, 31 Aug 2026 16:25:45 +0200
Message-ID: <20260831142853.1995573-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The reported platform can't be enumerated as it misses driver data
associated with the firmware node. Instead we should use platform
driver data. This mini-series to make it happen.

Radek, please test at least the second patch and provide your formal
Tested-by tag in case it works as expected.

Cc: Radek Válko <rvalko@lipicko.cz>

Andy Shevchenko (2):
  pinctrl: intel: Move intel_pinctrl_get_soc_data() upper in the code
  pinctrl: intel: Try to retrieve driver data for pure platform drivers

 drivers/pinctrl/intel/pinctrl-intel.c | 47 +++++++++++++++++++--------
 1 file changed, 33 insertions(+), 14 deletions(-)

-- 
2.50.1

