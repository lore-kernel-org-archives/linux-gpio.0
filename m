Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514233;
	b=oRKKhwTg+qiDp6oLPMllR2Cd5UxqAVucHWs8UGwhof52nxGrFOKelH1F1QxVeSNaEM8X
	 GvqsyoqtQAGRmgi06/9EWBZBb0vZt9rrH1s2YMV+2b5ld4V2ZPcKEj8L91mcAuv4wTbJU
	 P7CxvBPBfOOXb8H4QrQAuAfaERRJFWTluHRPDaITE0TV0NlBLmtiKuF3JV/JsNrKOMASF
	 vMZfAiULsXbFP+/hnFs8DJ0vDqVRLii+eR4CMB/W9wQujR4dCkNR4MoZQ5xenEM3h7nDr
	 N2TGe2Rdh7NG4wmSrd7K8R/vdlvqc91XTr2V20skHktwe4DPUNo2ln69KfM7wA+6isg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514233;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=48VphuVDqeqN5lD2GcFIyQ7SevY5jaHdnkERpX/nwKA=;
	b=CvomNxyGv4Q1886eG6XyeeU5rCKpGECXJ5DuaIh7RhIRlLZc+5Mj/Ujsg/g/0pYMXqut
	 M13eYXtYSamN1Hp5d1ZzkZ2G/ZvTmpRXZ6QmFrkx5sobjS5LaH9oDMi54DFkk1/319khB
	 yh+S7QaCgOE69JxX67Tvf4YYBMfhfEUneri9if2a1rjE91BT/z3u8o7tKAcJIBmo7Oqu3
	 npyYsVXYagzCt+grWZy15U2DshA+TyWoiZdUPdTWqWuXw5QJ1jPICvh1rnwEJ9fetEYzj
	 LTb4N/Es6QW1sRPJzeEFSU8Cd//dm4Uz/2+SToK2DW7o0eBZwTlKPvfsVHa/KwiboXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QztcFcY7;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81C7606A31E;
	Tue, 24 Nov 2026 09:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A81C7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QztcFcY7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795514233; x=1827050233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NLvt/ppyOkmiGQEP/q8ihUkZ6zx5Ghwkgb3ZoISTKoQ=;
  b=QztcFcY7l68yYtUL+GUq1exwlVI7qqeoxsDIX5wdwG7obUtttb8qHbZI
   RHuauIvsz9SbbPSt3rc3UFA9iLFvU+qCvFyMRQkgKJt7pXOdPe8rv6lWo
   KfDyMiFTurtYjzSy1CzuywI2YDW5zCP1l3593lDUstdoCIJS2YIY5Kuk7
   duM5NfKw8SOafpXwpozT/uJbbIGXlqIPtJVCDkUhjMufd8fYBbEdvf8gG
   ryzbh+31ABKkE2ErNATlpLgpkxXQCXzdywP9l1nlghlPMmxbrj1BAZ5xQ
   teFkzNjpmfISgp7+tXCRLqsi3leFY6kmjhfGNnSJOxXFGQ172PJ1wVt8z
   Q==;
X-CSE-ConnectionGUID: ZPUuaxDVTdqJ+/DcrxWCvg==
X-CSE-MsgGUID: w6IaxRYkQa62I0iiG76rSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4397705"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4397705"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 01:57:12 -0800
X-CSE-ConnectionGUID: T34wVYxBQTGokWt6aW2Y1g==
X-CSE-MsgGUID: 5qT1tNnvQOqUrpfVsmAZOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="13206123"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 01:57:10 -0800
Date: Tue, 24 Nov 2026 11:57:07 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kent Gibson <warthog618@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Jia Jia <physicalmtea@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/8] gpiolib: fix chip removal with lines still
 requested from user space
Message-ID: <awVfc9xLPXbkAov-@ashevche-desk.local>
References: <20261124-gpiolib-chip-removal-v8-0-aambrozewicz@nvidia.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124-gpiolib-chip-removal-v8-0-aambrozewicz@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 24, 2026 at 11:20:31AM +0200, Adrian Ambrozewicz wrote:
> Removing a GPIO chip while user space holds a line request, as when a
> hot-pluggable GPIO controller goes away, leaks the line labels (patch 2)
> and IRQ names (patch 5), frees IRQs twice (patches 3, 7 and 8) and lets
> a blocked read() stall the removal (patch 4). Patch 1 makes
> gpiodev_release() wait for pending label frees; without it,
> cleanup_srcu_struct() can warn, more often with patch 2.
> 
> Patch 7 also affects in-kernel users: their remaining IRQs are freed
> after the chip pointer is cleared, when gpiod_*() calls fail. Patch 6
> drops edge events whose line read fails instead of reporting an edge.
> 
> User-visible change: a read() blocked when the chip is removed returns
> the queued events, then fails with -ENODEV.
> 
> For stable: patch 2 needs 1, 5 needs 3, 7 needs 3, 5 and 6, and 8
> needs 7; patches 3, 5 and 7 fix a 6.13 commit also in 6.12.y, patch 8 a
> 6.19 commit; patch 4 applies to 6.12.y.
> 
> Tested under QEMU (x86_64, arm64) with gpio-sim, a shared gpio-sim line
> and a test chip on the hierarchical irqchip, with lockdep, kmemleak and
> KASAN.
> 
> Prepared with Cursor and Claude Code, using Claude, which helped analyse
> the bugs, write the reproducers and draft the patches; I reviewed and
> tested every change.

Bart, this series seems contain two parts, core and cdev fixes, the first
(core) fixes are being reproduced and tested in our lab and they are pretty
much ready to go. Can we at least have them (patches 1 & 2) pulled rather
sooner, please?

-- 
With Best Regards,
Andy Shevchenko


