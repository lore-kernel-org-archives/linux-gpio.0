Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883610;
	b=UGXxTdy99TFoAUdrERE5sOtiXkkilSZkLNyHMoFuLj6B0UZhtBJk2VEW0WXZK9VdzaDC
	 fLD15pQTJL4Q4MojUPYD+QKJ5H4Nff1JgGC2d/zdGKSeBhQh0tDT7HF7VoU4n29BLxi+7
	 E3vVpNfBCnHmqfy/S+weX9uRJKmk9Pvgb+9nqTAgz/z3kW4JKCSYlsVzfBFWSfix+/BV6
	 2BS7nRpImQ0MD+ULI/M6z7mmgzwhFcEybBTSGBN35I4euZCBHTHKGWipEji3l2QIMaNBd
	 r9JsQLjE2JryzXpkJf+jRspEQfebR8nUUuj6s8O93h6NbAhvU4Bdo8rTyMwX60OnEDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883610;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5pTLy1DMRoDwj8lZJ0UbFJoGofnphf79x0x39goZpc4=;
	b=AhqdhwjvGxhE3MhPJbHauwHdiOyZuKm08BBQCTmIh3BO7zYUZeOonMOvhP9VFUg8t6d7
	 oJ/+DFh+ZzjC9FsaX3pTjQXs30SpWUJ6xSA/zh606+JYwvZmhA2sCQnaBb2PF0+QtsHMd
	 ZG+ZphN6EwlK2z6J8xRHSACN3sHOcG904RgsnfUsJyxMDb15UkAy3uEXyC3gVUMGQy4TN
	 5CphMwgzeC4rHUXRZ/AyygS/7vZNmwBGCKYHlbvhi5Lfu/UDhcke3qI0PEdP5zvJQXc2t
	 7FeQbC4n6nPPl03InNttJUie/mPmPKrX3vw6wiW9kd2Zcg60V3eAfjnDkUxbnGYIBeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GFzIdAqn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15419606A329
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GFzIdAqn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959FE1F000C1
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 13:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793883609;
	bh=5pTLy1DMRoDwj8lZJ0UbFJoGofnphf79x0x39goZpc4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GFzIdAqnSGNDH2hk/s5EizIbO8Md9Uk7qUBGRcMk6YOCRtjRuTx8aF8JnVY0p1sRK
	 MKSsgJABo1VqsX6zMSpQqS2OMdEg57Lr5d2l3JfS+58d5TD2WCqomoFgZfqKXXxQ3w
	 ULUnwoabhVQusvErOpRBpYbXRzV9aPrXrahoXdgoABDjQE5k5Ecq7MO+IlY1D1GVze
	 YBboLDhn9/d4l2YECxVMbAVjDuPKoNUkedy3h3pc/adMBOZ09Sn8oYLyNgUwNTHyjm
	 LgGWKKv3AYkmC7u+Hq73zNqrWqUSj0m6ay+5OJpLHDQvihtdgZEAy2PZBvwYnRqWzI
	 vsqcQHY1737Uw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so1925225e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 05:00:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy8rlG6/QDQhUF2gPgQuc0tOfDHSIKRFkJ/ckN0/ZMFZ6mdKPWw2b3dpcCcTQAepnGJKtxy/Aw99TMH@vger.kernel.org
X-Gm-Message-State: APuU4Z8rBC/p0TennxKIj1xSB4zqk9WxuXkzx58Yw8LqgogxUSsGsuwj
	2hyZThHdwl3+L5hzkfETW4qV9heiq1al4Pjz5BinFqsmQaw6lcYrs6vdRKx0QfEiwO9UfI0eohg
	dJ+zdybkgwHJLoM7zv4qdIh0ybDdhe2M=
X-Received: by 2002:a05:6512:23a0:b0:5bf:e25f:d59c with SMTP id
 2adb3069b0e04-5bfe25fd6dbmr5769231e87.38.1793883607153; Thu, 05 Nov 2026
 05:00:07 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com>
 <20261104-gpio-desc-flags-atomic-v1-3-e23cedf619ba@oss.qualcomm.com>
In-Reply-To: <20261104-gpio-desc-flags-atomic-v1-3-e23cedf619ba@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 13:59:54 +0100
X-Gmail-Original-Message-ID: <CAD++jL=HfJX=M7Lvzx1-sb_9Zr0qYMWJccmgiD2yFQAEodkQbg@mail.gmail.com>
X-Gm-Features: AclHuK-4nqAaIXoMz8aCJ7rRxx6dK31OAuFQuXb16P8OOZK5p4ht6ZH_vYzr3MM
Message-ID: <CAD++jL=HfJX=M7Lvzx1-sb_9Zr0qYMWJccmgiD2yFQAEodkQbg@mail.gmail.com>
Subject: Re: [PATCH 3/5] gpiolib: provide gpiod_update_flags()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Kent Gibson <warthog618@gmail.com>, Adrian Ambrozewicz <aambrozewicz@nvidia.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 4:37=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> We have several places in GPIO core where we copy the desc->flags field,
> change several bits in the copy and write back the whole word with
> WRITE_ONCE(). Concurrent updates of flags that modify other bits are
> lost.
>
> Add gpiod_update_flags() - it replaces a masked set of bits with
> try_cmpxchg() loop. All bits are updated in one atomic step so no other
> thread can observe it half-done. Unmasked bits are not rewritten with
> stale values.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Sashiko has a good suggestion for this patch :)

With that addressed:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
