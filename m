Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799588;
	b=A7C5qqJ86B4Cwb+w+yhkQJftWmgna9hRg67Tz9CC/VKr1XPS+V2Bgl6kf/+VkfQzPU92
	 sVb3M17XwWalMdVF55knWjye33bWZXD9OEsb2WgT3EFybvzU0gsUgvwN1T3kZ9IoOZDNt
	 6JJ5svwIsa3RYX8iV1LvunR+suCKicoI+ieTND4m3zswLDbRwR9iRziKPykmfYA4g/Kmy
	 DXnIMe+KUbkFuZzoOxCVz30ngtjyW238tdpD2BihHgu4GDEdNCLUqFbqzffU5F5xUkX3h
	 ZZUREqvQoVLDx9LvVN6n0TMmQp2Z1NlB2Qyj9Kq5EVRQnbPkVTwnH/WauydLRPBYyLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799588;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eeJ30yvyUGPx8o9yVvLLpuFmoM+u+oWyns4sgAqLWcU=;
	b=c038R1+Mbnqlq+2uMYaU1AGg6dds5CyxbsUR/fkCdaOYEe51HsKpNn8pacm3ymxQnlO5
	 27Bzzw56ebZ/nfsrA+/tDoMKpdwD9PyDKPbNlcA523uk0V+ZWcT9cO4g6g/xXdSJl9GTa
	 /s2agh1sWKBtbOoBXrUXfoF/kSvHS8y2Lg0Lh3bUr3Qri3D28iX+nscFlK2THhs956zby
	 /bukLnZIjaubrBaXl+pql3ZjzUzjlydUe6h2wsdY5DDgd3ad17XYAoItgk1nrLnZ7Arta
	 r/SlcEFya3544pahc36kxtZ0nvZ4/2CGTWv3/oOmV9L07/EpolHLXzaHVrE0Tmg0h0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HtZQSCWu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83074606A332
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HtZQSCWu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CED31F00A1E
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793799588;
	bh=eeJ30yvyUGPx8o9yVvLLpuFmoM+u+oWyns4sgAqLWcU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HtZQSCWugbnjVYU9Hxobj8ni1O6FcsMn9LlBUqOth6s3HC+675twSV9bEGZZNMqpm
	 2CtTXQez+nuezQR2privxJu7WcCNJgDDiop99S/qLIbBBAJTz1Z4uevH0HYoaDCao6
	 g/vZP/kKl/L8aLux1AirZ07aQJMio+U76x5rkK+0/s0fbITxY2BKtbx5CSEkdx93Sd
	 REsFIXRaZH920hMJpq0AnkDVNOFes3I4xScG7eD4KOT+mFSAyVLpa6extfwfUzSFYR
	 RIs0HkkVG8Petfs3c9zzDM4uqpmXDl7FyebJIFET9bBNkbm52nYtHXD+Go5rSjUOK1
	 vrnLXEH2lMRRw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so369265e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 05:39:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxrWF3lDP2YAMp12TbEXycE5FZMVNp5ThioDg2dZt4pnkJ480s0RB1eVfQLy3d1y/RYIAE3I9YaVEuH@vger.kernel.org
X-Gm-Message-State: APuU4Z+6HAqBjKTqKySXroEGpq3/1OITbdnNnLbxrbMf0BFT8kJ6COvC
	n/PsBoqhPA5xqyDYY2CojeKnA4OlHs15K//E90a2nuECfmIW607Nf6TYRnGJn5gpfwHb5Gdi/J1
	1OGXsJhJi5FYTjz7NgH7OYXPYEYvb5UM=
X-Received: by 2002:a05:6512:3a8f:b0:5bf:ce46:2e2 with SMTP id
 2adb3069b0e04-5bfd9562ccbmr5929968e87.17.1793799587091; Wed, 04 Nov 2026
 05:39:47 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023094220.2989225-1-guohao01.zhang@horizon.auto> <20261023094220.2989225-2-guohao01.zhang@horizon.auto>
In-Reply-To: <20261023094220.2989225-2-guohao01.zhang@horizon.auto>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:39:34 +0100
X-Gmail-Original-Message-ID: <CAD++jLndt0h88jTstAbXVjX6gE9pgJh6-cMz3QqJE9gL13HNuw@mail.gmail.com>
X-Gm-Features: AclHuK-0aqMFI56OyvVpDlVDPOgJowr42P12MXMmPJSOyPnYrNLmd8BzuuXcCVw
Message-ID: <CAD++jLndt0h88jTstAbXVjX6gE9pgJh6-cMz3QqJE9gL13HNuw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: dwapb: add snps,native-both-edge
To: Guohao Zhang <guohao01.zhang@horizon.auto>
Cc: Hoan Tran <hoan@os.amperecomputing.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 11:43=E2=80=AFAM Guohao Zhang
<guohao01.zhang@horizon.auto> wrote:

> Some DW APB GPIO IP instances are synthesized with the GPIO_INT_BOTH_EDGE
> feature, which adds the GPIO_INT_BOTHEDGE register to latch both signal
> edges in hardware. The capability belongs to the IP instance rather than
> to the SoC, so describe it with a per-controller boolean property instead
> of a build-time option, which could not express a per-controller
> difference in a multiplatform kernel.
>
> The property only describes the presence of the register. Controllers
> that do not set it must not probe 0x68.
>
> Signed-off-by: Guohao Zhang <guohao01.zhang@horizon.auto>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
