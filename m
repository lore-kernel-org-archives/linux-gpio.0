Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795086865;
	b=o/Su/r0bFEVJldAzMmshBQfksF5WI4NuqY5H70yHdIWbusQI/ZAy6u70Z/eXRWFSBBJi
	 xJYsMOzUB2tzjibVGTxMMaWGfZpxYdOKOY4PZJ/SxXVWi63ZuuMBj4hRoIrD9GpaKs9uB
	 5TC9laWWxkYl3GbOjjjtk/2Vu6bMBgTslVPYenRSQt5TzfHgP0DcaMTBSMT7IZIovVo+w
	 r2IhrQuymyYa46ZNMkckkI1eutZ3C8/PjmzmbPWcciG9/hlwVabw3KWZZKaFyn3to+Edh
	 R4SfacV+IGynNXCYJvTRrNi1Ar8G34iGzH+dT8ra79rQK9IUfZF2zzzvmGCmrgKdyIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086865;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=ygAby4UN0UzZrAIPVILei7ELllQZJNLzEX2Bml/4ev8=;
	b=1Y/6yi4O4ZcasOu0CVBepAsgPhVrxz3oZgD0S+N96NbVFXK4i7xt8aR2+gsmR3zF2dwS
	 6jW1xIHaBe7nox31dI9ciua8Xs1f+sITSyAm7/SR0JkK7Ip5R/jAts/+/W+nDkrGWEoXy
	 +Q5CfRNZg8pSlDiikB9pcyW4U5ADwXmcGfp4Ws0dmLAn8YlI0ri5Nz1ZM3HqRue4hB4O3
	 /ws+2D9oTFNUhnh9EOME9iCpN42KmwYDrSdza5W4pSrDeznh4kAc89GaKorTi7u8msRCo
	 +DWnGr1WyydkhV7rwBx/jyFfgEvvnU5VXhObub7+cypLPksELICUCJ+qTXp1Ax6BLzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IzVzjQpV;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD2A606A331;
	Thu, 19 Nov 2026 11:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AD2A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IzVzjQpV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795086865; x=1826622865;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=vYEga44tZacey18K6iUdjuUPRvyYQ5Mp7hAa437uK5c=;
  b=IzVzjQpVrJrCkREZO5NLS+VF1ziHw25xXyR6SQ41lHgU34B38yiV602I
   xPnacIG1IqhPcnn9NLyI4OJ1EJGfmV3dkF2dCY12ZWeJGvaleO+3cEeC3
   tMYYSOSuMluczGqsCJHi8CfFQjLgTUCIdE4X0wwAWtXSO/0o7rdsQ3oiR
   bAmVd3MB7V12RVN+yYNlqufXCZRi5jimmWyuboyLUeVGCQklJLtW039Yo
   Nj/1tJhD+gpQ+ffRthG2fjXKo5/jHQpqA7jxDoE4Qy5wiCTUsvC0m/WzU
   +0FuvO0bfBGAkD0jArxkyub9lJKEazxIYpwdXIaKjpPds5yhTpZ9kZh+l
   w==;
X-CSE-ConnectionGUID: s/v3UYwBTHWfM7hvtgauEw==
X-CSE-MsgGUID: c3iPOpK8Q6aBf5QFKH1vRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3820739"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3820739"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 03:14:24 -0800
X-CSE-ConnectionGUID: ZPxZe2TvRzi2XccAPU1isA==
X-CSE-MsgGUID: N3pZDlnGQTK1tsU1yWNmGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10294186"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 19 Nov 2026 03:14:24 -0800
Received: from black.igk.intel.com (localhost [IPv6:::1])
	by black.igk.intel.com (Postfix) with ESMTP id 2C2B89B;
	Thu, 19 Nov 2026 12:14:22 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>
In-Reply-To: <20260318151256.2590375-1-andriy.shevchenko@linux.intel.com>
References: <20260318151256.2590375-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v1 0/5] pinctrl: intel: capability handling
 rework
Message-Id: <179508686217.1224334.16020510909776981622.b4-ty@b4>
Date: Thu, 19 Nov 2026 12:14:22 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Wed, 18 Mar 2026 16:10:14 +0100, Andy Shevchenko wrote:
> During testing a new feature (see patch 3). I discovered that the
> handling of capabilities is currently limited and in some cases may
> even lead to not-working but announced feature (PWM). Hence there
> 2 fixes for the existing support, 1 enabling of a new feature, and
> a couple of cleanup changes.
> 
> Andy Shevchenko (5):
>   pinctrl: intel: Improve capability support
>   pinctrl: intel: Fix the revision for new features (1kOhm PD, HW
>     debouncer)
>   pinctrl: intel: Enable 3-bit PAD_OWN feature
>   pinctrl: intel: Refactor intel_gpio_add_pin_ranges() to make it
>     shorter
>   pinctrl: intel: define iterator variables inside for-loop
> 
> [...]

Applied, thanks!

[4/5] pinctrl: intel: Refactor intel_gpio_add_pin_ranges() to make it shorter
      commit: a618576d73adfcc66d7e5f8c295fd88df7e7072a
[5/5] pinctrl: intel: define iterator variables inside for-loop
      commit: 34925b925793b1ed78fd7350a9ff4e443cbbe7f3

Best regards,
-- 
With Best Regards,
Andy Shevchenko




