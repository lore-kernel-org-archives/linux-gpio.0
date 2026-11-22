Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371952;
	b=r8SDnRSQNU5ANJMpMj8RldpDkoWDhXmeOV3vr80IIneD9BlED52WVWHy5kNlrAzSCiQK
	 kxU0WTliK3g5BpjK3ORIptmb/1KeSS6BdgSnyiVy24EWUY7jvTnmj2YtT3rw8BtSdOZaB
	 TtQVeUtXrfPBtbghhMmjsrj3V4fWzajcyRgnLmsz1zTWgauLs2UL+4vrWsTkh7sWCbyL+
	 FqX1s6FIRyao/FMAGKs32UyWgK+qFBd1PHY8nLbXY/HjYCQoXEJJaP9BmvWoJmI+g6NOe
	 uzTx7uNjQ6SiThyifmKBuezPJRH/yi4k3Ot1LomA/ubMHUeWryxW4VfzcPSWk16i7EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371952;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=l9CfgsFXDwrrEwwpmeKXg+KOAvu1yqasIfQl+WG4JYU=;
	b=g82jv6ypItt/7dnQtHgOoMbwyiP2SLHNsBef8Yu1dM4tT/PuapyF4xal0a9ZGl/7RR6V
	 KxMA7LHmzfSqkVCyCMcYY1sB/lBsx9meQScxCQhjqvfW2cZ2eCgkMZtC7diJmTCLf5FUo
	 Qf2uuXjj+dXY9kHW0Hnb4avFKriApG7FFTuLjsqzPk4DpjpQhF8oMVcHZyQTaS3jGoP7x
	 5nzqH5woOFb9HS7idQDcS1DzXLBzOXKSU+9FTTwtGlEgMvmQqY+aFtfaQ7xWUjRNkLCRL
	 Gbl325nSpyM7Mjj42OTWJcnKEh7lXXChX7zNktivjIKP9QvM2HQ4V452y2S/H44hFCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="LGc/9FGB";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE7E606A320
	for <linux-gpio@vger.kernel.org>; Sun, 22 Nov 2026 18:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LGc/9FGB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8361F000D8
	for <linux-gpio@vger.kernel.org>; Sun, 22 Nov 2026 18:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795371951;
	bh=l9CfgsFXDwrrEwwpmeKXg+KOAvu1yqasIfQl+WG4JYU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LGc/9FGBPBQZUvNmnpW9aoAV8DRN4f++L4BqYc5ofUu3imrsycqXZMRcVEBlOftP4
	 vqUSv2ddiGT8RF7fySiPJY4OCXr+N9UBJewMpLaZV5PW/2ggNoZZFKTFBjOTYnyc7D
	 79wisqxD9VZDky1SD0clVI6y5/AKpoUdxmnLf4iXtYiyRraYk8SLRMeqRC1C15AJVs
	 5Z6mvSNeDKCG3CdgJt7EnNrcGIaG5B5PNHiDeR/dULP6ZZ2SypagrvzPfAq0QfmVqy
	 mRjtpd8gKMvNXE4FMqpuahcZlvUqm9DGbYBFVGmqKSasaJSjjMyFMHHe1TGuiDCKU3
	 xZXITtGy+mlxQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c14a204305so1634365e87.3
        for <linux-gpio@vger.kernel.org>; Sun, 22 Nov 2026 10:25:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFA0VaokXXyhyKeOWGNdpIxbZmuQ1HESwFSvLtbmYPLk2xLEH55uZekQrO2344vr0s5AkxIbfwie2+r@vger.kernel.org
X-Gm-Message-State: APuU4Z+kJKLHA+gqJeadP1uA3K6EWnBaKiFk9gpeNETyp7nv5rMAvZdi
	WWCBqCedjAvqx3BdxF2yKovEnyDlR2eSM1VUpWVIyibdIuFU5/XpQAXdqQXDMCn+JMtx3tOxk3n
	Xy64th+GybOST3L9NWVJ1fQts6RkXKxU=
X-Received: by 2002:a05:6512:6d2:b0:5c0:d9e2:f66 with SMTP id
 2adb3069b0e04-5c1bc7b4301mr2437293e87.20.1795371950328; Sun, 22 Nov 2026
 10:25:50 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-cs75xx-gpio-v6-0-37aeda0aaedd@gmail.com> <20261119-cs75xx-gpio-v6-1-37aeda0aaedd@gmail.com>
In-Reply-To: <20261119-cs75xx-gpio-v6-1-37aeda0aaedd@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 22 Nov 2026 19:25:37 +0100
X-Gmail-Original-Message-ID: <CAD++jLkbKaRW8J-ZRxkrM5SX0-7eZPu=C_5OLCGquYOtWU4TOg@mail.gmail.com>
X-Gm-Features: Aa3M54rbItLFWFNiExC6gKouuAtPmZpVlhpXK-hpWeRjgFU7aqgZIJC1n_xCbCk
Message-ID: <CAD++jLkbKaRW8J-ZRxkrM5SX0-7eZPu=C_5OLCGquYOtWU4TOg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: gpio: Add Cortina Systems CS7542 GPIO controller
To: filipp.dunsky@gmail.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 4:09=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> The Cortina Systems CS75xx SoCs have five banks of 32 GPIO lines. Each
> pin is shared between a GPIO line and a peripheral function; the pin
> mux lives in the global control block and is not described here.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
