Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437330;
	b=yfDB6gQMstIwB4XaQN+ZmnwF3mgy86qH4PPIhxRircVWa5tCy8lGU7HDyu8/H/S6nTTw
	 498gZTg0bMVceBLiggPFXjq5B42meK0NQ3ookPrxP1oJUPZlIaUL/xHCGvCYpdFSluGMv
	 YXMQk52qmY1nLWHgiON7B2lOc+gMfUdwju8kLSLIcJrXuqcOieTChykEgyZZM9Sx6UN9Q
	 r6OlXMaXUAC/C4mruXBhg03tijVmHmGCJK+N1+MV3UFCdUtDP0ACYB0aHe7LQ7fdYwlX1
	 +bEpNmrfdGII/Y6xmyqGaj8MeXKkQyEY2IlVoqMzl5Dq2R22i2qoHgesCd45ZlbU8KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437330;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Jz67zOithzbiJRCMHcVefesWNnEQzXPW0AIPRvosAF8=;
	b=kfv9EnC7z53me9UFFJVrtdhzHK0BJHDwWR1LyfyMPLcoAgDrSZz9Hba5Rki7NW6FQ5xN
	 EIFhMSEXgWqARsABqjpxu5L7drhYAfnz9WsHCo6AkFvibAna2TNahtldXrjkWooJeZ/nm
	 BKjbtrN1rSbudfHV97WatnFhvhmqGkCN+R/b7gy2FRJFi2CuDCH4VIBbNNHXvI1QVOIhh
	 1o/c7Mjg/iFw0nbC/BXsO2Z+GErbMZ1V3Q7kZNz9uVbye8/uj/hkIoB0xIItPzWBToXqf
	 vRTwLpf0a0IX7fozjDC2QDo0VVQsGD9aj+d1yJoFdX3SuJl0jBw8aQChc4aO6f1jhxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bPoJjSim;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46336606A333;
	Mon, 23 Nov 2026 12:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bPoJjSim
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3490E1F000C0;
	Mon, 23 Nov 2026 12:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437329;
	bh=Jz67zOithzbiJRCMHcVefesWNnEQzXPW0AIPRvosAF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bPoJjSimV4wtwM8vPXmi27zxWHFlJHshSwd0W4ZPHEo6WxMrguJZXd8g6FfvV0krc
	 stIl17PssTiEV9Vv8b6AR4nJiaxuTqgug1+Ck5bcjaybXjVcRMfGONjiGGeuiUCfYc
	 51BItroYFEGmX3Z0Bhj91W7UAS31fh0scfZju26ow3eRMD8yWhlJ2jsjtHdvWZ3tax
	 qkTdWdSgaXk75TR0wCqyyaCBMcJVZDcaKWdN4M6kz6O8IXvetJZvd6CYnGZkV9accG
	 e0Bchd+lmp81eG7PvUavuJ0sAvQYvA/UX0iyxEbmHb87I5s7dnHw4NmHp5YyLEAFa5
	 d1aVS0pkP9Qfw==
Date: Mon, 23 Nov 2026 13:35:27 +0100
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
Subject: Re: [PATCH 05/18] dt-bindings: pinctrl: qcom: sc7280: add gp_mn
 function
Message-ID: <20261123-wandering-artificial-monkey-8a728c@quoll>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
 <20261118-gp_mn_tlmm_support-v1-5-703f7badd194@oss.qualcomm.com>
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
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-5-703f7badd194@oss.qualcomm.com>

On Wed, Nov 18, 2026 at 11:32:36AM +0530, Taniya Das wrote:
> Add the gp_mn pin mux function to the SC7280 TLMM function enum. This
> exposes the GP M/N divider clock output and is used on gpio60.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

