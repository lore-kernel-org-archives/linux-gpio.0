Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437363;
	b=Xb3YY/RBjdGBs/UullGSNryIcp9VqLr1lU8sYePLgjKZD3OANq5P0ji15cPG6m1R6x26
	 QUKigUW7GQUTgAATavWAqu81QNzT0LhfM0XH0Mn8uRkbgkDjv2gKe2trts0Q057Lt3NEe
	 xiixNgYiTDkr6uM68CHJfUcDDmxBQvZEZn/lmTcm9fGmHQlNj8Kl/hB1xbFLyYMCKFWDX
	 x9NO5lD6MVDaGNGPygG8Ib5Ythn41p3jfBltDZrOuNqlc1t3c7TA1fizT0LnhGjfQeLjr
	 l424Lpo4vk29ESJOMx58jOZRFuIc6iUVzgLNJsPKz5dWaia17vHGejiVspAIIoj019w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437363;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=D4Ckp7Jwjb7Ynveby0nf+DuvHjtldO+xRFFK+nFq8Oo=;
	b=MTMuf99oiIlOcr/YzJmJH9foSuzPIMWXV14V+fdd/O4IKJ1fmblz1y52e0wsW0H1oD1u
	 0vknDR3evny3tCHc9xTaT7Fn1bhwHMwxEmHuBuoXvW6gkjKClZQvpqAPLsd9VVtmyxSPF
	 vHDMkuYSDjDsLkQJ9qrZiNxV5qFWQQTjhNnrnHG/KCIhfJBgi3yCHyeLlLEBh2i5iuX4v
	 VvRaWr9Gg4CEdN5SnO/9OxnREkNvX1XPIJk5BCiODqLseAHblNfY3iuwbzZrhCpSrbB6F
	 hlwE4hydLPMQNW9bdtm8BMFrQL+JX/OVJIEKpUCuUXulUwSqRKZyFIvqfOMYJ+qCRKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EYxGXu2F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA36606A681;
	Mon, 23 Nov 2026 12:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EYxGXu2F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB92E1F0093C;
	Mon, 23 Nov 2026 12:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437363;
	bh=D4Ckp7Jwjb7Ynveby0nf+DuvHjtldO+xRFFK+nFq8Oo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EYxGXu2FcNZSgcn+VFddlCVbHUAZvj68VFisTuWCSuPC1B94jBpwRi5qAZRSv+V6J
	 u4aQ40rmoMwWqUEK9+I2Hj0w57HuZw4sd4Lqa5jntc4Kz29lWsSpFu8qKsgwdCDuDs
	 VQD6irniIHy/3jdxbH+G3b10HoR2iy7Y6CuAhJL7ZhNDShNisGUIc2dGQRaXuJqb1b
	 072s0lP/y1FtMtE9D4IWKePLxiWztwckL/D0rAb4e2m2d5eEW/+oulIDYiJ6F1K2fT
	 XBE/GCBNP0R0znTs+2IhOmD36CR4DeNN1hKHq09pfjNmXqEz0V913piAGXGpS5gvxj
	 m6CP6XnuneXdw==
Date: Mon, 23 Nov 2026 13:36:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jingyi Wang <quic_jingyw@quicinc.com>, Richard Cochran <richardcochran@gmail.com>, 
	Lijuan Gao <quic_lijuang@quicinc.com>, Melody Olvera <quic_molvera@quicinc.com>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Komal Bajaj <komal.bajaj@oss.qualcomm.com>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, netdev@vger.kernel.org, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 15/18] dt-bindings: pinctrl: qcom: shikra: add gp_mn
 function
Message-ID: <20261123-enigmatic-jumping-lobster-c107da@quoll>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
 <20261118-gp_mn_tlmm_support-v1-15-703f7badd194@oss.qualcomm.com>
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
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-15-703f7badd194@oss.qualcomm.com>

On Wed, Nov 18, 2026 at 11:32:46AM +0530, Taniya Das wrote:
> Add the gp_mn pin mux function to the Shikra TLMM function enum. This
> exposes the GP M/N divider clock output and is used on gpio87.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

