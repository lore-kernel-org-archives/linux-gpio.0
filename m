Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB08641DEC9
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 09:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377588; cv=none; b=l0AAwdXkUVtaUBI2scghf40D6DHyDPeSIaedqRPvdS88D5zKEq/boMgSbMkIfj/eAJ2RrBAT7vtRX+w78oVwAYpXcSqhugE4dokOYn4wp1I/Jc4dMqtt1rkLabDBvOXXK83PKNwFRzA9f3hKhqHTUL1hyeAwgglqK1aLNW6nPtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377588; c=relaxed/simple;
	bh=U3pL/r2KqbNMXRGJnUmPkJJApk2sbtDKXeUlDg0CFvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U8yUnaCsN1F5NZjqqvxia/JGiBJcie6lWyjs/hJrOLeB4csMLim8iBJ1jCjtg/XZsJPAxBwXo0bPFslLv3WG51KKDzh+cyNMHrzXGsR4r7p47G/WCt9e10h69oqiqJ7BRitXoicEUCwDXuO7jvoAal0v7EVBO7QWVKrLTwhTVFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KAbGaJCP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KAbGaJCP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688A51F008A3
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 09:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789377586;
	bh=U3pL/r2KqbNMXRGJnUmPkJJApk2sbtDKXeUlDg0CFvs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KAbGaJCPl2pwRqgiBaRisrfDVljxF5095JbDp8UIKQrO5J9nnKk+Du0GCV4KjtMMz
	 EMA5cYVMRtdNvEaE+4g8+JU+d5RxtO7phG9dhj0bd5usp4mw/KlezO1rxG4ntJjNAg
	 6mBeWxgHyV5yQiAiz01PNutlVK8LvFV4FE9z4VGg3TQYYkVLoXrrQNd9xekgO1xqt3
	 zbt7E0NS4LZaVwcnawmUGAgKi2DGQgwWY4okUNKiZt/0RKIKzFroHN269/ql15fCTu
	 t4xQpG6FOY0x70aNy7DBPwxaVdyoP/UbfZ5W2EnIjaAKZolrSNS1J++HDS2Fd7+RO5
	 54plOCxxtJs7g==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16f15so1993976e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 02:19:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwLiiST8f7Kl0Rdl4HhcQqyC1w/IW9WzD1cVDeC2Hzvln/nULYGFFup49eVZ4WtLaAKQRzUaarSxuFJ@vger.kernel.org
X-Gm-Message-State: AFuF++m3vx0poyeylRk4zhGBRXaVG10N71SenHKscD6pxPhBq28Jadxp
	uNRfVOVgNnoHavXQPReCxs8Rg1HpuYzruRnu4Qy8eO8NOuSeEx11b8BRARaXs904rNr+kbk/Yfv
	6VZ2aRf3yYLp5fuIfe5RjyL8HQ8TlNms=
X-Received: by 2002:a05:6512:12d4:b0:5b8:9a25:b546 with SMTP id
 2adb3069b0e04-5b8ae6aed1fmr805374e87.16.1789377585071; Mon, 14 Sep 2026
 02:19:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com> <20260901-pci-tc9563-aux-v1-2-dd9b80738e70@oss.qualcomm.com>
In-Reply-To: <20260901-pci-tc9563-aux-v1-2-dd9b80738e70@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 11:19:30 +0200
X-Gmail-Original-Message-ID: <CAD++jLnsRzVpGg7Ei9DEavSEM=0i8p86aSBRV6D3ojSVFa+FHw@mail.gmail.com>
X-Gm-Features: AcwNN1V4jGPTTxI5JmI2XzUeicCVIST9ICc88T_JW0Qobpl2fqYclH7UfnYqw8g
Message-ID: <CAD++jLnsRzVpGg7Ei9DEavSEM=0i8p86aSBRV6D3ojSVFa+FHw@mail.gmail.com>
Subject: Re: [PATCH 2/5] gpio: tc9563: add support for the embedded GPIO controller
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 12:28=E2=80=AFPM Lorenzo Bianconi
<lorenzo.bianconi@oss.qualcomm.com> wrote:

> From: Alex Elder <elder@riscstar.com>
>
> Add a driver for the GPIO controller embedded in the Toshiba TC9563
> PCIe switch (and the Qualcomm QPS615). The device implements 35
> GPIOs using two register banks: three registers control the first 32
> GPIOs (20 and 21 are reserved) and three more control GPIOs 32-36.
> GPIOs 22-24, 27-28, 31, and 34 are input-only.
>
> The driver is registered as an auxiliary device driver; the TC9563
> power controller creates the auxiliary device and provides a regmap
> that gives access to the GPIO registers, so the gpio-regmap helpers
> are used to implement the GPIO chip.
>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Co-developed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Nice use of gpio-regmap!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
