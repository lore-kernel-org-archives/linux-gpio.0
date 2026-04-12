Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D7B304BA3;
	Sun, 12 Apr 2026 09:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775987191; cv=none; b=hkkBvau5Ure5Oc4MKEplouWFf1x3TqO+4yRMpaB6qB5H/t1s/+re/crxA7AppMuQHpfJZE/tH7UpaUJd5ao9PtHVFbGFEyiLDhPKtlMpZFc1i9AOZt7acDJNrCm7pSXCIiCLXhpyr/7xv8FoOXgFko5rPZcDVWTpZ4SuEWFQG7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775987191; c=relaxed/simple;
	bh=nPgSbCNxr7x931h3Kp36EpB/gWK7CWRUP7ZCwnb0Im4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dTP+Edqvc52oWI2Zoc6Sh6c00dnlGG/Qn/AOXMkISvYl6y1G8KsPonK4yjBF4hiyFIIbjHXEKn30jXubNwJFlycicEncNZPIvY7ceQtFPtTfyuMIa5j4Ym/9OPoQ0EpZ9ov5d2LqkNcaA9CTxukHef+adH6mwLJsio2AucyxIoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BR+WU5l1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BR+WU5l1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7715FC19424;
	Sun, 12 Apr 2026 09:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775987191;
	bh=nPgSbCNxr7x931h3Kp36EpB/gWK7CWRUP7ZCwnb0Im4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BR+WU5l1bsDh9dHDmIEbIZs5PR8yTvQuDAkPxyTBNZtBw1cgQYgEWNz8xUVTuA86M
	 zMzCkWf4s1sNwdO1hD19umdcJPIFuEBFTb6bu4uLWc1siF9jya73jHhdqqY1J9UcMO
	 rIU6BBQFvic0LVRAd3UYVWPjxyv286Sh84UcYGeEfe0rhZvlVwkJOuBMRkgZ8MSvrk
	 ycGlShq6QBTHKoggRFiJDu2R8MD43b7U00FpwHUSWvWXpkhieJPzxlyKkp8bCakn5Q
	 UCExx+kb3RKDWx9DKX1MoUl04CkD5Ix38XIPVgP64G6ZefxrPgNEOouF57A+S5A3vq
	 psC1ZoxQaYO9w==
Date: Sun, 12 Apr 2026 11:46:28 +0200
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
Subject: Re: [PATCH v2 04/21] dt-bindings: display/panel: ilitek,ili9881c:
 describe Waveshare panel
Message-ID: <20260412-towering-limpet-of-sorcery-eca955@quoll>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
 <20260411-waveshare-dsi-touch-v2-4-75cdbeac5156@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260411-waveshare-dsi-touch-v2-4-75cdbeac5156@oss.qualcomm.com>

On Sat, Apr 11, 2026 at 03:10:24PM +0300, Dmitry Baryshkov wrote:
> Describe Waveshare 7" DSI panel which uses ILI9881 as a panel
> controller. This panel requires two voltags supplies, so add separate
> iovcc supply.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

