Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED278488210
	for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 17:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789062975; cv=none; b=pcJL0gzkHsvZhKebSg42pmowYV/xG664KVV2QgwilsLKzmheMXkL0u48arFWhb7KIF19Z4YGiJzgpLCeMXtGjwQmTeDhLOMlpXAwW9w9ygC8D0POeKOqcxvfAJxch5d6KHqBX87s+wvD8qUDiX6bSwEOztJBp6w5GqtXpTWi7Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789062975; c=relaxed/simple;
	bh=BCk0UxVAq3meh2C+LZSGNv3rmbhvKRV7iCfFt/Dz3dw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nWvLkdhGJZ+gIafYtrJN97WM1qTYr8AJPpVRKAlg0Rfq3U233yF4Z1iRoGoXltPpjmfYS30CU9kAMIqcOZ/Giq77XCsWcZTYWs8bAwLXKOcFStgPrhE88L7vnwvnla0kb8kAbDn+bckE331Vw8Fs4EwUQKKfMCFfdyqzox67KmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDUBM3+0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDUBM3+0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4531F0089E
	for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 17:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789062973;
	bh=BCk0UxVAq3meh2C+LZSGNv3rmbhvKRV7iCfFt/Dz3dw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HDUBM3+05ZFHDOCV3OjBDW0KT66lt3/q7b/N7uR6w1oUY8uqaEoTzYybov7EbY1rB
	 xvvcjD5DMhUEfaXLgPCnl/6M9ejGznHr3u4dSXIk55Q8eTsoiNd4mJlB7GZmBjFZdv
	 AAa9kzInyRyo7DnxOEUnJBk1z3qeH+TJ3wPaHFM2/nsGtajQTFNlFbOgRBo/tlqRte
	 DTbxZtVrv56Lf5L8UlhriJQK/43QkZNiKkSCxgiEvBqwENT2kge9fIMzDU+ZS2bdaj
	 93qtzD5Aro7H+jutod11LtKHfucYn1645p8MsJXieZq5P0QL/ISvGRrasx3sn6YA/k
	 pEq5e4ffn/gqw==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d5bso177391fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 10:56:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByoPgfpqVCqXG/jxzbokXjpdeFEMXseuOeCq3CvJAZQLCEVFduNNzLLkC7jRPby9Qd7hhzLdxBmhD38@vger.kernel.org
X-Gm-Message-State: AFuF++kUdN8kc2wvz8dMsS1K7cRbH6jJ/f9eqYTlVbLzzR6grtcxv41C
	xBc+/vHI0a7kjP5yfXG6/ZBRfsTBdx8qGQJ4Qd2hx8fiu1fpjGnorHmBviEhuKyr7DjEFupAhj2
	78iovkGOfkvsIEOqtPlLdAnjrzOjMkVI=
X-Received: by 2002:a05:6512:2525:b0:5b2:a919:f9fb with SMTP id
 2adb3069b0e04-5b8a0329b60mr209078e87.22.1789062972231; Thu, 10 Sep 2026
 10:56:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-ad7768-gpio-v8-0-6aaaa15adeb3@analog.com> <20260910-ad7768-gpio-v8-2-6aaaa15adeb3@analog.com>
In-Reply-To: <20260910-ad7768-gpio-v8-2-6aaaa15adeb3@analog.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 10 Sep 2026 19:55:59 +0200
X-Gmail-Original-Message-ID: <CAD++jLmrc41AqZ9dR-dZnHJJZymYSrn3Vbv8AHNmRop9LUCFcA@mail.gmail.com>
X-Gm-Features: AcwNN1WkiCA2qzwLBb4fggEbAls0tX6BGDPCw5Z3aG869Vzf2_ghI7zbOjrfGGc
Message-ID: <CAD++jLmrc41AqZ9dR-dZnHJJZymYSrn3Vbv8AHNmRop9LUCFcA@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] gpio: regmap: Add optional runtime PM support
To: Janani Sunil <janani.sunil@analog.com>
Cc: Michael Walle <mwalle@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Janani Sunil <jananisunil.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 7:29=E2=80=AFPM Janani Sunil <janani.sunil@analog.c=
om> wrote:

> Some gpio-regmap consumers share their regmap with a parent device that
> may be runtime suspended. GPIO register accesses must resume that device
> first.
>
> Add an optional pm_dev field and acquire it before register translation
> or access. Release it using runtime autosuspend after each operation.
> Keep the device active across the complete direction-output sequence and
> propagate failure when setting the initial output value.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Reviewed-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>

This is some nice stuff.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
