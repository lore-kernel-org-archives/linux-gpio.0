Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832852;
	b=gimiF8Ryn8DMpefrlX4bwFM902tdwFoRa5+yUmIGe36dZVfGkX+wKrg+agzRm2QxuHFB
	 sGTPujn4IIhd0oHfzx/ZvXaik4JEYXlRyq5TE/m4VGdD8JYyGcsZjwqwv0Vee0Z7qrCXE
	 Ed/lQHG8Ynmplc1I4LFFIAy163wLrD6JC2z6kLPQ2v8XV6Xv7BPGdkEHl3RLRYMIVxEti
	 WHRyNOhc2aws5a/n9AH5CYkKL/12t/IprON8BUYevCCpzVsSmlqxZDcIe9Poh00NOJymk
	 ohW1g4tv5Dz+ZtpulPMtX9j97eu98TKhc6aHt6I/cue4+DdFC3DCdFMKXwehs1jfQhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832852;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jRZpPoticutSixYemuYYwiXuah3bEvliada984Hu1cU=;
	b=hny879E70WLuF9V6RnvN6/6mwrLIYVq8lxXsFMpYkV0XcP0R0afcU04ftozd66G5bOfR
	 Ghbnp7jl7oSLkOyn95TgdYjMcplg9I6qDfsh3Lmncv5Co78gSJYHfNxl5WKu2eEICR6XH
	 lUa6E0usRt9bqFdfJ5hjHB6YvmRrL5YKeZ8asjEsIkOecR7rcXs76USbjJs4QM79B+XZa
	 fENaiZ3dwtrsD/OH5QtOTDYOEAKwvelKbdhJyOkwm4qQ3TbDQsgdbdq0gupOrNeF3rjJ2
	 pfBHiBgL3YMd2GDyW6q/pjEVo9SWB0LhWRu2nlTn2MEHgccThQmQ/fjCoho4LnaONvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DV0i6ZeE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F53606A31C;
	Mon, 16 Nov 2026 12:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DV0i6ZeE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FDD91F000C4;
	Mon, 16 Nov 2026 12:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794832852;
	bh=jRZpPoticutSixYemuYYwiXuah3bEvliada984Hu1cU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DV0i6ZeEjx1oSg/GkikaYea6uSQreUa0TA3UnllL/05dTUqSnYu+m4ayTF+LGABOJ
	 yhkh3lYeZhN6gTpb8F45FjccX3Kgi1LEm0+zSGFvg/+1NH4k6DMxKHVcziv5uR1r4w
	 cOMWd2Nh1dEMfV6dWDg3i5eegLJiYqGq2zuAzytGLxJ1XLXJGw8nrOhlLOGvR1jVCi
	 NLpiLADE59ykO9nvf4xJkz0T1lt08QBfpCFmS1MLcU6ihu9Lws7Vw8ld9GBgkyHLAv
	 7eVHZXsxnOEBpSJHJQ0mf4I1Uys4y7TKEawsXI8Qjl4R+RoxLYA8/AkbJHg7cLSYVh
	 jxtgtS77nzJIw==
Date: Mon, 16 Nov 2026 13:40:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Suraj Sonawane <surajsonawane0215@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add
 ext_mclk1_c
Message-ID: <20261116-nondescript-buffalo-of-whirlwind-6a5008@quoll>
References: <20261115174237.48908-1-surajsonawane0215@gmail.com>
 <20261115174237.48908-2-surajsonawane0215@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261115174237.48908-2-surajsonawane0215@gmail.com>

On Sun, Nov 15, 2026 at 11:12:36PM +0530, Suraj Sonawane wrote:
> LPASS LPI gpio5 can mux EXT_MCLK1_C. The SC7280 driver names that
> function ext_mclk1_c, matching SC8280XP, but the binding enum does

I do not see it in the driver, so are you sure you used correct reason
for the patch? Mentioning driver means you document existing ABI being
used.

> not allow it.

Entire sentence is clear here - there is ABI and binding does not allow
it. Please point me to that implementation.

Best regards,
Krzysztof

