Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437320;
	b=AJGpoM0GtG+IP1BbL+JW5nnMRKJ//ydcX+1Me1AIIwJpMmUPRcZyM1jEVgv8M1nDAdlX
	 DAC/r3YeTVK2oQbmrIAq9WSfBspiFeFpHdc55kUwo4F8nyTub7al1W8/mHVwAxqHZhKFR
	 oB6x4a3LrS4KJgz5eteHVzFFj0beuc7lL1ED/T3onwBMtaDTH6TAUq/bs9ltd12ftPbI+
	 DSm5hgp32pB5+tesNLbhETK7HQYsCqWRQ0RzPi9J735mjPYJHqbFhRhNEOy3FbrCfhq0D
	 oKtwkreaxc7HASRr/gpDRGaP51x0eygg9GaV6NlZfIm4k1jDKvfkLRXIp112n8rluwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437320;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SnK36Y9pli6fAhfG2bK4Kna1Thkk4RsjvqQSiahO20Q=;
	b=sWIXpaIdpS0uX+knmUY7vdpjTBSWRCJwNxMvIReal8IMUn5fdNyohCwyM6yWRBP5mTCz
	 sRw3ehtU+szz515Ilam8CcesbIHvLlhWCJ3GSpGzkBFfW4aFjV3Dx5cy0e3eGfh96mHAR
	 5O/TALLKfDwD0on3wOSYOm5Tu+5TMqpCrqjIO5tJ68bMYCSh8gENWLafiK2TFHlb3ASGM
	 oDnBavwNUuQfVCTuxy3VLPfzeaP3WzJ7ry2BnU1TWnkAveo0btEbnTLWTUh9QCApZ3Zbj
	 JL7XKsSzN6IIa5QYGxjgU/oKnQXrMD5Ow4mPkqm8vEEvBX1CHc52Idlv9mQno4YO3nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AiSA9oIh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98967606A31A;
	Mon, 23 Nov 2026 12:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AiSA9oIh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFDA11F000C4;
	Mon, 23 Nov 2026 12:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437320;
	bh=SnK36Y9pli6fAhfG2bK4Kna1Thkk4RsjvqQSiahO20Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AiSA9oIhvqf+PNXMeafaDvz6dNOSSekhMR4ecxhlv6PPZ7layggGUaJjhfTEOf/Ae
	 1U6PxPohpKJSKVSaseVTaTukrT7x3G/3O8ii0PlBM9JXQEypkv/z5DAXsXBL2+AfCU
	 TUY9ax+vY/npL0I9RD7x//9k2PcmrlcimYCmYvTP5IpXbwb8mseQEsQX3PGLTLzK4E
	 xXVDc/B5P95rKMztaJuCIxHGinzuXhDlkzxy8/lE/m1itYI/bQChEoX5c4Sn9ZEta6
	 T9eK1MW5oMPHDzEdsQMQwWUF8U7D9oI/UtfZMoXZdFoovUKBczC6XR4MTYgIQc6djI
	 69stPCMrF2gwg==
Date: Mon, 23 Nov 2026 13:35:17 +0100
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
Subject: Re: [PATCH 01/18] dt-bindings: pinctrl: qcom: qcs8300: add gp_mn
 function
Message-ID: <20261123-debonair-hidden-swine-4ee3da@quoll>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
 <20261118-gp_mn_tlmm_support-v1-1-703f7badd194@oss.qualcomm.com>
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
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-1-703f7badd194@oss.qualcomm.com>

On Wed, Nov 18, 2026 at 11:32:32AM +0530, Taniya Das wrote:
> Add the gp_mn pin mux function to the QCS8300 TLMM function enum. This
> exposes the GP M/N divider clock output and is used on gpio32.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

