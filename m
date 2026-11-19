Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795086864;
	b=PqIlNj8gd2pa0hAyYwuin/kwUPHMhugrXsT6qOlbVqfxKkhVLZxgP3indOv4OHVMFwFE
	 C6Xg3cPSR63PqiYqpeNLKNGak9klRYceV3zVdmOKmUbmfeY6RvOpcPp0tUYH8VIOx6HMn
	 I4a3n40dz6GqZ9h2mzmFmJGz+kGCqT9JxcIJBofwBU6ATG7c4a8w++QymsgdLY0Y8ihLr
	 ypThsfUuuu8hqsuNgdflAGCfbcEo+qTLcmrasSZl1/DYFVDAd9fJE5K+nAyhL03i4yImL
	 K/Bud0wd/vf/GCVPqjdWibFUfw9jIHWlOffg3XxXaVPpjt1F1TvhFOxJUucIFiM7GKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086864;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=PJmZF4LOir2pU96q2FvinjWiI03Gy7wsXRQWWfcI5x4=;
	b=Bd+DDiXHqePnnq7OyzXET0qYjSueiW+GNFpp5NcE+W5XcShNL8BYhqWssFtFz9Unf8lw
	 xcy6UXpYUStu2SRaNjj23Tv9df6jk3zZyKDOzTVKT+DLgu3ztMVQzY+2ck5CZXBVApCe2
	 q778WkqITw7fLBeH8P/SwvgxmNudinRd3aeV+klSyai1ZZB+iGCuVMNdfybxHSxfircm9
	 A3R0WSIoIrf1y4GULG8RPK16EXLFkZ+tubKQUygreo3KrbYGT0ldeX6gb7k0z4qjgkobk
	 G7yp64wQslK/5u9Z0Te/eznbcqCJZdod4bapUMWXe3c8p7MMmxfVcDgvlN5GhA6+t8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="mLbf/+v5";
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABB3606A320
	for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 11:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ABB3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mLbf/+v5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795086864; x=1826622864;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=gu6FFVS5bnk5FZlAM3VzCYNoGVQC1Z4JtfWeHMbt2Do=;
  b=mLbf/+v5GUUdMUxfUsB+JUG0xDmYoqrIVcirBQodVF2ca+PLsCXKN5Oj
   m8HQVsfktT5hAB6uP70PjXrhSji4fREzRy43vbPFbxRpnx9ouioBIv/Zo
   0hmrwV3obkzz8IN09XGWz3dtg0foAA3GH4pGHSXnNQZKZSX1YrBqSoxjc
   H6D5es478enxeN0Cg+yIRP2r1v3DtSavG2NbcAVIt/n7SQQUOKEFEbNvg
   3m8l15uilTU14kf5gd2Jxhn69QR7jkckhZJpNBU7w+/k8KqGBQlTjtP+Y
   TNEZSSMgnM6eCL0STWwdarLpDiDsGcRik/TdZUbZKRXHIxilnoHxtfYZD
   A==;
X-CSE-ConnectionGUID: XGCTwnAMSS2Qi7XPq1hqgw==
X-CSE-MsgGUID: AwM9lfM3Tpmu1aSHEJN2Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3820731"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3820731"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 03:14:24 -0800
X-CSE-ConnectionGUID: 1OSEwKmjTE+QYZ6Ger7zFw==
X-CSE-MsgGUID: inx1Y4FOTduYjVKcQoGMKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10294184"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 19 Nov 2026 03:14:24 -0800
Received: from black.igk.intel.com (localhost [IPv6:::1])
	by black.igk.intel.com (Postfix) with ESMTP id 27EA999;
	Thu, 19 Nov 2026 12:14:22 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261111121653.1295437-1-mika.westerberg@linux.intel.com>
References: <20261111121653.1295437-1-mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] MAINTAINERS: Remove me as maintainer of Intel pinctrl
 drivers
Message-Id: <179508686216.1224334.2957930090072020595.b4-ty@b4>
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


On Wed, 11 Nov 2026 13:16:53 +0100, Mika Westerberg wrote:
> My @linux.intel.com address will bounce soon so remove me as maintainer
> of Intel pinctrl drivers.

Applied, thanks!

[1/1] MAINTAINERS: Remove me as maintainer of Intel pinctrl drivers
      commit: 09639c08a6f7c6cb185a70167430b3d7d142daa6

Best regards,
-- 
With Best Regards,
Andy Shevchenko




