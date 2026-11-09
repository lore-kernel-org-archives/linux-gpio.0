Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794263695;
	b=DR8yl4BI0Uuh4B68iFkXYfKPS8Xx2giCNKf/vctDRPWGsqbi4TC/8J50S0EMlKIXg9he
	 83oyr0aTAF2XzQUN5c5w4bCrcuLrwNQEGJEJriQultFs0Fi82b8igwNWA7vc049TQQG8Z
	 l+0O4+eWUtzzHknaYd4XTSYX3tMG6VipgsDXJAKfI7VK9fPZotbuzhSt6pbToXB1AcW+x
	 mXTtZtUq8OfI7S5CB8zwX/Pz1wnl1DxMyc/QedKXcm7OgVhO5EOvgOQx3Wyp/57Cc/k7I
	 WwD/Dt8m/FwPTDIqYqa16Gp22ZDian1rXu3vWwfoqX8BQTsJLeLU9D7klUksv2G/YmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263695;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=np9M+pJSbds5rnylGSQybj0eEL70g3jA5yLzRpW6CGY=;
	b=1mZp6rWktuc96b0Q52FOGDyue6SgyabqfGwZa9R3JbSwm4wugWaSFHeDPmBBVt/xO90C
	 0Yic5fl+kIhMf2D5xagJM0EsFLXI5zulc5m2Q7di065aDA8Xotel7TwQhL/i2hiSsri1+
	 0QhIlaavQRS1ADic83I1dAMZaypq+wLW2kSpkcU9rxJ0E5UeyJbBN1IATdb5ZysGKR08c
	 CsPAi2E82SS15ZcgfLYz5DEOCsqpg5Z98qaqU4rVtx/H9nS8fZkjF5eojHjXUiB1jv8Es
	 bEgdm4jZs50N7UUw9IYR/xO3dCD9H9bNc24CwFz49l3Ni/wjyorCH75NDkjz01tR/dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=czYgiVEF;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB49606A331;
	Mon,  9 Nov 2026 22:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AB49606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=czYgiVEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794263694; x=1825799694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MRTklrICT1+xSptLDu/+oVKKPOOhfN35osx6RAortbA=;
  b=czYgiVEFcgl6tnLUxdQ8kVbqGst9PVsDaCDkj67Nunp+aF/+Yne25QG+
   cZ/HOBGTiNoroJngjwFW9e/PCGOLcUWyRygsWETg8NGqZ9s2ZoVsSUQWl
   +mHanRHUBQn32+DmBFNLsIdSvtRuchZ5mW6p9SGPsN9y5pescrqQVoVDv
   aD9Vay/+PFQiE+izAhN9ZWyUPF2e2O8COoStVgAbByuSH0/NNVYPQJJFB
   bBig0LeSWT+cgr9HRyyiaDm15aRFzLPWTtHVGYWZdDGzNA3nsUaqMHpDu
   ee5L/QVkUeraTIY8gH4quxOL7PTH2FkZUGLnhJYnOhbvtSnU0DtQWlhH1
   w==;
X-CSE-ConnectionGUID: NHDSAVdUQ+itFFn7NF5fUw==
X-CSE-MsgGUID: ehButblCSIWh64lyBo6ngg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3024255"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3024255"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 14:34:53 -0800
X-CSE-ConnectionGUID: OPyoT2rxQQmorsssOHL9FA==
X-CSE-MsgGUID: cZEl2ZO0Tm+iBpPw0W+jqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7974861"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 14:34:52 -0800
Date: Tue, 10 Nov 2026 00:34:49 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Paul Cercueil <paul@crapouillou.net>, Linus Walleij <linusw@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: intel: convert to subsys_platform_driver()
Message-ID: <avJKiYtczueslNSQ@ashevche-desk.local>
References: <20261106-pinctrl-subsys-v1-0-f17582f32aaf@redhat.com>
 <20261106-pinctrl-subsys-v1-2-f17582f32aaf@redhat.com>
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
In-Reply-To: <20261106-pinctrl-subsys-v1-2-f17582f32aaf@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 06, 2026 at 07:27:13PM -0500, Brian Masney wrote:
> Reduce boilerplate code in these drivers and convert them over to use
> the macro subsys_platform_driver().

Look at 20261104113343.1634218-1-peng.fan@oss.nxp.com.

-- 
With Best Regards,
Andy Shevchenko


