Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437358;
	b=Ez+Gz6+PKL8ff7/Tj6P3uoCXZ4hn0NtSHESyti6vh3UB5jtsx1DDQKZ1pnnlXOxICief
	 g35oVkJFaaXS71nwPL/XuYuX51DoK8/jZRlPOleEbBtNlhpD3Gq1Z5771gaZKUlZrEbMO
	 uZi2Yk/UHa/N0Alb1pBGBc6mmFqSs5VIhtSwrwYOPLzlfUp/AdW98kwDmjrqroLclhpf5
	 NiB0mWH/Z+t40q11J9OzJqOd/gRot6B98qa7GQLxxBym6gA4m70dec4DmdlEDkijWTKdf
	 DCuQsOrDkM7uPCMnHK5rywCbYmOGjXpP7dyvEccU3lWwpg/pQhP5ozYSBL91bbZF4vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437358;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Zy4Hmk1KRDGEYBFZwp5X9e/TViOhqR+ADksK53iFkYY=;
	b=BU/Kyy8CvoywHJ06eWKrs9BZCNL62ZARZ736UI/Qt+gFDMIti9Hhoi+9gMHE/2C9VYkH
	 nOZI1laCqAGdOqISqeZNgWKeQc9YYKn7WXAJOQi5+jRJQiGNTUIa4b4WSJlrzVSIKajiU
	 ++GR/OT66gPSSzc+b2widC57+jIf/UrBIyO6RND+mqu2JoPAh+zvs7PUWFHowqIPaWB33
	 itQYjHsovpbRzs1NNC388p3kqsQ1DZenvTmRnr/fzweOolxfunvljP6WelsICM1hACoUa
	 ymHS0uv5bClvGroDLYMs1Y/88BwytNX2arcFuEdczVdaKcRFbIwn/OcTFCYA+nlM1Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jPaN9qp1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E20C606A31E;
	Mon, 23 Nov 2026 12:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jPaN9qp1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 223441F000C4;
	Mon, 23 Nov 2026 12:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437357;
	bh=Zy4Hmk1KRDGEYBFZwp5X9e/TViOhqR+ADksK53iFkYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jPaN9qp1Qrmx0G5M4O9l2lVfMMVJ5abwhWUK35qFMZcDPXwDERMje0EKRNE3/Bukp
	 gy7u5H716zjjJCbgqRttp6A4q+AiDKuC13NmeR1l04HNtennXs0QFlfVMlGEpaH3br
	 OkUZgKE+dMIkBHngYIGZ/Zn/d82dufN8t8apkj7BrpBUl/MDMdX79lOBX/c7uKoc2F
	 IJ1FFXUWy9ZzUgbwVCMomsc+hTLIjMadtLA5N7lnM5ed5Q44e4azoupofcwUCvGGEu
	 +qsKxxITahpC3dwKhZQNdoUPCoCjQWqsFsRjQpQSR+cyYkBlxjayndUfcsMj+m8R4c
	 GcxcqKMIzZBYQ==
Date: Mon, 23 Nov 2026 13:35:55 +0100
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
Subject: Re: [PATCH 13/18] dt-bindings: pinctrl: qcom: glymur: add gp_mn
 function
Message-ID: <20261123-optimal-mastodon-of-prestige-17a3ae@quoll>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
 <20261118-gp_mn_tlmm_support-v1-13-703f7badd194@oss.qualcomm.com>
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
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-13-703f7badd194@oss.qualcomm.com>

On Wed, Nov 18, 2026 at 11:32:44AM +0530, Taniya Das wrote:
> Add the gp_mn pin mux function to the Glymur TLMM function enum. This
> exposes the GP M/N divider clock output and is used on gpio53.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

