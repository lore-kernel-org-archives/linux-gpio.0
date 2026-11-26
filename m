Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701963;
	b=Qy6JUnu9T4pxfR/omnUDZg8XkwYujDwfYfXenRDZH3ZdNIlMm6NvuUw6qkF0kmuWMl92
	 4b73jpcZWYZne7X9Hd2Ep4LppoF1rLQjkwYWtNyIuLaJUFHLojYk7JyIq8OSUlJxQbput
	 KSbM7oEooPibNnKirk+VPGq/8VPXPpYH0XT9/lpmNzBttpGEjTl5DW5IhSRcJSfw/jA+t
	 G/MLEgPtI708ayBTPBAH4m5NnEWzHG/AAqhEfp/+hxXRSjyR/jIpiANAFO1Mp3wJMzrQ1
	 FfoXNJGdYss++cOuLb0u+KGhSa79t+sUiaonOL0CfIJhIoK2jjh26Fn5FAx/n4YaoYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701963;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=45UpaWgjx87bjJDjsLj0OixcNrok9DROeuWasKD9Kk4=;
	b=tsALAFlvGD29vdj9lP7fgwmc53/uh03TNCK17MHtCK5nNbrwm3sgWj3g9tYg/LyBKTet
	 j8qQj3Ve6Zqa6pyC9V+BjBpODz3EjLO8wRBmwtWijLejmetORzTLHs7G5c0AoSk20MH8c
	 KVCCN8XENjLS/ClHk/e8AjRGDNbINfM7enUDptDClSeDJcKqV3/KWsfZ3g1/M9rQPu7yh
	 I41YtE6GWm6n+xxqVjzNRSuQyZArpr+4BPGD3y5Au6eIActQ0tcdMMt0PYRB5WuoHH+Jn
	 PiYeYqbz/dV9irj2/nhXYJ93W3mScL7vBPJ8MtoNmoae01AjzNIOK2UgnMvO+IUV+JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KpLO8Roa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 09F0C606A31C;
	Thu, 26 Nov 2026 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KpLO8Roa
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id BAA2A1F000C4;
	Thu, 26 Nov 2026 14:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795701962;
	bh=45UpaWgjx87bjJDjsLj0OixcNrok9DROeuWasKD9Kk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KpLO8RoapwftBSbkjm/Yg2a4HH1tbo3dmGXG63JNWk49lxRggq0b4cj0WbzUy8nEv
	 ArgzAIUIa4vlB9ajXb5JwX2oJN/8i4HAFOnfYSitg4uU4FFf7XDqXnMEIffHlHsipX
	 EP55DzLjxb+IYuoVchWcns4tkJ5KwCvQ7rM6nzfP2cOu1C4I/87tWdRzmPkdbFwfsI
	 gU50tAn+Zaz3YM+FNHHLzh9lAVrOOlYAaIJe14zyfg7cQbVk03vEZ6S2fiveq0p/UT
	 NIU7Cq8I90Ka81hQwdYo7N38TwG17SidU1s4v3YHs0l+hSiAjefr4pEJL2ygZZE3K3
	 59yr6d5beY2dA==
Date: Thu, 26 Nov 2026 15:05:59 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add Molokai TLMM
Message-ID: <5tej5x4vqx2vfhe2f2djjfdjd2nxvvrib2wirobmlbtaozqb6m@ghssr2pzz4xr>
References: <20261123-molokai-tlmm-v4-0-eed6eeaacc70@yahoo.com>
 <20261123-molokai-tlmm-v4-1-eed6eeaacc70@yahoo.com>
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
In-Reply-To: <20261123-molokai-tlmm-v4-1-eed6eeaacc70@yahoo.com>

On Mon, Nov 23, 2026 at 09:33:12PM +0530, Venkat Yadlapati wrote:
> Document the Top Level Mode Multiplexer of the Qualcomm Molokai (SM8845)
> SoC. It is a Kaanapali derivative, but has 205 GPIOs instead of 217, no
> SDC2 pins and a different set of pin functions.

While looking over the pins reviewing patch 2/2, I noticed that it
very much does have SDC2 pins. It's a nit but you'll be sending a v5
anyway so may as well change it.

Thanks,
Bartosz
