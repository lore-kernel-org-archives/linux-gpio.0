Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049313FB7E5;
	Thu,  3 Sep 2026 11:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436125; cv=none; b=D5udl0OF0sJ/vSddJGDcwB4UN7nIZ/vLPUx0KhnbOCj4d1/fTZEDyOlmV/rQEWFWi/07fYd6c8LsfFcFk4UFkRnXrT+Ay0nnyfjZ96l6vaGqU5OqvtNI8Jpmt+Mv6yqBPx8lpLHZNfRvxJIyu/G7V4C5dTkPgnhAV/EpheM00eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436125; c=relaxed/simple;
	bh=tEZnMJ5TaLpqaZNG2fwl3blf9TivQOwVdQFm5VVE0+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BpKmoYlrLIvAMKAb1QuRcg/usfIWbPu66yTnvu3Xei9M2xF0gfs+BCK/F+OIW64QeF2eK6/pPFmXqccwa4pZvjntet2TLI3tn6FUP1/9CYdwXGLETWZMQWDi5eQzDiN4Cm2Pda5jFRtqfcnjZIexACXnI5W+STZmQuNp3GkXPBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVb8YiwI; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVb8YiwI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788436122; x=1819972122;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tEZnMJ5TaLpqaZNG2fwl3blf9TivQOwVdQFm5VVE0+4=;
  b=XVb8YiwIzytWyc6j7gzlaY0xOmWmoaiZn3RZkD2KRvmC7b1CIQP9V7Al
   /qwqrR3W70jtz4mtfzPJCyqqr1tzcMwdgc4js0vlpFXvrHz+j63NFGpIX
   Jx9TEA/OASpMm5FCVihnF7CnigqUFudZWZGUAggAISYQUTHZoPy0Y+4V9
   3suEi6mhXgHQUr7ip7F0/QuVvqSxbrT7wBZCd2KU5RNomBMVs2yCTgY+v
   2SRe53Xc7rWY3QpT+sz1JnFPKPaTyOh7/vRQqmAFIqVTZ0X0MQZMit7T2
   HaSYE0sLw/QglEsjVukcyj7E9k9e4V7qo+d+kmzemVVZZ7PO8MtyrBeuq
   g==;
X-CSE-ConnectionGUID: gSs5AKUyRxmWwHMHzFQrEQ==
X-CSE-MsgGUID: gZ9G3DNySWyeXVaAumXqug==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92616602"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="92616602"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:48:37 -0700
X-CSE-ConnectionGUID: QNrPgzq9R8emW14RcraB7A==
X-CSE-MsgGUID: rRQeetGsQBWtj/L6fN2yHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="267939179"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 03 Sep 2026 04:48:35 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 3237299; Thu, 03 Sep 2026 13:48:34 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	=?UTF-8?q?Radek=20V=C3=A1lko?= <rvalko@lipicko.cz>
Subject: [PATCH v2 0/3] pinctrl: intel: retrieve pure platform driver data as well
Date: Thu,  3 Sep 2026 13:46:11 +0200
Message-ID: <20260903114832.1996235-1-andriy.shevchenko@linux.intel.com>
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

Changes v2:
- constified parameter in intel_pinctrl_get_soc_data() (Mika)
- added tag (Radek)

Cc: Radek Válko <rvalko@lipicko.cz>

Andy Shevchenko (3):
  pinctrl: intel: Move intel_pinctrl_get_soc_data() upper in the code
  pinctrl: intel: constify parameter in intel_pinctrl_get_soc_data()
  pinctrl: intel: Try to retrieve driver data for pure platform drivers

 drivers/pinctrl/intel/pinctrl-intel.c | 51 ++++++++++++++++++---------
 drivers/pinctrl/intel/pinctrl-intel.h |  2 +-
 2 files changed, 36 insertions(+), 17 deletions(-)

-- 
2.50.1

