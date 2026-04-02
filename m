Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DCB1A08A3;
	Thu,  2 Apr 2026 08:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775118633; cv=none; b=W3b34A89jp7imqaJv92qQwN9SgU8f5QU4B+8tcUAM6/cY0iNjOciwKSXcllc08Adfgs3F9JxoLawU5FHwQkbbq/lsfUK0dWCE2DP5uehgHsdc/fJfg9+ITu/ZO09QwjThdkf0E0PxdhBueOmqpqBborbeFOGfKVg0LLGbHwSH4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775118633; c=relaxed/simple;
	bh=HCgPWV6T3P60SAtKnvwq/8iR6b6yFifI5uLic24bmj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGhUQaicjbr6JMjKCzp+pXYFNRB/RaU5BRNEcj7qfLerU3siJgPF/cEzl+MeStS9VCty1akPiDEr1XwjnkIUY2ptWXqeV3F1XeYT1ij5tShxFoh+XSL+JhYTNEmr6U6Hi3SgiEsTkHRCzxA3OHQEgEpEQ+pNSRiEmQv3H643LDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zt6ZhL/z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zt6ZhL/z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9530DC116C6;
	Thu,  2 Apr 2026 08:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775118633;
	bh=HCgPWV6T3P60SAtKnvwq/8iR6b6yFifI5uLic24bmj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zt6ZhL/zQ6kNez7OX5q5nWKdOA1t/UBDJDPtfvbl+84/DgflIjTm25t5LckIWEU8m
	 rY7R2LPNiJ+rg1XDvPG6jsq2uvPEm9II7BgRpSfFwp71ArQKepkelwc+eB4L6kCAR1
	 qyXlkhxjWLkwfXhvIM3orvDrhQrKh11vWUxfViF+grEfNiAoooOHmTVzi29XPgfXi8
	 ewhdTsMpXLVym5SlhF0qtuoyDbjsQQVFMMnQZhB6ptrY1GNHrMSzWc8Ce/dyrmguKY
	 sZwWYaoegkWUEmjYz48VB4oDRAQilZlxXKpwYezibEzGrSgc/7UboK7p4KrzJN/HA0
	 FJDDlP2EPzyfA==
Date: Thu, 2 Apr 2026 10:30:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
	Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, 
	Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 02/19] dt-bindings: display/panel: himax,hx8394: describe
 Waveshare panel
Message-ID: <20260402-masked-vulture-of-improvement-8ae3af@quoll>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
 <20260401-waveshare-dsi-touch-v1-2-5e9119b5a014@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401-waveshare-dsi-touch-v1-2-5e9119b5a014@oss.qualcomm.com>

On Wed, Apr 01, 2026 at 10:26:21AM +0300, Dmitry Baryshkov wrote:
> Describe Waveshare 5" and 5" DSI panels which use HX9365-E as a panel
> controller.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> index 84e840e0224f..83c343b02835 100644
> --- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> @@ -23,6 +23,8 @@ properties:
>                - hannstar,hsd060bhw4
>                - microchip,ac40t08a-mipi-panel
>                - powkiddy,x55-panel
> +              - waveshare,5.0-dsi-touch-a
> +              - waveshare,5.5-dsi-touch-a

Same comment about style.

Best regards,
Krzysztof

