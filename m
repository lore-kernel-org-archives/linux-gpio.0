Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CC554CF65
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 20:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923484; cv=none; b=urqYJGWmA1l0OuYm811HWKJul2SsyC8rocYGd3O81O62EgjzslscqHeRm+UI2SooH5b5WaKYu/gYMNsnnKNgpoPkk/bpTSty3JgvAUt23W7EyQGxeSrnX2H9Ktdb3fQlZh+PgwlrkA51eDCBnAavjWoaCn7NwVQpYXno3oCERmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923484; c=relaxed/simple;
	bh=OfhQykuIML7IMVz6cRu6/mMpVxxrEtw7XZ2BTfyHt4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W78+haKkDDR1S3TV2WFcg/L7Df8XULp2TO92WwwszeluM5PWUe+OjCJE86035X88hjC0RJY6InvObYGLn8zh9Pgh/091slJevJYfbBwv/eXGNGxGhlb2jdulLl932d/kd06Wf9jNi7wkut8VzEScZNCc/+tXjj8psgqPH/DZrf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ibINYw5l; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ibINYw5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791923483; x=1823459483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OfhQykuIML7IMVz6cRu6/mMpVxxrEtw7XZ2BTfyHt4Q=;
  b=ibINYw5l80wZbsmRBaqfsGMDdiBcdWoL7yMRZ1FnHJOUBzT+T5EbBRPa
   lt0wXPSocjnLsM1RILwb03eGjldAYi5vJcdtCifLYahWjg+0iIDaEGvbn
   8GbSAmCr4VMB7C9f2GUyvK0TCc9X8dGdZqK4+fG4mtHLVru30WAImckik
   8hB+qQWUfk9R5qIhMJ2XIsa7dKgzP29NstX+wt0i7YdV38fDE2bC/yRTV
   d6zzyasechBFDHjQZ5zcE6YkSdl7uQh/mAXY3V/o16+6sWobY8emKNWMP
   Y/gpCTPRfzmtFyeXGsaU7gMpuWr+YK7wQZlk8k7DOpXVxe6LSMKENyAPz
   w==;
X-CSE-ConnectionGUID: M0jnlcFpQqqTjAqUhATOHw==
X-CSE-MsgGUID: iqBuVKQiT9iVXMxrK61MsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="564017"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="564017"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 13:31:22 -0700
X-CSE-ConnectionGUID: EibiI6QPSTezg1dYPU0jfQ==
X-CSE-MsgGUID: rr1gCKdRR3+24O2+V8D4ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1614612"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 13 Oct 2026 13:31:21 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 8C84499; Tue, 13 Oct 2026 22:31:19 +0200 (CEST)
Date: Tue, 13 Oct 2026 22:31:19 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux pin control <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Subject: [GIT PULL] intel-pinctrl for 7.4-1
Message-ID: <as6VF3GFQdlHkuSL@black.igk.intel.com>
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

A small bunch of changes to the Intel pin control to enable pure platform
device enumeration. The set was sitting in Linux Next for a long time with
no regressions reported. Please, pull for v7.4.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v7.4-1

for you to fetch changes up to c016587866e573fa8dff50c3bdae9734c4418099:

  pinctrl: intel: Try to retrieve driver data for pure platform drivers (2026-09-03 15:42:32 +0200)

----------------------------------------------------------------
intel-pinctrl for v7.4-1

* Enable pure platform device enumeration for the Intel pin control

----------------------------------------------------------------
Andy Shevchenko (3):
      pinctrl: intel: Move intel_pinctrl_get_soc_data() upper in the code
      pinctrl: intel: constify parameter in intel_pinctrl_get_soc_data()
      pinctrl: intel: Try to retrieve driver data for pure platform drivers

 drivers/pinctrl/intel/pinctrl-intel.c | 51 ++++++++++++++++++++++++-----------
 drivers/pinctrl/intel/pinctrl-intel.h |  2 +-
 2 files changed, 36 insertions(+), 17 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


