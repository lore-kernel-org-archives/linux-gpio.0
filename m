Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621800;
	b=2XHeZdw+JOUnmLZFvZzRAOJovfEIk6oYsLFvbcJGQR1y+l/nSrx4ptw5qqFkx6qkYoAa
	 3DmQRL7SiLCbLPdjl3+EKCSskrjy6/HrvXnOtwub8k4+G7H63ZrWZmSPBqTaH5p5W1cUS
	 178tJc7F7iXaSvrXyOCnByAWLVFlOBQQkjEz9GOCR0zBqs9oXDbKan/o6jrIDS7dgCjYO
	 n1cuh1qTouyiIMLdoCrcNYQ7+d4psfcuPGJ3buVFTB62E9pgLMVFxj/fIOVLJrIn8jZTu
	 rWS7CTW5VCxPQNZpEabKpI22TZhECslzOwd8yjPObdRK9UDDf4KNGlkr3qnViSD4atQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621800;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=lReQU7NxzdyMLitEYTvwzWGfAmtcYG6PsRCCypVAxzs=;
	b=CpuqG61ZAb1qcq8HgC58mUwnWAbEF2oMoX81IZB0YyLKZJj4jtCbH1BJsE0t/DAzE6Nz
	 jPo4JbILqt4YG0E2j4sNbNWXrbrl6bvnWUFq+6Hjv/Yr+Q1hZrM0NhDlXTVS2Ppmv51qi
	 IiQoTlcfMaTvCk7/rOgO7KrFdRtUhEh7P6NRbFPBXPI1sixABvSQlqgM6nzJbMEum0Nkq
	 NnIMJpnGscOH3onjlLhAdFhf6Ttwg/eAIL2s1Vq6uOjyjMUGELbIpQ9LZUqlAzbNnySlP
	 Ts+bXRAXR18eCvxOfiW4Zqxks1mW5KR5YXYTZnXSwbgVrBbDWkdqdC7yfLeAXmRdndg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcwhjSj5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id BB119606A329;
	Wed, 25 Nov 2026 15:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcwhjSj5
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 51CAD1F000C0;
	Wed, 25 Nov 2026 15:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795621800;
	bh=lReQU7NxzdyMLitEYTvwzWGfAmtcYG6PsRCCypVAxzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kcwhjSj5mCqxTTL5+HrJ8rdC8TQJrCBNEXNJ6m0nWYz0CFvD+eYim46rHqhjVLQlk
	 +o3DnzrC4kT6wYlje1joZuoI2JUatQ/K30dY5KNDbjItjCGQhCaVX2jqSVueRgx+hL
	 gKCossHBXSyKY9+DF6TXn5y2PoVugOU3oQMoU3l90VlS39VCi0lPTBD7u+7JeAJmgb
	 Q+HkSI4NyF8kWHoIcrixmj5Yh+Up7SnGMGLRiSnrWgKTrvfPhAu+EiQfaoLiUg3cKK
	 BzeARjMlN5CyFmoaEPJ2Wdrgsf0TJxF00EdCS5Kgu1G+LxZDcrIYJvQrhV+6gZwaoV
	 AFuSOFBvNSWBQ==
Date: Wed, 25 Nov 2026 16:49:56 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/10] firmware: arm_scmi: add an operation to set the
 function of a single pin
Message-ID: <saazm4ffmsvhbbohfdfqphfvhkcfnbagnkcwaguctdylhgh6tl@4a5fi4es3klp>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
 <20261123-clegoffic-pinctrl-scmi-gpio-v3-9-d61f039be008@baylibre.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-9-d61f039be008@baylibre.com>

On Mon, Nov 23, 2026 at 04:21:31PM +0100, Clément Le Goffic wrote:
> Add pin_mux_set, which selects a function on a single pin. mux_set only
> works on groups.
> 
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com> 
