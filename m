Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F443DE425;
	Tue, 13 Oct 2026 09:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885054; cv=none; b=SQnBhu0vLkuvR+PzCVQKQRr8xtaZ0/dcsyuwqvpNgyP9gPPOjxumQ4TdGdrT6dGnXzTniERTzMhM1odvSMEB/jlW/29VbyGF1pERKXOmZiJS7fo13xJdHc4KD3WiWY3MFZfco3j/pwT5nxj8B12Fzkja+Q4W+6CGgXF0+xMFdHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885054; c=relaxed/simple;
	bh=DL5WXYvswNKtznPTbwaWjCKiiOqiXMuquN44WX/pmPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAEDuI65Kq3ZgcsCAfwcmAkAADsdk5eEdwD45GGLdldidLm8pOHy76D9CUD3GhCyDrTLLF8LgqjmdYU+9VcQYAQ1hcUrPfYxDJuVN0VLSwZnZkIKZ9hXcgHD/wo+f/b+Kxdzxzke7jDlw2gyunB5hFuAH9afNXciyokrVdWbb0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DsmTV4KF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DsmTV4KF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791885052; x=1823421052;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=DL5WXYvswNKtznPTbwaWjCKiiOqiXMuquN44WX/pmPA=;
  b=DsmTV4KFKTtHfyE25qJLg2MxDtHyllTHtCJAt1ZetmEOFgQFIuRbQb3a
   oJ3xe486qL84OX3jtuBfkh8K7NmsakYPx9aQYm31IGpSw5ieHG26Y8kKh
   oTzvyJlVgLYKHJOhukfzo02b2gOs72n/Aab/1vewxMtdLmNZwLT5wYyWf
   8ETu5np38owOxgTfSCCJCDiQQBQ+XKNtYb1nykE+MqbjznWUdzz30Bzgb
   S83PtKiI7ib40jRyqtdDrUi9zw06dYTniyZHkR9OnGH1Qk+f+j4ngbz6l
   QEUSf1Cc8dscFUnw2G3PhAW+oydlb0lPHHRHwMP7y1YEmnYVH36U93kQJ
   g==;
X-CSE-ConnectionGUID: ZhV+rANuSGqE9/nLdeJ2pQ==
X-CSE-MsgGUID: Qb7thFFvRgiD5ipe0U6emg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="491865"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="491865"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 02:50:52 -0700
X-CSE-ConnectionGUID: +dozvRk/S0mHO7B5mtfusA==
X-CSE-MsgGUID: yaKujDkWTRmU693QKaOM2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1096077"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 02:50:49 -0700
Date: Tue, 13 Oct 2026 12:50:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: zl020895 <zl020895@163.com>
Cc: longzhao@ambarella.com, Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH 6/7] gpio: pl061: switch data path to gpio-regmap
Message-ID: <as3-9rn0HgpPuiJp@ashevche-desk.local>
References: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
 <20261009-cv75-gpio-v1-6-5836bd438423@ambarella.com>
 <as3amWxGvbUdwE7k@ashevche-desk.local>
 <e1c092a.7c2c.1a1347a0650.Coremail.zl020895@163.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1c092a.7c2c.1a1347a0650.Coremail.zl020895@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 13, 2026 at 04:56:14PM +0800, zl020895 wrote:
> Hi Andy,
> 
> Sorry for the churn and thanks for the review.
> 
> Looking back at your v9 review of the convert patch, the only point I
> did not follow is the data-register path. You marked those
> regmap_write() sites with _set_bits(). I did switch direction and IRQ
> enable to regmap_test_bits() / regmap_clear_bits() / regmap_set_bits(),
> but I left the data-register writes as regmap_write(), because
> regmap_set_bits() cannot clear a bit to drive the line low. 

Can you elaborate on this a bit? Even if the cached value is 0, you still want
to write 0, do I understand correctly? Wouldn't it just mean that the registers
should be marked as volatile or something like that?

> In the next version I will use regmap_assign_bits() there.

Hmm... If regmap_set_bits() doesn't work for you, regmap_assign_bits() will not
work either.

> I did not find the other notes from this mail — drop fast_io, keep the
> regmap_config in the convert patch, and the guard() blank lines — in
> the v9 comments. I will fix those in the next version as well, along
> with reverse Christmas tree in irq_type and a precursor to drop the
> redundant if (pending) check.

Yeah, some notes are new, I only referred to the old ones.
But I believe I have mentioned that the code is not needed a shuffle
as it seems already in a good place. Otherwise it's unclear from this
change why the almost unmodified code is moved around.

...

> >> -static bool pl061_is_data_reg(unsigned int reg)
> >> -{
> >> -	return is_power_of_2(reg) &&
> >> -	       reg >= BIT(PL061_DATA_OFFSET) &&
> >> -	       reg <= BIT(PL061_DATA_OFFSET + PL061_GPIO_NR - 1);
> >> -}
> >> -
> >> -static bool pl061_volatile_reg(struct device *dev, unsigned int reg)
> >> -{
> >> -	switch (reg) {
> >> -	case GPIOMIS:
> >> -	case GPIOIC:
> >> -		return true;
> >> -	default:
> >> -		return pl061_is_data_reg(reg);
> >> -	}
> >> -}
> >> -
> >> -static const struct regmap_config pl061_regmap_config = {
> >> -	.reg_bits = 16,
> >> -	.val_bits = 8,
> >> -	.reg_stride = 4,
> >> -	.max_register = GPIOIC,
> >> -	.volatile_reg = pl061_volatile_reg,
> >> -	.fast_io = true,
> >> -	.use_raw_spinlock = true,
> >> -};
> >
> >No, I have already told you do not move these. If you need to rename, just make
> >sure it's named accordingly in the previous patch that introduced this.

...

> >I have a feeling that you ignored my last review. I stop it here, you need to
> >carefully read *all* the comments and act accordingly.

-- 
With Best Regards,
Andy Shevchenko


