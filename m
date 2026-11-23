Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437336;
	b=p4iRf57wr7b0QnC3ZRV1N8WSZKClUewM2cbVlSiMlrdFYSGP7yOqEBojPkSFb9GEs2xy
	 ORs+ls4pH/PoUvvbu/BUMUrJ4zivMovJJl7JlTNpmRaWkGRoivu8nH7l3sog879zaD6sH
	 8GAHVoBoKFLd/QESU7VEF2wZ3CgFPP2mPbCfnR3jzgtIZWKc6QfZS+REBE2UdfVvmLGau
	 LIVZb0iYRypTJToSn3haPwULNxl+lSMNW0WQDBgFYWuOT/3WwssregS3Uaai3gv59T4t3
	 8bN1wqqpWSED08Tm2xFw5LVrVtrhczUmf0Roen4868FFSmpALDy4RuPJRM3up9UfUzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437336;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=B3ur+E5WL8iwwpHME//Dle32qoKpXFl4Mqf3VXbR8j4=;
	b=X6XxFaPISq5EMpFXWNZs4hubi+tXNhghBBQvPgzQRICckVtmic9OMO+JfjBYht9VvMoF
	 Kv/y8jdnPtCUxMg6WPO8DOrbm6CworYXyISuCWgJtcNu+tM7oRetKSw3XT6rXxzJRTRwK
	 YD2I6pW1u2P3SmAVrGo7+FFp5Lp7QxLn25IY80/tPplgDudDrWlJPri5ZWcVP7T1oyFKo
	 JDEPPw4ln5z6vUoIjzVW7Zm8qPKdqN1WqyfKq6dnEgd3ekw5mfI8MBYCllZpZYpeZHDxM
	 0j5axe+/1kdC3aEG4cVfcCdqIcKRCNU4kKfBwMucgsiFHAaAdm2v7HF+CJ1fVmYFe8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VWJMW6+f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA91606A31E;
	Mon, 23 Nov 2026 12:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VWJMW6+f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 967461F000E1;
	Mon, 23 Nov 2026 12:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437335;
	bh=B3ur+E5WL8iwwpHME//Dle32qoKpXFl4Mqf3VXbR8j4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VWJMW6+fEXPpleDCHKMNm7vFs0WkkAxquqL/fuda3hGxr95gcWTlz4Ox7UCcWiVQ2
	 /hVbami9MTolsSUsFWskZHK31kajAxfI/TzVuq/XkXU+CoB87BqHMntC65ojhE0JZ5
	 8oTpT4qtEc9XycDLnQ71TH6Q5KgJ9d/hdd7q+Tzhe0GN9o7/bAI/Uk1Fuh7RWqYp/N
	 j7iebS9JI5PFxhZlczuMpPEQ/aKmcnwGEAzoMgAAYe1yhXRiWMoI37ss/5JlfFqh/Z
	 p1KnzTweTeUMEUOnph6f6NbaQoYO8bkblNJEVKnWt3mdaJ+cMUlCZiJE5ji1gP4Rab
	 IiCCQ4gGmFO+A==
Date: Mon, 23 Nov 2026 13:35:32 +0100
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
Subject: Re: [PATCH 07/18] dt-bindings: pinctrl: qcom: qcs615: add gp_mn
 function
Message-ID: <20261123-mellow-pillbug-of-teaching-1b4f56@quoll>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
 <20261118-gp_mn_tlmm_support-v1-7-703f7badd194@oss.qualcomm.com>
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
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-7-703f7badd194@oss.qualcomm.com>

On Wed, Nov 18, 2026 at 11:32:38AM +0530, Taniya Das wrote:
> Add the gp_mn pin mux function to the QCS615 TLMM function enum. This
> exposes the GP M/N divider clock output and is used on gpio29.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

