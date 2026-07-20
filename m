Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9271B3CB55B
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 08:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784534662; cv=none; b=Q+llVVpceuveb0SirnudHQIYIv2TG4CyybSeFZycjrDLItMk5NidAgdC4J+CJ5byK27dZ1stCuuIQWiGpjrzBux4HKofxBoONKFk/3ejZPQxd7B/I1MaBuJPyA9qw8J50qMRjxMQsFn+Bdac4J68iAYWUWxEo0dCNTGNMLZoIbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784534662; c=relaxed/simple;
	bh=AZ5U/Ml/mDWWvO8CqBU+V2BMU3BkyWf7FQdquPnOB0w=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f/eVGj37CnPsIEBu6VBszVgQuw8n0d70MNsLtcufxVbZYXKFWe9pvpgQVaVuffw3teAVKjNKVp7vrkiALJDDOlTAjwB/m8LtWqSi2dWsrOIBdCUL1tURcuNFCP032Ixy5Z3fgmKB4zL/YZ5yLSav59NgI/R2NIZxLSeZtOMj2hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEMSJWcU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BEMSJWcU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B9E41F00A3A
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 08:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784534660;
	bh=nwaSjR6F2hET4WMgjJ7m4XjIeyNiyKSUuRkVKY0gKmo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=BEMSJWcUzD/3NqznjaU7b9blwHm4XTwvaxclakFvch6ppgkQvJrleHU4EhGobYBB0
	 8xRLC+NYlOpTMIB3JtCV9Q4agce8VZb1tMcs1ocNNX1YVEEIdlIwYX2IXArH50llGJ
	 /RGyT1ePZWFoNAGlCvbnbnzvgQalZYMQlajBfIHQ0kv0dMyZjackwJooM0Z125FefS
	 qVyIpnCiPnUcpqZqVzsu+oC9wXu6lZfp3nh28euEqUbVwVBfCVXAUWqUnZ5KRgeSn6
	 txAZFO0IzPGuemHYZLKPcvhnT6IWGYN0MObAXUmfiOztOJZ7FxZWwuz7+CQBTNOqgt
	 sXwUMXoIuw7Kg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b00d1e7082so7380961e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 01:04:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr7Eskm0KWZvq4bIi/7+BiPF6A+PtMtYJeHjB3+SoLP4QK0MO+LOHLb+v71cE4nkPj8IXMKe03riIY8@vger.kernel.org
X-Gm-Message-State: AOJu0YyRs4y8rhPZuFs+kHT4BszEdSXskhG9wt0Q11cozPQmADs+qYEy
	S1oc/QKBlBLJnmsimXdIf7rkudckNo7MAzx+ewkPHCvzXrxdP2y8duF+zHjEslN81Q7SOX7YAQj
	jfbL7uhmLYeTzfi7sCsk2P2tLtIieY7iaqezlyUGylQ==
X-Received: by 2002:a05:6512:61d1:20b0:5ae:c210:1a19 with SMTP id
 2adb3069b0e04-5b28f87cb98mr1581011e87.12.1784534658898; Mon, 20 Jul 2026
 01:04:18 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Jul 2026 01:04:15 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Jul 2026 01:04:15 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260717145827.43889-1-david.lee@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717145827.43889-1-david.lee@trailofbits.com>
Date: Mon, 20 Jul 2026 01:04:15 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md1M6JK-SBUsOERUnGV4R4db+6Nxn+BRXdnagV7QAGiWA@mail.gmail.com>
X-Gm-Features: AUfX_mzUb9PwsWPBdpuCvGp7XdJ2u-R_DYTlV7joDC8fYIkiptBXEAU3iZ09nr8
Message-ID: <CAMRc=Md1M6JK-SBUsOERUnGV4R4db+6Nxn+BRXdnagV7QAGiWA@mail.gmail.com>
Subject: Re: [PATCH] gpio: ljca: validate event payload length
To: David Lee <david.lee@trailofbits.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, 
	"Dominik 'Disconnect3d' Czarnota" <dominik.czarnota@trailofbits.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Jul 2026 16:58:26 +0200, David Lee <david.lee@trailofbits.com> said:
> ljca_gpio_event_cb() ignores the event length and trusts packet->num as
> the number of two-byte GPIO records. A device can provide a complete USB
> message whose nested count extends beyond the payload, making the callback
> read beyond the receive allocation.
>
> Require the payload to contain both the count byte and every record it
> declares before iterating over the flexible array.
>
> Fixes: c5a4b6fd31e8 ("gpio: Add support for Intel LJCA USB GPIO driver")
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: David Lee <david.lee@trailofbits.com>
> ---
>  drivers/gpio/gpio-ljca.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
> index f32d1d237795..cb2b2623ccb1 100644
> --- a/drivers/gpio/gpio-ljca.c
> +++ b/drivers/gpio/gpio-ljca.c
> @@ -290,6 +290,9 @@ static void ljca_gpio_event_cb(void *context, u8 cmd, const void *evt_data,
>
>  	if (cmd != LJCA_GPIO_INT_EVENT)
>  		return;
> +	if (len < sizeof(*packet) ||
> +	    struct_size(packet, item, packet->num) > len)
> +		return;
>
>  	for (i = 0; i < packet->num; i++) {
>  		generic_handle_domain_irq(ljca_gpio->gc.irq.domain,
> --
> 2.43.0
>
>

There are two separate v1 of this, I'm confused.

Bart
