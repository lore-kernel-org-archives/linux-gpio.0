Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A999239A7EF
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784971254; cv=none; b=ChcbgNdr7p8He7oywfSa7A6cC+RYg8MtN1Vok3lzTkf5kjFaCRWCKOZRzJO9KTWvFq8U2jGoowitZd51VbP8d7DBiQjP5FQiq6hNiUEoYOgOVcxEFRB8MZncbw3dmpyrnpmB853wwXtsW3ZREFVZfVvGbpkztc41LaYLWA30ZLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784971254; c=relaxed/simple;
	bh=czFeVM0srpJXC06T5IagXGllAMP0yg3xodfjsMJsWuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MrQnVKcQ3Zi/H2B3E1nENzapPKvwBblRIZbH6L1qlXB4eCgSj5gVo8HJUq+MrBIrEYiDhhQp4vUmmFazz/BQUdAQLJhmv/EnWnCCQ5asqRNyAFoix/8SgTKhnjir283FTGbC5kFJBXnpKKyckaCgtdG5JYOLGQrZvSpd5mwpYZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7l14/gk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7l14/gk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D4B21F00AC4
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784971253;
	bh=czFeVM0srpJXC06T5IagXGllAMP0yg3xodfjsMJsWuI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=D7l14/gkJuBe6XC8OfB4qnEEokrVYpojHRkeLihSOuRWpUJzZZuqyIPdJOwUrIFJQ
	 PWOxznPCASs/Tb9W3VehuxhBP8aVSs/J3G87zZTBiJz5jRtNL3z97Zx2FShA0zQbQl
	 GkkpHNyJkLwELaNVs23uFhiZOsBIXgn3kWaw9aDchS0wfaTv+k8XNOXTMNgrlY9+P1
	 hAmtn+OuRODHUyb/O8X1yoWiEuidm1ym0vn/15eGlRvmrh5ZmtvW1CYuzSNqtMGiA9
	 nYwvJ68Ntwy9lFsmn85Vo1IpLzB9EbtXFS4JYH/O7L6f3FiWURpEXuTUDJk2ZT9E3u
	 qpR6TDpYLTeMw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aec201b582so1230966e87.1
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 02:20:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rot4cYuhWpzzZqdyv5LGXHJ2g8t4HhDYtLTdXecP01K6qbopibX8yjbMfq4yN2iMWh5WDHH90ZhMz3u@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4f2uiPCTuaNX9RXByQdc35/Is+I4YPKtGmbwfB7aAiv2V5B2a
	Wub4TY84iXgjesEpplphaUQDPD6UbSq0YJuJwDzh9YzrN4CDeuPVQoNN/7iX7Q05vIYCvl+oCV1
	MUE2jthul8IY0a45sn7ZkFIt8lhKJeu0=
X-Received: by 2002:a05:6512:3408:b0:5ae:be47:f006 with SMTP id
 2adb3069b0e04-5b2c1b5caefmr259778e87.43.1784971252074; Sat, 25 Jul 2026
 02:20:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260719134548.8830-1-linux@ulli-kroll.de>
In-Reply-To: <20260719134548.8830-1-linux@ulli-kroll.de>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 11:20:40 +0200
X-Gmail-Original-Message-ID: <CAD++jL=tCKeELwvXQVTg0L4DLmGL7HiAJ3J-OaCDx2b8P6B+Ow@mail.gmail.com>
X-Gm-Features: AUfX_mwilw7yDox8SW8QhTXKiAqAqdg4N6cIf95uaJ25Sfj1T5Hau1WH7GGea5M
Message-ID: <CAD++jL=tCKeELwvXQVTg0L4DLmGL7HiAJ3J-OaCDx2b8P6B+Ow@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: qcom: ipq806x: mark gpio and pcie-reset as GPIO
To: Hans Ulli Kroll <linux@ulli-kroll.de>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2026 at 3:48=E2=80=AFPM Hans Ulli Kroll <linux@ulli-kroll.d=
e> wrote:

> The qcom pinctrl core supports marking functions that represent GPIO mode
> via PINCTRL_GPIO_PINFUNCTION(), so that strict pinmuxing does not reject
> GPIO requests for pins that are muxed to the GPIO function.
>
> ipq806x still describes its gpio function with QCA_PIN_FUNCTION(gpio),
> so it is not treated as a GPIO pin function. As a result, GPIO consumers
> can still conflict with pinctrl states that select the "gpio" function.
>
> This allows ipq806x to keep the GPIO-related and PCIe-related pin configu=
ration
> in DTS without tripping over strict pinmux ownership checks.
>
> Fixes: cc85cb96e2e4 ("pinctrl: qcom: make the pinmuxing strict")
> Signed-off-by: Hans Ulli Kroll <linux@ulli-kroll.de>

This need to be relayed to Bartosz as qualcomm pinctrl maintainer!

FWIW:
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
