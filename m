Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42158304BA3;
	Sun, 12 Apr 2026 09:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775987329; cv=none; b=exYz0dJm/p1QrBLk6evcJPcRiFtVXHjm9YaqK1diykN3ZfSEDqAViRVNAacGrfmXWBz7Q1kSuyi1ZwvMPQxpkddWgjiKnp3xx5OPD4ENH+p11yKxS9bX9GfHT8LG6Ad6eitiFj5DjcbeO6eLZ2sBWJ0nCls0bTdYu/w68RtjZeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775987329; c=relaxed/simple;
	bh=gOPiGli9koGij5DXb9x/NWM4UfSOi83jDyeZIdZk5n0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eH3WbpU6G6050uu+9jzR2xrlvCo11fQLKD9bmPAWsHNCGIA/ni/SCktapHizQzepRD3nEheQpPQCd3PlNjOH46uoBOiFd/NKkq/KWOJd7sek/uNyC/ZBHUIXMCSLAgSidBs+T2d3ZgLycCKXHCWucb4HICqyszo07tnMiNTgXBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DeZ8RlGP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DeZ8RlGP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED757C19424;
	Sun, 12 Apr 2026 09:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775987328;
	bh=gOPiGli9koGij5DXb9x/NWM4UfSOi83jDyeZIdZk5n0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DeZ8RlGPZEcItgirMcg2ckLfLhxaNG7TTp7pArHCiHwgnwNGa6ve2pU65P5rP8l+f
	 NlTeLMl5GmskQaI1Vd3hAWynvy0Jl08sJ01eLcsjBYkvsRg58yD5YgFnx7cREGe68D
	 dfau4L7997rWCpu8ygmtHbQTnbSsGMxkr5fEhr6o1mFrh17S6WT+cTPZ7clSxXkPS6
	 tnuFHnxhxB4VQjnEwlFN4+yaqWgaDrtAPjQK0Tu6WKOob8TDNAn4j9qOrQnPULlfHa
	 q8W7voa0mwdO2MjI8vIMGYK9oqm4uFCLEh6ExKSXVXGu/LBr50XMraeUz56/wsZMI1
	 uvefUXIP8LouA==
Date: Sun, 12 Apr 2026 11:48:46 +0200
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
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Riccardo Mereu <r.mereu@arduino.cc>
Subject: Re: [PATCH v2 20/21] dt-bindings: gpio: describe Waveshare GPIO
 controller
Message-ID: <20260412-diligent-ginger-flamingo-f5059d@quoll>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
 <20260411-waveshare-dsi-touch-v2-20-75cdbeac5156@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260411-waveshare-dsi-touch-v2-20-75cdbeac5156@oss.qualcomm.com>

On Sat, Apr 11, 2026 at 03:10:40PM +0300, Dmitry Baryshkov wrote:
> The Waveshare DSI TOUCH family of panels has separate on-board GPIO
> controller, which controls power supplies to the panel and the touch
> screen and provides reset pins for both the panel and the touchscreen.
> Also it provides a simple PWM controller for panel backlight.
> 
> Add bindings for these GPIO controllers. As overall integration might be
> not very obvious (and it differs significantly from the bindings used by
> the original drivers), provide complete example with the on-board
> regulators and the DSI panel.
> 
> Tested-by: Riccardo Mereu <r.mereu@arduino.cc>

You cannot test a binding, it is not possible. Otherwise explain me how
did you copy it to the device and what sort of device runs YAML.

The tag was given here explicitly, so I really do not understand this. I
could imagine tags coming from a reply to the cover letter, but adding
tag here? That's just fake test.

Best regards,
Krzysztof

