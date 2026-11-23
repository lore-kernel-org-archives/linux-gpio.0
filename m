Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437325;
	b=Z1wG9bGTLDQBpGfMy3v282bNlReiiUgdUgCF6JcAmZjNts5dPR9MwDZGIVAWVKaj0qGA
	 rtAYFF++9IOrVrMj63JpK7aHuY0dHzMF5JqCxCSFrW3d4dIicajl59GHfYav9yIzo6fz/
	 I9m9oXRhe7oYgkEvY/RqWi8Q3HZwX61RyzJf/EyHAxWPWrSofGIORj8qtEqi9M7t4cMH5
	 uUYK5k2jMy6e5Wzs8ja32o15FEYYl0/HAd5EzpunP3i23bPPIN2iob2GE2NAcG3+a4rTx
	 pVeUqdKZiTjLAJl5nvcvZXM9sxFBxnOxzSrJ1EmhVGd3zL4LQHH9VW38ddyaWJtB8tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437325;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=B3xPSIloxPLJQdKjq7cJzsmlG4fsujtN71kGQk/8CH8=;
	b=iVdWUYAus/j304LbF7bflmrX3ObEJhJEb81d7TH9gVd0TN2k3Uj46AWyv/9F5Cpsq908
	 pOofD0l1rqrlk6bH8fSDH/TBd2HuCEtEK6dPIPfPARVARnSzDAb7BmLyTnh8INLw4Cl6L
	 0tZmBVg3TT1zZ8Gs3xK+Z1iF2JOsVod/VUX2aMYU3sY0ZAQmfBNoLWyEYNTUYCJWUD+yC
	 Jd4ooxpQyghN4Utmqnn/djRpPxey0COLX4nF4Z9eljDbvL7E3MkGDrGCwyn6LnxW+Yo4D
	 k/tcO0SW/gwWEv2UVpftjsATImKycRyPxihK2nQjN/5YIALhutDSK3tMLpB4YjHxOcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=As9L7W+h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7417606A31E;
	Mon, 23 Nov 2026 12:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=As9L7W+h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99EBB1F000C6;
	Mon, 23 Nov 2026 12:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437325;
	bh=B3xPSIloxPLJQdKjq7cJzsmlG4fsujtN71kGQk/8CH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=As9L7W+h8w9mY/+4YR1knIJg4HpoAAFzK5WtkViRFXn0CFQ4crQcBwYdGY3fAp1yq
	 Ht1cjCopcMD2GMB7oXuEnUel4a4x4dISJWdXufm3Bk+AoNE6FVNcbF4j/ZHzxcoqOl
	 aG+hAk8oSkvSAtiiPF6fbKbc2fdOdUTBiiLoFw4jsoCvFoNplXeB0fGVjcNmeh/CsF
	 nq6AaBim1qvL83Rfa2f7it3qq7rVthkHbaOs2lptQWvaHzRIRwTUPrUZ90l8zl4mfx
	 gP2cpU4pGlnZcTzFPwtd3etol5qFEGAOjQZaPAP/kTZT/WYPCWhoULq7ulBykt9Omd
	 3fZzWDBpUfUUw==
Date: Mon, 23 Nov 2026 13:35:22 +0100
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
Subject: Re: [PATCH 03/18] dt-bindings: pinctrl: qcom: sa8775p: add gp_mn
 function
Message-ID: <20261123-refreshing-tangible-frog-22329c@quoll>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
 <20261118-gp_mn_tlmm_support-v1-3-703f7badd194@oss.qualcomm.com>
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
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-3-703f7badd194@oss.qualcomm.com>

On Wed, Nov 18, 2026 at 11:32:34AM +0530, Taniya Das wrote:
> Add the gp_mn pin mux function to the SA8775P TLMM function enum. This
> exposes the GP M/N divider clock output and is used on gpio35.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

