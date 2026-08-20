Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B073AAF7F;
	Thu, 20 Aug 2026 06:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787207832; cv=none; b=btkwMbceZfmCI0iH8GGnVCo+Q9cHYdM5t+xyH2cMnWxQ53eDm55HZuU22qM5XM9rArOdtWJLx0OfIdUuUp5k03cPa7gdWMhM+WlIxz08Ub10Gu5hyxH1cNqAyR6+XgR6V2am2CA4uh197yRJ3Bx52ig/IlHAIHU/oU5xydKc8Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787207832; c=relaxed/simple;
	bh=twd2hSp8RXg3LcsDoxYwRo7i50y6T+ujr1ovcDjawE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkevvLIw39tsg/C0fDIxB7cGVajmCH/ifuz9se9tRlow/XgTe0SswmKYNTi3IeQKqqypRWUH2SLdzOlNWFGfxWMYLwfsmlCKvJymT82xB1I73u2svKDCzsb/tREOZK/1UTx5neGJDnNGjZRBPeDBTxxtoWpAWnLeIy5M7aQoKag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ok/DAA3e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ok/DAA3e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C161F000E9;
	Thu, 20 Aug 2026 06:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787207831;
	bh=twd2hSp8RXg3LcsDoxYwRo7i50y6T+ujr1ovcDjawE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ok/DAA3eMFFl3/EWYXUD2twPDDVgtQwMkJXiHJGNHh6Eo32qhZeSj4aUxialCU/8s
	 HWLYoqylq1c3LnfmcHEsE5X0hABdyMlXeutQWGqdKMGbLjwS2YAELUV6OHblo1oq3B
	 nw7mWKvG+WknE7khshEXgzsiomzLJkPINLEkEFQNewgYzEx2nCxeh9RyWjpqVEW2k6
	 g9MBuNJIWXZCYo4X2YLdMQGqvzFEqtoeEfI0bCYR3oh9+IOUbHpyKXI9inxtjxp7f/
	 dOF7ZxrsYY6wyU6cOHPMi3p+nMftlHDrBub3VkBVXPCwF4wJPZqHI8njlS3nshnDqf
	 DiWAf/FcdlLmg==
Date: Thu, 20 Aug 2026 08:37:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Chen <peter.chen@kernel.org>, Pavankumar Kondeti <quic_pkondeti@quicinc.com>, 
	Stephen Boyd <stephen.boyd@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@suse.de>, Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 01/10] dt-bindings: pinctrl: qcom,tlmm-common: allow
 functions on the HSIC pins
Message-ID: <20260820-handsome-vehement-buzzard-07fc64@quoll>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-1-e5f93ea76ffa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810-msm8974-usb-hsic-v1-1-e5f93ea76ffa@oss.qualcomm.com>

On Mon, Aug 10, 2026 at 06:42:05PM +0300, Dmitry Baryshkov wrote:
> The common TLMM state schema requires the function property for GPIO
> pins and forbids it for all special pins. That rule is wrong for the
> MSM8974 HSIC pads: unlike the SDC pads, hsic_data and hsic_strobe are
> muxable pin groups (between the gpio and hsic_ctl functions, see
> HSIC_PINGROUP in pinctrl-msm8x74.c), and the msm8974 schema already
> lists hsic_ctl in its function enum. As a result any valid HSIC
> pinctrl state fails validation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

