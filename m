Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF1C3D3337
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 20:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783630124; cv=none; b=C8yXGwZmJYmQOT3VnFc0UHqZ5lh4wX2qU01ep6JPDu/dXPG5w9VkoAyWTpBk6cyXqXHonwbJcVelKISmYVbjtrLlHHDcwAq6rzcxNNG7dG9PUKcdVz/yoMOEsHHcuwIGEr3PiTQ1/7RgNAD/69RcxuckDhjppbIr5lFWp4ZbQ+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783630124; c=relaxed/simple;
	bh=VXhB2BI+iPKwrneakQVpERhuZLFecyk/cRz/Tt4kcSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q6/RhAk3sRVcC+hdy2qxn4IH8J4c8FgFhGP5S5QhGcUPJKwgWZGXrOBt1g+3lQUwmPKkAMi0zmPC3L0hcOIcf06iKdWo2259eOgOD/Le8yFKUNKW1NNNVIyOtD3XH6rprtz90CJa2Bw8Hb4V39XXExuTlINQIS8esOHlNUtiIcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BrM0JReG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BrM0JReG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783630123; x=1815166123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VXhB2BI+iPKwrneakQVpERhuZLFecyk/cRz/Tt4kcSE=;
  b=BrM0JReG53uiTeRnXbKvaI/kRlNglD/SYLf0fScMbmZ8j3QgZLjLMFDO
   DuQ61/2A0iVH2GF+/PpnbZYStotJc8MInO/7s3ubsdGIiH6bhrKcjOr03
   zEBeD3IaahB33zGhpIfSK8S6GrY3MOPMhAPQT9b/NkOUwyIPEV/9o8itD
   K9EAzHlreB8offgXLLwhWX/QccUsqKSxcmTuYE0WECqLK7e3aM2UsXf7f
   QFTgGGZmc5aRMVlgkThqL0Ors8M0+YPBjZAwTRdFgsPvfz8VSVgihtOC4
   sUJrk2rEiMlg+cZp5pFvfyud2NaJzWi6srAEnhpmBgeOn1cG9RvKBCj65
   w==;
X-CSE-ConnectionGUID: +4/k0gqKRtO8Oe46531xUA==
X-CSE-MsgGUID: 3SgFiiqeRt6pi/rh2wuvVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88012720"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88012720"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 13:48:42 -0700
X-CSE-ConnectionGUID: K9yNHuV4QWqJGya8RSR7xQ==
X-CSE-MsgGUID: QbEiytoiTbuj9/tRXpf/EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="277930608"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 13:48:40 -0700
Date: Thu, 9 Jul 2026 23:48:38 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Gary Wang <is0124@gmail.com>,
	Thomas Richard <thomas.richard@bootlin.com>
Cc: linux-gpio@vger.kernel.org
Subject: Up Squared Pro 7000 (UPN-ADLN01) broken BIOS?
Message-ID: <alAJJr5ATEZdHBBA@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

Hi!

Since I have been playing with the $Subject board, I wondering if I miss
something or the BIOS configuration is utterly broken. The problem what
I see is that most of the pins on the SoC are marked with [ACPI] if you
look at the debugfs 'pins' file for INTC1057:00 device instance.

This means *none* of them (which are user visible via HAT connector) may
serve as an interrupt resource to the OS. How the OS should request interrupts
on those pins?

As far as I understand that the BIOS does initial settings of CPLD and
basically I can use transparently the pins as per their configuration done
in BIOS. Right?

Btw, do we have any contacts to engineers in AAEON or whoever who does these
UP boards nowadays?

-- 
With Best Regards,
Andy Shevchenko


