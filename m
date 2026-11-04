Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799402;
	b=hnPvvbAReaEChjLsCiCN0Jj3l+KtoXNC8I2BoPSgKtjDAVUyBX3ENi/OcbHNYe3cuoy8
	 4yILK3zdhyL0LCGXAG2Aai47gAefr/XzOvX+SyRSAiVih9fcEHyoPKZT+TSlxW/KH0wxL
	 g5xE0+PjvCh3bk+BzO7iATxpVopz35kaeuXRxmc/v6qG3qH/wMehLvSc0kzWu9TwK5OvS
	 YZYZ3UeKwDjfb+aG83tTKYC1q+L86I7l7c3GmcTPZ/noDfMRp0+2edxgTDaYc1BH1mEtB
	 kJQWd2llbf8+2x6aOX/N43AvTD/Eefc6NMlmOBqxRYYjbC/RvM6UXd+fm8BT4I+Mxyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799402;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4IW2IJC8HI+A2vE8HMXp5CkVfOyxGkyctb+UUmFFJsk=;
	b=UtDBUTPpKRlPQRBJrXgYYGxkQLNmpCXlp7CnCeTzKkC5yJMjZWxAnMRkbAUcyeAy94Lz
	 2pdN9uw7fWF/XdsMCdJX8NaNfZrLiVLwEpellLYC/CWkWOQhz17Td/bckg+c0whQkH93y
	 /AvG5iT8TvQ6XR2vpIMYVq17IBp7Yqk2j4vUuU1k0DOAiY++uenRBwsoJfcekFs/lNk/6
	 hNJu4T4PBYizZYzXH/ThBLNtyRCkSbFFoT891YOJXui2h3+BSZXf759Vm79+uWjWZnSEV
	 xLmUyZtlsT60Cfc/HoMMaaXNhLcIwjuKZvDrKdPEPXj436m0W6KnSVjL+cgXynkcbhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e5zkBXRZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31DC606A329
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e5zkBXRZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5205C1F00919
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793799401;
	bh=4IW2IJC8HI+A2vE8HMXp5CkVfOyxGkyctb+UUmFFJsk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=e5zkBXRZFg/nuA+/9YSZ7a/HIwYz8bBVfkKSb/kdADlwNjs/hnn2vFKw2B4NdqVXt
	 lgf5FhrMIkeIkGY9NDxptXausbravIDpqtlYHSO6tX8h3v9MLXQUQgSVi1WizL3TFm
	 u1oTDCy+0BymcVlBq67Q1O/U23oBvle/SHmD31QGQkU/NLwlUPtJdo0wHk4boLiBAl
	 BfVpFXudolihCiW2cCLCwrA31am2rNgoSGbHloaGJToY0nnv9viZ7ApM/jvItBs0Gj
	 75sebh5l/I5bKfVR+KWV4TY2mjCInMSFnOpSALqLjcCnp7+FWYkLcz592wBw0C1wN8
	 p9k+Eres6A7fA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bfc2ae6e9dso546354e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 05:36:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzyROTK0w2vdrOM+bM/rq+VKbFoZ2Fx7Ol+IaTDhLjvvEb6EI1YduDQbnL9U9Fg9HWKvR16jDqyev9T@vger.kernel.org
X-Gm-Message-State: APuU4Z/xavdTr8iLGpVxLojCsuSyolcL91byox9XZixJFXBShYdxWqo6
	mu2txcL8l3e47vJMkxhGkivJix1MTTCI24cqJf+in+kNGdj6OqPl7jbR0+KEelWCE/yd5cnYJCh
	+FDwZSDT3WBwIyPpPghNn1qJSXU8CaYQ=
X-Received: by 2002:a05:6512:3da6:b0:5bf:d68b:9283 with SMTP id
 2adb3069b0e04-5bfd9579616mr5589329e87.50.1793799400124; Wed, 04 Nov 2026
 05:36:40 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023204207.48277-1-olivier@mgcrea.io> <20261023204207.48277-2-olivier@mgcrea.io>
In-Reply-To: <20261023204207.48277-2-olivier@mgcrea.io>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:36:25 +0100
X-Gmail-Original-Message-ID: <CAD++jL=MppGddVSBF_CpOzYZmL7YqKVTps6RoGzT0NJzRsP6-w@mail.gmail.com>
X-Gm-Features: AclHuK-0JNw2LDUbT04QkjMt0f3XsZ3rrM3rgKxLy-FpJXBHdtz5j54CKebu4Qg
Message-ID: <CAD++jL=MppGddVSBF_CpOzYZmL7YqKVTps6RoGzT0NJzRsP6-w@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: ingenic: Add an X1600 group for 18-bit RGB
 on the top lines
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 10:42=E2=80=AFPM Olivier Louvignes <olivier@mgcrea.=
io> wrote:

> Boards that wire an 18-bit panel to the six most significant lines of
> each colour leave PA0, PA1, PA8, PA9, PA16 and PA17 free for other uses,
> which the cumulative lcd-16bit and lcd-18bit groups would take. Add
> "lcd-18bit-msb" for that wiring.
>
> Used on a HiBy R1, which drives its panel this way and uses PA0, PA1,
> PA16 and PA17 as GPIOs.
>
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>

Patch applied!

Yours,
Linus Walleij
