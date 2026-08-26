Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA947439F7E;
	Wed, 26 Aug 2026 14:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752816; cv=none; b=Tzm6UCP5LebPIMNvzPhv0SBUpC5iIPqyFLgBJ+kea9/7ruH/3kjvaBpQbthbpbp2p3KkyVm5ghyDqu9aC3qNxDRqftWq+CUGcueUOx/p14YWCt56qv9s2nmnOAidvAsRkP7HRLGonOwCxdeQXU4dKgRVWl8iXlxnI8Jz7S5vudA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752816; c=relaxed/simple;
	bh=/TzXwS4YF5gUqidjGf4wMNZnieUtP2YP6qNtEw/gL8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4u/9UNxo1cskHL5EVCWGCmxiEBiLOuTbVuV0apIPHOrXK+AypxsnpNhhm9mk+Dx0HRxSjImn0Pf3MuliWtjgzmdXxCWZJ2NzGEze8Gg9OE7QeFF9c3D9OosHnFQ3Zt2T7k552N3Ua6PPHF6I1DiWwMo/pPtNUPyG4X7yKtY28I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LyqZDVQ+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LyqZDVQ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787752811; x=1819288811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/TzXwS4YF5gUqidjGf4wMNZnieUtP2YP6qNtEw/gL8I=;
  b=LyqZDVQ+CJYdS3yFvybuZQV5BaQMecgR9jvRlqNXaJ310vqgOLBBitVG
   Lb628+kvPp+/yWKvWLfpXjx7MPUQb/8wZN59XR9etxyTVDNDR9S6CFj0r
   GeZ/ueXVswa7JnASTRUQvPlIi98hPJq10/vTffn5qEKXLq4VfKVn08rza
   GLgkWKzPaXn6ykHONUk8WdVPf/Ks0miAOecjTGXCtmBEsDr4WEix0lu+v
   dY5rCKtGN1t3l4phLrs8CvCDWj6bxBRHh5FfLbIjkJHD0OvqiTFlhtPXi
   TrIOF4buybCVSo+mjMZJn6CMmjC7nGvRegG6Z5Hhmya51rrqGZ9Cx6ukA
   g==;
X-CSE-ConnectionGUID: aZ1lGm9aQdWSSoN7arv80w==
X-CSE-MsgGUID: mpn/pdsEQEGxvesHzi/2jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="90744756"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="90744756"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 07:00:06 -0700
X-CSE-ConnectionGUID: dfsx2vyhRDCF5cIeDZjYWw==
X-CSE-MsgGUID: VeOrfRlZTq6usqVghYthtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="267014274"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 07:00:04 -0700
Date: Wed, 26 Aug 2026 17:00:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 0/4] gpio: Unify the GPIO controller node check
Message-ID: <ao7xYVKgM5jW4vUf@ashevche-desk.local>
References: <20260824074427.3226457-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MejNn8NJYe6ByKig8cZHL8pq98waNfVozY9SteZYYJmHw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MejNn8NJYe6ByKig8cZHL8pq98waNfVozY9SteZYYJmHw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 26, 2026 at 05:33:23AM -0500, Bartosz Golaszewski wrote:
> On Mon, 24 Aug 2026 09:42:31 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > There are handful of drivers perform the same check in different variations
> > over and over with a potential to make subtle mistakes. Unify the check by
> > providing a new helper and convert a few users as an example.
> >
> 
> I like it. With an Ack from Linus, I can take the series through the GPIO tree.

Thanks, but note that I need to either drop or redo the patch 2/4.

-- 
With Best Regards,
Andy Shevchenko


