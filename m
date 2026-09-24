Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AD548165C
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 14:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261249; cv=none; b=UP1hE/ZnlmxIb3vwX0eYJMkcRLciO+EOKPxAYPbko6EpvajYCudW5wMKfotJ3LOy6Hh3LCXwxBP+qHgrJFS/S36qUsGW/xc/ROdk2jmnPetrTGqpxOnASl2B4ILAXmZRfrMm+0Zp1ZBlEu61O5RwQCUVf1koZkFGZtF2pCbmM3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261249; c=relaxed/simple;
	bh=I81OH35bS0gLfQaCw54On7nrzePGh/9twZAPCzjnb0Q=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r0yzP7Gjd2ikmAjUGLXge0Kj4lO3G12bVku0oMxjNjMKmeoPXJDyICARYplRJQi1V0o9sF65nDD31arKBkVJENMETrHz+cpFwm+G6k2w8Bj+piRN23hqFngJiD9UxXEetmEwo5EHkTTL7dcF4I1n/9xMZpX1TE3/JZvwf/i1Nas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYQnT4DT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYQnT4DT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DF31F00893
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 14:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790261246;
	bh=I81OH35bS0gLfQaCw54On7nrzePGh/9twZAPCzjnb0Q=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=aYQnT4DTEwcNfwZzEp4MApCxLdB2caVuZnkr2A0pbsniqrXuOwKKogSHSMfjIGbCm
	 RQawvb1hFNprixA7osXvdzJd+FZAQVzQe7lrFGRz9Qh70x5Xewn/zjRfeuOZ10C/jU
	 bTfFtuhfCvLggJgBX+hSNKmURJQLsCNtK+bLpkLf9Pi7zLGEQkzUNBRdRYV0P4Q1pS
	 QFKf9yxiP/RaFb6RVeYZC36jVQNPGqURTk0hC7/lMbBuMN6JdsxpRKmwLbPeiDkJ/+
	 EwHdT6NzgCbfqcFUydTdhz66DxtL6LnlSmEj2jSeCzT1uqoHeQRw/9TxHLmlWuOOyo
	 JEXD0MMIwtIoA==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a302a4e42aso16253591fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 07:47:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwHfXW+XAPhYt4dXVrYv5ViIDYvgIrmkLS8HMeNnko0NyAnBCotOcVAw1tSJ4OWeEj/PDNrOGRn9+1M@vger.kernel.org
X-Gm-Message-State: AFuF++nBOwRdPxDjUuUepSFNxT8m4rB7Diq3e9bglcSBIHJ5KBV1I+Ew
	DBVZk2GXCv+RKo9j74ksMYRgiAVEbl/MLJmZ4OV8yi+5migFkvVcJfBp1wEqfuZA6W3ly6ufX3r
	QYBnM3iQVZH7uNJgmmKSY2OTyWI2wL36nKkTCnKh8GQ==
X-Received: by 2002:a05:651c:31c6:b0:3a3:749e:31a7 with SMTP id
 38308e7fff4ca-3a63e16b7ccmr5452671fa.27.1790261245159; Thu, 24 Sep 2026
 07:47:25 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 07:47:23 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 07:47:23 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260923182243.41060-3-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922103051.5257-1-farbere@amazon.com> <20260923182243.41060-1-farbere@amazon.com>
 <20260923182243.41060-3-farbere@amazon.com>
Date: Thu, 24 Sep 2026 07:47:23 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mfx1bMzcXW_inG3F=YRBJxhOCPgPAYRF=gV=waxb-cX6w@mail.gmail.com>
X-Gm-Features: AclHuK-qfkNKqtEkucULl-Wwu4x1GqZ5M9FyRIxKY0CzcvLn9b3cHvxWzFK8qdM
Message-ID: <CAMRc=Mfx1bMzcXW_inG3F=YRBJxhOCPgPAYRF=gV=waxb-cX6w@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] pps: clients: gpio: only tear down the echo timer
 when it exists
To: Eliav Farber <farbere@amazon.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Sep 2026 20:22:41 +0200, Eliav Farber <farbere@amazon.com> said:
> remove() calls timer_delete_sync() on data->echo_timer unconditionally,
> but the timer is only initialised by timer_setup() in probe() when the
> board describes an "echo" GPIO. On a board without echo-gpios the timer is
> never set up, so remove() operates on a timer_list that was never
> initialised.
>
> The guard used to be there: it was dropped by commit fde046a8c490 ("pps:
> clients: gpio: Remove redundant condition in ->remove()") on the grounds
> that "the timer along with GPIO API are NULL-aware". That is true for the
> GPIO API - gpiod_set_value() is a no-op for a NULL descriptor - but not
> for the timer: timer_delete_sync() on a timer that was never timer_setup()
> initialised trips the debug_assert_init() check and emits a debugobjects
> "not initialized" warning under CONFIG_DEBUG_OBJECTS_TIMERS.
>
> Restore the data->echo_pin guard around the echo teardown, mirroring the
> condition under which the timer is set up in probe(). gpiod_set_value() is
> kept under the same guard as it only makes sense together with the echo
> timer.
>
> Fixes: fde046a8c490 ("pps: clients: gpio: Remove redundant condition in ->remove()")
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
