Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E8E437847
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 20:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786392530; cv=none; b=i//uL/9OmyG3MvjmYQzQGeya4tDRg6wHtqIytTnkDcQuywdmSebJ4te5RaTX4Baer6yqmAVFTgx1cWOFIfoIqxUrxYY7hBloh9cQh4DozURUnzpsNnuLwbGACZFVCZoiwibx0oAxV3omSfPbyZ2cpDMYHHFVvgolgHHaibHsBIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786392530; c=relaxed/simple;
	bh=PVxB+HpF5gJwn2MewfiHQ8qVkVDyA4ChZQAvP9r8du0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MUxuLNGbk8dHq7KDVZaUiTgOdgdFrg3IOni+hulvYueRS+dyQSyew+nAMQLlAXbIqhGoKr+ZPKjacBCidijfxpeULa49sYsWNS/8mU1ILaCzQnse7DH1GhciUPEXmyA3mbh0ZPHJKQKywD2PEkJS1yloFJsw3Q84Cxu2rCNiV5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPdlCCN1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPdlCCN1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492971F00ACF
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 20:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786392528;
	bh=PVxB+HpF5gJwn2MewfiHQ8qVkVDyA4ChZQAvP9r8du0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iPdlCCN1WHTnrcp4qPCqZCeN22izSXVTan9/YjPJthQrocMAP9W+RrvsB2pUbj7G+
	 oumeICBSdrpNvAS909YhYiPabCdMcYvyWCXXsW6zPPJ5Ewq+h1cthK//m9a4CFjwof
	 KjnvVTm+MidK7yw+mJOlN89Hu0bMJR/SrMdhNry1B12zgkZgDkhrXHVCOYVhWLcLaO
	 4yd2h2RlyVAmRlHahaOlf2xMoYS3C1r8jHu1ByyOrg5exuLpbfL2AAjpPxfV4NF91I
	 +4k/j8+aug8l14E5/obNdCxyhoLVGAJllAxbJsCIUXpjm9nrUrupRbOAc/Un0HA3d6
	 7XxJiIGK8f++w==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b015b2d792so2221581e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 13:08:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrY7V5sJQi9GUwfVTO4FbWG4w21Hh93gEHBoAaPMvEWFgVZpqq5SKhCrwZkbWjtwNTHGKnt0HAq5HBI@vger.kernel.org
X-Gm-Message-State: AOJu0YzhNJCKiSddxfKv6giQV8bMMTpLg8hN3vwzOrIuf3cSTF2JWSh7
	h7pUtjTERnAu0CDUQlXVG/2f0o63JI7YlnynUOSSB0+WqIc7RoMfQRTCWmAvekNeE91yT2HYb0w
	EqT9C9wOvptWzJBCJSdb31EXZihc2hyU=
X-Received: by 2002:a05:6512:668d:20b0:5b0:23b4:be97 with SMTP id
 2adb3069b0e04-5b2f4b801a6mr3693256e87.6.1786392527084; Mon, 10 Aug 2026
 13:08:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729132736.3807082-1-sjg@chromium.org> <20260729072727.v3.4.0af20e702c540f54a3d1694654b158a9b783d68e@changeid>
In-Reply-To: <20260729072727.v3.4.0af20e702c540f54a3d1694654b158a9b783d68e@changeid>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 10 Aug 2026 22:08:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLmXtsWNdJ3ecPcpnSHK9E00fQSUmv5r1ooCC9n_zp91pA@mail.gmail.com>
X-Gm-Features: AUfX_mxsREooqobH0O-veo6ClRCAIrzdMTMqoFk0qwAXfbPSfoYfYy7nEvygW94
Message-ID: <CAD++jLmXtsWNdJ3ecPcpnSHK9E00fQSUmv5r1ooCC9n_zp91pA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] pinctrl: rockchip: Add RV1106 pinctrl support
To: Simon Glass <sjg@chromium.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	linux-rockchip@lists.infradead.org, Jeffy Chen <jeffy.chen@rock-chips.com>, 
	huang lin <hl@rock-chips.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 3:30=E2=80=AFPM Simon Glass <sjg@chromium.org> wrot=
e:

> Add pinctrl support for the Rockchip RV1106, based on the vendor
> kernel in the Luckfox Pico SDK [1] at commit 824b817f8 (a Linux
> 5.10.160 kernel tree). Each GPIO bank has its own IO control (IOC)
> register block, referenced by the rockchip,grf phandle of the bank
> node; the register offsets are relative to the bank's own block. The
> drive strength uses the RK3568-style exponential encoding and only
> pins 0-6 of GPIO0 have drive-strength registers.
>
> The RV1103 is a package variant of the RV1106 with fewer pins and uses
> the same pin controller.
>
> [1] https://github.com/LuckfoxTECH/luckfox-pico
>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Patch applied!

Yours,
Linus Walleij
