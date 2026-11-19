Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795086865;
	b=ZaJx3u2ZSd7ICQwcOtZKIFJdCok9mk3TcezCuATeiKdoWMHHnT8qydHtZCDMGibyOmvE
	 AWbgumAy5fBEe/7P17I11Q2WJ8k2T5HA58umOKZs371Fml+fU3oKLZ7EEkstGjc707r7j
	 nwBSm7Ph71wI7gz559sWPZTziTUP0RV8EelOTXgZEjliMr3kQwWRPVZTmAhCjA6X6o4wZ
	 fi98BSXW/5qD6CkbsbV4JBqGd/L6i+92B4QNBgT9whPC5upFbs5WXZqxLXqYRkw8g0SBS
	 nR34iWl8NK6Y3n+w4nSJlebxyxmPB+r6ggXf+Pno9OAxc0+eUsfN4uHkKGkTJCFsdug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086865;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=wSZbffeHEoyR2pYQCtLijlFM6YnuP8VnDq4hiI1jt24=;
	b=lDXPcNx3St0nQb/cBCefyKMimTdYkUfgNekT+KAQZ7mG9Ma2Szj8uvvH7SWKfJXJLRBQ
	 e3zWkAnJBzNDj2MopLBJfl8Sc9ZZTG3RE+v1h7JZ/WjaZ0Hg4cXqMsyiH16c9c82m6Nmc
	 67Z93FHu42uJoCzdN3fqLhSaW5w85tdYDu0F8JUIjF/D5mQUBfXOewQqQr8KR7aQY2Pf7
	 CaH888XcVlKbjrPKqc75BGWEUDf6PLanyWxFpC+MjyZ2T94GxEXQDJigE0CGN/s4HzgO/
	 odyaxqC7+wvPsu5MYXlB2e4uGtFqvaVyy8aW1nizpu0cKDL133pt4ie9gMWsbJ1dK1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QIXMPXCc;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEC1606A32C;
	Thu, 19 Nov 2026 11:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BEC1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QIXMPXCc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795086865; x=1826622865;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=FqwaV3rM7c5WPQxn/eHfuerXGyruB5DXlIDheGDlJ8k=;
  b=QIXMPXCcGOQxcxz2g7k18S/19LQN2tAYqup/Kt25B1AR1eH7KdHDVtCf
   tIbVLV2Q/ANzGKpXqz4vxvQb9lyXLby6aZ6KskNaxmy6Topi22aryBl0M
   nZUPztaIVaZGFK8xcN7PgI4seCuspTGBwcnOdqrAguVhbUg8gwzfin+Bl
   uNW7PXiFZakqs0yFBKCn8A4BI9NYOUZt3b87DMyUMxvhJCVOs2RdSRAF/
   CkO0ToEubMWBQFFu65Wqp6lEN4qpDtdsath/iAkBnhy0ecXyEiC0PBb9f
   VrL7Yc/vcKsmHW9Ue/tXR2+RSUdwTLrJsqPAYB9Eehewy95pKi3QFm4VT
   A==;
X-CSE-ConnectionGUID: 8p5XQTr8RvWOnSiYB1M9RQ==
X-CSE-MsgGUID: ZEDGmRkVTxWprZnOR9pjoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3820736"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3820736"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 03:14:24 -0800
X-CSE-ConnectionGUID: rsNyOPSdS8W2iK60qmO5og==
X-CSE-MsgGUID: COybTW2+QbeMstvDCuICZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10294185"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 19 Nov 2026 03:14:24 -0800
Received: from black.igk.intel.com (localhost [IPv6:::1])
	by black.igk.intel.com (Postfix) with ESMTP id 30FF19D;
	Thu, 19 Nov 2026 12:14:22 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104113343.1634218-1-peng.fan@oss.nxp.com>
References: <20261104113343.1634218-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH] pinctrl: intel: Convert to subsys_platform_driver()
Message-Id: <179508686219.1224334.13266012832232048118.b4-ty@b4>
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


On Wed, 04 Nov 2026 19:33:43 +0800, Peng Fan (OSS) wrote:
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
> 
> No functional change.

Applied, thanks!

[1/1] pinctrl: intel: Convert to subsys_platform_driver()
      commit: a6f0cc84449028495f2cc6c8d46bfbed3dade348

Best regards,
-- 
With Best Regards,
Andy Shevchenko




