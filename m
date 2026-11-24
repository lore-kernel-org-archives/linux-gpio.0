Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526067;
	b=Sp67pjhm//2mQ42YpuPOh0aczeK687jqXcRY2Dc7zF2A4nNRx0GtRlwGmvKus3cyGuLY
	 lxzKy4kE6qFwvJI4hy7zg8rCCKsxZNYA1o3VHZzoswB2auvN7hC7S63XZRzQBMbwXGExu
	 1h+8tDksS4wVvdBdSSDJMjXZckSfG2pcUgNnPRhXvusgwJXftswC20UbEgZvUMVZlOws4
	 aeSfnvIe4WrjXLtfF5kw3P3fwgL8FIee8LwZrOA6k6yfbU9+JgT1cPQ4fMXJWzKvB68hL
	 bMROBad9W33xnkc+9a0Matd5sAk0K8PFO4qmEQ6x9cTPK+Wj17TOXSoOt9DTxiLQ17A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526067;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=w7BiznOWgHLmpIv+2b3hWA7Y1QIueKgvuwOMsmguZ5E=;
	b=jdtrxp6KcwrBf9XoR5uUByEsQuk1iROZTflSrDcJkFU13/277lwwe/OMIIMwBfhX5Oa3
	 HMhCYU9P/eEmXyOX+7mJ5ExnOef9HPWiLADTQrS2wqAUckjb41+tyUgYLmUzHwfGm+ZDx
	 vxzqWe1gN51pTvwjXUzjtfrVtGpxhIVz8j+kVAYxFD1RQrYEJ5M0jrGTIQgf2NiYuQcfx
	 O/ym17Y5ghtz0dwgyrUmIBz98dvxGeWBPLoYX1eiwaFZvMi962jAvrC+yt+hocRlkgujZ
	 0Gher7vWCOeXqHlXxQM6stx5wHGor2531wWkLoBSTimA3DEYnmAYs0plu8jyfWR3eYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gOecnZJB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 0DACB606A31E;
	Tue, 24 Nov 2026 13:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gOecnZJB
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 1B58D1F000C4;
	Tue, 24 Nov 2026 13:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795526066;
	bh=w7BiznOWgHLmpIv+2b3hWA7Y1QIueKgvuwOMsmguZ5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gOecnZJBJuZCWB3gPCLGl1613U0tMxxt6MbXP++9jp6aB4919de/RjWvLNq6vXoGA
	 klSyLb2CoCoi37h+fGvvOcRtN0H/upkagp/jhQedYB//kDFqMCeSmlCfLfXjpXRIzL
	 AaYNEQqT8dHcH7Mcf6pNazfAhHK6qKI0cenoD7bxXMS6zAn0d8G74gihFEibWl5dpM
	 tRnDVET+KYFPH++BJE03On9MbYkEgZNU+9wBnGJe7jgs1ZNy/4alkh74yTrHQ5HOHj
	 K9E+PPPzDDzL++n45mdQV/GwVkXD803r6g9+TGZbj7vhoCvAc1wg4nzlVmyjJdMwGg
	 KuueZOoFf0/7Q==
Date: Tue, 24 Nov 2026 14:14:23 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: longzhao@ambarella.com
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Mika Westerberg <westeri@kernel.org>, devicetree@vger.kernel.org, 
	Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 02/14] gpio: regmap: add
 GPIO_REGMAP_QUIRK_SET_AFTER_DIR
Message-ID: <rjxlen54cxvhlbiq6uh5ytts6kyoz3v4hczh7bhjoxfsode2se@hesqdhe2vczl>
References: <20261118-cv75-gpio-v15-0-e3c563673fe1@ambarella.com>
 <20261118-cv75-gpio-v15-2-e3c563673fe1@ambarella.com>
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
In-Reply-To: <20261118-cv75-gpio-v15-2-e3c563673fe1@ambarella.com>

On Wed, Nov 18, 2026 at 03:42:19PM +0800, Long Zhao via B4 Relay wrote:
> From: Long Zhao <longzhao@ambarella.com>
> 
> Some controllers ignore output writes while a line is still an
> input. Add a behaviour flag so the output value is written after
> the direction change. This is a legacy quirk. New hardware must not
> use it.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---

Hi! Sashiko's comment on the return value of gpio_regmap_set() is valid.
You never know what the underlying regmap actually is, it may not be an
mmio regmap.

Thanks,
Bartosz
