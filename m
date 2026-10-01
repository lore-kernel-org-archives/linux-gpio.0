Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCCF4343EC;
	Thu,  1 Oct 2026 15:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867941; cv=none; b=QJBh5dIeZReiT+YrOKLzROxTzvZmy3JdFbqE+QbzYuTTaERuf4QuNHZ0wXI2iOwBPrTwvyHDtZPC2yMYfpTdHWd5wkM/toKG7cF/q4SL2scLGhFjYNj2kf8iT4EqPnRoSpdh8gLMY7WcSzpSjn0cVGQT4E1v4arkTBjkR9jQDaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867941; c=relaxed/simple;
	bh=BzMkzUMym8TPgoF1LnaHg8Cuf3l4ZDiloWOmsCVMt8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5FFksWfRtjzC8/2wddrpe7547izkF3KQ3x2t+tHu1xHKYAuiGowM/IP3uIj8dYWd3xNid/v5Kgp9LUHGJKcXopD4K/8JN8Ev1XmFGwGPWmuzSIlFqarbNNWgeWCE8A5+mP3Qm4LnzjeQt0AvlRsuTDmAncP70OatD0LGhk3rOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nf9hoAr4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nf9hoAr4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D061F00898;
	Thu,  1 Oct 2026 15:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790867940;
	bh=dj2fkjcKjWre8m0PjjKpIC4GrIpzQCcb/+EMf4y2wRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nf9hoAr4hfb9spMcEdtX20knWP5ekP8gsDrHZBsQT37CpLX2kkfvrBfO/EFy5pMX5
	 nzzVdaJVoCT0XeHXJ1o44qbZ6zXg2wFBF4DL7d8TDKFW9NTtzMoSHq/orcdA5kNTdK
	 XlD6oh7fGF32u/UrjngipeC3eP0w9bSkQiBwo9Pf8yjuKAlePggEAgFnlZRRk9PIxn
	 gSAb4jfBm2BcaeVs2SyvHibxADAkdfbyv6B9jI1vfvM7NZCU5l9AK/H5CRWRP8AXZi
	 VQqOV06CCG1BYL4r5t+2BxC58YzaJIZcpT0QqSQudzIESQaQ3OBvFAOE4O2erE7iKY
	 xAt2jFyrzVhIw==
Date: Thu, 1 Oct 2026 16:18:56 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Alex Tran <alex.tran@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] pinctrl: scmi: Replace pinctrl ops get group info
 with generics
Message-ID: <20261001-neon-tody-of-will-67d0fa@sudeepholla>
References: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
 <20260917-scmi-pinctrl-generics-v2-2-3eeee364257f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-scmi-pinctrl-generics-v2-2-3eeee364257f@oss.qualcomm.com>

On Thu, Sep 17, 2026 at 03:55:56PM -0700, Alex Tran wrote:
> During probe, populate the pinctrl device with group info
> so that the generic callbacks can be used to fetch group
> count, name, and pins.
> 
> Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
> ---
>  drivers/pinctrl/pinctrl-scmi.c | 81 +++++++++++++++++++++++-------------------
>  1 file changed, 45 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
> index 1d85a16f300d..c93d61dfa282 100644
> --- a/drivers/pinctrl/pinctrl-scmi.c
> +++ b/drivers/pinctrl/pinctrl-scmi.c
> @@ -40,43 +40,10 @@ struct scmi_pinctrl {
>  	struct pinctrl_desc pctl_desc;
>  };
>  
> -static int pinctrl_scmi_get_groups_count(struct pinctrl_dev *pctldev)
> -{
> -	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
> -
> -	return pinctrl_ops->count_get(pmx->ph, GROUP_TYPE);
> -}
> -
> -static const char *pinctrl_scmi_get_group_name(struct pinctrl_dev *pctldev,
> -					       unsigned int selector)
> -{
> -	int ret;
> -	const char *name;
> -	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
> -
> -	ret = pinctrl_ops->name_get(pmx->ph, selector, GROUP_TYPE, &name);
> -	if (ret) {
> -		dev_err(pmx->dev, "get name failed with err %d", ret);
> -		return NULL;
> -	}
> -
> -	return name;
> -}
> -
> -static int pinctrl_scmi_get_group_pins(struct pinctrl_dev *pctldev,
> -				       unsigned int selector,
> -				       const unsigned int **pins,
> -				       unsigned int *num_pins)
> -{
> -	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
> -
> -	return pinctrl_ops->group_pins_get(pmx->ph, selector, pins, num_pins);
> -}
> -
>  static const struct pinctrl_ops pinctrl_scmi_pinctrl_ops = {
> -	.get_groups_count = pinctrl_scmi_get_groups_count,
> -	.get_group_name = pinctrl_scmi_get_group_name,
> -	.get_group_pins = pinctrl_scmi_get_group_pins,
> +	.get_groups_count = pinctrl_generic_get_group_count,
> +	.get_group_name = pinctrl_generic_get_group_name,
> +	.get_group_pins = pinctrl_generic_get_group_pins,
>  #ifdef CONFIG_OF
>  	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
>  	.dt_free_map = pinconf_generic_dt_free_map,
> @@ -460,6 +427,44 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
>  	return 0;
>  }
>  
> +static int pinctrl_scmi_get_groups(struct scmi_pinctrl *pmx)
> +{
> +	unsigned int nr_groups, nr_pins, i;
> +	const unsigned int *pins;
> +	const char *gname;
> +	int ret;
> +
> +	nr_groups = pinctrl_ops->count_get(pmx->ph, GROUP_TYPE);
> +
> +	for (i = 0; i < nr_groups; i++) {
> +		ret = pinctrl_ops->name_get(pmx->ph, i, GROUP_TYPE, &gname);
> +		if (ret)
> +			return ret;
> +
> +		ret = pinctrl_ops->group_pins_get(pmx->ph, i, &pins,
> +						  &nr_pins);
> +		if (ret)
> +			return ret;
> +
> +		if (!nr_pins)
> +			dev_warn(pmx->dev,
> +				 "Group %s contains no pins\n", gname);

I think sashiko warning on the above can be ignored as it is not true.

> +
> +		ret = pinctrl_generic_add_group(pmx->pctldev, gname, pins,
> +						nr_pins, NULL);
> +		if (ret < 0)
> +			return ret;

Similar question about use of pinctrl_generic_remove_group(), but I did
check the driver and absence of driver remove() callback is the hint I
believe and devm_* takes care of cleanup I assume. Sashiko also points
at some possible race with devm_* cleanup. I will leave that to you as
I don't fully understand how devm_* cleanup works in pinctl.

Anyways, with fix if needed or without if not required,

Acked-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep
