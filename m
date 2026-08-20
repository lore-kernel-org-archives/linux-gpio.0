Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A193BF660;
	Thu, 20 Aug 2026 07:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787211079; cv=none; b=Q0ybftiHF+I7MHbeVD4PMyvUD8yH4clLsh8mN2Gof9bQ0+YZQW+IHF163hUY8inewmN7psoreGZ084fTJ5kAY+4G4KgJq9l9/c/ihNwZtNiWybtmWPg78L0FjLf+D/MTtpXXVBR7SrbmAZ0EqjFQKpFrCcK2bv97mjxaribxuxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787211079; c=relaxed/simple;
	bh=NY0FX+nlmglIcBMXjNSErJV9oFMYoScVAVnCYrrwTJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=quom0diehpBDO1dzG7SxTVDb4MLAhxCpd/moZwnL7I22Jv5VnwlCQxQNj7Grm66lCiJJdDiTouNJaSLbA3jxweZN4WbAcPa7PtOmHjYZ5a4hIVF6w7hFTS0BNoFtsjMz2Zou4jtu3yuj9ffJXuPqvRry8kTjgf8qFURYCsYJ8+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCbWH6Hb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCbWH6Hb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B98A1F000E9;
	Thu, 20 Aug 2026 07:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787211074;
	bh=sx25kkDKj6a9WHoWJkihodGAMO5znMhpv9YxWRmpAlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FCbWH6Hb1DgaIb7CrQsxfuAGo7iDwADUZ5FnxM2SXJoYInioB/gR105kxnJM+zyC9
	 ew5Ebt6nD+riCl70VGDIqxqF1+mePkd8TSI5DeCHbcav3/Qth/dEcPkMpHLdDfkLP8
	 xmje21UZ3UcMeOHVM1/Gl4PCUQB4pn1RSOZhndwdbM+4rSVURbaeZJ7h4xAFmZKCXc
	 YiRR8yGJhzWNYKEpfpqXv1NVliQ0hRJ2+LX4Hdymv3GQoIdjzNVHBO5aEvtJSta/W3
	 BH5VWvvST19ZTDxZ7k2MPuTNodRuOw5DwtwkC/m7v/0xrlJKBnDhGWRm4sHtZqFSxt
	 jPsJNyhVxzpRw==
Date: Thu, 20 Aug 2026 09:31:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
Message-ID: <20260820-singing-boobook-of-ampleness-3a930a@quoll>
References: <20260816-msm8952-pinctrl-v1-0-a7272bcd2187@mainlining.org>
 <20260816-msm8952-pinctrl-v1-2-a7272bcd2187@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260816-msm8952-pinctrl-v1-2-a7272bcd2187@mainlining.org>

On Sun, Aug 16, 2026 at 04:48:31PM +0300, Muzaffer Kadir wrote:
> MSM8952 has same pin count and similar pinctrl
> functions mostly with msm8917, but some functions use different pins.
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm       |    6 +
>  drivers/pinctrl/qcom/Makefile          |    1 +
>  drivers/pinctrl/qcom/pinctrl-msm8952.c | 1248 ++++++++++++++++++++++++++++++++
>  3 files changed, 1255 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
> index 9409e678ec6d..8b631e641e16 100644
> --- a/drivers/pinctrl/qcom/Kconfig.msm
> +++ b/drivers/pinctrl/qcom/Kconfig.msm
> @@ -222,6 +222,12 @@ config PINCTRL_MSM8917
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	  Qualcomm TLMM block found on the Qualcomm MSM8917, MSM8937 platform.
>  
> +config PINCTRL_MSM8952
> +	tristate "Qualcomm 8952 pin controller driver"
> +	help

No depends? No defaults?

Best regards,
Krzysztof

