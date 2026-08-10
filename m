Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430B83A785A
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 08:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786351575; cv=none; b=VqappM+bzCDyoV2v6w3iJwl7SvyJepw+yXT9MxW7sw+3LIYZTCX76Socd2+pLzIWdcGhY917f2zD8sgXVxK8ahSZA36tdYmwotFbvACo9tfTw/x2XfmL3vVfRgj7H1QeAeM7hb8oFUUsKNbcvgmFZm5YLWoWCSXfD6WNt6gEAGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786351575; c=relaxed/simple;
	bh=RsKADUMgeowYjnZvcdkRK1ZAM4TNPwlua/rasgq2RME=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eUXz1CJO+ORExvWRixueo1ijgr6FBsI0NUgsy+qfFPDJ+NmD7euJxUK7CqFbD8alOYx3+BnY7oLw2H5IRpX8Vg85la/sCHxvkVwmo9B0LZwjBP0k0vDAWiqvs+Pucsl5iufl1+9SgcnxW+nJddCAiNzRwkxHqnhnvEr5n289/kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7NBcDyE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7NBcDyE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F851F00ADF
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 08:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786351573;
	bh=tCAzQ4QhvdGyVokqSsSAhCWMRFxWsmg0lAjxef+q6i8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=f7NBcDyErKeESFMMkK85akiTuHSSmtukeLYkVycOaX6C9+9Jl7AAtdVjdfKIriGIo
	 5w5Y5TKjVlLyFU65phqKJSPZmHMlbZMgUVr3/rIekcN2EmhI6VonHaAcSvxaArLfDu
	 9WDDu6VEC1wPTkqKWblIQpb9xzg/JFAEzGgSuvK4RBWb6TxZc8JFQXn5E3Y5fTZgng
	 u8+HPKN77sQmi9uEIa7+Mxp6zzGWt008EaqKdRUvkf/Kx4tgmJoMN99+1NKDMKmfQ3
	 654xFcx1DBLql0mP5XdLWb9G0PNa8yY1npBAdeYd2k91QyYJKkLXuChe6NI994k1NL
	 07e65rxWdr56w==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b0f19bea2fso1669035e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 01:46:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RocZ/PjJKv92M5NEqzh2Vc6haX4+8wOAljnTCXxmmlRO++RXSFT3WqrRmVOpEn79JUx+SuVt/HbAbV/@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu4l3hL/V9Rqo+OjdZVxw8xphc++91KFAOvpMtWE9CO7l/uDY1
	krUZZNIkWldZxgueWLG1Yvqza9tzthB6hdEx51475/MXZxq4YCQF+DriFw2j2KUUeIcgBgD8qvn
	YwDamYSEe1hlYg35ODv4RTt1EqOJ0VypOgNnWK95asw==
X-Received: by 2002:a05:6512:2387:b0:5b0:136c:5cb5 with SMTP id
 2adb3069b0e04-5b30919ecdbmr2749509e87.20.1786351572606; Mon, 10 Aug 2026
 01:46:12 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 03:46:10 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 03:46:10 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260807-ads126x-v3-1-f89925d72792@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com> <20260807-ads126x-v3-1-f89925d72792@gmail.com>
Date: Mon, 10 Aug 2026 03:46:10 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mf9Z5UMyt9bZP5b86mK0cWnbO=oxoR4iu+0f_YwZ-2CyA@mail.gmail.com>
X-Gm-Features: AUfX_my1pLRH6F78qzBY1n1Osm4PZslGFJSHY6YtJfzV1BJFXd7VlvF8TxDJ-XY
Message-ID: <CAMRc=Mf9Z5UMyt9bZP5b86mK0cWnbO=oxoR4iu+0f_YwZ-2CyA@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] dt-bindings: iio: adc: support the TI ADS126x ADC family
To: Kurt Borja <kuurtb@gmail.com>
Cc: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	David Lechner <dlechner@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 8 Aug 2026 05:58:23 +0200, Kurt Borja <kuurtb@gmail.com> said:
> The ADS1262 and ADS1263 are 32-bit, 38.4-kSPS delta-sigma ADCs with an
> integrated PGA, internal reference, excitation and burn-out current
> sources for sensor biasing and diagnostics. The ADS1263 adds a second,
> 24-bit delta-sigma ADC (ADC2) for background measurements.
>
> Each can configure its own voltage reference source, the two excitation
> current sources (IDAC), plus input and excitation channels rotation for
> offset and IDAC mismatch cancellation. This lets the device drive and
> ratiometrically measure RTDs and other resistive sensors.
>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---

...

> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-controller: true
> +

Where is the gpio-controller functionality in this series? I don't see the
driver providing any GPIO chip.

Bart
