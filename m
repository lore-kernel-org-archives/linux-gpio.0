Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8552E38911B
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 07:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075796; cv=none; b=JzqcvF+Tow1SifTHiecYA499e4udX+dky03eyU75If95WX+oW1OZ8UWFoZ1YWznjfraMJCFXsQ4UrTzqgLOY/DNKa+3tr0CZcuCd3nB8NBZqO4JEyRodlSWg950Kh+D+piPw+AaMgNMk7VcabnjsVY9cYipkUaUGRmcgrlkFEmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075796; c=relaxed/simple;
	bh=RmSyIZYBm5BBud27yt8n7nimrWLHPIUxOYz60PnwVgs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rhtp3ARxTs9lZ+C3h+q6PceKAwAkXlgKHDdeHtRzTU9vK/LvqsLLWGmIzM/ZPmIr7jA82rS5nVNfRq2INQwBUzByH4wVYad0iDYQyeVwJINEdCC6+MTq12d7O+vTsZ4zfB+DAugP8sMej89WsA0v8LZwQVHO53JPuLA3AmaE8wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNz8het9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNz8het9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A2D1F0089F
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 07:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781075794;
	bh=RmSyIZYBm5BBud27yt8n7nimrWLHPIUxOYz60PnwVgs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ZNz8het91ikt+x1M1s5p9PGlBuGwK6RT3fJOsixKPT0oLGv/+ExoPOXgaKlDUXC4g
	 yNiSX2rnUrjPK0DFmAHvPnOUxv+7b8RIuJQubohnxPkfxwbzBGKjZOu+18aq6/fvIH
	 YWdd7cDfBA0yKZkVZDoJi1SERSVEAwyeMsD+z02WwgP+fwb6Pf0rvGyg5uCI8CCh0Q
	 ObMAIHLrxWJiSRB4kpwyLXEYsw+4Y94WnUr2p0KzdaqJ42pTinqi2V0+Ysr9TJzCOA
	 obmp14R4zFRbracZNrysg5DBDxGRHOWdxjsCN42EwgX3frrY6y8/yiZTmo3PSdwBrZ
	 gohsI9aiEafxg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aa5ce4904eso6720876e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 00:16:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+ZWVDf9v14N0Oq2MrxZy9q7a8UyI+ZPvbwgdIPgIAXYdEISta4KS+6AM8ZXjyfFjyUpTv5H/vydTa+@vger.kernel.org
X-Gm-Message-State: AOJu0YysUbH7lZ9AeoMfMVoiHVbd3I86y2ZHMF8tWtISmZnKSqhU+NSs
	dW/relOYFm7mqj29RbaUKu7AMSkA2daBUSHutH3asaBYvxGy0tg0GZF/Q+j34GFX3DNW4mQO+q6
	sI3/pBKVnvzwFvZsq4bpgwLviQVz9mhJJSbmHG8RB8Q==
X-Received: by 2002:a05:6512:3513:b0:5aa:610a:374f with SMTP id
 2adb3069b0e04-5aa87b91e6dmr6785826e87.38.1781075793080; Wed, 10 Jun 2026
 00:16:33 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Jun 2026 03:16:31 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Jun 2026 03:16:31 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260610-ultrarisc-pinctrl-v4-2-b7e9b2a8ed84@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-ultrarisc-pinctrl-v4-0-b7e9b2a8ed84@ultrarisc.com> <20260610-ultrarisc-pinctrl-v4-2-b7e9b2a8ed84@ultrarisc.com>
Date: Wed, 10 Jun 2026 03:16:31 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdN6q3QBy6gip0DzajEkAdPn9V2q_SMoHNaqRisc=cwdQ@mail.gmail.com>
X-Gm-Features: AVVi8CclKZRUSD_vOJ4r4MOi2qhfbjTTcG9uDl9HKEcQlTy0yfwzLywyGbfBMzI
Message-ID: <CAMRc=MdN6q3QBy6gip0DzajEkAdPn9V2q_SMoHNaqRisc=cwdQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl driver
To: wangjia@ultrarisc.com
Cc: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Jun 2026 07:29:56 +0200, Jia Wang via B4 Relay
<devnull+wangjia.ultrarisc.com@kernel.org> said:
> From: Jia Wang <wangjia@ultrarisc.com>
>
> Add support for the pin controller on the UltraRISC DP1000 SoC.
>
> The controller provides mux selection for pins in ports A, B, C, D, and
> LPC. Ports A-D default to GPIO and support peripheral muxing. LPC pins
> can be switched to eSPI, but are not available as GPIOs. Basic pin
> configuration controls such as drive strength, pull-up, and pull-down
> are also supported.
>
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---

Looks pretty good to me.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
