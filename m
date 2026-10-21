Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603649;
	b=zxXui1EdFAs+UIKE0LHSuRoq0tgxTnS7GsSqk+PNuPJlmVIiYHk/CesFHQCtOwXeGThj
	 suJ61t+jKxiAMqTvEsrDZY6gix7IPUmjCTXYN7WYquj5TgqI5rPHf974Je8yhmGMMmYm9
	 7JU7dfppXY5EJmhXjRGraS74zaueu/L+25dNQyEwPnBgtD/CH7ugPG73lzJgKBj4goc23
	 azacL69PGN6+be1jLoTY6/HRmBjIc4Bxg11ia5ePWbivyXF33GcBc47azeKXEQeo9fKQd
	 Q99u+phcFOc6hZrclEErV78xkxw10mNe2WyYQFBHgBquM8UqvqcjJ1cKbU++Q0cHipg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603649;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=YB5yQqRd5W36BK9HMhW5ML/kvdBxgZ9LdSmIEm0cRT0=;
	b=WuZ1Y5vbV2Bhsa40pE/e68DQyWrxoHtw/rzXgxpJB9CvmvzQQgwcca4HLcQmALOy8kvP
	 VTh2izt5VvnRgnoBwm2wEU7m9YtR8YR1Yz4r9LISEMJaaB/+SPaSWXyS8s2KQan5HT4Nu
	 D8KTZe1Q5mEHfoPTl0lVUKWG9LbSSq5CewJ3ytBHtmhQ6vKBdCdy/H8OPNkdncNHW+eV2
	 v22sZEpuXPuaBuvyx1z696VuFE9ijkUYCt7aBRs7HG20RbAeuZqmoJ+S/RCaxPrHrQyv5
	 7qbMW0GsjLFqW7RaW3w3yHuoIi34EGUdiBAlT0IrYA0lRH0LS1ArKCAhNIjMMt75oGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l72kTAxN;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE7E606A31B;
	Wed, 21 Oct 2026 17:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FE7E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l72kTAxN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792603649; x=1824139649;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d96yl160fsvZqmtq2GUgRGHWBGTzWfYJwPm1PGSVih4=;
  b=l72kTAxNVb7wp1QMku00RL4xXlSbe50MrzT9ZH7cofsPHqO/Gc8h366j
   L+cEw+suGaq0N3YGJivtv+GQ+SnBhKivAR7mcrCdOXRON9pO8nEUucurY
   IIk1B/AULyfZufb0W7c3m7Qd5sNssXVCBA9mWpcZfSEYQsCXRV9kvV11c
   IgB2JJpXrHwO5R9YHyjY7SfOZctgC0S5IY8WMEALIBQTFM4Bx+CxzPMQn
   1EmGxkbtBGIyeb9DjFRS3ulEbhEU9L6oTmNv5sCSat7E9/N4Bv/4PS+t+
   dsW2FQVvx82OqOscDQwcFf/2sjP4Pq3up+W6Urxtj0X3h5y+znm+qq0NY
   g==;
X-CSE-ConnectionGUID: fv+tpsqLQ/ic4pZcxF/f7g==
X-CSE-MsgGUID: TPp9yymjS1K4OkM29psYGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1345505"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1345505"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 10:27:29 -0700
X-CSE-ConnectionGUID: f0yVNm/pS/mxDQ4v+rWsTg==
X-CSE-MsgGUID: w+93Z9l2SlmzmJoHjgZ9FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3071817"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 10:27:25 -0700
Date: Wed, 21 Oct 2026 20:27:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: longzhao@ambarella.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 7/9] gpio: pl061: keep the parent device in a local
Message-ID: <atj1-0OckTqIktsY@ashevche-desk.local>
References: <20261020-cv75-gpio-v11-0-e058bae19571@ambarella.com>
 <20261020-cv75-gpio-v11-7-e058bae19571@ambarella.com>
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
In-Reply-To: <20261020-cv75-gpio-v11-7-e058bae19571@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 20, 2026 at 03:54:11PM +0800, Long Zhao via B4 Relay wrote:

> IRQ logging uses gc->parent. Keep that device in a local so the
> gpio-regmap switch can change where it comes from without rewriting
> every log line.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Also see some side notes (for the future development) below.

...

>  	if ((trigger & IRQ_TYPE_LEVEL_MASK) && (trigger & IRQ_TYPE_EDGE_BOTH)) {
> -		dev_err(gc->parent,
> +		dev_err(parent,
>  			"trying to configure line %d for both level and edge "
>  			"detection, choose one!\n",

It's better to join string literals as one might grep by the say 'and edge
detection' phrase and won't find any match in the code. This can be done
for all messages in the driver in a single, but separate, patch (I haven't
checked how many of the messages like this here, though).

>  			offset);

...

> -		dev_dbg(gc->parent, "line %d: IRQ on %s level\n",
> +		dev_dbg(parent, "line %d: IRQ on %s level\n",
>  			offset,
>  			polarity ? "HIGH" : "LOW");

Since it's debug message, we may use str_high_low() from string_choices.h.

...

> -		dev_dbg(gc->parent, "line %d: IRQ on %s edge\n",
> +		dev_dbg(parent, "line %d: IRQ on %s edge\n",
>  			offset,
>  			rising ? "RISING" : "FALLING");

IIRC there was a patch in mailing list to add str_rising_falling(). But for now
I don't see it in the upstream.

-- 
With Best Regards,
Andy Shevchenko


