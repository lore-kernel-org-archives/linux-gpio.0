Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD3C3BBFD4;
	Mon, 17 Aug 2026 08:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786954410; cv=none; b=WXiY0rzflsHE6ResWH8KPXN8aXnGh7iGwGPs5N+bF1noBZ7NAqf1Mknl6mvMwimwNSsKFLTWl6y/TE2KRjkXEKG9Ia615pQ/1QWRmwiixiAtk4H+SP2xajPiW4Pya1mIEBqwqZ2ZsM82UIsyDvpghnjOk7BSYFwksF8fnSSN9fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786954410; c=relaxed/simple;
	bh=d9z8Bc9WTevwszcasPftlPaxfeObi/uieLRUU5QFH1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A78K+VIK4IKd8vbWv2HjVyQH92coB9SVhy/reyDUXh4gXy0CNWOQxsn3wn5Vh4XSlFz6QNfg9hTioeNdTK2tRzqXwmL6AhQsrEZrGNm6Dju+ejfn2cKgGjUoBYM9FQk9/YUS4Vq6pEw9aeJ72CGIhJgO46ASdROU7YjDruVHyqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uq2OUPFo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uq2OUPFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786954408; x=1818490408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d9z8Bc9WTevwszcasPftlPaxfeObi/uieLRUU5QFH1c=;
  b=Uq2OUPFogjVWZOqRGPps3uFrnlr1cm6WNT+6UtKsYKjXhLdMwfKbK0J+
   tfy9h6W8T3v8+RxGmJNuPQ9HihrYe6XmRIQmg4oQHfkNAY28Hk7Q78LNt
   AZo65ELmFM8TWRLjzY9VENyaHMbxHDuH9Y90xGUk4NNmZ5nRPii6h9tDT
   umB+RtZ/VmoJG13SNRRJm2+1f9aR34fhcaJZWShmuYv4HzyjR8B/TLpnO
   fpezWiN8jxsS4j5c8Vd/jXiUiAJfumIZ91GPeTP+OL3xwj8iBO1DlIzVk
   72lqE8xjlqS0ajXQz+hLcehgHHfXDofTGdo1E4QnGSx8TFVbcmM2YcUNc
   Q==;
X-CSE-ConnectionGUID: 8aeLYdFCS56F41j+oSUjYQ==
X-CSE-MsgGUID: 8GLR/HN9S5OSB1csrLt99A==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="104804918"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="104804918"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 01:13:27 -0700
X-CSE-ConnectionGUID: My7bCKHXQmqPI9xPUPFE1g==
X-CSE-MsgGUID: n5r16SM/TIWEBk2MgEgjrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="269118014"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 01:13:25 -0700
Date: Mon, 17 Aug 2026 11:13:23 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, James Tai <james.tai@realtek.com>,
	Tzuyi Chang <tychang@realtek.com>, CY Huang <cy.huang@realtek.com>,
	Stanley Chang <stanley_chang@realtek.com>
Subject: Re: [PATCH v3 1/7] gpio: rtd1625: Remove unnecessary blank line
Message-ID: <aoLCo8peLQpibczv@ashevche-desk.local>
References: <20260816-gpio-cleanup-v3-0-f298cdd65fca@realtek.com>
 <20260816-gpio-cleanup-v3-1-f298cdd65fca@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816-gpio-cleanup-v3-1-f298cdd65fca@realtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Aug 16, 2026 at 11:17:30PM +0800, Yu-Chun Lin wrote:
> Remove an unnecessary blank line in rtd1625_gpio_setup_irq() to clean up
> the coding style.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


