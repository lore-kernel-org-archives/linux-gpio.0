Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794178;
	b=IaG6w922YCukR+l4cq5zWol4uhq0GHbuM3v1QuBdtxvHcr+z5M94ffu//WUb+AT0r18z
	 C0f9S3p+D9elJ7s3daXT8qIO6XyF6w9Ae8v2FVE9/C0h0sW0IvwMLX3FaA0OJ6c4kGjWc
	 H8GELZXgz/w3o9rHVZ/r2ly7BCrnU6SuSQK9LKm1ceFBLey8vcPUXWwLWYUih/UoB/L9q
	 y9k4Mq7clcb9GI9qTwnyIj29GFweYz2R0XEwnYT68JULtQDKQNNWvoAl7GUBcxjsGp5Zi
	 AJYR9PqnnRyO0fVbk1kj8rwUeAPRNONqZbVV1owWo5ASiIsYVuDj7xuJ065TxZKI3NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794178;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=v3edpI7roRPBRuWKTQHxJcaURUUagWWoc6hZuYQDLzo=;
	b=WS846DpdEmxL7dMfXvJlUBgJO4fm309tyjUZa9UIO1PcpN4AMgSMBZaTWqNXPl2rbAY+
	 P7Zy/BDqpgQ9PknrWDQrkeWrI5nkf9UTf5L2BtDy7fVcdNMmRDZJUFu/QmWxFhwOodoTX
	 wy///ePg71L8VDY+aeQfk3+WDTjwNQ3ThlKRsa6AdGmyB/yvu38x4u1/yIKsZLN0Lsz/b
	 6z5mw69DC/d/izxAgsNZkyclZ/Z6pRea5vz8EDhhP4ToJevqEP8HaqOKI1hIVnpeMKSYU
	 Eh5gGOGmqtTSnvcjowT5ABufw38ZPmys6hzDzyFxliNar4UEVEvDZyq6+OlCp9nxyRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hwfHCe9u;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B425606A329;
	Wed,  4 Nov 2026 12:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B425606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hwfHCe9u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793794177; x=1825330177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7ZW3EZJmMMMMeXrE0s3+ZOpdnGH6jd7hmKlWQRl3phM=;
  b=hwfHCe9uuTRro+VhtK63nuvyCQJA0kPqmaAv0freKcJwlRl5oB0P/58V
   7l8CxsaNjDr6E52vLUnZe1URcMeoS1I2s5818T9XCaKjiFRJRdaTNMbEH
   i/G3hGW+V7RWLLAlsa/8L+Q6as04Poa8BOc0lgKcWPcK5h3/im1r5L5Yn
   Hxb/HlnKnv27Byy05tVvnNdpB1pCLPIBcE0COqf3lIJZqKt/Xd8bYQkyO
   vk1vy0H8z2157dm5ZFtdHTnz7jyCsWyISvFf78VwNA4YHjM9wdQnjYz1z
   ehn1uRkmSHNCujPK6/7T6m2uR67j0nAqRZ6OTtT7Rjv/iFqISPWuCFsii
   g==;
X-CSE-ConnectionGUID: /oFpNmO9S2Sr2S4ahjzicQ==
X-CSE-MsgGUID: AMLxJ727QTGT0z3DA+xPBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2580814"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2580814"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:09:36 -0800
X-CSE-ConnectionGUID: 1kfSpOpESMCbIs/yOKpJgg==
X-CSE-MsgGUID: bDLhA6o4Qvq2k41VswqLmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6864559"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:09:35 -0800
Date: Wed, 4 Nov 2026 14:09:32 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] gpiolib: fix fast-path cancellation in
 gpiod_get_array()
Message-ID: <ausgfFandlNVa2pJ@ashevche-desk.local>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
 <20261103-b4-gpiolib-free-v2-2-ea46767c9cf8@gmail.com>
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
In-Reply-To: <20261103-b4-gpiolib-free-v2-2-ea46767c9cf8@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 03, 2026 at 07:40:30PM -0800, Dmitry Torokhov wrote:
> In gpiod_get_array(), when a pin on the same chip is not in hardware
> order and the preceding pins form a contiguous block, the fast path is
> cancelled by setting array_info to NULL. However, descs->info was
> already populated with the array_info pointer during the first
> iteration, leaving descs->info pointing to the aborted array_info.
> Consequently, subsequent array operations still use the fast path with
> remaining bits set in the masks and wrong hardware pin numbers.
> 
> Clear descs->info alongside array_info when cancelling the fast path so
> callers do not erroneously use the aborted array_info.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


