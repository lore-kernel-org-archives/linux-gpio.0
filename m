Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1B63E171A;
	Fri, 17 Jul 2026 08:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276787; cv=none; b=LKDaQ61PjeB2rTAdnk0nbVloLuHe4nEC2NQ1CtoXpSB9wFUHfA8i/hmLiavsm01HtP1kIEEvA6gOukAAw1HxNT9Hmae656UZmZ4j43MSQl37NJ7IV0CIZiAOlqOcxcK4aYMRd1KqYQXFLqSR9deqZuXsqxxuI8SkXvW+o3/hWxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276787; c=relaxed/simple;
	bh=9RJeLriUWP1Cw9Ah5z4fWytL8F/TyLZk31AaBnpvWPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2EgdBscYjCp0k/EaT78Jfko6xKjArV9Z15fgl/w5cmGHYmD0x9FAEeXdM0k3I/U4vNFY0E5VkKz4m1ovwNbOpeBjYdf+S4hNY+Vv6dSobf7dFjqY9eF5XS/x+OOkvwgrkK9GjbOHHAQOkZ8nmc80AoLreDe2WV/orESXk2KoRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9H9Uuil; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9H9Uuil"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BDE11F00A3A;
	Fri, 17 Jul 2026 08:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276784;
	bh=T9pndubpo94srI/dV6UKKxbqwVLl8zkHgzmZRI4HcyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E9H9UuilpLPXOxv4UFxawCdB+oJZfpG3RUPF6iuevaNT3LNiW2IMjW/awsPLgqvuI
	 dZcLgsMXrzZ9evyfmsIkQ5RY6br1Lj/MMG2d9bLA4UB8R1tAtxFU4A8UjFDC4l2VjP
	 eIvRvbSIxhaXi/mQQahmc0GdO0zh4OpU/p4RexxV4MqV5HsLVw/NQ4S97qsvGUZfPf
	 oMLcSmx8l1DilB4LTx7ZjaBqfgT7ncBY6aA/MUYhvY3NeBXJrigp88wnVAXT9a3C2P
	 VHSb0NMhAqS26XEcvBVEeUMGaHqE3EojkvMlwRP+OfX1ZHFuX+2lxCQGDDbLkAJeqR
	 iql1zmNuzTwsw==
Date: Fri, 17 Jul 2026 10:26:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 3/4] dt-bindings: pinctrl:
 qcom,hawi-lpass-lpi-pinctrl: Add Hawi LPI pinctrl
Message-ID: <20260717-ecstatic-notorious-grasshopper-efc437@quoll>
References: <20260715133243.3170821-1-prasad.kumpatla@oss.qualcomm.com>
 <20260715133243.3170821-4-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260715133243.3170821-4-prasad.kumpatla@oss.qualcomm.com>

On Wed, Jul 15, 2026 at 07:02:42PM +0530, Prasad Kumpatla wrote:
> Add bindings for the pin controller in Low Power Audio SubSystem (LPASS)
> of Qualcomm Hawi SoC.
> 
> The controller has 23 GPIOs (gpio0-gpio22) with functions including
> SoundWire, I2S, DMIC, VA I2S, ext_mclk1, slimbus and lpass_lpi_dbg_clk.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  .../pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml  | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

