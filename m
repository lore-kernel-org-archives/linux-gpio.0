Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE68C226CFE;
	Tue,  9 Jun 2026 23:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781046764; cv=none; b=Je6zCI+3PSwpnLbdnw+DbOoAx6y8zAfT7ejaFjdvL5eWLJjrJb9K0ZBqasF+uHBncYPRmtZrNUxkRcV6YIFrdsSk5D8iJx/QGZkd0X8MZpFXzsFj+YT0UrJAZbT6hOn9J0uSV2E2OXYKlcnuZu4CZ5bS/Kebnb9Z4ysPdIOQvfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781046764; c=relaxed/simple;
	bh=U6D3YiKPeUTapsSxzv0/cMod4DgPieoLCzf0t5Xn31E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EbrjBW9pAL3Iz+iSQgj/sE5NNm0RPkR3zITorlB4KA0tWTL6g8pLE/uBgdOb9FHa1IxQ1zalBOlHBEO+E9/JtQc8bGY774HWTYLVEYhwYrf8dV8f60IVBD50vBkKaZXDy3ek6w/ELH8GRSQ0UfTN81cGx+PGRtA0feDh2Xc0Axs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJZUDDU1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJZUDDU1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D9981F00893;
	Tue,  9 Jun 2026 23:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781046763;
	bh=WT2nDSM3VvkE4nL2HSYCY2OqNNUomHlvN3zgAZu1Wzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EJZUDDU1LIMY76jS1Z+drjDhKoTMlELsLdfm0c9lq6236UUKdbrz5weskyi+cjI/3
	 6SOCMAhstyT9UMi1JUCIiAeZh52VNs7zi0gLOivSoTIzsqIAMqMmLlb6B8zFu3kYZ+
	 oPTj2iyxIMtjCs+/4x8KBa7OqlKYW2eIGotpj1BZW+nAYOGDV68BymrLCarrrBsQ8A
	 u2Q67Z0rEoH7Be5HSD+PiiILRbx5XQAaGA1ys3lcKhSbRA0IJ5ZV1cWNHwir0ax4vo
	 n8XXBh+fSuG/BNqF6/bInPJVuWqmHEFQDZq/RaBlIGGRS04ZRwdXiwkIeWWXLjKp9g
	 3kNRYI9GcX8cw==
Date: Tue, 9 Jun 2026 16:12:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	mohammad.rafi.shaik@oss.qualcomm.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/2] pinctrl: qcom: lpass-lpi: Switch to PM clock
 framework for runtime PM
Message-ID: <20260609231238.GA1901681@ax162>
References: <20260522204644.4101640-1-ajay.nandam@oss.qualcomm.com>
 <20260522204644.4101640-3-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522204644.4101640-3-ajay.nandam@oss.qualcomm.com>

Hi Ajay,

On Sat, May 23, 2026 at 02:16:44AM +0530, Ajay Kumar Nandam wrote:
...
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 15ced5027579..4d758fd117c4 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
...
> @@ -48,22 +49,48 @@ static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
>  	else
>  		pin_offset = LPI_TLMM_REG_OFFSET * pin;
>  
> -	return ioread32(state->tlmm_base + pin_offset + addr);
> +	return state->tlmm_base + pin_offset + addr;
> +}
> +
> +static void __lpi_gpio_read(struct lpi_pinctrl *state,
> +			    unsigned int pin, unsigned int addr, u32 *val)
> +{
> +	*val = ioread32(lpi_gpio_reg(state, pin, addr));
> +}
> +
> +static void __lpi_gpio_write(struct lpi_pinctrl *state,
> +			     unsigned int pin, unsigned int addr,
> +			     unsigned int val)
> +{
> +	iowrite32(val, lpi_gpio_reg(state, pin, addr));
> +}
> +
> +static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
> +			 unsigned int addr, u32 *val)
> +{
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(state->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	__lpi_gpio_read(state, pin, addr, val);
> +
> +	return pm_runtime_put_autosuspend(state->dev);
>  }
>  
>  static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
>  			  unsigned int addr, unsigned int val)
>  {
> -	u32 pin_offset;
> +	int ret;
>  
> -	if (state->data->flags & LPI_FLAG_USE_PREDEFINED_PIN_OFFSET)
> -		pin_offset = state->data->groups[pin].pin_offset;
> -	else
> -		pin_offset = LPI_TLMM_REG_OFFSET * pin;
> +	ret = pm_runtime_resume_and_get(state->dev);
> +	if (ret < 0)
> +		return ret;
>  
> -	iowrite32(val, state->tlmm_base + pin_offset + addr);
> +	__lpi_gpio_write(state, pin, addr, val);
>  
> -	return 0;
> +	return pm_runtime_put_autosuspend(state->dev);
>  }
>  
>  static const struct pinctrl_ops lpi_gpio_pinctrl_ops = {

After this change landed in -next as commit b719ede389d8 ("pinctrl:
qcom: lpass-lpi: Switch to PM clock framework for runtime PM"), there is
a warning that lpi_gpio_write() is completely unused, breaking the
build:

  drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:82:12: error: 'lpi_gpio_write' defined but not used [-Werror=unused-function]
     82 | static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
        |            ^~~~~~~~~~~~~~
  cc1: all warnings being treated as errors

Seems legitimate, is this intended?

  $ rg lpi_gpio_write drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
  61:static void __lpi_gpio_write(struct lpi_pinctrl *state,
  82:static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
  91:     __lpi_gpio_write(state, pin, addr, val);
  167:                            __lpi_gpio_write(pctrl, group,
  172:                            __lpi_gpio_write(pctrl, group,
  179:    __lpi_gpio_write(pctrl, pin, LPI_GPIO_CFG_REG, val);
  340:            __lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG, val);
  350:    __lpi_gpio_write(pctrl, group, LPI_GPIO_CFG_REG, val);

-- 
Cheers,
Nathan
