Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96AC3B19D9
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 09:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786355451; cv=none; b=m2U1J8uVt7t15nX+Qws/bIxi+sVzIiR6x6CDqusckmEfIEcL6vIJh6mX0sJzea/SmpFlueD81RzCkR04boQb0ojsBWWA9WOACnAzboEQbLH6IS5NFgpZxlH/8CSxqmFe3Y7WkygZvo0SgTJmD9dd2jeN+Csuqob2nl7ka9mpc2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786355451; c=relaxed/simple;
	bh=eKKA2wVfs3fRtZhBV9VXaMEroXhSxr8gOQihnyN6MEI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qfXtmmBuPgyi67cQsDASDEvxQJsUwZvIUFztN/NMfbY8jsKBStmdP7sKI2QHK5JIXzeA0Oa+v+9WxR2ndw7czoDHTOEgb6bl5CGpL/RSFw6HG/38iORpWyl5ILkBC+mAMHhm7fOdvImxEhWrCLDz9PFhiR/z+obxwljMuMdsYuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WR4bzl1C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WR4bzl1C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EE11F00ACA
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 09:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786355448;
	bh=sX5BJdsbPs6K3GAF7gpY60L1LFPFfMvdnCsZbzPTZA0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=WR4bzl1CYvRCP/4gARnJYBb7GZw83C4jwYxqjbsHETeQDNkNElXbhwOXU0d/3Jw9w
	 G+FxADOwTcUdQBQgRPNOg7vIZ36MUUNgOcZzLSn4rcrvVC0xauo+MUS7RNAtfmMj5+
	 ABd5lTKcCtoumgeca48ygeu0qeHjsYtyBiQzkkE95KWkz0Vm96hMjQuvaJHbAY05Xk
	 UWFfMJt+2vEoaBYOUXwq6uw1SNfI1S1uTePgzCuCH+eG5WgVsthl/0CONDfu2WRD94
	 9h06xp34Y+mGbCwR6YDwR22puI1MDNRQ8/oV3EWNDIleail8MkAkMDvO+k87vOiR5P
	 xhLOHlXBVaurQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39ca300db70so11090211fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 02:50:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoYILj3Vn32howcNEBfQhqW9fqPN/Ad4rXgxK19ndGcBAc7lo5GTEMoFuXTsGaDikoHUYLEGWXxX1Hp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8SoetYf4KubnfIVCqzrDb2Xp+rMIrprAfIKtwe5HStVmbszle
	MVhSDMC6h+iHMAH0Whaj3kdfr7GTOjrituy6N1pBBreZMrzzmeayfbimZNP2NbOELTDJ6WidQmX
	O8/x8lnpcrZ/IBeYlFQ6iAubKGynDoL2VrtZHPD0xDg==
X-Received: by 2002:a05:6512:3b85:b0:5b2:f426:9c67 with SMTP id
 2adb3069b0e04-5b3181a76c4mr75248e87.19.1786355447012; Mon, 10 Aug 2026
 02:50:47 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 04:50:45 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 04:50:44 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260809-kuno-soc-support-v1-13-5e0ede4a0c72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com> <20260809-kuno-soc-support-v1-13-5e0ede4a0c72@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 04:50:44 -0500
X-Gmail-Original-Message-ID: <CAMRc=Md2_8VNJFvuteutFN1gpzScCnqqT7xozkz4eWw+dzdkSA@mail.gmail.com>
X-Gm-Features: AUfX_my0AaRg9hbEneJhdebl-8K9qSTK5y9JJLbzogutLOHMgM93bP3H64RlhRg
Message-ID: <CAMRc=Md2_8VNJFvuteutFN1gpzScCnqqT7xozkz4eWw+dzdkSA@mail.gmail.com>
Subject: Re: [PATCH 13/15] dt-bindings: firmware: qcom,scm: Document SCM on
 Kuno SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Georgi Djakov <djakov@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, 9 Aug 2026 09:27:12 +0200, Hardeep Sharma
<hardeep.sharma@oss.qualcomm.com> said:
> Document the SCM firmware interface found on the Qualcomm Kuno SoC.
>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> index 037d4ad8f718..ecee5aef65a7 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> @@ -37,6 +37,7 @@ properties:
>            - qcom,scm-ipq9574
>            - qcom,scm-ipq9650
>            - qcom,scm-kaanapali
> +          - qcom,scm-kuno
>            - qcom,scm-maili
>            - qcom,scm-mdm9607
>            - qcom,scm-milos
>
> --
> 2.43.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
