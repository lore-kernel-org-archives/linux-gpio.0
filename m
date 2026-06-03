Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506743C768B;
	Wed,  3 Jun 2026 15:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500425; cv=none; b=FIPWcqTqRGk4dCRkVTYe2rDps39055guHBDBFrKLHIeNQmTZowSFKnRoSxL+Qjfuryn5Ychvxonug1V5q3dV/aCtV2575Bm8wCvKG4bXZgzsLJXQMPAD3KjtGVG5eezrjzBRxr6RDzo1qFHmXLndKcYXohM1hwyGfkr1Tm87HYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500425; c=relaxed/simple;
	bh=cpn4yTiiAFRkkaUNW5AykQVAabdFWHsRgND/Y/Ah4ng=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uOqUiA2YgDovQtBhH9myBpShWT2Vh557TMnC+wIIuOigX+7NyPkxPBGDzB0Svg5DIbpkQ/DRrWTXqAri03oTiGQA00WDGWB8Ttt6lvTGSiRUpQFF30Z1JzynBihQnzZzNlkwv6gfYjuI6FeHGR4Gdk3BNsHlHJwY38xUruhZ0M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OAOVUiJu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAOVUiJu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24CF41F00893;
	Wed,  3 Jun 2026 15:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780500423;
	bh=pvh7WBcpCvjV07cjJwkDV/jigGYo8N5l/XgPWfRuj38=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=OAOVUiJuQXRzYuxKCuZRwqjJEuQcg4H7nvtvnyFQHEubfZtjMHF6kjKcKzb3TueIV
	 ZUPljkvrBfJWRynZNImFHR+R1lz1e/yEp1gH+E7vW2qVgljFLClptf+z4u0NLjtdBF
	 6C1ED51CJ6gy6ICGe0Qg7v7l3Z4Du4UHZnTE669gK5J1D9MO+xafxDwKTC/6qgZ6qN
	 ZMHPfOE925OfI/H7wSlAi5vY9c53DWh4oSSrQsrm2eIOUFfZ7TqQ/GsQGuJ3SaU6py
	 j0kAXF3mJyfTYBvn1n2b+R6SfZZYf8VwHPSb/fDSxJCZWXO7VoiHIbEnULm0Dv9TBl
	 nGANlH8vaIQqA==
From: Thomas Gleixner <tglx@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Sneh Mankad
 <sneh.mankad@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/8] irqchip/qcom-pdc: Differentiate between direct
 SPI and GPIO as SPI
In-Reply-To: <20260526-hamoa_pdc-v2-4-f6857af1ce91@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-4-f6857af1ce91@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 17:27:00 +0200
Message-ID: <875x3z7igr.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 26 2026 at 16:24, Maulik Shah wrote:
>  /**
> @@ -92,6 +99,8 @@ struct pdc_cfg {
>   * @base:           PDC base register for DRV2 / HLOS
>   * @prev_base:      PDC DRV1 base, applicable only for x1e RTL bug.
>   * @version:        PDC version
> + * @num_spis:       Total number of direct SPI interrupts
> + * @num_gpios:      Total number of GPIOs forwarded as SPI interrupts
>   * @region:         PDC interrupt continuous range
>   * @region_cnt:     Total PDC ranges
>   * @x1e_quirk:      x1e H/W Bug handling
> @@ -104,6 +113,8 @@ struct pdc_desc {
>  	void __iomem *base;
>  	void __iomem *prev_base;
>  	u32 version;
> +	u32 num_spis;
> +	u32 num_gpios;

Please fix up the struct definition coding style.
  
