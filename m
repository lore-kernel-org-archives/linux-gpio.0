Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305477;
	b=ENjpsHrCZE127124bGkK5KaChQgpoaNtHVn8vDY+z26b0c5hqsd2IEofIkGVsVihWCjC
	 nefguk+118NhlQwRw4Z/0rP4M18orobsLd2RYYVtYyQY25z15kDWUoGvoUjyhUukDFaMQ
	 8OCsgmNo4KFzPEo8xVwEscyroXfKqHbSAKEeV65vkpexQMlc/k5huBIgGI7W3nW0ge696
	 Jjxcotf23crtK4OUSRZ0bE8pwa2sdDVVxwuUsSLzfZdfWy+i9Y9RqTKBH2NBn2l7k58GU
	 LmTlBFrEiagBAxFlw77PCDJ7Y2CKZMAj2RYyvgmFTpA707zqidJZTjAiRCUgFm0PRVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305477;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LM51+0VL+U20dMw6cpcFuI/raNTJrwA8scBfva1+Uw0=;
	b=rQcAOBeAsaZWTMOQ6KkARRqFbl2nWuEcn2pGkgYj4WlM/UJFUbK5QOI3HDIz+sfTOAEl
	 bh0c9b/PcucNItgbfFnQ5gqLE3I17Y39SZ2ivwkq9lMIDGE+jDYkTX7Vc+pA8vLMQhVrk
	 aljFh/GPfqJLSyWCWcNZ1snkCQSwnWdEeeTKHxKwq6kcqQwMDw92oJlM/I9MOMVHV0hvf
	 Yw3W2umy1n5UyPe9W1/HElFpcze1BuxadBwDQNOYxBHPXFjY+dyso8XNkK2CaeRH4X+PI
	 GJp/f7ZFj3iTZvs3cX2On/DX9Tx3NPGT9O/7rU7fZIcVcVeRWJmbTWW7QMUxFmmj3gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cIR5J1FG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46930606A332
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 10:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cIR5J1FG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E52C21F008A6
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 10:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305476;
	bh=LM51+0VL+U20dMw6cpcFuI/raNTJrwA8scBfva1+Uw0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cIR5J1FGWz4E2RrE+ZRYNgRrHTP0mJ7LAB5s7ycV0TcYsrwT8/fgTwCVBfGVScN4Z
	 XYVMdacl6QQ0RZlQQ+cOdP2vteBr6CMp9No9ARt0ryWj5OxOYqvxvKISK2dOBqGgNu
	 LLAmGR9D73I6c+b6dymaNNajdNW8Ct31Xgzpkfaddjyrm5zHOVsTASwTKcU4sQ3qIk
	 AFQm+KFMTE99p0fZxn+OxBO2j9WlUMcH4SJK7wmbQq3CNi3evF3NdJe2CfDbytA4o0
	 MaUB2V9wPe1if1HuM+XH5wS0FUYbsoqb5NMxb+ZH2QQcZKkE4U7GNe4PxEPRNeVEjs
	 vblby/9j67oEQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c14f7768acso1356638e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 02:11:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE/ISYb6XnXKuQ0fS9M8DAAi8ZGHcv5piVAD5Ou2Fz3VsGZP+ZyDt7sxv+pRnK9tKHNQxtt0XsUCOZW@vger.kernel.org
X-Gm-Message-State: APuU4Z/PO2aBwj9OJwhgCPAS1PsmGEh9v70w77WWYMxO2fUgCfWQThGr
	lFBHjRnHRxwhAI9dJH/8t/S24IKTa7eid45jZX4Mr3gfhlwnLsJ7urCJsP/KzSEhpiZjfysWThw
	BlKA4Xh+MCLBln7VFEen3vmgiYgMDQ5o=
X-Received: by 2002:a05:6512:3191:b0:5bf:d551:8c71 with SMTP id
 2adb3069b0e04-5c156e7f7a7mr575525e87.18.1794305475650; Tue, 10 Nov 2026
 02:11:15 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-gpiolib-hog-stack-corruption-v2-1-c5b28cb8dc8e@oss.qualcomm.com>
In-Reply-To: <20261110-gpiolib-hog-stack-corruption-v2-1-c5b28cb8dc8e@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Nov 2026 11:11:03 +0100
X-Gmail-Original-Message-ID: <CAD++jLnGYzWWG5EaqiQ4CSsOEGrj_x+0KdSQNEypx25N1jQZTg@mail.gmail.com>
X-Gm-Features: AclHuK_mDbsyrpU8a_opwKSRKtLA0K3YfW27yFYnGpEd-tJse_SgshuTlxV8ks8
Message-ID: <CAD++jLnGYzWWG5EaqiQ4CSsOEGrj_x+0KdSQNEypx25N1jQZTg@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: fix stack out-of-bounds access in gpiochip_add_hog()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:01=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> In gpiochip_add_hog(), parsing a device tree with an excessively large
> "#gpio-cells" property causes a stack out-of-bounds write when populating
> the GPIO specification.
>
> The value read from #gpio-cells is used to copy the values into right
> places in struct fwnode_reference_args but that struct's args field is
> an array of size NR_FWNODE_REFERENCE_ARGS so a value larger than it will
> make the loop write past the end of that array.
>
> If #gpio-cells is 0, we can trigger a divide-by-zero later when
> calculating the actual number of hogs.
>
> If #gpio-cells is 1, we can also perform an out-of-bounds read of
> the "gpios" array.
>
> Reject #gpio-cells larger than NR_FWNODE_REFERENCE_ARGS, lower than 1
> and make sure #gpio-cells is larger than 1 before checking the
> active-low flag.
>
> Cc: stable@vger.kernel.org
> Fixes: 802c51a83e9a ("gpiolib: fix hogs with multiple lines")
> Closes: https://sashiko.dev/#/bug/linux-fdec1c0e-c6e3-4eb6-8746-d68a3f951=
374
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
