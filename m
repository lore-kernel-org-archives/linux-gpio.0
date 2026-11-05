Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870217;
	b=FqMpUUV4KGMKVnP4DoXl/6Jl3pRxmcxLbujh0AraRb5mUB40fUl/mPbJH1Z/nGdYLKKv
	 AaOgoawARv4PhPXSHsqE0WSgKICPZ2cVkAaMKMj0zo1Hx7a/TUND+VTJLWTluGOYdu9YW
	 Tvc9yh+GglfNDjwCkgasRyiFLotmCSf+4ImCgUECGes/baR2RaT913hbOOlSQEvcZkB66
	 xWx0InkZZJW9QBC6eulsUeJYCI/qyDupHr/Hzmry5Ay3+CwKShL9Pr8dhJg5BI4CNlT36
	 Td7Oq6fmaMWrQTOOmqqy/e6f31QyfhOQGbkyW1mnmeYU9TiwOpokPhrCvPeKQCQGjJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870217;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/B0Xmlc6rqju+PGYvGBZ7ObHHOU978H/pVKBXVC450c=;
	b=Wz8cc5Hcp1yrBAeCFhixLSOYASGZfmiTYT6Ztfv+v3dNaPa6VS4gzF+UiZ6jYafBlB2v
	 WCRU7qWkkEzlTvDGHdqEe5JhBJvFMiCVA4yo/qANireJJZ03TAr4FMuf6QmCAcq7zZvtp
	 zzcR2T/+mLRIf6DSpi7zWR373Xb+9NB+GVI0otAHvW+8N8f2CZhMaqz1BlOeWxHpjmbHb
	 n0e2cwbuoNWL1PBoFXdWvAxFVX4oiZs0XVQARbO5qePus8QtYJz3bo9WRWWt8gjrFICHM
	 d4mXQcbj09PZmLlewbmLXFAWAgj2JG12zB26fft5q2aBpETnf1ONT0MVbW0oucip7Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HC0JHHUC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 6D790606A31B;
	Thu,  5 Nov 2026 09:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HC0JHHUC
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 763831F000C1;
	Thu,  5 Nov 2026 09:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870217;
	bh=/B0Xmlc6rqju+PGYvGBZ7ObHHOU978H/pVKBXVC450c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HC0JHHUC5Z5QpI80WWJFrcZSG4CosWdR0f9odz1ECO3x4wIw1Ulvrt2YFvWQtkmRu
	 3d3YdGB2XcUmo4OwP2kPrRi9ffMNewsW5dhoq4mTzvM45FDe0U4HYPLff4FZn9eTxl
	 056Toc79tGrHywmutZ05+c7ofdS58KiFpBNwWekl+wazya/1Bh5xrfollvSvks4ZgR
	 0HSlgrWpCwR56AB9NH4WR0u8wJylSdZ3IqwqIdKgBGErua8pJoKfMOAWxYixrk8unm
	 U2QkfSgwue52r3ymp029rmX5pZmDQyIS6UDgSDe7EIbL24IS1JlBZOdacBzNzmvF1W
	 7ZMHjo3RKZFhQ==
Date: Thu, 5 Nov 2026 10:16:53 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Eliav Farber <farbere@amazon.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/4] dt-bindings: pps: pps-gpio: document optional
 pinctrl states
Message-ID: <sapqrnp642h5yfewtei3qscw4tycwt6htndixeefzuouvcrxva@6kmmovqx2m4f>
References: <20261104172912.26456-1-farbere@amazon.com>
 <20261104172912.26456-4-farbere@amazon.com>
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
In-Reply-To: <20261104172912.26456-4-farbere@amazon.com>

On Wed, Nov 04, 2026 at 05:29:11PM +0000, Eliav Farber wrote:
> When the PPS input GPIO is routed through a pin controller, a board may
> need to mux those pins to a different function while pps-gpio is not
> driving PPS (for example after the driver is unbound or across a kexec).
> 
> Document the optional "default" and "inactive" pinctrl-names and show
> both in the example. The "default" state selects the PPS/GPIO function
> and is applied by the driver core before probe; the optional "inactive"
> state, when present, describes the mux to restore when the driver is
> unbound or the system is shut down. "default" is pinctrl-0, matching the
> implicit ordering the pinctrl core already assigns it, and "inactive" is
> pinctrl-1; the driver looks each state up by name.
> 
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> Acked-by: Rodolfo Giometti <giometti@enneenne.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
 
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
