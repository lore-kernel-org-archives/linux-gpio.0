Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AC915746F;
	Sun,  4 Oct 2026 08:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791102019; cv=none; b=DxOWCqqlzFqlIQy93GqNvNJggvpzwpgUtQPs1o7EHC5ikPvrIvsbMhAmX1Rb7TrswNjvQ98v+8s/oybEKnLStdYzCFaqIL1bYDbx2vgWzvFuTSM0twnVusgwjbhhV/afbiUdwjk6A97phN/Il3nHIZIuN/96SfT1imH6tjB72S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791102019; c=relaxed/simple;
	bh=Vsapf1kOW/cI9QN5gkodmygcncjVMEcCl0pgkMZ+c6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ayKmmuDpljvnzplSmROT292s5DBnvTXk6LCpprcqdvm7yOmAuEXGEgH9hFh/gRLBZi96JkojYzpdS6yWERVLDznf1vyUzlE1we9o/vbShTzUSxlhmf+rdWZIH7unZl5Rov2gd0vVYP+/VjbxIlODOwpuTLnmZZ5izTtfE8eEx5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cOqi+lIo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cOqi+lIo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791102018; x=1822638018;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Vsapf1kOW/cI9QN5gkodmygcncjVMEcCl0pgkMZ+c6o=;
  b=cOqi+lIoMaZ4gQanRzZN3A86CHhZa2Gk3OSrswT5GHCE2nMEa9rh+cHt
   B93XJQxpnKB50jL5ERKib43WYfoIaiVt+G2fpvzYx2QSicjrjitK+x9mS
   Y6CaxSUZaRvK6YaYtvjdT8VXHFqM+/4v7mrNCkl6AovjsuUUiDSwoNV+p
   p3vJ95DXSeJyArPPsy+TRJP4Ng8dW2j6uvKuq9JuqFYIhe+BGgga9uUv8
   u5PBbLPzy42UCbFDjeGb08HL0Z3YXgVYajQ5ztwsIKfNkg8LNnnJchB+q
   n/6b2PNswAX+7IRO946GDLnL5dbs+1zcnCAyIvv0A5B8Bz+vy6wf7WWfH
   w==;
X-CSE-ConnectionGUID: Ua+Cn44VQ72rIb7nUZt/kA==
X-CSE-MsgGUID: 2tqrwRTYRrGiVgH2rkTJqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="90933882"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="90933882"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 01:20:17 -0700
X-CSE-ConnectionGUID: mS7bUlfMT5OvaOsG9B1xPA==
X-CSE-MsgGUID: wVilO/PZSoukuvlhmKYWsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="274688316"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.100])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 01:20:16 -0700
Date: Sun, 4 Oct 2026 11:20:13 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Adrian Ng <adrianhoyin.ng@altera.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] gpio: realtek-otto: Handle errors from optional IRQ
 lookup
Message-ID: <asIMPd-Kat3Zo978@ashevche-desk.local>
References: <20260814043028.12548-1-phucduc.bui@gmail.com>
 <aro6C_SWBGF44z5E@black.igk.intel.com>
 <CAABR9nEmXm2UwOWHDR2=A_62LuFxjgN4En=8Jcn2r_on0XmROA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAABR9nEmXm2UwOWHDR2=A_62LuFxjgN4En=8Jcn2r_on0XmROA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Oct 04, 2026 at 08:08:18AM +0700, Bui Duc Phuc wrote:

...

> Thank you for pointing me to the discussion.

> > Have you read the discussion [1]?
> > It would be better to make platform_get_irq_optional() to be actually optional.
> >
> > [1]: https://lore.kernel.org/lkml/20220212201631.12648-1-s.shtylyov@omp.ru/
> 
> However, Regardless of how the API might be redesigned in the future
> to return 0
> or negative error codes, the fundamental requirement at the driver
> level remains
> the same: real errors must be propagated properly.
> 
> This patch isn't concerned with the API style discussion, but rather
> with ensuring
> that driver probe doesn't silently swallow genuine errors like ⁠-EPROBE_DEFER⁠.
> Proper error reporting is necessary under any reasonable API design.

Yes, but doing specific error handling is usually not a good idea as it adds
ambiguity. Like -EINVAL was used to check if the device property is present or
not at the time of trying to parse it. This was specifically clarified in the
documentation [2]. This is just an example of why the checking over a certain
error code is not good.

[2]: 70fa0c308aa2 ("device property: Document how to check for the property presence")

-- 
With Best Regards,
Andy Shevchenko


