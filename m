Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950389;
	b=JIhG+XNGkKgOJFcqPzSdDq1KFaLkmp6ndrj2sU/uXKyPyLcc/mwSwjUHyQE04kF0s539
	 fLm+BFReAZSXeqO0LrI970cramOaBwEq0heZzeZbsZ9Dr8YkivQi612eSYvkyFJGREAuK
	 8vV6jNoQch8UNZeylvw7yYM39LH7IGcDo4DPhRW8VIVMVn2vl/dAyip4VrdllPIsdudj2
	 JWt8EMKSxlMD/0mdp6+5j/WZI/dj099Tz133r+bQMoYQhiMjLPTtRz/3nGgLa63sidKiI
	 sd2GM4dn+7wXICQ4TRxUvhrN/3pM5RqYaVRXGlTMqMFcWVCrHY+fcviQ6J/3P3tY+9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950389;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+MhpUSiK+IXbujmRSb4i0Yi0wcelsHhHjMYNDrl5RnM=;
	b=r9Bu6riM4e4gpeLtNZUvQIWARSY/zU1+bjpX2LoSBF/lpgDptQ0hM2CMfddZjrUbCC6u
	 yaVSYKULE/b5fTGk1JexA7lhJ9E2lM9WSLn5+Vbze8Y6LRo2BtwhSq1DmJEekRb1RIHfN
	 XWK8C1Ja8QVW/EvMr8goRUkTcwhOitcaAQl7qUqoWouFqih1SwSK7BvenKqOe7RQMKN9o
	 M37aNilR8r+OqgZMzOjsvtccVWQTGJlPefbqQlNP9EReBu3oOWOZRpR4YopjkEU3OL01F
	 GsUx46yyEQAOYiHcqQt3BDMUPOn3NUBKuzzrdVTINHQAsNi9W/nEr6xoU8KD828cQUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GAWTxZ2n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46437606A32A
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 21:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GAWTxZ2n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD86B1F000CA
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 21:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794950388;
	bh=+MhpUSiK+IXbujmRSb4i0Yi0wcelsHhHjMYNDrl5RnM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GAWTxZ2nbhR94NJ7n90jGVrC1thSbsLc5wHSDTT0L7xPzk0+MMwZyVG6Xf1+ogpjh
	 wMwKM1fBJSt1bMBHsvb/fro/WQwQQ9WGGWLzyb1WxoJaJU5qSMrV2/0xA9Kj+ulpEf
	 pjKQ1AExGqL+CR0ivN19LZnHEWbRqTFdZIY1NAxC3yCwWJwjKX2d8pWoFcZ0yF519T
	 MXBweq3WbJh/FOP5NV64xXsiqqZTajo8+SuEKglczZ03TcLm4k2SvyWlPVgsKHxRjP
	 4PfTFXh3wlVqoHaSl+oHixRJsMcqNtYaRfDEH6pci/ndqACufc/7+r+adZytukX8KY
	 qHKWOB7D45Z4w==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3adfed9a887so3512061fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 13:19:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGjna3EZfX1MXflrrebG/l2ThFoXihC/wkG8ro96EcpKNJfaU7+Ou+LOowyqXICyTszDzDlzrWFZ9uC@vger.kernel.org
X-Gm-Message-State: APuU4Z+ThiWHW5wqcukt6c1E6Lep3f5QDBv2dfqXl8IsUoajJjiD9RzE
	G8dP06g588oTLbAvN2YyYNXvpctFdwfdDYW2QDCFCpD9Z8KQk9upXr2oBnU+m20RhdO63J5z7pE
	5CUmtjKXqYmlYvnPOOdgA6q3Vpx+4mxQ=
X-Received: by 2002:a05:6512:3c9f:b0:5be:3444:57f1 with SMTP id
 2adb3069b0e04-5c1aa04abf3mr115048e87.63.1794950387532; Tue, 17 Nov 2026
 13:19:47 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109194910.2282454-1-sahaj123.sc@gmail.com> <20261109194910.2282454-2-sahaj123.sc@gmail.com>
In-Reply-To: <20261109194910.2282454-2-sahaj123.sc@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 22:19:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLkyU4OVTgYtbih7Q73WJB0kSFb64CYJLuiFW0ZUGpQ36g@mail.gmail.com>
X-Gm-Features: Aa3M54o2GcB4ftxhBt5xRh5EJOcNS3butjePxGJPXmqVqLMPZ3xuDk1XYTeUbzM
Message-ID: <CAD++jLkyU4OVTgYtbih7Q73WJB0kSFb64CYJLuiFW0ZUGpQ36g@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: davinci: use controller-specific MMIO for BINTEN
To: Sahaj Chaudhari <sahaj123.sc@gmail.com>
Cc: brgl@kernel.org, j-keerthy@ti.com, nsekhar@ti.com, 
	prabhakar.csengg@gmail.com, avinashphilip@ti.com, sujithkv@ti.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 8:48=E2=80=AFPM Sahaj Chaudhari <sahaj123.sc@gmail.c=
om> wrote:

> The file-global gpio_base can be overwritten when probes for multiple
> DaVinci GPIO controllers overlap. The later IRQ setup can then write the
> BINTEN register of a different controller.
>
> Derive the BINTEN address from the current controller's mapped bank
> instead of shared global state.
>
> Fixes: 118150f22d6b ("gpio: davinci: move to platform device")
> Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Look into following up on Sashikos comment separately if you
have the time and energy!

Yours,
Linus Walleij
