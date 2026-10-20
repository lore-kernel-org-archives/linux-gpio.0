Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502224;
	b=FmXI2xsd49VcAr07XNW9WxhardSwJs/VEYNi4NLL/uVPZayq58tZzRLpPEQJX8Avf+Mw
	 +NkDMYLkQH24Rkz4EA2wWFI7oCp9GsKvyAzXw0aj39pvcL4AVcCy5IpVJSgqFPaMmaRSG
	 kjq8RWtHPHcZOz5M+Mm6OdJq18OKuJ+VNz6d+ZPp2EjYb8fO2MANxA4ctn9xGggwPxoFe
	 vNcnYv3HWblihdMqxmINTHVCN2maU1GD2pLsIFFamxL2lV7drjwSQVydL2eB11IH8IURp
	 8cvR5DxQMJg0PsPb2uyuQ+jRiNPjOvcQBuANOb+Ywe/ECrfyxUqhjW1NzB5/iGUXFLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502224;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 Received:Received:From:In-Reply-To:MIME-Version:References:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=sDfwnfFMb7H/U0LG01YBStUGulHQM26pPCTaRK+6r7Q=;
	b=tQ3B5Wn5N7WtJgPZzm3YUYm7vgLQbcpxTX7mjwmP75vhxa1WpbPdkPXFUDIyNwZhrJNL
	 72+xnRkZPVZJrOJoybF/BsSLbP/HBWXGAWjQxPZ17qyPGfAdOfxO7D5sYQpfCiedZo2Ub
	 mmJ0dalyUi3agXdY4bu7L6n+vZujIJRvk7rhL63V1T7MA9MgCfWeJMd5RdbFZ1pRrZqtS
	 dB0kOPJ31eW2lp881K3+nJe2p4gkSXHQP40Lk+UyBO5HodSP0N5Li5RrhnLEwzCBIa2FX
	 PtaYqWODs2XbJjlEnhkH1ERJzJhwqxT4xBRFLsrbvVG3T6jwDR0kLKK0Icp8uZi4S5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FfsesGt7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9B2606A31E
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FfsesGt7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2696D1F000C6
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792502223;
	bh=sDfwnfFMb7H/U0LG01YBStUGulHQM26pPCTaRK+6r7Q=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=FfsesGt74++87e1PYiuiZqu6olz8+eXc/5ca3xBoiBV0HrNseGvgF+mEMgjbyaUwm
	 /3urQVvJYdqeuAfGj52OJdl74yrRsYI2HqpWv5b2JVx/U/YbCoe5s4ESTKFdUrU8WE
	 Z/ydMSAjjTC5INk9Uwh8pzP4ZevG8nJ+ZnR6u3YnrLwLUKqSu9j2aH0TqFehZTwwuL
	 bVbjp61s2IYymQYrsOo233TB7XGRD92ee3QbUc17zgIIhq03TCkaW9vyOPDKfPMKQL
	 8OBCWqCxuJ3GQuyvUGQr5U6bpL4pLPktM0SX8htUkdJazwOMwBVcaWYeFRJNZ6kUkb
	 Cd+EupBy6yN9g==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ba3ec92031so3537366e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 06:17:03 -0700 (PDT)
X-Gm-Message-State: AFq9FYKoikdC06TP7IKi5u4kDVHPt7KBahmL3ES9KKY8ZhDvUJ1DdU0r
	Us63dUCjEcelPcb6pfoU/y+tpTyyymPw9QJgcej41/97gU6st/OGHNFTn5bTR49Mlt6TX2Dnd/N
	CT4NC5udAvH8L+t4+3EBJjyFOWunezSbo1DLy8J/XMQ==
X-Received: by 2002:a05:6512:60c:b0:5be:516e:5728 with SMTP id
 2adb3069b0e04-5be516e574emr2125370e87.32.1792502221841; Tue, 20 Oct 2026
 06:17:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 09:17:00 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 09:17:00 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261017043605.1503563-4-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com> <20261017043605.1503563-4-shengchao.guo@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:17:00 -0400
X-Gmail-Original-Message-ID: <CAMRc=McoAYKHojJCT6yeTvsMLKDTisD3V42VH5ebRapuG-UGBg@mail.gmail.com>
X-Gm-Features: AclHuK_k9lO_i1S3i6iGAOndmTvxczShpEE6soiPBepKsGh7JYvDFptjfrC8dpU
Message-ID: <CAMRc=McoAYKHojJCT6yeTvsMLKDTisD3V42VH5ebRapuG-UGBg@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] gpio: shared-proxy: Drive the default value when
 no votes are cast
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Oct 2026 06:36:04 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> A consumer that requests a shared line with GPIOD_ASIS never calls
> direction_output(), so def_val keeps its initial value of 0. If the
> line was left high, for instance by the bootloader, a later
> gpiod_set_value(0) from that consumer matches def_val and the proxy
> treats it as withdrawing a vote it never cast. It returns success
> without writing the hardware, and the line stays high.
>
> The consumer has no way to tell. Its request to drive the line low is
> silently ignored until it first votes for high and then withdraws
> that vote.
>
> When the requested value is the default and no votes are
> outstanding, write it to the hardware instead of returning early.
> For lines configured via direction_output() this is a redundant
> write of the value the line already has. With votes outstanding the
> request remains a no-op, as the line must stay at the voted value.
>

Wouldn't this only matter for a line requested as-is? We could avoid the
redundant write if we only did it for such lines instead of for all
unconditionally.

Bart

> Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/gpio/gpio-shared-proxy.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
> index 24241c981df1..456a3c3dbf71 100644
> --- a/drivers/gpio/gpio-shared-proxy.c
> +++ b/drivers/gpio/gpio-shared-proxy.c
> @@ -81,9 +81,16 @@ gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy, int value)
>  	}
>
>  	/* Desired value is the default. */
> -	if (!proxy->voted_change)
> -		/* We didn't vote for change previously, nothing to do. */
> +	if (!proxy->voted_change) {
> +		/*
> +		 * With no votes outstanding the line should be at the
> +		 * default, but a GPIOD_ASIS line may have been left at the
> +		 * opposite value. Drive it there.
> +		 */
> +		if (!shared_desc->votecnt)
> +			ret = gpiod_set_value_cansleep(desc, shared_desc->def_val);
>  		goto out;
> +	}
>
>  	/* We previously voted for change. */
>  	if (shared_desc->votecnt == 1) {
> --
> 2.43.0
>
>
