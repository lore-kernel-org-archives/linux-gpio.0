Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A86D3CB2D4
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 11:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179117; cv=none; b=sMQAdgod+jsUWV1n/IVI9MlFdq9C/npg5rHGBBFMVLlO4WyjKQPtt842tawfkGWZ4F+8hLNUUfn20edhLfGPv1AfWLdETy5NwBWwxNWlFaALz+bDgaDAEiIE+yV737LY+vL8wZcS0nWbjCwVac26xWTNnnVuwb7ruxNkhqAmzVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179117; c=relaxed/simple;
	bh=R6nvajDJulrF8z5WC1vREpNwXQE4BL47pSwNxW5HPYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fdkxrWBjHpu9RcEsQDxltfTrwlXEMagIJ7zD4tWVri+FJuev8QDjVHGXBbXr5ExVzP3exOAUR31mCOl/iiNsWPZbHCDVo/RL5e8Ck2njd+PCWyZK7KpibtnvNhQARBRDSIpAW8MqGSGaU3qEymL8PVcI5YILZ5ZzPRqQpzALmmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=doeezvb2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="doeezvb2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573981F00898
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 11:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781179115;
	bh=C5eCQ2m+9ZnT9BEwMkn6XIzbcen83Vtx+Hp/s3prw9U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=doeezvb2/5zokwyIlK+Tpp+JQbgxLLB8ubmaGu2t4ula10p9XR+AXSK7qrfa8YFrt
	 Ar+eN6O0mlGTAciR3AAV72pjHLeRr3hzWTd3pF6fkzADeepwFMitmBeLk5D9iLC/C0
	 qiTX8r4VbvrvIrZ4LgYKwd7Of6gUD038Y+3+y12uDxguF4tPO258SqJzjqKt+ZoisR
	 Eo1O3rHYLz1sRuWg7Twbsd/+KCFbCcEIh1JqyvoS+8JqwkmYJPucbURlrRq6rUGi3l
	 AEifYXahqRCENJxgHuwbqmHl1DAIKi5R0krcLHWL4jvESg+VA5Qi4NIlu1VU8Yg2ey
	 u+XHNQzAP+ebA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aa61e3d3f3so7931028e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 04:58:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ85JiyUIh6QK/KIuy+MWOgwrVMZeMZ5Ts//bx+R+FHQ1nzPi+0KpDmq8ynDOpICF+PceGrYpJXM7M4e@vger.kernel.org
X-Gm-Message-State: AOJu0YxVyM4mXpFEdZ45JZLPCOY7RS6UjtIY96EihJz9i/LIS4Z8GJ1n
	EHaykxzuGoL7TqoFwsel//M3k+r4Fw3EWGr8jzCg6fGNzgDL+S63M8nQhvesWkVToi1gzYDdU0l
	mA51yT7HLiGiq74nd5XhK9efSW8OrmpA=
X-Received: by 2002:a05:6512:110d:b0:5aa:6c89:72d8 with SMTP id
 2adb3069b0e04-5ad27ac49c5mr780915e87.19.1781179114160; Thu, 11 Jun 2026
 04:58:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 13:58:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLmzfnOaz1h-e2CP7++AYi0CW6cDF9dTO0aU2m3tRfWfBA@mail.gmail.com>
X-Gm-Features: AVVi8CfHelBjMWn0SWXQfsRaUfTwlnx7-cxwN6bRp62FY340cXBs5nRmH5Xbr2Q
Message-ID: <CAD++jLmzfnOaz1h-e2CP7++AYi0CW6cDF9dTO0aU2m3tRfWfBA@mail.gmail.com>
Subject: Re: [PATCH 00/18] pinctrl: airoha: split driver on shared code and
 SoC specific drivers, add supporf of en7523
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Sean Wang <sean.wang@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Markus Gothe <markus.gothe@genexis.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 7, 2026 at 2:17=E2=80=AFAM Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> wrote:

> This patchset
>  * fixes a series of issues
>  * split combined driver on common code and several SoC specific drivers
>  * adds support of en7523 SoC

This seems to be a collection of previously posted, reviewed and now
also applied patches. I don't know what to apply and what not to apply
now.

Please rebase the remaining patches on to of my pinctrl "devel" branch
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Ddevel
and repost as v2.

Yours,
Linus Walleij
