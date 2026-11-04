Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798920;
	b=rH/mFAblmi0Ww+bOMpiiqh5JqjWAqtIZHnzr9I2zMGBRyCzfpjhSDK8YIgSWKqSrAULH
	 lUXBZj4/Cs3PyG9npzzViHiVG+gKc6e5Qmf5PHR9gahzR7Frd0WrYRDicheEwAdjECzzo
	 s2Im+g6E30aEwUoY6fhfLUe/zmZpjtXqy5Xf7TIW1WZYlelXSu4+mVSadgbBCWZYix8ea
	 kfvt0QeLsnpoFXCu4tUAUfNMrd+6vQhaEnxAml8uvI5ayU49ajtX6UtkW9SM9n4G24wId
	 ZV2gat5Jwndebl+2K6deJUhvXjUxawUpTZRuVA0SzvadF0wnP55ZxBpIZ8OYmp61ttg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798920;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ipkAqbggt55e8owGiWNHCkmgjpvjuLsbOQoZe1ToEhU=;
	b=JI3a6fWQYpsefonIJurcCk/l1X4m+TIbTNhZCBkMh509mMA8s+CCgVwB1DmV1ZTnMMoK
	 HWrHlKCAXWLjVPxkn7FHn0rLteWnXjbpzXoOmFQUrcwuJfwgElVXk+U+tnvRh6k+qwtfU
	 YEo0fIkdLGAx1IaD/RE57QWSXlVZ0EaAayKIkS3/9Q1lpOP7M0S12VdClFYXIxKolxSOB
	 hCsiGIIFRtBGdW8tf0MQq1k/J1fv91Npe3OmZiuv1K3K4lgimBH9pSA0ptdUTEcyGvUM3
	 rn/dA2KOcOBRZoKEOuOB8lQl0Mj9onu3ES4lH+zKVjtjjOaPSHTKZ6ZgZdR/nOMYy5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2lXRFfX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8BE606A329
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2lXRFfX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C5B1F00A02
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798919;
	bh=ipkAqbggt55e8owGiWNHCkmgjpvjuLsbOQoZe1ToEhU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=T2lXRFfXZaLRNZ/0XiTfwEfhqfbR/AxqmiJ/PC48id2dU+KepIz8CsgB/a4Xk67h2
	 7JAh6FXQ9U0YT/jtJK7cG4KAAhceexawpksqe7tvilSADeR9nKQ3V9J/Iq5li0qQcA
	 ii9LuccCIOogG5K7/sYje7YG/OIwCrqbXpUhtOauxI0PX5wJVkn02lUhN1Fse1pFKu
	 2bnCsKzc/NRVJfJzrrpTojvgbZClmYAPEgp7KXnmQS27x6F0FeIBY5fj42fvHJeIad
	 s3nZOmI5k4euB7uEzu6BX7BtwLHl6jNetFdv7vFeRkJYpFupdnXsUI9EVJ6XOgFWGx
	 xhCD2R/KEoZxg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be4c78e8caso538292e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 05:28:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy5LQ86hlKmSK4j+KsS6Ki9Nxgh024zi+eQYP8kW0xu3gNB/QSylt9QtbQhBXuMWNUjNEF894EdoJ/k@vger.kernel.org
X-Gm-Message-State: APuU4Z+LdMFoilHPaGZx4NlTxjbW5cBXlF7rzDOOsr0GrRHk/OHOXe1l
	SthKlcNaUYcWkJpFKSNR8aPWDd4ujfQrL7O+Tm/q6zhjkporr0SIxvzyizJ+JVIkRFE5cxOicoR
	Kz3WWksYk0uEZxi2o2wciC98qtgOVbuo=
X-Received: by 2002:a05:6512:124a:b0:5bf:d60c:9f98 with SMTP id
 2adb3069b0e04-5bfd9583912mr6161437e87.59.1793798917566; Wed, 04 Nov 2026
 05:28:37 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023175710.19181-1-vikrantyadav4802@gmail.com>
In-Reply-To: <20261023175710.19181-1-vikrantyadav4802@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:28:25 +0100
X-Gmail-Original-Message-ID: <CAD++jL=0E8+H9A6M4r=+_P5Q6BDyL9J0A6DDZborrMt0ioAZkA@mail.gmail.com>
X-Gm-Features: AclHuK_cAGzrhoW8feJiHqlVa1pPLSLWgUyyK-IC6FwMXxU_M-CdGLm6sZ7z9jw
Message-ID: <CAD++jL=0E8+H9A6M4r=+_P5Q6BDyL9J0A6DDZborrMt0ioAZkA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: fix bias readback in airoha_pinconf_get()
To: Vikrant Yadav <vikrantyadav4802@gmail.com>, 
	"Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: lorenzo@kernel.org, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 7:57=E2=80=AFPM Vikrant Yadav
<vikrantyadav4802@gmail.com> wrote:

> In airoha_pinconf_get(), the last branch of bias check
> "else if (pull_up || pull_down)", has no check on the requested
> parameter. It was meant to reject PIN_CONFIG_BIAS_DISABLE when a pull
> is enabled, but it also runs for PIN_CONFIG_BIAS_PULL_UP and
> PIN_CONFIG_BIAS_PULL_DOWN. When the pin really has that pull set, the
> earlier PULL_UP/PULL_DOWN checks do not reject it, so the execution
> reaches this branch, which returns -EINVAL. Reading back a pull-up or
> pull-down therefore always fails.
>
> Signed-off-by: Vikrant Yadav <vikrantyadav4802@gmail.com>

Maybe Christian can ACK this patch if it looks right?

Yours,
Linus Walleij
