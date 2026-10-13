Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E8A51588E
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 16:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910363; cv=none; b=VUPrz6GArlLiWBwKRSibC9QL0Cw36i+VbcS7CFCr/Z8PBsnJ3IU/gYuUyzoiKIG8U9KkLl7g5i32tApvzWJG1k5ZXR/nF62WZtcIYhLI+V4xS0nfs3qoTKsQBIlWA1YtJvpbOKCReU/FkLcu5ffx5i7VYBYWKi3sRHfhSLjz2HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910363; c=relaxed/simple;
	bh=2kvmNKcTF1OSxfJGbx91Ab7juSk8uVHf9kwGVHZ7/jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a2DKmlMRwoOiuOcSdkFZrIkHSuuOPqPc4loVS/rC60Oxiij14+4pPnhHrL+7VNiViT2RkQw58s0LC+LmnJYE2Nv1urb2wd8LAriXwwZzR1CPU9YqYxzqXu6g7BdbwCr8yCrdj77Y8Xr4CZdF+QdDfanmrFuIwuZSGzdSTnnSJDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJEUpDdw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJEUpDdw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E39201F0089D
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 16:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791910360;
	bh=eldS8GplNjgTNKWeHV2zLRcIwD+JHyo0Mc6Zm17nTyg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SJEUpDdwlT97nO6lc0n/R6Oe6uXVsnSWlQ0PeDy68BYviEoMgIWrnSABf3oPREArF
	 KT92We0VmupMcw/WlzrS1W2uypvCMnqG4UJlLxrY+JdQaE2iCNsdGjUbZmCkRgVbjq
	 LetOsuaXa0B8VBYz1dPLtr2qQQpSwp5KqmjHKQPC7Xep0RSFtXcZ3TIDQ4cDAgZYDq
	 i6OJQMYhDTTFYSZ0ejFn1IoXo4MgY9WDYSnaN1KnRd5XeTgMwwQT+B0U2D/saX5pmb
	 L/CNyWm1cXwvXzKrBYPRujo5jJN3PJC7m5D50N0qIx8ENFaEWI4fJhfZQ/dhRkGZvb
	 39rAOgxT96J3g==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a60cb94b80so33888841fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 09:52:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxXQ1hKjGX8UCqmKt7Ljh8SfmfnjVPASctDMqvGygxt68PQ2nYtU41+1KULERerq6lAGpimnvzOlLZ9@vger.kernel.org
X-Gm-Message-State: AFq9FYIPiJSv8Xp+c5hYbEvl3A1sUqVFIIWqx0Gc2OuTEsK965Neor+5
	Q/tGwKO8og6c1b869k/zyn6tm4G244vaMFu4dEt0Ws1684zFh7CreqarDYjEqNyHVft3/5DMocE
	SHzgb9nxaJWt7OPm+MNixRght2uywKRI=
X-Received: by 2002:a05:651c:b0f:b0:3a3:52a7:3a1d with SMTP id
 38308e7fff4ca-3a9c5125e97mr30998631fa.1.1791910359553; Tue, 13 Oct 2026
 09:52:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com> <20261013-gpio-mxc-cleanup-v7-2-c4d769587d3e@nxp.com>
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-2-c4d769587d3e@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 13 Oct 2026 18:52:27 +0200
X-Gmail-Original-Message-ID: <CAD++jLk1CC+hKyjRh=-dJ8M3oeMqo_8AVkNCUEUxpTRX1=SXDA@mail.gmail.com>
X-Gm-Features: AclHuK_VSzCmWjCTJqET6DItFfQvgfiwDPO4tQVVwYVu_IZrlaY_9fZ_pvqLqPA
Message-ID: <CAD++jLk1CC+hKyjRh=-dJ8M3oeMqo_8AVkNCUEUxpTRX1=SXDA@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] gpio: mxc: fix both_edges bit operations
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 8:04=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> gpio_set_irq_type() can be called concurrently for different pins on
> the same port.  The IRQ core serializes per irq descriptor, but
> different pins have different descriptors, so on SMP systems two
> concurrent gpio_set_irq_type() calls for pins on the same port run
> without mutual exclusion.
>
> The read-modify-write of port->both_edges is performed outside the
> port-wide scoped_guard(gpio_generic_lock_irqsave) section, so
> concurrent updates for different pins can overwrite each other,
> causing missed interrupts or stuck IRQ lines on dual-edge triggered
> pins.
>
> The original uniprocessor MXC SoCs were not affected; the race
> became reachable on multi-core i.MX7 and i.MX8 SoCs that reuse this
> driver.
>
> Convert both_edges from u32 to unsigned long and use set_bit(),
> clear_bit(), and test_bit() to make the modifications atomic.
>
> Fixes: 910862ec092c ("mxc: emulate GPIO interrupt on both-edges")
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
