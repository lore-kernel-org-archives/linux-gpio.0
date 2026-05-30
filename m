Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506FA253B42;
	Sat, 30 May 2026 10:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780137796; cv=none; b=qaFFKR5H57rl4OZueWLSCBq2wI4eN9gvvu869d6lfR3zKOQ2qFcV7Huas39T/iQt6po0KVmm6SuTkY+XOcOImBL2pfaPVKlkDztb36huS4lFO2OK72bZqzsyYtnzaEVp+XycYTWkqeAEUthb9ZPnJ2u0UGryUFHIppZSBMrrySk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780137796; c=relaxed/simple;
	bh=m9kBZjsTOHpj4wqR8N8NT5nlovrYILypc5DDRIAdyFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2yGCLS7oC1EUizJAVE5LqgxSFWbcj0aci8aON1V9SlKwgGqvUu0cIJqFrLtnHnTZBATYecq/CbzjiZiHB4YTtZ+OtSMr5dhlADXo0iE2qRGzXL0V46rREkBy9Of6+Vq2xE0o7zawAAAzA2GvawgC0vJri9l7o9IydS8MFSUYn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2Y7BMd8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2Y7BMd8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F5251F00893;
	Sat, 30 May 2026 10:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780137795;
	bh=VyaCmi1S4qv3v4K/lqnb+sAaLFPH1HmfeGUvApAylZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H2Y7BMd8FghtG2ezsC3HOXu8WhWUSJZLr2afxCpjijvRRXmSJfTdkt0+zigTCRA2w
	 CL8HCtWq5yVqCuuuVPZzrz76VBtQanUY8muigw8terCH3JRMivTVA/okFFRoOQIqqg
	 Z3lw2Q2hyWR0g+eg0km/tHSZCTYaGK7iNcITY3/muLQ/ibe7Tt39D4GDfbGvnXaKTo
	 wpgSJX04OwEPBhkhtagUuvgr23TSq41HOPYN881VowC+elADm4EKzGrOklRDD8xpMY
	 d4EqA8S7jHcyD/5A4J2lKM7pDn/5JCrLu7crmNS9RfoRAbhrZpf1rdRudG2PDhY/UA
	 FmZtJfNpYXTbQ==
Date: Sat, 30 May 2026 12:43:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Describe Maili TLMM block
Message-ID: <20260530-relaxed-refreshing-squirrel-d5c814@quoll>
References: <20260522-maili-pinctrl-v1-0-0a6636f5c277@oss.qualcomm.com>
 <20260522-maili-pinctrl-v1-1-0a6636f5c277@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260522-maili-pinctrl-v1-1-0a6636f5c277@oss.qualcomm.com>

On Fri, May 22, 2026 at 12:42:08AM -0700, Jingyi Wang wrote:
> The Top Level Mode Multiplexer (TLMM) in the Qualcomm Maili SoC provides
> GPIO and pinctrl functionality for UFS, SDC and 226 GPIO pins.
> 
> Add a DeviceTree binding to describe the TLMM block on Qualcomm's Maili
> SoC.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../bindings/pinctrl/qcom,maili-tlmm.yaml          | 120 +++++++++++++++++++++
>  1 file changed, 120 insertions(+)

Assuming you will provide explanation of Maili:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

(but I will not give more review tags if I see next patch also without
that explanation because I requested this multiple times already)

Best regards,
Krzysztof

