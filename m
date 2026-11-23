Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437347;
	b=o3DfBSaS2PtvRdi1avakryAvuUHlSMFsfQBhzx68WT7woHRUxZjokjCpJQoTT6eln3rP
	 U59mQdqTP1TSRns4i7Cje6tmbuB9bbeY7gTr/sO6xrg48TT+O6NXOIym6EtDetmJ4KK7k
	 Hs8Ciiu1swfyw8h9BDnNZGLtN/0NbAaimqtycKXk/TlzH3ks6UgG2vFsWerUNJAMHgAdE
	 Hl0IZyLiicXFm5luaVf4WgLFVJBzcoB73gqmRBaxStujqNEU8QyLBU4RhoDcRCYZGoU2P
	 r+lS6Y9m9ZykoVOEpVdE4CuThJzsFmYN68ef1kSOppUmvZsK4d/y6Zgh51DmyZ81NUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437347;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ogjog3Z1u4dxytyp+wTGGaL0haAC7XlQjFOGGtWS4VI=;
	b=RSzx1ZsuRkRIvsXsPdhfoHthHTUaCc3dvzfx6e5BMag1KkK666KribOeQWeacxS4VFO9
	 P0P9r2ajG88hPrfeAc3a2uabA/wmYJt3awS//DltQOhdwCoX3R7NrikO2v/6NGuZdqreX
	 ubahcAEwFfLZuvgvOBHGUitmgetn5FLdSrlJ/KFNjmfSeuLOTuM1NPgEG4rNNlZHMFjZR
	 XscMVPAD5tN2367ZMEpPnjBfilyoYrUURgK0Np5Xbl9bPlCQqQNY+XvpXQ/XXc4x9+CzQ
	 Ql0uYV5j98RnHFL4eFmAZotFSaE7R/2endySr9kPz5t6VO+9xUuFxIGKKIBgQs8o3mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H1IAeOQV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A0C606A32A;
	Mon, 23 Nov 2026 12:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H1IAeOQV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA6521F000CA;
	Mon, 23 Nov 2026 12:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437346;
	bh=ogjog3Z1u4dxytyp+wTGGaL0haAC7XlQjFOGGtWS4VI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H1IAeOQVsV1W1I09H2kwNWtvExRX+pEXcg4WYSNjK6LN8x6a4EbwZk2RYwOXi+qET
	 6RZo3lIW4nvTfMLEfnV4rWzGQzrGfoIqftpbWqEOlAlzPHSX5jJy7yPO1gg9CnX3/N
	 my+0n3G5tfQcuZnAIw6Q1DT4dAxBNTOrvxqfhluJWB67w4s9hCREyEa9PKHtFMHROs
	 DLdNzgUWgCRFG8dlZGdSOCk9ef/g0bxYGZFSyB4VWGbFk0sxh2gxagyQNu3mBwS/UW
	 RbVlyC7f9qJbQvoVa+dG+zQ+1sPhLRlGC7GZXHF7+4md/28Fdv/lgyzxL/orHms6D7
	 73gTKTWNhTXUA==
Date: Mon, 23 Nov 2026 13:35:43 +0100
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
Subject: Re: [PATCH 09/18] dt-bindings: pinctrl: qcom: sm8750: add gp_mn
 function
Message-ID: <20261123-singing-majestic-cockatoo-1a9c5e@quoll>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
 <20261118-gp_mn_tlmm_support-v1-9-703f7badd194@oss.qualcomm.com>
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
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-9-703f7badd194@oss.qualcomm.com>

On Wed, Nov 18, 2026 at 11:32:40AM +0530, Taniya Das wrote:
> Add the gp_mn pin mux function to the SM8750 TLMM function enum. This
> exposes the GP M/N divider clock output and is used on gpio53.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

