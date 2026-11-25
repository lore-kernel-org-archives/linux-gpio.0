Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621816;
	b=GqKyuMjzFpeBZVX5kvgZQA5rmLKfLTh2zva8FWpT+tl81gfwR09mnt48VzYAR1AlrHsx
	 qu+qWiG+86AgUujvIY8iquUEK3PRm9EfhRtv/uO5YDdPig9g5M8hO7gLbG8s0uBph9eqo
	 heFw/DBiOnPBVl56cGT6/ffCj27wonN6WjCFkmMHcfOEJujZnZSH+OCnvYcwPcsRnXGLX
	 8LtHJACGymTKqwOYplKc6/3xhkkuAdf52+JIIMX12WmErCA63XXHH2AZ+UT+6xlXhvlMq
	 cyqxJVDLk70+ZC5NOVO+0BBWq/JHiT2lUVIZ59OF5zqskHUad9NPp9XEUE3PFkPNNTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621816;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=tb8wm//Z2DWHkQayZbIfmLnJvc447+MeYyV1guYLOyw=;
	b=zD34X1I+Gk85OF16Jvt1CBThYd96bYAQaKaFuPGbzS12A2cfvckWXsnr/xB7iGekiJ5L
	 zrdU9UN6C6QLTX9diQyoF76yUXJj8cwVN1oEkVorfBRA1pPh7iaEhKNYDADT36zElUFaK
	 oq/6FVZVzXl96pUgS592drP7e8crg5gxHOrnwUACvSjb8PZaofIRsSb5w9QP1U/h7GofU
	 45+gcQ5U+RjLPTY2Vhr7hxd0wXVAGlsBEjbQn+xKYfaKiUzv/tR1/iIYgt+NyU/ikdfLa
	 Wb4N84Ck5N25ntF+vCqN5UsldWkOCREvZ1KQ135FiPzIcnFJ37Bk6Lnh5fp8vDY3D7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kuw3i/W/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 2009A606A692;
	Wed, 25 Nov 2026 15:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kuw3i/W/
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C0C971F000C0;
	Wed, 25 Nov 2026 15:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795621815;
	bh=tb8wm//Z2DWHkQayZbIfmLnJvc447+MeYyV1guYLOyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kuw3i/W/jtLmA1Ts/BTtCRAV0kDdVWCskpWL24jRLED55WzHSBRLsi0h3YZhV1s27
	 D63nFumsLv3cybO2Bm0eHQfMCBO2eKdBXAZuP5W/0ofWlJn4N8tYbcE2a20kEez2Yz
	 fqcWc+RjpUXs7tM41+T5IF26KyxTbk/hnZMFwk3l5cuYpqyb9NjQ8w5YsbFgDRICHn
	 ApJIt05oggkQs8ULVP1tUVp3kNlBvDX0C3c17U9NkC+BmzbEYjNIGM4+C4Yf4Pu8Et
	 kTBmT9UEI8mHw/DSsitTzPhkzpQeQPg19l1E398RaFClJnEC4yYYSZrjjZZJd6l21i
	 H9nBzlXareA/w==
Date: Wed, 25 Nov 2026 16:50:12 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/10] pinctrl: scmi: select the GPIO function on GPIO
 requests
Message-ID: <uwppebmjytpb2qmprqdfgsly3srqwmbavbm4edjb4e7s2jymiw@5af5prsdps2i>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
 <20261123-clegoffic-pinctrl-scmi-gpio-v3-10-d61f039be008@baylibre.com>
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
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-10-d61f039be008@baylibre.com>

On Mon, Nov 23, 2026 at 04:21:32PM +0100, Clément Le Goffic wrote:
> On a GPIO request, select the GPIO function of the pin, on the pin for a
> pin-only function or on its single-pin group. Without a GPIO function the
> mux is left as it is.
> 
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com> 
