Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399416;
	b=UZFpAMr8KCtkcYR4Zvsti8Of7h0kwJXrnnJHFEMR0O+Qb0sI2dkdpbQ0CQl7OmzHJxsR
	 K+ZTiCqXrAKjEiiST/LCwyCXgKndcb5lFDP7H0k41y2K8q4esHkjj+ykSGURTZO/dFSmS
	 WMHAYlN8YZQHQcA8NpjHkhQrCsK5PytOReIG7rs044lFQu8RXMhYoRvmci5W/fCXHO7C8
	 +GGGVA311ZfF247/l876RhYrfb8IPWuJ31XBZ9SkoyaOAbky4GtRl4+O7dI/TI/10DlP9
	 5zf+toD+pjyJtOlHVJnWqXRaaDRyMFrIFnZABsT1shwnNBVkd3opP2zhtW9u5vwvKpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399416;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FJPLfs/gG5FcZ8u6zvDGs9Vxhb2vdeb8LlVgwfggjE0=;
	b=AEGgt3sQ2X+vSm9l28nd0RFG0sDWnuqnPdhiZDXl/2D+k00qBkoPGPgnAt8QApzfLp3Q
	 Te8rO/DzB+1NnvoxsydhMNzuVL2nzbYrcANlMLpVzOrfx7Zv1JmtAhZBceSfMdkTPRH5V
	 NebMusSNGlA1YyedLirXFoOdwQZ1xv08MKdvFB/1yLP64xtAQOn2XlANfPErvf2NgEKI2
	 q+UKILb63kccx9Z+mt2oRBFHE2QQZ1yfzR0LXBj0dFH7fS5Q6k36kJ4PjqvCMMIb6BIAK
	 QaJS5uYJ7uTMuuk2uIrqAuA8BTADeNh4MLuiHbYHkOVv6wwnS01sqT4PyXG/3AZnkdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cZpcP6xI;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB2460A2637
	for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2026 12:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CB2460A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cZpcP6xI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794399416; x=1825935416;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nla2JApduMMq52PgF2dY8afK5BDIfsePXV1ps8sjm6c=;
  b=cZpcP6xIKpzt/I9Q38kUgT1Z5DFGqv98o/aL2FOqy7uGxGvRUqofoG0l
   5vJAJ9cg8dB6RGPAyOGoOmSjbiOd5ORxS/f7L2SJPZHFy/+KibWKe8hXW
   uVmXAHj2Qki+UHFjwvbE9oIyJ3mU4V9HOOpi7XhXeeKScRxSoOnadOTQg
   laZ6/rWrrmQVwD3Vw+Vt/kZILQTdDMdAMkmoBVzjXArMUp70dz+aMB0wl
   aef53VyZbNYj2O5523/ZoVNkiAXc2wBV5Mu+idqo4ArYIBzrEL9YI9jd8
   tPTH2Ptw/RcpUOMxBV76IlH5jA2UkE1e6h5F1CrxbHWdSNfIp5t5ocPnL
   w==;
X-CSE-ConnectionGUID: zdn7o3uiTcajUFMCuPAuOg==
X-CSE-MsgGUID: 4UGSyFfZRvC9iWWhde9vGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3196999"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3196999"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 04:16:56 -0800
X-CSE-ConnectionGUID: Xzy0IgNDQ6aiPDgWOh47+A==
X-CSE-MsgGUID: AcHXEjWUQM6rE553wsnNzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8583052"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 11 Nov 2026 04:16:55 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id B1E2299; Wed, 11 Nov 2026 13:16:53 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Remove me as maintainer of Intel pinctrl drivers
Date: Wed, 11 Nov 2026 13:16:53 +0100
Message-ID: <20261111121653.1295437-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

My @linux.intel.com address will bounce soon so remove me as maintainer
of Intel pinctrl drivers.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b5f7aafddd22..083881778ade 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22106,7 +22106,6 @@ F:	drivers/pinctrl/freescale/
 F:	drivers/pinctrl/nxp/
 
 PIN CONTROLLER - INTEL
-M:	Mika Westerberg <mika.westerberg@linux.intel.com>
 M:	Andy Shevchenko <andy@kernel.org>
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git
-- 
2.50.1

