Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0084735294E;
	Mon, 20 Jul 2026 06:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784528320; cv=none; b=nLQPYGxIQR7eu4ivTfBEji7jqCOHlyDpHC3HlJz2SSYhc4RdQVz/4UA+fnmdlEkwbfgvQ+XOqAy7fuztiM1486auyhNrTWm0HEw321TnC3Ps2VxGKpsF/aryEhAEXGeMO//EMWRknQmdP5SQuufXCRItxS6Oe/qaeDsylvyxlw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784528320; c=relaxed/simple;
	bh=SyY5MMWvfkKKzVR7hAKCXBZrRp2fW/zSriY8mKjAqtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sT8vApo3E8Q5T57N4KZ9poT3Gm5daTHf+pf6qANbMYUCWvxQkDLMTOKYiiVNuU+3VBwqXNc71fLwmwl2OHID7huECfl5nmwpgEtEX4sfbq1MvQB4rdx+yfDd4E2Zc9bW7iy2dgOgQdG5xtXrA1SzVFEzMEIDlaQtA1ZoNEcIkKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ep1VKK8X; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ep1VKK8X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784528316; x=1816064316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SyY5MMWvfkKKzVR7hAKCXBZrRp2fW/zSriY8mKjAqtw=;
  b=ep1VKK8XzYdF7fan35ERPANI4nCp7CYN1UEGXhFx93CyIybsN9WzMrL3
   hWvtAcsphp8GrkdGt2lJaR4MLASayqYdfqIz9oAp0JDxZpdyK42z+ijYF
   0D7LnfbwfwjHz9xZKSkKwLquy6y/fb3YY4VZ/1AfCM3Qhk/UZGCLnyfCM
   ldcaBM4jLwRY7zNnRXjK2S8n4MzVkw+fSpDC7l1tBmrwvdsA6KtW8CIaD
   JzJnpFHhfvM3utK7rk6lDa+wJ6c2Y6gJDkLqPnRn4JHxvh4k1H6QXJe7i
   PSJVf9QbbmOuImFWXDR+L8w/cxvuQikwoAJUD28RlxTKm/CFS59Eweyhi
   g==;
X-CSE-ConnectionGUID: A4YfMBZkRTWFCfp7qSdQ2g==
X-CSE-MsgGUID: odQKzCGzRSOThuGeSjq+sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="84868893"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="84868893"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 23:18:34 -0700
X-CSE-ConnectionGUID: w5ykp9PfRP2aNedjHNYZAQ==
X-CSE-MsgGUID: JGhfZceJQD6Iop8UcijvoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="257430331"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.94])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 23:18:33 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E438C121C02;
	Mon, 20 Jul 2026 09:18:34 +0300 (EEST)
Date: Mon, 20 Jul 2026 09:18:34 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: David Lee <david.lee@trailofbits.com>
Cc: Lixu Zhang <lixu.zhang@intel.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dominik 'Disconnect3d' Czarnota <dominik.czarnota@trailofbits.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: ljca: validate event payload length
Message-ID: <al29uoy9knSpEuNU@kekkonen.localdomain>
References: <20260720054906.69588-1-david.lee@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720054906.69588-1-david.lee@trailofbits.com>

Hi David,

Thanks for the patch.

On Mon, Jul 20, 2026 at 05:49:05AM +0000, David Lee wrote:
> ljca_gpio_event_cb() ignores the event length and trusts packet->num as
> the number of two-byte GPIO records. A device can provide a complete USB
> message whose nested count extends beyond the payload, making the callback
> read beyond the receive allocation.
> 
> Require the payload to contain both the count byte and every record it
> declares before iterating over the flexible array.
> 
> Fixes: c5a4b6fd31e8 ("gpio: Add support for Intel LJCA USB GPIO driver")
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: David Lee <david.lee@trailofbits.com>
> ---
>  drivers/gpio/gpio-ljca.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
> index f32d1d237795..cb2b2623ccb1 100644
> --- a/drivers/gpio/gpio-ljca.c
> +++ b/drivers/gpio/gpio-ljca.c
> @@ -290,6 +290,9 @@ static void ljca_gpio_event_cb(void *context, u8 cmd, const void *evt_data,
>  
>  	if (cmd != LJCA_GPIO_INT_EVENT)
>  		return;
> +	if (len < sizeof(*packet) ||
> +	    struct_size(packet, item, packet->num) > len)
> +		return;

I think this case would require a warning message, maybe using
dev_warn_once().

>  
>  	for (i = 0; i < packet->num; i++) {
>  		generic_handle_domain_irq(ljca_gpio->gc.irq.domain,

-- 
Regards,

Sakari Ailus
