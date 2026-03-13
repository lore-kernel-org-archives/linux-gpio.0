Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2638832E137;
	Fri, 13 Mar 2026 13:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773409168; cv=none; b=JetNb8T6IC0gmnzmFr9yBhyYnm0CMPNxyEQog/HXjtTpcudVAh/eOIOfiJjys/HMcEgUbyP/gqF8hRHRLgbCdgIYpixjpXH3HdbuKPGHZMKiYKW9lCZhfQiWRTLeg44gWgdY+sP676B9/LHa+RjjH+kk/K0tKbkQy2zRwqPYqOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773409168; c=relaxed/simple;
	bh=KWZSAbiyjrzLNM2qSo3Ip3kXkUGs7ZYJJB5Q/aqWnT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=loD98t8M1GQY+dyaizQ+bUCfZHDUGbiZxuH6M8BObKuOMiaCDwKPOvrEzaTzd/ylXu2mXp0zrcd0sovc7sQYfgwbjvPzgAXrYwHBN2Evb94q2KGH9gErXZIB8ddOGFsPB9TzOuNm2kF7wC4gy5GA9Gh3/8IrrpUwuCEsX8VsMkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxNon3Ju; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxNon3Ju"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346EAC19421;
	Fri, 13 Mar 2026 13:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773409167;
	bh=KWZSAbiyjrzLNM2qSo3Ip3kXkUGs7ZYJJB5Q/aqWnT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mxNon3Ju/MbjR7gDaOoInJKcBn18JpU5KIrveljutUqMhVAnRGm6HSdGUiMWgptyT
	 ZbTiz8JcUO3YeEgTDVS/oIUOCTzW/r2vQ2YHBMziRlyG/ad1kBXO7BwoC27o5C/PaU
	 bRPajOTudgJvEoXwvxozIztPGvZT1cCkpqOegnBA4Ux1xgGfbstlyAbmygbBwvpKfp
	 PL7OfrRL5xxn0Bu5TwiY/NF8DclcRSs2t/Py4642WrLNnd4rlESzTJvWrDWJAx5hv2
	 BD0mv9+IFKxFFxLwUoHy1tJw1a0ws4LR5Yb4a0NrNqNg+Ek0DDsMII9E9HjmHhEjmf
	 yW+0Pwxf17pkg==
Date: Fri, 13 Mar 2026 14:39:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, sean.wang@kernel.org, 
	linusw@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	hui.liu@mediatek.com, nfraprado@collabora.com, linus.walleij@linaro.org, 
	mars.cheng@mediatek.com, andy.teng@mediatek.com, hanks.chen@mediatek.com, 
	sam.shih@mediatek.com, rafal@milecki.pl, ben.ho@mediatek.com, erin.lo@mediatek.com, 
	zhiyong.tao@mediatek.com, Jason-ch.Chen@mediatek.com, amergnat@baylibre.com, 
	seiya.wang@mediatek.com, tinghan.shen@mediatek.com
Subject: Re: [PATCH 6/6] dt-bindings: pinctrl: mediatek: mt8188: Fix include
 guard comment
Message-ID: <20260313-cunning-fresh-rattlesnake-ab8087@quoll>
References: <20260312041533.187553-1-akkun11.open@gmail.com>
 <20260312041533.187553-7-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312041533.187553-7-akkun11.open@gmail.com>

On Thu, Mar 12, 2026 at 01:15:33PM +0900, Akari Tsuyukusa wrote:
> Correct the mismatched macro name in the #endif comment.
> 
> Fixes: 9f1bdd7e8221 ("dt-bindings: pinctrl: mediatek: add support for mt8188")

No bug here, otherwise explain user-visible issues.

> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---
>  include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h b/include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
> index 2688da2f621f..66a451953838 100644
> --- a/include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
> +++ b/include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
> @@ -1277,4 +1277,4 @@
>  #define PINMUX_GPIO176__FUNC_B_GPIO176 (MTK_PIN_NO(176) | 0)
>  #define PINMUX_GPIO176__FUNC_B0_SPMI_M_SDA (MTK_PIN_NO(176) | 1)
>  
> -#endif /* __MEDIATEK_MT8188-PINFUNC_H */
> +#endif /* __MEDIATEK_MT8188_PINFUNC_H */

No, just a churn. This has no benefit, because it is obvious which if/endif
this corresponds to.

Best regards,
Krzysztof

