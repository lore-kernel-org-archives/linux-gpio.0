Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437369;
	b=IDTTNGq7jcwG/Q4f88weaS7lHHzlVV9FRqbxVCDyg65zIhPHVWdcegg/C/hwE0saTmI8
	 mO4SXA+/natG3cxdEKK6zFCauNuWhQlh8YQpNqGvJkN1HDd2A240RWKuS+IDWjPdHrVpt
	 +1FZ7a1IuRxqw4WBvxiN/DMpb6tCsUdhpbqDmQKsM8/6lbo2URK5Rvmj9xt+vvR5TaO4C
	 uNr93TWu9MAeFcMxy8ZPJWcxq3cvqMjfwngdHg604ArkYKKnCxf7CkYTuJhI6Mx37bDRc
	 15WKN02SZDgMOOMkmDhJM5CgRg72A9gQX0WZ3pyh7T95KlFqLwJ9aGPjnXXoByMa8wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437369;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=u19f3dVud/ZrmYlQFvC8zg1o8rPzMyXEdD9FHodVIm0=;
	b=t+MjwPLrXzTQsHi5TnPbxEUco9FjLC9dNCLnfcvBZcRZqmbEQOgp0D+fOUozm+V1ViTp
	 3htUIA8J70H5qh9BlDWMDgIFftvT9Ty5+bwkmSH0L8v+InaLYLaECIIAwkwHYn75RecFd
	 Xi8n8YafDH+fwva0u+Zogm7gAIvxJA/b52vM1r1NO4lfriid+HZWhDXk3hfScoMwW/BNZ
	 rg2bC55A8L06wyXE2Xlj/kaYeccSBRPAEN/eBVVlkI64Zn6plKwWsx6bsUgv4kI9b+SC0
	 pjAxnvg9lOmM5dau8BKcpm6M/4+78aq/aBFvofMBlrFk7ReKBt5bNoLi+MCL08VWFdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T1GjEiDJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF086606A332;
	Mon, 23 Nov 2026 12:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T1GjEiDJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F67C1F0093C;
	Mon, 23 Nov 2026 12:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437369;
	bh=u19f3dVud/ZrmYlQFvC8zg1o8rPzMyXEdD9FHodVIm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T1GjEiDJe83q99JcoUyIxhWXwTX34yYk4MW1YMBRVLMsc4OSd62FufMMDYPRJgFkJ
	 bDkNnuUf87cAVZ1Wht8mswqUy2w4KPsbFhvQabRs9/SwZ3CYMF9yqa0dtXwxnZVJ2N
	 EMg60X+46+r2yqB50hpXWXjnU3cs1OkLtS/2Bye7DC0/MHLFUc/YRt6izJoNMudZj1
	 RwIIbuy2N0PksTRamtyt6K99zm945+tRcor5xjrbdP4sN3fGi5Ts1TyqGkQz2FCXLl
	 vZxxww150qGvcvOr8i4EYv5EyOLugfnfS2jJdyxiMP8Sh028Bzb4g6ZnpamBRaUIpd
	 Yyvcm3xz1NeVg==
Date: Mon, 23 Nov 2026 13:36:06 +0100
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
Subject: Re: [PATCH 17/18] dt-bindings: pinctrl: qcom: nord: add gp_mn
 function
Message-ID: <20261123-shrewd-boisterous-cheetah-1d5d3f@quoll>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
 <20261118-gp_mn_tlmm_support-v1-17-703f7badd194@oss.qualcomm.com>
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
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-17-703f7badd194@oss.qualcomm.com>

On Wed, Nov 18, 2026 at 11:32:48AM +0530, Taniya Das wrote:
> Add the gp_mn pin mux function to the Nord TLMM function enum. This
> exposes the GP M/N divider clock output and is used on gpio35.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

