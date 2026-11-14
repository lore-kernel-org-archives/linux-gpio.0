Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650285;
	b=OtGziNqcTe69iO5ozCs/PJ7JzkTVT63EJ6+5ITP8uO/SCAB9AXZBa+wRFmS5Ex4X2HyE
	 4OH65MVIQ5xcBR6AgDc+kMsWT4dxp9k49N06fyazcV39z0uNu+e6BzU1YVAT7xyN3cDeB
	 ot2MVgJUyNnoz0UDH5b5GgqDvwIDbg+0kqY1MDmSYzO+kD9eh6uS1TZWWaKfIt2AhKTuH
	 gvJhNrtVzU2cfxb7GxyMDnSdFTMOv74s8dis25wKtENIQcY+WQRISjdYfU0V0RPo/oJ6o
	 FzLB9JqTftn3ToNdXySGrV+ohjVZZu5H13xvUtbyhN5Qo0E7PoCuzQbBEBBhsF2v96Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650285;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=1aAu2p5q+46k4xT0nfJKDCSVnUNtpAw2+j4NQOXi/aU=;
	b=yCECD5Rc+JLGHl8GeM1G9Rh3LhxgQeQC3SWq2hDx8uQiGfIYVJqsdOid0FkqH2GrHjHY
	 sKmlMIudhhEP3PBcbp9Mnfn7w+oVgKrgfA43LdcJGm3a5pmU1WGMz6WyAY9DH8CcWyOd3
	 LqOzgOWdnNvfb124/kQKY570C8rHV049S6P/CARbc0tiyL9+SUVTzVRntzQEkCTZ6chvm
	 1A84fTNxg+jyLs6agBsdGOXjmKnawW0KiGnqv29JHX6nta2TQ3z48a4iSU07+o8SIVkTj
	 2g5dpvqtE+W3CYaBkNfxqU8r0IANeaAD2S3Grdd/tXGDk2Y/8HVd470EQYSpfOs24Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q0hfoM5a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFFD606A327;
	Sat, 14 Nov 2026 09:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q0hfoM5a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09DB1F000C4;
	Sat, 14 Nov 2026 09:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794650285;
	bh=1aAu2p5q+46k4xT0nfJKDCSVnUNtpAw2+j4NQOXi/aU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Q0hfoM5aikZN44ro7I4hnoYExts32CDZbuGMBnIhCaHhrl990JWcBKEh9QFaxRyf5
	 yjiMrWzO7sz9jEgbFIwNHvrhA7JUFXV3nMl9yu+nK5D9We6jpY+EEBqTyWtIetEA6T
	 kx0XghcDNQ3Ft1dgE8yrxi2z3W+Wnf6ZDVME6BSiWmYcl63CJfq2aTcbFJY/SCI4hU
	 JpwonnmWW9/d22xtCdbe+oG2u7LheAXYxZQr4nr8eIEfSCqRevKU6Wi9BGmuoSnD/O
	 w/xlbNWWUGIOKKwOejCBmgbC1SkEz+4hXpqt7Dc8brSGT3wi0qSsnt7vkrEKKXPTxk
	 zk0mZX5OkUfmw==
Message-ID: <d0f781bf-a325-4eee-9431-7eb387279934@kernel.org>
Date: Sat, 14 Nov 2026 10:57:55 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] soc: fsl: guts: add the RCW override of any RCWSR
To: vjardin@free.fr, Dong Aisheng <aisheng.dong@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>
References: <20261114-for-upstream-lx2160a-rcw-pinmux-v1-v4-0-eefcea066a55@free.fr>
 <20261114-for-upstream-lx2160a-rcw-pinmux-v1-v4-3-eefcea066a55@free.fr>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20261114-for-upstream-lx2160a-rcw-pinmux-v1-v4-3-eefcea066a55@free.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 14/11/2026 à 10:12, Vincent Jardin via B4 Relay a écrit :
> From: Vincent Jardin <vjardin@free.fr>
> 
> fsl_guts_rcw_rmw() only serves the SerDes lane modes. Export it for
> other fields of the RCW:
>   - fsl_guts_rcw_read() reads a status register
>   - fsl_guts_rcw_override() changes fields of one under rcwcr_lock and
>     waits for the status register to follow
>   - fsl_guts_rcw_override_supported() tells whether the DCSR view of DCFG,
>     which holds the override registers, is mapped
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Acked-by: Frank Li <Frank.li@nxp.com>
> Signed-off-by: Vincent Jardin <vjardin@free.fr>


Acked-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>



> ---
>   drivers/soc/fsl/guts.c   | 73 ++++++++++++++++++++++++++++++++++++++++++++++++
>   include/linux/fsl/guts.h |  3 ++
>   2 files changed, 76 insertions(+)
> 
> diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
> index 28361c63e26c..d2e3f66d0da4 100644
> --- a/drivers/soc/fsl/guts.c
> +++ b/drivers/soc/fsl/guts.c
> @@ -369,6 +369,79 @@ int fsl_guts_lane_set_mode(int serdes_idx, int lane, enum lynx_lane_mode lane_mo
>   }
>   EXPORT_SYMBOL_NS_GPL(fsl_guts_lane_set_mode, "FSL_GUTS");
>   
> +/**
> + * fsl_guts_rcw_read() - read a RCW status register
> + * @index: one-based index, RCWSR1 to RCWSR32
> + * @val: the value read
> + *
> + * Return: 0 on success, -ENODEV before the DCFG block is mapped,
> + * -EINVAL when @index is not 1 to 32
> + */
> +int fsl_guts_rcw_read(unsigned int index, u32 *val)
> +{
> +	if (!soc.dcfg_ccsr)
> +		return -ENODEV;
> +	if (index < 1 || index > ARRAY_SIZE(soc.dcfg_ccsr->rcwsr))
> +		return -EINVAL;
> +
> +	*val = fsl_guts_read(&soc.dcfg_ccsr->rcwsr[index - 1]);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(fsl_guts_rcw_read, "FSL_GUTS");
> +
> +/**
> + * fsl_guts_rcw_override() - override fields of a RCW
> + * @index: one-based index of the RCWSR and RCWCR pair
> + * @val: the new value of the fields, in place
> + * @mask: the fields to change
> + *
> + * The fields outside @mask keep the value the status register shows. The
> + * override register is written and the status register polled until it
> + * shows the result, as fsl_guts_lane_set_mode() does for a SerDes lane.
> + *
> + * Context: takes rcwcr_lock, shared with fsl_guts_lane_set_mode(), and
> + * busy-polls the status register for up to RCW_TIMEOUT_US. Does not
> + * sleep; must not be called from interrupt context.
> + *
> + * Return: 0 on success, -EOPNOTSUPP without a DCSR mapping of DCFG,
> + * negative error otherwise
> + */
> +int fsl_guts_rcw_override(unsigned int index, u32 val, u32 mask)
> +{
> +	int err;
> +
> +	if (!soc.dcfg_ccsr)
> +		return -ENODEV;
> +	if (!soc.dcfg_dcsr)
> +		return -EOPNOTSUPP;
> +	if (index < 1 || index > ARRAY_SIZE(soc.dcfg_ccsr->rcwsr))
> +		return -EINVAL;
> +
> +	spin_lock(&soc.rcwcr_lock);
> +	err = fsl_guts_rcw_rmw(index - 1, val & mask, mask);
> +	spin_unlock(&soc.rcwcr_lock);
> +	if (err)
> +		pr_err("RCW override of RCWSR%u failed: %pe\n", index,
> +		       ERR_PTR(err));
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_NS_GPL(fsl_guts_rcw_override, "FSL_GUTS");
> +
> +/**
> + * fsl_guts_rcw_override_supported() - can a Reset Configuration Word be
> + *				       overridden?
> + *
> + * Return: true when the DCFG block is mapped with its DCSR view, the
> + * second reg of the dcfg node, which holds the override registers
> + */
> +bool fsl_guts_rcw_override_supported(void)
> +{
> +	return soc.dcfg_ccsr && soc.dcfg_dcsr;
> +}
> +EXPORT_SYMBOL_NS_GPL(fsl_guts_rcw_override_supported, "FSL_GUTS");
> +
>   static u64 fsl_guts_get_soc_uid(const char *compat, unsigned int offset)
>   {
>   	struct device_node *np;
> diff --git a/include/linux/fsl/guts.h b/include/linux/fsl/guts.h
> index 8d5ffb985fee..7127de897c23 100644
> --- a/include/linux/fsl/guts.h
> +++ b/include/linux/fsl/guts.h
> @@ -142,6 +142,9 @@ int fsl_guts_lane_validate(int serdes_idx, int lane,
>   			   enum lynx_lane_mode lane_mode);
>   int fsl_guts_lane_set_mode(int serdes_idx, int lane,
>   			   enum lynx_lane_mode lane_mode);
> +int fsl_guts_rcw_read(unsigned int index, u32 *val);
> +int fsl_guts_rcw_override(unsigned int index, u32 val, u32 mask);
> +bool fsl_guts_rcw_override_supported(void);
>   
>   /* Alternate function signal multiplex control */
>   #define MPC85xx_PMUXCR_QE(x) (0x8000 >> (x))
> 

