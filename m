Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A699492516;
	Thu,  2 Jul 2026 13:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782997772; cv=none; b=LBNktmUYxCrOa2H4hSVgq0UShqMk+SNzJBrCv95bwM0/7LAXA3nULlutGteiXEM14wa92YrKjShMpuvgSu7kxAJAUVSEGeH+U3XyEHdg7onSHn4yH/QfWMepUOAdrz13tp6gjf6d7KrdWmFGJoFJxhf6wA0WwRdDfToNixXsyXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782997772; c=relaxed/simple;
	bh=sayFem59xsLU5QvtjYKmfb+cFOYGKZInO3e2nOb4Dms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O7hb9VuUppCx3hxDi3S0H0eHR0sDkb5dnsuv+UkNOm87SgRBepVBu1JBRHmVRolt4QsJVzZ0Vm2RNoR3pAaHVZiX/e+bcUj1vymcw40mF19heUVPh8kHUnG+6dzynKX7VIHujBkual4dhrK15DpzC1cX0zwCFVL9ZbI2zk0/SOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bF8akQ1u; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bF8akQ1u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782997771; x=1814533771;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sayFem59xsLU5QvtjYKmfb+cFOYGKZInO3e2nOb4Dms=;
  b=bF8akQ1ufIHZ+w7veE3rpIqPN5AxYFr2jduysVWkHtJ2tFFY9hTgN9YS
   5bXpqaYv3+sfxDN+9avEmBaDjiRymX/k9eD3s+MUt2TafW1u181NgmJkV
   8rVXL6GCJbEk0BC3BFLJapBRIFAC8s/Hu7BH7GzsXTHGWJ6qq9dWXhr9O
   QOldx1+17A/KpghPib4o11/Lp6lChxRySGUxT0VYfSUsO7g1pTMsOTJVV
   DgnLjm/vZwTyTkeeBt1HLrPmMifPBfpIOpiBSLqnX9pJZliT6w06+9IUM
   BnkVNrvFX35b2GEuLbigvShyb8yqkXuxNAVJM5AYLLG6l4CFqgBdb6IVm
   w==;
X-CSE-ConnectionGUID: HvnRE2lNQCarJ0gw9UUv3g==
X-CSE-MsgGUID: NmWHwFPFRAm/ijRGYcNV8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="95256368"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="95256368"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 06:09:26 -0700
X-CSE-ConnectionGUID: Rmz0jVmKQQ+YszcaIfFqxw==
X-CSE-MsgGUID: akJwM1c5SZaTRIfukKetVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="251140488"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 02 Jul 2026 06:09:22 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 77BA295; Thu, 02 Jul 2026 15:09:21 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-gpio@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	William Breathitt Gray <wbg@kernel.org>
Subject: [PATCH v1 0/4] gpio: regmap: Keep tracking IRQ requests and releases
Date: Thu,  2 Jul 2026 14:42:53 +0200
Message-ID: <20260702130903.1790633-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During the review of the v3 [1] of the series that adds a driver for
Realtek DHC RTD1625 SoC GPIO the gap in the GPIO regmap implementation
has been discovered, id est the IRQ chip that is created by regmap IRQ
doesn't have IRQ request and release callbacks and hence in terms of
GPIO does not track if any line is locked as IRQ. This might lead to
undesired and most likely faulty behaviour. This series is to fill that
gap. Currently it only fixes the only user of the automatic IRQ chip
creation facility provided by GPIO regmap, but also provides the exported
callbacks for others to be possible to call them from customised versions
of the callbacks in the respective drivers.

Most of the affected drivers if I am not mistaken are the Industrial PC104
ones, hence I Cc'ed William to look at this and perhaps even test.

Yu-Chun, can you give a try with your v3 based on this series? I believe
we can use regmap approach after all.

The merge strategy is to go via GPIO tree with the immutable branch or tag
provided for the first patch that can be done by regmap tree for others to
consume. Of course, there are possible options, I'm all ears if you think it
will be better in any other way.

Link: https://lore.kernel.org/all/20260512033317.1602537-1-eleanor.lin@realtek.com/ [1]

Andy Shevchenko (4):
  regmap-irq: Provide IRQ resource request and release callbacks
  gpio: regmap: Provide default IRQ resource request and release
    callbacks
  gpio: regmap: Apply default resource callbacks for regmap IRQ chip
  gpio: regmap: Order kernel-doc descriptions with the actual appearance

 drivers/base/regmap/regmap-irq.c | 22 ++++++++++++++++++++++
 drivers/gpio/gpio-max7360.c      |  7 ++++---
 drivers/gpio/gpio-regmap.c       | 25 +++++++++++++++++++++++++
 include/linux/gpio/regmap.h      | 21 ++++++++++++---------
 include/linux/regmap.h           |  2 ++
 5 files changed, 65 insertions(+), 12 deletions(-)

-- 
2.50.1

