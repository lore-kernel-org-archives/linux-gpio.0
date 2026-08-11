Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026B844AB6B
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 14:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786459847; cv=none; b=tFQTazbzEBZ9qn07etC00fvuOLrAwYzJKx/w210UbvmHkYl/eJuqZR4WiM7tvSxShuzpLy/Y8+qAWpK9S1ai7f1/ECMyzmPXtIJAlT9F9tOI10th74J0MIpEIZafDTLUN3/kwCV917L0ojFu9v/0rgSxZdvKhxHlh4MK6TEALfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786459847; c=relaxed/simple;
	bh=S4nlJkVZPbo7o9mm1ZxblN4wp1n3CqHccyz9E6GKQ0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f8mqLqMfuStB+xX+dALyVZ4Aduh2xyAUAzjQ5ZBO/oeTWaifxXUy7ZEasaUwicl9T5JkJuaBXKBwBFEbLzPAvR4pXpV3KheT0g9Dndn2PxggpeFt9uTv7AFVuqX9vde34zYkJDWlb3A7Ge1LNnj5uVHII5vV86QmgBWU4HYTIB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lFW5Svq/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lFW5Svq/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786459845; x=1817995845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S4nlJkVZPbo7o9mm1ZxblN4wp1n3CqHccyz9E6GKQ0k=;
  b=lFW5Svq/v9EiZJ+BZu0DMAVzAsCXFeC1rbQ2w27wknrC1IntoOmJd4/R
   mSjnIu9Hjt9OZYMiMbM9K4sqNBF/Wk31GK1C4eNUcRUk3hbZQSCQRMzYA
   Khup+xMMBNYHyyE22U6f6h+u77joVe70riys41jwzdrCj/KZMZyMecppU
   fEASQiLFu/yRsUSsRP25E5pM+s5YplawvGjeKloIc+5ZKBSpewNbr+/FI
   CmGEdC8zZakhzBBb3XWEJXSZSpPcDtxmWVl2pUjGCbOuvh/Er35jc5vgT
   P0leLgL5+ecRcMkVwRrtbIqubBzgSx+gft9IDInG0ybQEm/a2sk+u/0Wj
   w==;
X-CSE-ConnectionGUID: quUMQ15GRba7gK0F+84zxg==
X-CSE-MsgGUID: coCYB6KvTBmLYIiAX1Q5TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="109783160"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="109783160"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 07:50:43 -0700
X-CSE-ConnectionGUID: NS7UVTadRAC4J7289iVC9g==
X-CSE-MsgGUID: 34ZzsmHzTtyfyTJc+8KjUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="260743201"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 11 Aug 2026 07:50:41 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 8FB8499; Tue, 11 Aug 2026 16:50:40 +0200 (CEST)
Date: Tue, 11 Aug 2026 16:50:40 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux pin control <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Subject: [GIT PULL] intel-pinctrl for 7.3-1
Message-ID: <ans2wKanSm6W5lSc@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

Hi Linux pin control  maintainers,

A small piece against Intel pin control drivers and associated. Was a long time
in Linux Next without any reported problems, please pull for v7.3-rc1.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v7.3-1

for you to fetch changes up to 699fd26ba39c6659b9f5ebbdee9293b9b6936283:

  pinctrl: intel: Remove redundant dev_err_probe() (2026-07-17 18:57:43 +0200)

----------------------------------------------------------------
intel-pinctrl for v7.3-1

* Enable CPLD pin control on UP Xtreme i12 board
* Miscellaneous cleanup

----------------------------------------------------------------
Andy Shevchenko (1):
      Merge patch series "upboard pinctrl support for device id INTC1055"

Gary Wang (2):
      pinctrl: tigerlake: add some pin groups and functions for INTC1055
      pinctrl: upboard: add device id INTC1055 based UP boards support

Pan Chuang (1):
      pinctrl: intel: Remove redundant dev_err_probe()

 drivers/pinctrl/intel/pinctrl-intel.c     |  2 +-
 drivers/pinctrl/intel/pinctrl-tigerlake.c | 32 +++++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-upboard.c         | 21 ++++++++++++++++++++
 3 files changed, 54 insertions(+), 1 deletion(-)

-- 
With Best Regards,
Andy Shevchenko


