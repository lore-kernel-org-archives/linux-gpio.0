Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310046;
	b=vWJYbIo652yfMnaIjuT2jjICRYdj1CEtqgblmgtGp9C62Fw4fEoBJklUxg/Wyz0vGKV5
	 ldzzLDekGqXX0xsd7Tr8JgzEDF1gB4xr6w7rGuDAGqhbiV65a0IccUowwIVRiBaXs2Gus
	 DxejQnp8KarWxMFW60jN4kxfi2xwgzxaIjkUz1H/4SEdCvGDmXgo+GlxCzHC0k2jtYm5F
	 VhLU9PSafhLD8rx0znr2DbRnSPZmY1cpO1Bm68fizpZvAz2vtOAef4VLi0x6PDDSzH+wU
	 NlxE8hYvbwyjFPYnH6jHvbgkglW61rnZ6GLdzx7kAA9RQo7I/0D1bFksULsZ4XRG3Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310046;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xjKo83ruPiMjaLeqqEKk4HpjLTZGu/w/e3f8u6JIFqQ=;
	b=Uy2ZFUIyzYebOKQyJzNhjKiN4QrrTUZnwIIyjOBogyIUAsRZLMqvf1HmTk1CTrZiG2b8
	 FIncs4QKGuH7kyqL73+LitLMKpPKVsJmyN+swQ+yJ2RaB2nNbUUKZdwK8QKpry5XKFFkK
	 lXHcxJjt2peP9nbXwuAZ9LYrILRQPN8EUNQ5V7YjRZs5XE0hv+gvcVk/x0urSBSQZnE7h
	 Qjb99itfcP2sAfYcwPAYUlbxR60w5n1nos8cjaVWfoirRr35mlG78gvbsf7adVfmT6Adc
	 SXAAYxw9H5KG1o0uAmDUxr0vOEJ3N32CDQyvAPo/Vtw9mc8yHs7eJm7ZYXDSHVVTm0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o06zW7yt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 54D7A606A321;
	Tue, 10 Nov 2026 11:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o06zW7yt
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 4EFB71F0089F;
	Tue, 10 Nov 2026 11:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794310046;
	bh=xjKo83ruPiMjaLeqqEKk4HpjLTZGu/w/e3f8u6JIFqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=o06zW7ytM71hUtQAL23i85zx854dNfonKGYz0g7PnRBmPaPQ1gp1CX05A5nFuFXQm
	 plu3wYNTkE14cH0sl+LMT3OO+IrHys/DtYX3Oh09Qaqq8C8I48VBEzeBq9XEIyxlo4
	 mGWqerSjgrSHXXl/rX0AWjmjGyBWtZazfq0M9vxtZnwQma89HcuRFxxfgQQxb66MWV
	 cfdXJabkEyuomqfpMIBFt/WaMZ7bSW0PXmTddFT6/5PYo4esvq6IvvPbsutYP6FHb4
	 fmUDk6ZOJk11YGAlKhqB3TNuqK7tx4Q22J4JLfbVAnOTF8D5oHXbSDNMUw5KM5q+Ve
	 WK34RlybCOlNA==
Date: Tue, 10 Nov 2026 12:27:22 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Prasad Sodagudi <quic_psodagud@quicinc.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add qcom,remote-owned pin
 configuration support
Message-ID: <m3znhsvgj33ipd655d3nzjnx5q74kx4cn3jwoeuarov7j6mdhx@cj6qrl65ps2n>
References: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
 <20261106-egpio_fix-v1-2-569d220a4748@oss.qualcomm.com>
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
In-Reply-To: <20261106-egpio_fix-v1-2-569d220a4748@oss.qualcomm.com>

On Fri, Nov 06, 2026 at 01:29:42PM +0530, Pankaj Patil wrote:
> The eGPIO support added was incomplete since pin ownership is independent
> of the selected mux function: the eGPIO present bit only describes
> whether a pin is capable of being owned remotely, and the enable bit
> selects the owner - 1 sets the owner as APPS and 0 sets the owner as
> remote io. At present it's a mux level decision by setting the function
> as "egpio", APPS releases the ownership to remote io and in process
> cannot use it for any other function.
> 
> Add a driver specific pinconf parameter enabling the "qcom,remote-owned"
> dt property support. pinconf-generic falls back to the default value of
> 1 whenever the property carries no value, and an absent property is
> skipped entirely. Since pinconf-generic emits the mux mapping ahead of
> the config mapping, this is applied after msm_pinmux_set_mux() has
> set the pin ownership, giving the intended result for a state that
> specifies both a function and remote-owned.
> 
> The hardware programming guide(hpg) explicitly mentions that the egpio
> enable bit can be set independently of whatever the function select bits
> are set to on targets which require shared ownership while the APPS
> continues to use it as normal mux function.
> 
> msm_gpio_dbg_show_one() printed "egpio" and returned early whenever the
> enable bit was clear, which was sufficient while that state could only be
> reached by muxing to the egpio function. Ownership is no longer tied to
> the mux, so report it as a suffix on the regular line and keep the
> direction, value, mux, drive strength and bias visible. Pins muxed to the
> egpio function reach the same register state and so print the full line
> too; their mux field reflects the previously selected function.
> 
> Fixes: bebc49c1e5f6 ("pinctrl: qcom: Add egpio feature support")
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 81 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 73 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 32aa7b919e24..4d96260f9909 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -48,6 +48,31 @@ struct msm_pin_state {
>  	bool saved;
>  };
>  
> +/*
> + * Driver specific pinconf parameter to hand a pin over to its eGPIO owner
> + * without muxing the TLMM away to the virtual eGPIO function. The eGPIO
> + * present bit only describes whether a pin is capable of being owned
> + * remotely; ownership itself is independent of the selected mux function,
> + * so a pin can keep its normal function selected while being owned by the
> + * remote subsystem.
> + *
> + * The "remote-owned" property is a boolean flag: its mere presence releases
> + * the pin to the remote owner. The default value below is what makes a
> + * valueless property come out as "release", as pinconf-generic falls back to
> + * it whenever the property carries no value.
> + */
> +#define PIN_CONFIG_REMOTE_OWNED	(PIN_CONFIG_END + 1)
> +
> +static const struct pinconf_generic_params msm_gpio_bindings[] = {
> +	{ "qcom,remote-owned", PIN_CONFIG_REMOTE_OWNED, 1 },
> +};
> +
> +#ifdef CONFIG_DEBUG_FS
> +static const struct pin_config_item msm_conf_items[] = {
> +	PCONFDUMP(PIN_CONFIG_REMOTE_OWNED, "qcom,remote-owned", NULL, false),
> +};
> +#endif
> +
>  /**
>   * struct msm_pinctrl - state for a pinctrl-msm device
>   * @dev:            device handle.
> @@ -328,6 +353,10 @@ static int msm_config_reg(struct msm_pinctrl *pctrl,
>  		*bit = g->oe_bit;
>  		*mask = 1;
>  		break;
> +	case PIN_CONFIG_REMOTE_OWNED:
> +		*bit = g->egpio_enable;
> +		*mask = 1;
> +		break;
>  	default:
>  		return -ENOTSUPP;
>  	}
> @@ -424,6 +453,17 @@ static int msm_config_group_get(struct pinctrl_dev *pctldev,
>  		if (!arg)
>  			return -EINVAL;
>  		break;
> +	case PIN_CONFIG_REMOTE_OWNED:
> +		/* Pin is not eGPIO capable */
> +		if (!pctrl->soc->egpio_func || !(val & BIT(g->egpio_present)))
> +			return -ENOTSUPP;
> +
> +		/* The enable bit is cleared when the remote owns the pin */
> +		if (arg)
> +			return -EINVAL;
> +
> +		arg = 1;
> +		break;
>  	default:
>  		return -ENOTSUPP;
>  	}
> @@ -536,6 +576,29 @@ static int msm_config_group_set(struct pinctrl_dev *pctldev,
>  		case PIN_CONFIG_OUTPUT_ENABLE:
>  			arg = !!arg;
>  			break;
> +		case PIN_CONFIG_REMOTE_OWNED:
> +			if (!pctrl->soc->egpio_func)
> +				return -ENOTSUPP;
> +
> +			/*
> +			 * Ownership may only be handed over on eGPIO capable
> +			 * pins and is released by clearing the enable bit, so
> +			 * this is applied here rather than through the generic
> +			 * read-modify-write below.
> +			 */
> +			raw_spin_lock_irqsave(&pctrl->lock, flags);
> +			val = msm_readl_ctl(pctrl, g);
> +			if (!(val & BIT(g->egpio_present))) {
> +				raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> +				dev_err(pctrl->dev, "%s is not eGPIO capable\n",
> +					g->grp.name);
> +				return -ENOTSUPP;
> +			}
> +
> +			val &= ~BIT(g->egpio_enable);
> +			msm_writel_ctl(val, pctrl, g);
> +			raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> +			continue;
>  		default:
>  			dev_err(pctrl->dev, "Unsupported config parameter: %x\n",
>  				param);

Sashiko didn't spot it but eGPIO functions are now defined as
MSM_GPIO_PIN_FUNCTION() so pins configured as eGPIO can be used via GPIOLIB.

When you call:
  gpiod_get()
    msm_pinmux_request_gpio()
      msm_pinmux_set_mux()

You'll end up clamining the pin again by setting the egpio_enable bit
unconditionally.

Bart
