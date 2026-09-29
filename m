Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27F6524AF4
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 13:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686924; cv=none; b=LmHFrqKlJ3RVGyNET4GPRvrvJClqOgKc5ytG2pGDNDKdqAoAUpff3i6mkC2TwznkLTO3Q1vBSchxPrrx67yBNKuOR14oB+Bb8uIYXtvrOL7MEgGKxPztWDkLyVYtPCOpQgHAZbXyyt9/TsE65WpKBG9IVQdFFuDqIrB9UheOrMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686924; c=relaxed/simple;
	bh=CkJeCBJKSOCZKqGwIyQFI+az2FW9NpabYXClSX/bwmw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UMUuiYCDMWl/GPdUvJhJFuAvRryc1FddTxos9CD3wjRBVixIR5ZcQuvcY4qu5FK16gKy1LBshbpwRS2iy8eZsLmEb7Zs5ieEeC/LkfTOPMN1DGjNoBxYLYSpjuMyS8wY4XUqjROui5xdYKWHQ6+jU9LkjpnBZKtU8FLbPNBSlw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ToJsScpW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ToJsScpW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296A51F000FF
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 13:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790686922;
	bh=lEahU7N2copOxmJaiZyQw7LSVt/4rrdBaLn4Wd0mVRI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ToJsScpWzQBuvDsEpfItJ7pgTGIeRBIiN6SmzGzClev2eRaEFWS/df/pcDFNBGyNV
	 bJe2IrGok8v/du8J5QHPU1957RyHie3sdIHU++fuQvHnWGVQWu6yRJpwKjNcjyoef4
	 21bI6T87fDYk5OvZ1bRInxUa1g0uZDHkV8q/HgCyXk1laWe4ZPSfj//p12se6RDLYu
	 JEyPTvaBtqi7n6EH1z84eYqCOfhabS5/zoesCntkVwn/ivQAuHEgXrkUkXE2vbckZy
	 3u0zKEA3ucUi87KFjRmommO+EGcXw1Yn/m9kBTbNqqBNe4WVdfEz7VpJTVtWHRRSus
	 bn1YaeQm/Ry+w==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5919af2eeso32755431fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 06:02:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBztRb51g0Uur7V78Z/7+58VJw5d1I17PYBRV+E+BtpZMoPIh1VHWQMdhi+3AHa37NGk5I7HyMxzrZeO@vger.kernel.org
X-Gm-Message-State: AFq9FYLb6wCWnDoQO2f4s+WUJLcG7hc0ELkeuTlSbdrmhoVDxGo3CwmX
	C9QuRufRZZw8oNFxSr2yIzOH9c9AY4e4tFfb/egWvSaSz7n2HHPV+sdq8ovRZb2U7Mssg9XiSzN
	wMcRr8ML2CfzU7dQMyD+F0lMTHro7yP1T+ajrfginfQ==
X-Received: by 2002:a05:6512:118c:b0:5b7:5142:d495 with SMTP id
 2adb3069b0e04-5b8df085af7mr4713766e87.64.1790686918625; Tue, 29 Sep 2026
 06:01:58 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 29 Sep 2026 13:01:57 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 29 Sep 2026 13:01:57 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260926-loongsongpio-v1-0-71de7ebebb76@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-loongsongpio-v1-0-71de7ebebb76@gmail.com>
Date: Tue, 29 Sep 2026 13:01:57 +0000
X-Gmail-Original-Message-ID: <CAMRc=Mc5JSVBnhxp4ctrz6hOj62W2rjk4FJj8WdyE=yChJ_FzQ@mail.gmail.com>
X-Gm-Features: AclHuK8c0HTP_UTUQiuV3uHEiUq54l41OiZQoULoGxainPZA3i8OOzHlMTad_To
Message-ID: <CAMRc=Mc5JSVBnhxp4ctrz6hOj62W2rjk4FJj8WdyE=yChJ_FzQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/4] gpio: loongson-64bit: add interrupt support for
 more models
To: shankerwangmiao@gmail.com
Cc: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-gpio@vger.kernel.org, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Sep 2026 18:28:35 +0200, Miao Wang via B4 Relay
<devnull+shankerwangmiao.gmail.com@kernel.org> said:
> This patch series aims to correctly add interrupt support for GPIO
> controllers found on more Loongson CPUs. The GPIO controllers in such
> models do not have a complete intgrated interrupt controller, but choose
> to delegate interrupt handling to their parent interrupt controller.
> This sounds like a heirarchical interrupt setup, but what makes it
> more complex is that multiple GPIO lines in these controllers may share
> one interrupt line on the parent interrupt controller. The details is
> described in the third patch.
>
> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
> ---
> Miao Wang (4):
>       gpio: loongson-64bit: Support for irq controller on 2k2000 and 7a2000
>       gpio: loongson-64bit: Generalize interrupt controller initialization
>       gpio: loongson-64bit: Add shared interrupt support
>       gpio: loongson-64bit: remove gpio_to_irq() handler
>
>  drivers/gpio/gpio-loongson-64bit.c | 708 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 683 insertions(+), 25 deletions(-)
> ---
> base-commit: 481ed5dd3ed7136f627b8ec372ba39f5b2e7d27f
> change-id: 20260925-loongsongpio-829824a3d562
>
> Best regards,
> --
> Miao Wang <shankerwangmiao@gmail.com>
>
>
>

Can you please resend it with linux-kernel@vger.kernel.org in Cc? Otherwise
Sashiko doesn't pick it up. I'd like it to take a look as I don't have enough
context of this driver for a thorough review myself and it's a complex change.

Bart
