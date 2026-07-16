Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D1426FD97;
	Thu, 16 Jul 2026 17:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223770; cv=none; b=e5I/yqSEd2Az5QPjg6DHR55oL3Ay5gn57h0n8dTbamWhXGxx4KMXyXxSWuHAXL0WFHiFgGM/RaMT1JbJ75MmIo/bLinUILifO1LaDEoyAumRQBj9+V6TU2985vNFmCBDMYVLdb/Sg6U4sps6H79o4E4sRsd6dWCZUTbRA8Fu6T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223770; c=relaxed/simple;
	bh=4Fde0zH8j0vJcSOWD8DgKoqdkh+Uq+VIoVGlR1HjS7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KuEpFo1JBNtQmwGbWKB0w14OpAXyxGHtObyc8WFH6Oe/U7G+t2A2nqw8TzASNXs81KVPhJuN/XjLRJ93pSu0DXo/f26vo3pRM5zJAW/BQk4hbgnMyuvaDpbWZbUMlvWugRR0W/ZrWih7cwDitpVnd+MtrRFC5a6c4jgLPXSle44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hkyxlwac; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hkyxlwac"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784223769; x=1815759769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4Fde0zH8j0vJcSOWD8DgKoqdkh+Uq+VIoVGlR1HjS7M=;
  b=hkyxlwacezvrjJHmD6d6jRZgg8vS4exeg4ZgRouQ3wWumENDuzLfLiJj
   cvbMfSP2Crqxd/bGC8Yw8W6ydNRYjrNClWdRIwymQ6Z6FTac0K/YMQqxd
   bPkW21/OEnZEKW9MI9aRzuyK17p5r/3Lw0zH14Juggx0OH5xss2Tik9iF
   zRFeESZTuHQr8+R8sLNuq7u2pQJnwxGYdAirBD5gpt6Vb2olIeHY4fSUG
   wCFKSKwtvMgvx9HvLV8Uf2ANzD67keyloSGUHZ7vLfQEYLCNvNmhMmmJB
   4bZO9Np0NyI460RPyBJ1o2V11rxBq8w6Ovq9unGes7ZfRBpwlFRK2HkZF
   Q==;
X-CSE-ConnectionGUID: HV0Z99LETQ64nzDVCLbYsg==
X-CSE-MsgGUID: VaTwpokFRu+a1Cu7TrhxcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="83877126"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="83877126"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 10:42:48 -0700
X-CSE-ConnectionGUID: 85mIzpyiTuGierS4TaWEow==
X-CSE-MsgGUID: jEZkAGURRrGr75I645e1pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="256023104"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 10:42:46 -0700
Date: Thu, 16 Jul 2026 20:42:44 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Michael Buesch <m@bues.ch>,
	Andy Shevchenko <andy@kernel.org>,
	William Breathitt Gray <wbg@kernel.org>,
	Robert Richter <rric@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 20/21] gpio: Unify style of pci_device_id arrays
Message-ID: <alkYFLPlMOT-8EH1@ashevche-desk.local>
References: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
 <a5c6484f2ff045068b667e3c08e8f98fd31cbbc6.1784133987.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5c6484f2ff045068b667e3c08e8f98fd31cbbc6.1784133987.git.u.kleine-koenig@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 15, 2026 at 06:55:25PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Update the various of_device_id arrays to conform to the most used and

OF?!

I guess you messed up with the patches in this series. Two mistakes I can only
explain with some bad rebase happened or alike.

> generally recommended coding style. That is:
> 
>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
>  - at most one entry per line;
> 
> Adapt the few offenders accordingly.


-- 
With Best Regards,
Andy Shevchenko


