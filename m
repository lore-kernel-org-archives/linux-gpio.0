Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D66EEBB;
	Thu, 19 Feb 2026 07:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771487216; cv=none; b=BSl9M+SF8pz1lseY2KwtAOHSKd2epyggOHQNcbiGhCXF1w4ZHeXOdztpnt8OakQZg3xAnC8xGeRN/xIcz7f4jhcKsw4atv8zV6TRJUbYBZr+nDMuUMXPyymNUo6yE3l2UoxWwvUCZrr8M3LuG+NgMXIRWy5G8tGA/KgH3p2CVVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771487216; c=relaxed/simple;
	bh=GN0vD6kXUPQhEvdSXRBsJGrvuMdhWoSPUvlIU/CAGL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+NSkszwfxfO6LCoRN7RB7L1W/+B8z+RzrzyZaRA7oocyuD6U2oxY/nyBP7CG8KXzb3311AD7XdB+nQHzDHsaD4tqRaX5tL+BtgsKGkaX++OJJEizRdMKxkOJ0/5cjA94SYNlJNRdbp7TFi7SB3uL9duZhywF4PP2b9awLb5eW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ElQ8vLAw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ElQ8vLAw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771487214; x=1803023214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GN0vD6kXUPQhEvdSXRBsJGrvuMdhWoSPUvlIU/CAGL0=;
  b=ElQ8vLAwfh4994C+1xv7UmDrYjjUJt9D4jyodA2CbEfPfvzv0+cDdDJ8
   HAFvxuw8bmKBV6zcIhReAEAr4wfX5E9k6/kHfRtdxBYCrkqHCFdcOe2mm
   87d4qTskSc7qPkavgKsnp1Zt4Fdm2gLacAn/S5Qg95pOOCBUq9aOF3Js3
   Nq7pdK2eZVVZSTCdG2KKiUcJjVXeX+cExOQeU/1xpja+SEGbeiOKJKg+Z
   xTjZ6ODP/PcUESlZd0igxKk9fEOgw8H+H/ltd2ms7/QJgy8S56JZl21K/
   IAhY9+QDPpnWDRl3t+yskwDCbxDwg4FAg1Ekg5OC4I6Q3hxTqTGQ9CH9g
   w==;
X-CSE-ConnectionGUID: mbj8K3CES2CZM20Y24IQ2Q==
X-CSE-MsgGUID: WoKpJLMcSISmUocZMVnkIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="90149289"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="90149289"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 23:46:53 -0800
X-CSE-ConnectionGUID: jp/7FrT3RZavL4VbAp/KuQ==
X-CSE-MsgGUID: FCkcQscLSLeA13VQHis97A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="219443701"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.114])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 23:46:51 -0800
Date: Thu, 19 Feb 2026 09:46:48 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: renesas: rza1: normalize return value of
 gpio_get
Message-ID: <aZa_6LWSgM0Y6_2P@smile.fi.intel.com>
References: <aZYnyl-Nf4S1U2yj@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZYnyl-Nf4S1U2yj@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Feb 18, 2026 at 12:58:09PM -0800, Dmitry Torokhov wrote:
> The GPIO get callback is expected to return 0 or 1 (or a negative error
> code). Ensure that the value returned by rza1_gpio_get() is normalized
> to the [0, 1] range.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


