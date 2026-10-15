Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241354E73B8
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 12:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068782; cv=none; b=FeIEUmZi3BsA66j4lVUY40K79PgPItSJRmhhI1RlDY2rx5UG8YK7hREZZHKt/aX0V9CvXyqKqXvzs0wQw8jovfiBgtqcTFMzCjg7QRGT+Xd64QReUBjZxewtHTstGaseOwBIMGQ4piYgXQP/y31uzHcqx8rY/xvJcRAZhUNKVcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068782; c=relaxed/simple;
	bh=V2pDeiafTzSv8mCHkw7Xon5sL4Btx3C/FFYZobwOp4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cFFuwb8WOjxf6LdlIvEmOK1p+10IGjItZfCSqbI2UI1bOEMA5OCJNKU5SIDs3XJlc3zAnQnKyU95h95Kz8VsH0Mb83giWAjKPi+HsKujLoYyKb/JUPu6r/Z1ptg0hK8AHbcWCgR09NSkPuxpZHso9fa13UQ1hHCE249bubL3FhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KbH3sFyO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KbH3sFyO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792068781; x=1823604781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V2pDeiafTzSv8mCHkw7Xon5sL4Btx3C/FFYZobwOp4o=;
  b=KbH3sFyO3UEd0R6bsbPy03lCYZWM8GwTHFmEyG8xPBMwH1RDYGZrjXg3
   dS3kvj7RzTPAqXePuP/KkOllk9w2KmLCWv1wKPvq/pjtV81mKnfB4gERQ
   rOv8E/OK3qvwmTc5S8bI3BK5e00fJ4taY4rL5GW6woTiWt9CpyZz0jwgq
   jTzjw9DpBbA1nBcpbwdYk4iP3vosPJnbmWrYDQvfKIa2UkAb9ahzFBYtG
   VdE88LqjwpUdtMBy7gxPKh0yamMtvXR7Wh7d9FiAkNU6Dw4PFCUBOY4PP
   HCgfXRS+dDtneHBgIrRf2e1I2bHyaqYB0w2FilRtvUn4VMJ28w5MOJ0vr
   Q==;
X-CSE-ConnectionGUID: bgeWKKOzT6Kx3Y94aQ3Hjw==
X-CSE-MsgGUID: wfsee4MFT4Szj8GORk2COg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="837616"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="837616"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 05:53:00 -0700
X-CSE-ConnectionGUID: CQ0nngceREGcwxFOo1qfrg==
X-CSE-MsgGUID: 4N33zaIWRP+y03PGNmiO8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="3439385"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa012.fm.intel.com with ESMTP; 15 Oct 2026 05:53:00 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 1B7ED99; Thu, 15 Oct 2026 14:52:58 +0200 (CEST)
Date: Thu, 15 Oct 2026 14:52:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linux GPIO <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Subject: [GIT PULL] intel-gpio for 7.3-1
Message-ID: <atDMqjm-J1qoYPeX@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

Hi Linux GPIO  maintainers,

A small set of fixes for GPIO on ACPI-based platforms. It was in Linux Next
for a while without regressions reported. Please, pull and send as a fix set
for current, v7.3, release.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v7.3-1

for you to fetch changes up to 3fd4bf93d586cb07304cdcb5e8b3c51ac1d8284f:

  gpiolib: acpi: Fix GPIO lookup using relative path (2026-10-13 22:34:07 +0200)

----------------------------------------------------------------
intel-gpio for v7.3-1

* Support relative path to the GPIO controller in the resources
* Add missing MODULE_ALIAS() to make crystalcove driver autoload
* Ignore interrupts on IdeaPad Slim 3 15ABR8 and Acer Nitro V 16S AI

----------------------------------------------------------------
Abduvaliy Abdulazizov (1):
      gpiolib: acpi: Ignore GPIO 11 interrupt on Acer Nitro V 16S AI

Alban Bedel (1):
      gpiolib: acpi: Fix GPIO lookup using relative path

Dmitry Torokhov (1):
      gpio: crystalcove: add missing MODULE_ALIAS()

Mateo Borda (1):
      gpiolib: acpi: Add quirk for Lenovo IdeaPad Slim 3 15ABR8

 drivers/gpio/gpio-crystalcove.c    |  1 +
 drivers/gpio/gpiolib-acpi-core.c   | 10 ++++++----
 drivers/gpio/gpiolib-acpi-quirks.c | 29 +++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 4 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


