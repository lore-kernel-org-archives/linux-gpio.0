Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96342EBDE9;
	Thu, 20 Aug 2026 06:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787207641; cv=none; b=NMSSlmww897/c0igSCkghwLOfXvGoLtWx3OQynJIivsHsoBQDelBU2gnf/knT95CRpTzn8UoakBxl0P7UkI9F3zYROcUNwwzuHWNjsXoQQyj965HmypFXAV0lZ95DhCz8vdul8Xjhobw9HiV/hFJM2K4DkWfp9lMcw0lvkXFAU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787207641; c=relaxed/simple;
	bh=i2IfvybPXQN8HxOaIEpopMFy2nqWKK0MkaIhAgFy4CI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDjEFRFIXRZ+MItQXyHFHTVZLiyuolu/E09UV45IMv+5QBXZWSWaYHvdFXSBWaxUceFqH63urEkJYBPnY7ssxX3ZpS0jPsIZYdN4ZNWxjCiJPeLriTLnl6IJulBhTDkI0qqL0I3PQUHneUxwyMYPsXlINTSzIsl1uj2jFCp05Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EEV5IBYz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EEV5IBYz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551EF1F000E9;
	Thu, 20 Aug 2026 06:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787207639;
	bh=pD0WGepCub8+i5e1jJFZFXcaekgCTPD8PN9ZPkEAxKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EEV5IBYz2sQWJcppHKtA/neiMzJ8dzTcX9gTn+cla5ZDnw1X9SGDDTAheeNnsJ5yC
	 KVSPTvmErc/gyeXhnEFzeV19QOcyqHOp6JyphfJsaIlXT2XfYPb+ZGXc8eT8ZmFEQV
	 4HqMQPfKauWSbgS6yWmck4PIsan1kxcOy0rormH/e0MXbDkLrL3Pkij93QUf/8bc53
	 baov8xWkYJvFmH9UNjAhGMwfCPAPm+GMEfsYBKJgSsMQh4rdkAO8rlGUNkQnNH0cou
	 mSxn0E5Ry9anTXI8qyd0nM1Kx2+LLc/mgWf0VFh4bhTToC7Wef+gDhrBa3LMlaIxt3
	 A/iymAZ0o4OmA==
Date: Thu, 20 Aug 2026 08:33:55 +0200
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
Subject: Re: [PATCH 02/10] dt-bindings: usb: ci-hdrc-usb2: allow the HSIC PHY
 as the ULPI child
Message-ID: <20260820-optimistic-merry-mussel-9efbc0@quoll>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-2-e5f93ea76ffa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810-msm8974-usb-hsic-v1-2-e5f93ea76ffa@oss.qualcomm.com>

On Mon, Aug 10, 2026 at 06:42:06PM +0300, Dmitry Baryshkov wrote:
> The Qualcomm HSIC USB PHY (qcom,usb-hsic-phy.yaml) is a ULPI device: its
> driver is a ulpi_driver, so the PHY node must be a child of the chipidea
> controller's ulpi node. The ci-hdrc-usb2 schema however hard-codes the
> ULPI phy child to the qcom,usb-hs-phy.yaml schema, so any HSIC
> controller instance fails validation with bogus clock/reset/compatible
> errors.
> 
> Allow the ULPI phy child node to match either the HS PHY or the HSIC
> PHY schema.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 4 +++-

USB patches must be separate.

>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

