Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870250;
	b=hdLJ5lczaFjuGdcXhTEpusYJUx15qIwfelJZlXlAcDhJXCUlwjX0+tocmUVoCGb3y3Gp
	 qCk/+HbEuv/WxhtWz5YdfGVspOioX2spe85PKUFn+2PRc3nlPKSsm7RMorfNC1hDdDGy0
	 dz5ntXf1YTiWuNZB3SeHl21B2HY7ssiS55ILqTYJXAGRF3Bdy5iuXZ94ejfevSU800sTb
	 lLCok76XzjiMUZ9MecVKRGnSFR/v2fQL/gAXbdCLJtJRDplPWLyRAZxGz80FNMvv0+bFS
	 1U46K5/qIwCW61E9O7J4WEwio+Mpx70DqE2NMZ5CuEwvuobI3bCApqekuxuJ5qkrRLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870250;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1jo/0g0Rac8EcQu0nPi2PV0kGYLgJhM9WEAYmcvbWnU=;
	b=16arXVbohztvnX1SJXUEDgCtbcWM/m20NOnxTVzsN2LHz6KZMkL9tDA5nJbiOvlG/jc4
	 Y2wXK4DuBWye+RmIGTVGnZ6UiIPcR1E+aN3vdN7rv1EpP+Rbbj5W9B5i9vHhAk33FTtff
	 nhiR/mLY399pKZR9ev7QoMhTo7+RfWcF+2xRxscbWImSfvsihTesKI+J96M+/bHJ21ebL
	 yt6WoEpZAUa+j/DmMUWWUrYZ3IXA5PFFuGZJOK3/zl5ohFvuLX51AZlCypzqsiM2jvuzG
	 ULGcfCPf2guiRKvvISltcx0V3JtuSzKYozMXwTTtHgYgGaiVWRlhnwJmdqHwdNFTx6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O9dVOGnZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 11BA6606A31B;
	Thu,  5 Nov 2026 09:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O9dVOGnZ
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 0B8581F0093A;
	Thu,  5 Nov 2026 09:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870249;
	bh=1jo/0g0Rac8EcQu0nPi2PV0kGYLgJhM9WEAYmcvbWnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O9dVOGnZXzXrIgXv4dzoCyS/6UmllahrrXxQ4KBMlyXf/h3lPuxoDNDUrNd+KaXAf
	 2/DaParZw/VksLVJd8IhTphXxssJJdRq8IwsV69SOZg2/tNs+sO9CngNxkRchxSFDx
	 FcfpMXckRi/MZ9FGcwAKE1footmnIgK8qnhpRlaIyWjuwqXIiGBlUB6yr76UTgs8lQ
	 F+3K2x758sEi7zPbcPeyD9BhhoxJiPO69AuzPfnyCayHgbDXHYV4IvsGUCdxfTh/WK
	 sQCLzTOByRHzYrxt/r4pgXNsuUAAMEmzO/vShK6vxYsIAPY97BOqJlt85uPMdkYFAC
	 kjoTJm8hu6iwg==
Date: Thu, 5 Nov 2026 10:17:26 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Eliav Farber <farbere@amazon.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/4] pps: clients: gpio: release pins to an inactive
 state on remove and shutdown
Message-ID: <3tbeowckykhek5oc3de2hcxzh4hld4zs5nc3yf3yu35ckv42vj@dz4t35nfrczh>
References: <20261104172912.26456-1-farbere@amazon.com>
 <20261104172912.26456-5-farbere@amazon.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104172912.26456-5-farbere@amazon.com>

On Wed, Nov 04, 2026 at 05:29:12PM +0000, Eliav Farber wrote:
> Some boards route the PPS input GPIO through a pin controller and need to
> mux it to another function when pps-gpio is not driving PPS. The driver
> core applies the "default" pinctrl state before probe, so the pins are
> muxed for GPIO/PPS use while the driver is bound. Nothing, however, hands
> the pins back when the driver is unbound or the system is shut down, so
> they stay stuck in the GPIO function for whatever runs next, kexec
> included.
> 
 
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
