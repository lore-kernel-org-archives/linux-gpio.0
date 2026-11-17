Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950422;
	b=MwECuh2DsecFSWbpsnNs06+9hxYNN+5UF8uU7CGIcM3PeHhLSQsyGVZ9QMqXrnUGMMSR
	 ozjO6ECiqCRej3zCaClF0KobA+hTjq+7ELZ6ESaQbOCmlrx0B0hIxDpQ8CcbeNLPaCQZM
	 xbDy965qIJbHsRGnLTtpoWuAX7HVaa7WggOEtX5nLITzCWiLmQIRVJQ+qXMs8Qp66hcoX
	 huOO7f1DDYZoIX5mXhvJXPZyNMXSeteV3CHzIeIUsrURjvZkx7M1YnLoB4VqyQwZLudqt
	 1R2J1Da+wXGWNGlasiNbF2lMhG8d6V6V1G/yUPIRekjYmMWJ2ozrtp/PESQadOB6cPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950422;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iGBY6pPGdt665O/LNZZyvPu55C366I0ivMrwgomHXZs=;
	b=1nZMqMUorh6gOJQ4ydpberSIkJbi7jGtRRF7JvKbRC29LNBCPPwk9S83R5mmS0RzWoPC
	 ZZ0GcIIZHMgB5CB87gi5YjsF2tiGcEOFAcSYWnMRiqEDV1EKOYHC2yQEHzHiQCcnyJWiE
	 5Fs0EAflWNznWNxXCdkTkfRE7+9DqmzXPcnkASeDopekUXTTwOhfVgZnFoVcRywBJoFOP
	 uB1cF+1euUqRcJJixbzGw12Zx7Xj9datUa+5F3GyZ8/EqQTV42W1gNAmBq1LO/ktV4ETr
	 np0S7DwUIR9yWDdVC8y0XQ3SpqcVz+9+4trOT/um5+cuKF7eZRUA/wxT+jMoQc0gOzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YoDem+AT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E68606A32C
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 21:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YoDem+AT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B811F000C4
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 21:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794950421;
	bh=iGBY6pPGdt665O/LNZZyvPu55C366I0ivMrwgomHXZs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YoDem+AT0QRAWmaS49ofjMVfTlKctJefFqajPnv7dCWmJoyXSbBAkQyiE9tFvFNqs
	 WUSNbOIrXFwrlzuCkXlesHZnwIb2Ge/JLf5vk+f9XAO3KGh7WkIaYEXe/X1Pq+9foa
	 /oH51RI8ruABMjLPQoH58w5MKs8UnWgeVzv+My7dFaqM6+VK/08wOWYPYQQWEv35Yv
	 E4uIBZByTZLH2+mEGjQ1/hakxhq2nIAj/xq4NQLbSEQZmNEp6Jra/tdG9XJl23GItY
	 dA9G/7xNrUOly17HloFjDuFvV49hemNLBzwB7EGQl8IUMpO1KlXYb07OYilH8Q1yxY
	 XAnNwRF3TIPYA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso155681e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 13:20:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH7K4UQvOxfYtMOXDup4Gl4+jNKNEhWO3DTu6mHYQPwEFAeBG6QFDI3Tio2m2z5JbyWnsdl8JVNeMsV@vger.kernel.org
X-Gm-Message-State: APuU4Z/s4QbakcCdOJfRnJBjEPtRpDZhr4NimJG1BNHRhdcjKvsDDRbR
	onWobE5neH1oPJAtmDvLWAO5hCfNi0zaUesSBFfDzZ5JgN5mL6ErSCENld7Mz+VmoXYYQxuxrW8
	dU9ZwyrV0KSTllSzCMJ9hnG8n34nhqhI=
X-Received: by 2002:a05:6512:2304:b0:5c1:4e10:20b2 with SMTP id
 2adb3069b0e04-5c1a0f94392mr1254808e87.45.1794950420663; Tue, 17 Nov 2026
 13:20:20 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109194910.2282454-1-sahaj123.sc@gmail.com> <20261109194910.2282454-3-sahaj123.sc@gmail.com>
In-Reply-To: <20261109194910.2282454-3-sahaj123.sc@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 22:20:08 +0100
X-Gmail-Original-Message-ID: <CAD++jLm-Zo=L5A8kTDKaBojmdHT67TZLqc+LjgWPmYq2dTZGvQ@mail.gmail.com>
X-Gm-Features: Aa3M54rX2Yw2mzLa-c0fBDhd98NWpVXKyS6G16iraPzzN9vKI1SD94pE8d26hWc
Message-ID: <CAD++jLm-Zo=L5A8kTDKaBojmdHT67TZLqc+LjgWPmYq2dTZGvQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: davinci: allocate bank IRQ data before
 installing handlers
To: Sahaj Chaudhari <sahaj123.sc@gmail.com>
Cc: brgl@kernel.org, j-keerthy@ti.com, nsekhar@ti.com, 
	prabhakar.csengg@gmail.com, avinashphilip@ti.com, sujithkv@ti.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 8:48=E2=80=AFPM Sahaj Chaudhari <sahaj123.sc@gmail.c=
om> wrote:

> If allocation fails partway through bank setup, previously installed
> chained handlers still point at devm-managed data that is released when
> probe fails. Allocate the complete bank-data array before installing the
> first chained handler so an allocation failure leaves no handlers behind.
>
> This fixes the probe-failure path; it does not change ordinary device
> removal.
>
> Fixes: b5cf3fd827d2 ("gpio: davinci: Redesign driver to accommodate ngpio=
s in one gpio chip")
> Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
