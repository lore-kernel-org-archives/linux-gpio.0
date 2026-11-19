Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074021;
	b=4KQplxWWYUn6zkwTAonwjHIpK9VmgBTv+SpfDPr136hyt2BoVGCIxYnQrNuNWJFh6QoH
	 7NE+rvkIRQunz8ACMzB2n7W0jcjpS5Rl3187hGGl6b8MqPutT7KyzkjaeFmM3b6/ALQd1
	 HBC7dI2Xziz8zzadB8jj/7MfUF0TnMjBsRxNNwmtmMdMxj+dp9NnJDcxU6MBKlvS+RJcu
	 za6XYUsLsEWQMv6xGsifFU4LFMHPluXqkxZom4GcVnY81AHTPm5Ju2xWna5IajtzZwLFG
	 /OHLylgRBngon5fslwvlyjM9prEP+iSOvBsz2YCAQ/TB7+0ookz239SeEm2YJ89iO+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074021;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=I9EY3FKNiw5ECDhc/tcVzPRkDz+FAXugtL8mkl0pXls=;
	b=j0BlFHYcI7DdIgx6h9wDexTrWnC0t/SLOVzB/QAfTuGXasN1hoD9Rk6sie1Q7eDx44ui
	 16HfcrH9ky8UVmL1bejCriOAJq40+dI+fZQmdUxsgOd2Qq9Bq/a1tE4tj6PvfGhtBi6G8
	 fcTONrvbFSUDz7LIrHPeY7jGLEV3Fs9r12m7uXPN7B9Ro84W7cOmvbebvAF/lC34X3vlg
	 quf1hoicYlYOJm071TFcnsQtTo9Ye64ZRoGzAe4f28pBghK7yFUr7au3PkEF/bQMSy5eu
	 pd2QgPZQwXZelSyK94xXL12lmNii7bs2vzpAA9wN6gnuRIKqeuFfEj2CVrUPYNYnDDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gYp2qiV1;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC10606A320;
	Thu, 19 Nov 2026 07:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AC10606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gYp2qiV1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795074020; x=1826610020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QRXYnY4IdZ7ChW1zAO9xKVzOQXeqLl1lwDpg3PTioFI=;
  b=gYp2qiV1CpRHCSfRt9BZc4EabOc9ReqkYdHFOb257v2X2ImvjG8Ua8C/
   nsNXL2IAGmuQq7zxcUH0ACmsbMzHEdVkPmNMtyVyoNaetaeYffrNiTgQm
   146wRNdYZwikYnSVX5n6Mx7DKhc/vjBlBQ3cYyNWS2g1I4maat1Or2pQK
   DnkWeGaqOqI3SM+BkL+QWTFT6fhq0qbdFgwC5mxcbi02hqKhBOxAljNn9
   +TQsZINkEjQFvqmgJARw72xJP1AAakKFXwWSe8qhphu5cFDq7gbfPQEJS
   NcMA52mTOgJKzlgIpblGSpKPNe1zGyr6eBGmlE8/0DtRDdFjNI65R/vAC
   A==;
X-CSE-ConnectionGUID: nIpflkS/QWmaCrzVJ4iMXA==
X-CSE-MsgGUID: SY2itDpKTyipAb2KcDRNag==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3804931"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3804931"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 23:40:20 -0800
X-CSE-ConnectionGUID: SycEWPP3RQqaL6ubb5b6dg==
X-CSE-MsgGUID: Z+L9eNZ2SjaPtf3NqLaeqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="12185505"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 23:40:16 -0800
Date: Thu, 19 Nov 2026 09:40:14 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: longzhao@ambarella.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Mika Westerberg <westeri@kernel.org>, devicetree@vger.kernel.org,
	Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 03/14] gpio: regmap: remove gpiochip before tearing
 down irqchip
Message-ID: <av6n3oNVl2pyeLBK@ashevche-desk.local>
References: <20261118-cv75-gpio-v15-0-e3c563673fe1@ambarella.com>
 <20261118-cv75-gpio-v15-3-e3c563673fe1@ambarella.com>
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
In-Reply-To: <20261118-cv75-gpio-v15-3-e3c563673fe1@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 18, 2026 at 03:42:20PM +0800, Long Zhao via B4 Relay wrote:
> 
> gpiochip_remove() calls acpi_gpiochip_free_interrupts() and
> gpiod_free_irqs(). Both still need the irq domain.
> regmap_del_irq_chip() removes that domain, so remove the
> gpiochip first.

So, AFAIR Michael rose the question that this patch makes the unregister flow
not reverse symmetrical to the register one. I took a look at this and I can
say that this is a bit twisted. The pure creation part is independent, but
to function it requires GPIO chip to be instantiated. So, yeah, this patch
is a bit controversial. Let me see what we can do here.

-- 
With Best Regards,
Andy Shevchenko


