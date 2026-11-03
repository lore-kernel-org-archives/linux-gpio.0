Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706077;
	b=MEgi1iIbNCXrc824UfvH7B1EtekkSRWG3SIT+M0aNhOTM6n6jaSwcsOojK0Znvf1VNil
	 GyFvmnEsECxzIPzbkFAnBVQLSOV/9g6mptl8QI5nPC7TK36qU2vYf1p45N5GTyoSVjEW5
	 NEosm3sJ5auMSVfuI0EcRPUIXSvs6byOs2D1Z+Qc0ImW2iEJFCgVel8WZySEk4eLslFO1
	 ASANhostTDp4PeCdd7fgj4ZSZsQeLANeHJ4Hb0du7yN3yLbIMdFswXVs4Z+QnyBh/KrDC
	 pjNFglLBRG+SyPnoFRhE7NoOyZg+VURy3knv6PSx0wkOwRDh+CZ+ec7O3Lkj84JAl5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706077;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=9rRrksSImQxjgaCoOlcavqaTwPlSKHx5ylc9VpIQuFM=;
	b=u5+73NC2we4F61WNSyiaN6qzLnsWuDFRsCbnvEMgyHehnpTHXA1RPrjJgZl6xpQaORK/
	 pMEWMMI9pcPlCegraEMfO2YDu/NjdQn3pasWjN2bVm17b/TAQgJvHYRug5mxyf2NlkkjY
	 C01eZDoj9PvCfgUHYZewk0vvuC0HiqFASSVd9GvXWsWynBeYTdoI+DajwqpITunkHCNea
	 T/cOrAGu5DsZVnDnO7OUecCrn62sGvHhQoJnuqNtUA5wOfunUwSUNbGyMqYhjrI7WBe7u
	 FWA+tanQVzit4iRHputV68OU76mjb95r1YVXlRggsJFaJFxBk8risFXSPTiqS0whOOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mKtc8SeN;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91755606D808;
	Tue,  3 Nov 2026 11:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91755606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mKtc8SeN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793706076; x=1825242076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IeFn5a9AdmVeg5IHSIJsjnU24bAycCXoaf0T4GZLG24=;
  b=mKtc8SeN1kckuZ657maHu/eJWVsvvJfX1FhxKlJfGLhkjZLbIfyah4r1
   FPWUzBt9mAStqZsXJrduLbvFEbH+xgvKo/aecDCfUUEdSnMN0bsHlVgaR
   NXGPLTHMoGuhtjcF5kgr5aOX6ke3r6iNHGtv3WZxAPEjr53cftgWUJTve
   KG6cxBJ8FJd/mStJYyawAIc1kpvG4hlgiSPo0aSCCbVsb0Ba2ymxF8mX1
   jVPTkronchPr4rO7HXtDCRSnwJbeeb08EvjdLWTBJShwp5zPDEiV/qfLt
   xi7EoFE/zIBSGu2mMlCoAG+6YlPeTzgUE/3XENjWRELVvrlDzfiX2R+uI
   Q==;
X-CSE-ConnectionGUID: 0O8WqsaGRheervORtvnxrw==
X-CSE-MsgGUID: PYoJ5x+DSI23O/gDkMoUpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2303563"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2303563"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:41:15 -0800
X-CSE-ConnectionGUID: DnQ4jqYmSHq02PTVWlnnGg==
X-CSE-MsgGUID: QMBqbzCZR0yjZh8s7mqmyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6308191"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:41:11 -0800
Date: Tue, 3 Nov 2026 13:41:09 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/11] pinctrl: scmi: select the GPIO function on GPIO
 requests
Message-ID: <aunIVW4JeM_P2WOa@ashevche-desk.local>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-11-52d92843ad97@baylibre.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-11-52d92843ad97@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 30, 2026 at 04:58:42PM +0100, Clément Le Goffic wrote:
> On a GPIO request, select the GPIO function of the pin, on the pin for a
> pin-only function or on its single-pin group. Without a GPIO function the
> mux is left as it is.

...

> +static int pinctrl_scmi_gpio_mux_set(struct scmi_pinctrl *pmx, unsigned int pin)
> +{
> +	const unsigned int *elems, *pins;
> +	unsigned int nr_elems, nr_pins, i;
> +	bool pin_only, gpio;
> +	int nr_functions, func, ret;
> +
> +	nr_functions = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);

Is nr_functions signed for a purpose? Can it hold an error code?

> +	for (func = 0; func < nr_functions; func++) {

	for (int func = 0; func < nr_functions; func++) {

> +		ret = pinctrl_ops->function_flags_get(pmx->ph, func, &pin_only,
> +						      &gpio);
> +		if (ret)
> +			return ret;
> +
> +		if (!gpio)
> +			continue;
> +
> +		ret = pinctrl_ops->function_groups_get(pmx->ph, func, &nr_elems,
> +						       &elems);
> +		if (ret)
> +			return ret;

> +		for (i = 0; i < nr_elems; i++) {

		for (unsigned int i = 0; i < nr_elems; i++) {

> +			if (pin_only) {
> +				if (elems[i] != pin)
> +					continue;
> +
> +				return pinctrl_ops->pin_mux_set(pmx->ph, func,
> +								pin);
> +			}
> +
> +			ret = pinctrl_ops->group_pins_get(pmx->ph, elems[i],
> +							  &pins, &nr_pins);
> +			if (ret)
> +				return ret;
> +
> +			if (nr_pins == 1 && pins[0] == pin)
> +				return pinctrl_ops->mux_set(pmx->ph, func,
> +							    elems[i]);
> +		}
> +	}
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko


