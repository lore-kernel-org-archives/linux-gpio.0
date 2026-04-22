Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD74637C0F2
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 16:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776876198; cv=none; b=nOwBCnTejdd6Nd6NKca9GAQAMXwW+F8KzwFRxcpLET4Rscnr7GmkRHekuvRyojFqpbC+UiDDkDBcwJtXhisVOigw5qmEJ8xLJN/LcNhSvL3p7wROpSFrsRFonLfIretDBGnApzOOm1mCfww7yoCFzSntXlMQS0MBTuIA92fiLMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776876198; c=relaxed/simple;
	bh=ki7ctX2Txm7d7ZEc99PkVh8KlJFUEtHlN9kAmelJoSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A61mGguKu8B/CaG/9GXWhv2NWlN5nJ8Lm9fnSAqd6b8boR+iscd5uuQ6ZdkZBx/UtH2ShavXA70huU6Y3stkJKXVgK4Qu3tk+9xoSjESgzzw1CruBe4mI2EmFxMkaSNcMtbVQpaO3q4DyWaIXR6WWEAeeKFlfrHvmImunpp3JCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WucEkB2n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WucEkB2n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 684FCC2BCB4
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 16:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776876198;
	bh=ki7ctX2Txm7d7ZEc99PkVh8KlJFUEtHlN9kAmelJoSo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WucEkB2nXHMf3JGXkpu4TuvUkFUPxRcQ4FmIOo3cLWiTlRnjq/bwJdJhDVnO4J+lg
	 qbWl230lowxPzs8YqMVDqMJBjGmpZXRqwpyJQWdKSEy/IpNupzoBhPt0Ofgxv/Hsi7
	 oY6gNoab8S+89z0KDxzd+Are5fNvwgjkFsypIMqVeQGZY9XjWA+3r4mUhq6TMLTnwo
	 oeB3GxeM82SkQ9LT8MbHAg3o+PzTIu8ptGjqER0PGQBD6l9jzjW7VjiSyXI80ZY+is
	 VzffIYWCTzXwGj0c/+iB5k03TBf5eijkfQtBhjSSJmzZGL30tVL80VxeZZumc4wRp6
	 TdQHppXblRbQQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59e4989dacdso6249171e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 09:43:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/uD6QBqDZwpGRKZnCYOzvglAwZctdLr2CGMDy/MCF78CdtvHTk3RSrG/PgVZlQ+R/VLx+hB/qNe6Db@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ecbZ1UxSlFtsOjMMDhmBYeOT/BcE4Nfb7WdNG+2cePMqDRUh
	MdfVcUFulqaYHfeuTg1Zh7kNX5XrkeAOm4RKbltFDxpMQWqdXBNwVWbRbU3cDX+BJGuDqQ8y0T6
	EvxrWKg+vZcJq59hnArfOrHkQMxDqzJo=
X-Received: by 2002:a05:6512:6193:b0:5a4:1cc7:f744 with SMTP id
 2adb3069b0e04-5a41cc7f91amr6365794e87.6.1776876197106; Wed, 22 Apr 2026
 09:43:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413102326.59343-1-dev-josejavier.rodriguez@duagon.com> <20260413102326.59343-4-dev-josejavier.rodriguez@duagon.com>
In-Reply-To: <20260413102326.59343-4-dev-josejavier.rodriguez@duagon.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 22 Apr 2026 18:43:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLn-+KMYwxM6xRJi2BT-c1gBHHp_4qPMAdMSpv-MjEXL9A@mail.gmail.com>
X-Gm-Features: AQROBzAAJx6D6w16YtyUS9T1hgK6MR3tXisedCrCmxuKxaq5FRq3ou8rLvVVqUw
Message-ID: <CAD++jLn-+KMYwxM6xRJi2BT-c1gBHHp_4qPMAdMSpv-MjEXL9A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] gpio: mmio: add port-mapped support for gpio_generic_chip
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: brgl@kernel.org, wbg@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 12:24=E2=80=AFPM Jose Javier Rodriguez Barbarin
<dev-josejavier.rodriguez@duagon.com> wrote:

> Add a new structure gpio_generic_chip_port_config for configuring
> PMIO chips. A new function gpio_generic_chip_port_init() allows to
> configure them.
>
> Add an io_port field to struct gpio_generic_chip to distinguish PMIO
> from MMIO chips during initialization and select the proper register
> accessors.
>
> Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@d=
uagon.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
