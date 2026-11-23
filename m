Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437353;
	b=UqfhALCzch1SGNBPOY1MU5gkzUHDKn7rtd94lN0gxvTWH7OMAk44Qa5e3X7Jv1ulbgPQ
	 vojoueV3ABtrGPndJl96vEee/LVC3Z1K33zmr7E9xvHZY8yQ5T3QOSq0CE4YMw4RJUvE4
	 wTiunFExUMJ8otAjoNazUxCbpxTniF4fPvKJcXbyQ6MKzKv07KFWHG3DUnGmja826RAPx
	 8HyXo06yhsXdXO3pfd8NdCGjqnpkSnFLl8QSs/Ou0uwUoBu+sTsA9SlFEgf86/6bh1cbA
	 ReF1wQdyoonCwg0oAIWu1VomrHskeKRopQH8Nk7qad/Gm9HDoxOUMdoevfmxBn+qDkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437353;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4s6v4SiCowpelJb+Gv17xCg2SmSjM5beHfoy+gTxwQg=;
	b=j7PbcIu3DLhS2FdDVSxqT8+q08jUJKGMZWjSnKjxm6YUk+4FF4rVL7mfrkBM+6sZ5ETP
	 02rcZdIw9Wvjjzt8LBEvIWf+cVHEscveWJF+NtYdLguLqjLxsJo0Uyc/7L0lcdql6mTit
	 6W3To3R+jAwDPNm9MtKs1clZAhF5R0AfANg0EEzyHFsyGSJ54LuzFySj946mR32ZKUJ4Z
	 f8rG9/x2y2QuY6YwUvwSsuUoERBOP8lP/n9oZjsvGTvrIs3fkwcMqi4zCCS56lyM2MccF
	 FLZMBN597ieM/t4svLl5wOzBM8JWemGSQVqglyTaCBrGuQHjAYYhQ5iIfPzbJPH+1Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B1WWDIbJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097A5606A31A;
	Mon, 23 Nov 2026 12:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B1WWDIbJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21E71F0089E;
	Mon, 23 Nov 2026 12:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437352;
	bh=4s6v4SiCowpelJb+Gv17xCg2SmSjM5beHfoy+gTxwQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B1WWDIbJRCX8COlHr4oX8mJ+3jPoDnVYrxJ/tWX3QfzK+BWzVMc2hhsdY8TYSWviq
	 pmaZcQ6v1vO4uBPmD3vrW01pjyApamqrDGuhhWQvcRU8q4C7671c7hJ4hRIRGBpcxE
	 mx+onwWotxV0DSIT3O/Z6ODRskvVmwZLt/yD6o+CMoMcrwj/MkndN/wE0RhBjzH/8H
	 XKldRVc1NE5FtWNjJ9Ugjzju28sAXRL1Qa3qb2wlZ9aD91SQNpzsMokawIoPDYm2q/
	 lbEpvnnXdev9ueXG1Jdtp90X3NwXr/A4JPQbgmYSBzqgu2QNmcjyruRn7CG4KVdugk
	 17ehGztEfSjKQ==
Date: Mon, 23 Nov 2026 13:35:49 +0100
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
Subject: Re: [PATCH 11/18] dt-bindings: pinctrl: qcom: kaanapali: add gp_mn
 function
Message-ID: <20261123-lemon-mastiff-of-bliss-53b8df@quoll>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
 <20261118-gp_mn_tlmm_support-v1-11-703f7badd194@oss.qualcomm.com>
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
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-11-703f7badd194@oss.qualcomm.com>

On Wed, Nov 18, 2026 at 11:32:42AM +0530, Taniya Das wrote:
> Add the gp_mn pin mux function to the Kaanapali TLMM function enum. This
> exposes the GP M/N divider clock output and is used on gpio53.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

