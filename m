Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793793747;
	b=rz71CN8fqXPTwsHciL7Ux1zgnmKcVtR26IQ/583gqqPQJmzyzvzrnz7I7OL49YGVh1FC
	 X3Xz441mwogF68WHi8quPbyNqGwRa3EBoUnY6NqolezzurkNFKEqnZFWKYULx5U56K6tk
	 +zZP+ANkb5QDiwQ2sHzaQqsKYWmJXQw7lGmDQLSHC1mwxvYtiEPyOOgxzKQMUlUXe+9Nt
	 y7EQs995dUqoGN0NJA5kKGlPAZzJpuTnLRYKg9GqPrYkvDvsnXHMvTQdzQVw+Lf3AmYiq
	 Zwmmh+QbSoofT9CDNJqLyEDu/0q8Y986d8L8fgqkUO96Ia0l+kcmKyukxFNEPclKD3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793747;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=J+MjPhMs965Lvmv06hvs8vPpLqQFloDOzO/EzKlNPK0=;
	b=eFd4pb8iVHLRKB3PN1N9DV5pFNbIjoLE/2aiHPWbsE260WWVzXsa3OqFmDOdwfzLTC5s
	 /gg3W/3mwAe7Qqten2nvoGO4zEpLhrj14GhVMRoG3v0oCEkpbYiy56CbTblcEa7G9+uEZ
	 zfq7Q4ry0odxldVdxZJquVGwjkNOsxhlOW10lQHcb7X0uBi8CZKhxxYo0PPZM7BOwGQbs
	 bmXttpVmViDSBJJPuEAzslibhF6Hz6pJh0dYXVh5+/fMUZE0kUruA0Ja+W6RAS1ouVqEj
	 oaq8zXnP3buUmsObj/UyVucMYez3ot0gsj+C6DIguoWo8unlbQ9pqepEA/RGCEazc5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q2IyUzvs;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98D6606A32F;
	Wed,  4 Nov 2026 12:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E98D6606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q2IyUzvs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793793748; x=1825329748;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AOQIzKBPgyRFLmUKSraCjcRg3aJ/ODihlIgQ/rH1jPM=;
  b=Q2IyUzvsc9+9/qzL+2qzDADW7JpMENSPcWy6UZrkbh/o+0svfuik5l9Z
   8i1ZGznmI23j8mHCX5+MD1CSzIO4uEEcmZ2wCJULPsOmmTPrN7NDLwu6p
   ANFcLuW2n0GLtcP1xqpwf+W4i6d++nUW30dQbVAQNh9cfiMFvG2kGjeGA
   pqXIB+LqtjB1ALxhikhROfTgs3o2TXVZJtbEtzlM+k00gMqnypIgrlSB2
   UwPsVWlNCcP6uFlg3V+H7gxYp8nMbCJm85INbdrtp5QMs0QXGfbTWDCuL
   4mFAVr6SX53nJ8N1Rx6ndeA6u+eum+K/zRCoLAA2qtaRCHT/jp4r5chdF
   g==;
X-CSE-ConnectionGUID: HsSHFuU1RCq5siVMaEf8qQ==
X-CSE-MsgGUID: oSCzClUmTtmeoTrSuuasKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2444160"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2444160"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:02:27 -0800
X-CSE-ConnectionGUID: uRLuiX7UT+ikjeRk1NGYgg==
X-CSE-MsgGUID: on/50HxRSEiT+5nLE+Y3eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6834853"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 04 Nov 2026 04:02:18 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0B1E099; Wed, 04 Nov 2026 13:02:17 +0100 (CET)
Date: Wed, 4 Nov 2026 13:02:17 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: intel: Convert to subsys_platform_driver()
Message-ID: <20261104120217.GD176724@black.igk.intel.com>
References: <20261104113343.1634218-1-peng.fan@oss.nxp.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104113343.1634218-1-peng.fan@oss.nxp.com>

Hi,

On Wed, Nov 04, 2026 at 07:33:43PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
> 
> No functional change.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/intel/pinctrl-broxton.c      | 13 +------------
>  drivers/pinctrl/intel/pinctrl-cedarfork.c    | 13 +------------
>  drivers/pinctrl/intel/pinctrl-cherryview.c   | 13 +------------
>  drivers/pinctrl/intel/pinctrl-denverton.c    | 13 +------------
>  drivers/pinctrl/intel/pinctrl-geminilake.c   | 13 +------------
>  drivers/pinctrl/intel/pinctrl-lynxpoint.c    | 13 +------------
>  drivers/pinctrl/intel/pinctrl-merrifield.c   | 13 +------------
>  drivers/pinctrl/intel/pinctrl-moorefield.c   | 13 +------------
>  drivers/pinctrl/intel/pinctrl-sunrisepoint.c | 13 +------------
>  9 files changed, 9 insertions(+), 108 deletions(-)
                                     ^^^

This is awesome!

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
