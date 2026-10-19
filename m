Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CDD4071DE
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 08:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397133; cv=none; b=s8LMU+vnqkIou4OcYP+BKhdDE9CLAF7UYhumtGFjbTbqLq57Gy6UEN/Y05n+VqQoWJQR37XE0iK9USH8rInbWg2iCAPQ9IFBKKvMpSMFGZZyIXPOddN6QsvijOt3EtMA2VkkTGLqQoxJhWrP1oMHnEd4RsowGrklG2dAmfCqmM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397133; c=relaxed/simple;
	bh=MNn9EReI0H6EENStGI7aE0ualMsLo14gdkGY09N5E3U=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MtK7KK/5AlxAfuKdND66GhoBuRd9PBJsw9G3Ido4JFan7a+nZZ80VhrOQAWzviZURHMwDMrX0zbgyxpLJ7rQ3po8COBTk6tkBTIMpQFxLQBbLRUWkOUf2e5bo/4GIkQLQLfIkbUO3wiQDt511T2r5tVhOUbp1fuYqJgIyX2W0Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eaawz8Nk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eaawz8Nk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E1C1F000C4
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 08:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792397131;
	bh=Opn2C+E92xKwQsN6h5E9V9ZrB1GQ2MnOKeEbuvT5O7g=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Eaawz8NkGmmc/B2+oRKDloMx4jvuCIPwPI/PzNc+TS9pajKYIumZL5T6DZPNr1i2C
	 9qXOHdOaqpdGV+NSavPcoVW8EhCz97Rl6Wx/wRldqi9qufbDgC1IBG0pN5G6SmE/mh
	 BGBTmjb3xIji3BNE14L0492XU6GB7eXQNOLSEZMCMAt7YL83V/LcIy5GGgpMCQbNtT
	 ZIYZMGc2nAVPXC9zkEE/2obrZD/pdsRPNMDzPQG1WlSz3VkVwq3jv71934V9EK4BP0
	 PaxurzGH7cDkDQ2K0H1jasollcTYOKWb2wEvzypDNJVIvsocTAFuAb2Ol91CHISCzn
	 UtX5nB8GesGFQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so24041241fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 01:05:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwBvsm4upaBK1RyodE6REwCyMCuZoPMyYOYTGHVONNACXtf/ZCkBPm/IZkKm5xNLESG9dutQ35fkE0D@vger.kernel.org
X-Gm-Message-State: AFq9FYIQPjLaODd2nQlq/vhxhdyq3l9RQKBjZpXpmSu10Cuy6DDc+06V
	imSsqQK4L+XzTbGBRVGZo7Z0ze3RIrK+O27iDV3BBCjvMgL4eBnDR7IL8dHwDy3ABc5KurShqBJ
	iMGKLTnEqlusCD1qlJLj2FSM67cf4o/iCnIW2hW5sdg==
X-Received: by 2002:a2e:be9f:0:b0:3ab:39c4:55a5 with SMTP id
 38308e7fff4ca-3ab39c4607amr6913691fa.17.1792397130541; Mon, 19 Oct 2026
 01:05:30 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 10:05:29 +0200
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 10:05:29 +0200
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261016-upstream-tda54-gpio-v2-1-5c4f8b10cdbc@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016-upstream-tda54-gpio-v2-0-5c4f8b10cdbc@ti.com> <20261016-upstream-tda54-gpio-v2-1-5c4f8b10cdbc@ti.com>
Date: Mon, 19 Oct 2026 10:05:29 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdXhgtFKXvb9ZwCKya9uHR79AA=Je_pUKe-aL4JGGiTXQ@mail.gmail.com>
X-Gm-Features: AclHuK-KhikiLJw6im0dPRghw6fj_ecjB_InLYFf-XUgpvNM-jDdSNh_Mm6cFZo
Message-ID: <CAMRc=MdXhgtFKXvb9ZwCKya9uHR79AA=Je_pUKe-aL4JGGiTXQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: gpio: gpio-davinci: Add the tda54 support
To: Aniket Limaye <a-limaye@ti.com>
Cc: vigneshr@ti.com, u-kumar1@ti.com, nm@ti.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Keerthy <j-keerthy@ti.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Oct 2026 06:30:36 +0200, Aniket Limaye <a-limaye@ti.com> said:
> New version of GPIO IP used in TDA54 SoCs adds support for level-triggered
> interrupts via extended registers.
> Add the device binding for ti,tda54-gpio.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-davinci.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
> index 1434d08f8b741..02b6b9a436a68 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
> @@ -18,6 +18,7 @@ properties:
>                - ti,am654-gpio
>                - ti,j721e-gpio
>                - ti,am64-gpio
> +              - ti,tda54-gpio
>            - const: ti,keystone-gpio
>
>        - items:
>
> --
> 2.53.0
>
>

Just a nit: you don't "add support" in dt-bindings. That's done in driver code.
Here, you "document" new hardware so please next time try to use a different
wording in commit messages.

Bart
