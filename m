Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318572;
	b=W6zEpbV1kJjH8+2YyBc3YPFoXWHPhnA/B9DhNDr98q0JOJSBWlE6PUdqqqMyqFKQpCEV
	 tP02pV5VRaZCoyRWg9/Jy3vxSad8Nv8HRC+dENavnx4iX+ptKhx0wGo+DJ+AtRsywvY7y
	 OtGaTAXe2k/F+hgdHrvl5X3dF7k48yB2tM+qTAjL3ZbSJq5fulZlea9IWH5drYWRZLVu1
	 hZjvWv9u8cm38G+tbF3L8ii9q+ND77ZX5E2tNEHo6qfzsGpl5uag6FgG9HuvFQ7B7vBLv
	 JXEBbZE2aeb46pdHZeq12JfKb2nPCSi3BfiAH9FMLU3B6rZZ7uLrvVRnAKV96cnCRNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318572;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=Rte+nFjJfCpN04ZQkjjif+xK/XpIBzJx/BQcSctTM9k=;
	b=UVN1yp1SLkAMdnNxDfe++6CThSd1J32HPP/n3DwjDD2hy/jKz08V7pH+DHbWtblBKVvC
	 w+Q5ofxpuUC9CgTFLdq2dMv9qWm13Z5QeoiuQwLYiHMbebQEIV/NxOcpjUIq0cCVZ37UQ
	 /5GTzpjsiTL3PNuEqnFTti9rPPU9oJeD7Xy+semZclP2OpAtIoy2/wST8ogbpxxVu6RFG
	 sXhKcFOdbswF9rBNyIf17OnNoaDa1czlkWz33RFmeSSBL1huxnCHLby5mXY8e5YhRBk7b
	 kCSCXJOUWlqBMuaV+1lAnuqac/ZeDdv4iwowYfolmC35bxqFLDsOQKBuzMejhtspdbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=M7r9xLlF;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7AF606A31C;
	Tue, 10 Nov 2026 13:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D7AF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=M7r9xLlF
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20F1C1477;
	Tue, 10 Nov 2026 05:49:27 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 353973F632;
	Tue, 10 Nov 2026 05:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794318570; bh=hYzeZBtVBVDXCHttXoGztstvHvPFY7lN52/cdyn0Zr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M7r9xLlFeYK9RYXoymnR5xbY1504ntzT5LN8cIeeXIgXL7Xcq5lR7JwMvOMEIiJjM
	 0NOQsrhoEejZso/105nnOcn9IBTS4yVgFxBKiIp0L+ABb8dyCAf6tpi+NzaNtCOxbX
	 ovxXTmqBujnIKaBPS7kGPeKc09iRcAGySN6wXaaw=
Date: Tue, 10 Nov 2026 13:49:25 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
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
Message-ID: <avMg5XmU8uSzPR4s@pluto>
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

On Fri, Oct 30, 2026 at 04:58:42PM +0100, Clément Le Goffic wrote:
> On a GPIO request, select the GPIO function of the pin, on the pin for a
> pin-only function or on its single-pin group. Without a GPIO function the
> mux is left as it is.
> 
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---
>  drivers/pinctrl/pinctrl-scmi.c | 64 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
> index 6f44e8c0fee6..ba649304638e 100644
> --- a/drivers/pinctrl/pinctrl-scmi.c
> +++ b/drivers/pinctrl/pinctrl-scmi.c
> @@ -74,6 +74,69 @@ static int pinctrl_scmi_free(struct pinctrl_dev *pctldev, unsigned int offset)
>  	return pinctrl_ops->pin_free(pmx->ph, offset);
>  }
>  
> +static int pinctrl_scmi_gpio_mux_set(struct scmi_pinctrl *pmx, unsigned int pin)
> +{
> +	const unsigned int *elems, *pins;
> +	unsigned int nr_elems, nr_pins, i;
> +	bool pin_only, gpio;
> +	int nr_functions, func, ret;

Beside nr_functions, cannot all of these variable definitions be moved
inside the scope in which they are exclusively used, i.e. down inside
the for-loop ?

> +
> +	nr_functions = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
> +	for (func = 0; func < nr_functions; func++) {
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
> +
> +		for (i = 0; i < nr_elems; i++) {
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

So it is a possibility that in the above loops nothing is set..and it is
fine should AFAIU...but should we log/debug something in both cases to ease
troubleshooting ? (maybe just a stupid question ...)

Thanks,
Cristian

