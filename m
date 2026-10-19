Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6600356CE28;
	Mon, 19 Oct 2026 14:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419964; cv=none; b=gXg/rjfP3/PgnYu2l2ZwXevogVl2dnfFHGJyZ2u5R+y7OYGy+OkD1CdQdKWzBZ/xsqokEzqXIjuY7ud7kpjWsdqMfrBHOAPOum7hzkka9Hl/ARFX196R8GiP4ZOrsA18s78+dPpTxtpZn5D1+NZUq55fmGWWENVtlkSA6pIYJHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419964; c=relaxed/simple;
	bh=ti1yO82NWAXq70CnTV98mY57q0nPfClzAudNIlBtrSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=az/uOzlt0EiJ37HqPOb+BixysQAm8xsa35265X5Rb0TydRIyelc8M8ySTDjVP87LP+ZXxZ6VoYcgcGj8SstuLgDtAZ3vzArM0+UXxsXYKF2pNWw0F760hkc5XoRNK4C/k7iR/E4XB2waZR/EqueIMoPuOBDGRgTnyr+7oUShwUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gK829uGJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gK829uGJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2FC91F000C4;
	Mon, 19 Oct 2026 14:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792419962;
	bh=5c7yVaLtr9x4fkx2BIkC1OF7uxkwFHyouac+2BuosV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gK829uGJwuHy0+KUuUByxqIxBVMzXAoNbSej8eAWfvgRaS+5YW1j5+tGZBOxMj5AK
	 gjd5XvAqtMkOyARij0M6L/Ah0i2oee/l2wDD3B49iLnn8SmyztKaHkYKo8aBhnPD9k
	 wkOh48gpxMWMlmBM3OwydpOuj4uUlBzxW1HFZv+VdxeZx9bR5P4W+tkaf2QiED27BG
	 Bc6O/HBPILIPgOnuCN4ZLwYJxMUqdBUs/paPiIukoYGJRptYqDoMIaT+65zVg3zQ3V
	 6Z/6WVtoJ/VY9LnLw6z3I/Dr4i1doDDnl5g7ZuqbGp8GalMl5Ao9MQ6ZVXwOjnv+XO
	 ynQq2sStMJcSw==
Date: Mon, 19 Oct 2026 15:25:55 +0100
From: Lee Jones <lee@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	mfd@lists.linux.dev, Frank.Li@nxp.com, lgirdwood@gmail.com,
	linux-gpio@vger.kernel.org, linusw@kernel.org, brgl@kernel.org,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com
Subject: Re: [RFC PATCH 7/7] gpio: p3h2x4x: add GPIO expander for the NXP
 P3H2x4x I3C hub
Message-ID: <20261019142555.GB2663669@google.com>
References: <20261016164625.3166779-1-lakshay.piplani@nxp.com>
 <20261016164625.3166779-8-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016164625.3166779-8-lakshay.piplani@nxp.com>

On Fri, 16 Oct 2026, Lakshay Piplani wrote:

> Expose the pins of the target ports placed in GPIO mode as a gpio_chip, so
> the hub can be used as an IO expander.
> 
> Each port contributes two lines, the SCL pin first, so target port N owns
> the lines 2 * N and 2 * N + 1, and the line number is also the port bit
> position in the direction and level registers. Ports that carry bus traffic
> are masked out through init_valid_mask. The port function is taken from the
> device tree rather than from the GPIO mode register, because the hub child
> that programs that register and this child are independent MFD devices with
> no probe ordering guarantee.
> 
> Direction is the output enable: clearing it leaves the pin in Hi-Z. An
> output drives the level before the buffer is enabled to avoid a glitch, and
> the input level register is used for reads in both directions. These
> registers are not protected, so the callbacks do not take the shared
> register lock. Implement get_multiple and set_multiple so an access to all
> lines of the hub costs two register accesses instead of one per line.
> 
> Interrupts on input level changes are not supported yet: they arrive as an
> I3C in-band interrupt and the edge detection configuration is shared by
> groups of four ports.
> 
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> ---
>  MAINTAINERS                 |   1 +
>  drivers/gpio/Kconfig        |  11 ++
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-p3h2x4x.c | 294 ++++++++++++++++++++++++++++++++++++
>  drivers/mfd/p3h2840.c       |   5 +

This needs to be a separate patch.

>  5 files changed, 312 insertions(+)
>  create mode 100644 drivers/gpio/gpio-p3h2x4x.c

-- 
Lee Jones
