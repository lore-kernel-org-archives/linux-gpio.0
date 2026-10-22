Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657176;
	b=kBK2hRGKOuQLStyfqxB9U6aAsGdaEnKrZzQVclsjM4GmWpXETRFZsulc6HF6Z3XrREtH
	 1txvhe1Cv05UfSQBIqXrSPsp1bReGW1CeYSht5iv4arEXLSYpT2UBGDWd2kzK1gJTaBfL
	 NYzMuNcxEH+8mUfbHxIuwMwOGzhKuU1cLyZcbzzYYVsoiTeetR6QADWF9yFBUPMZyHhQ/
	 /rD1lLCndhiOaeaDTth66BVDNC3Uv8sySfBjjgC5oXQ3B3KZcKNou4dwqUeGBc5iemOQT
	 7GmX5JW1//YXYRrpyQN3zYQLCWtHOK4BRDIr1tdRmyP6YljPQXJ12BaRn4JrMvRhWSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657176;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=kEa0cBo3fUDZ6WcN57IeXDg2DsdxKm9DUjTL91eWlBU=;
	b=SeXv7Rh9EI9ntVbhrpeJam3wzNbuxaHYkRaJs7ugM9TSLFtiA9u0GXcZFIx62ifX+Zfk
	 Pv9FmhFlLqmnwYfpdQp9wJDZwf6T/RpUx1ts4nUvk8AkQEmZUIHjnu5plazkwRMRHb/p+
	 glPS3Fs4v4goU4yBlM0WmGVNRy88Bjv+zV8PhenjFVhnrkEjgsfnlSzaCzhG6sfxCzaZK
	 7keOQh6QaWUrw6iwYmv2ELOHJYqF+fwkl1nxK6a8FuLmhNgYPuW9gC6IcZq7W2VHBrmHc
	 5yEJrdGuIONFfxS+WzE3VZypIczm+tHs7SWCYnLCUvpxz9Rx1ZyC1CapuZwW93Ht/tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Rjoktmc/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88045606A319
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 08:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rjoktmc/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C3C1F000C8
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 08:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792657176;
	bh=kEa0cBo3fUDZ6WcN57IeXDg2DsdxKm9DUjTL91eWlBU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Rjoktmc/Za/N4z9R9WyvNL2gLx4i7izRhHiJHPS3YumQqm0CzG25Nt0HkwnkgcobQ
	 dw48gwvCU6hp8puQpO75oEdi4LaGUtGWfnAGeGKvaUfguupaAgHoIrMEXIoId7UTKa
	 bC6DIgVn1WBDPRXd350PdyMFZ/7UYWqI4EDxbwYulgTWmK3tyb4+Z8Sf86rSjyuOFG
	 FHW4TfC7ewjZbo5NLcJrm9v4ZHY/ChsYTHpxauhtkuiDGwcOwQ5hp0YSmsvioAJd7o
	 blFfXOrf7lRLaiAV4J2tq57moS6Oh0AEosYx4eimneDHZ6JiCN8TA5gHpReXM7XfO9
	 ahWEAlXfrJaTA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a772ec8389so12332181fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 01:19:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByf75YLMWBPy4OHWK29xU01eoZ7mFihpYJhXNHXW3xkdh83w29SA3rrHJx3S8YCk73h5z7l6I91q/Z1@vger.kernel.org
X-Gm-Message-State: AFq9FYLk/+nkdfbCBuuXmva3IeOKGJvK7fgbLtzuxvU7FHXB3hJD8nRE
	ak7HYuqXjkL0HuU00aZLgdM7GbU8QyQLrUprVbkEYp1pGe8AJTKgLMNyrpPt7/f0GcaNo8J326c
	p4umuujPTOqDbBrujj7tZs3Szd5ngIplLlCShzdFUXA==
X-Received: by 2002:a05:651c:2101:b0:3ac:4854:9701 with SMTP id
 38308e7fff4ca-3ac48549851mr11282571fa.13.1792657174896; Thu, 22 Oct 2026
 01:19:34 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 01:19:33 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 01:19:33 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <atkVrwhbP45oLiIE@google.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021190212.2237804-1-dmitry.torokhov@gmail.com>
 <atkULU8_9xQ1c3eY@ashevche-desk.local> <atkVrwhbP45oLiIE@google.com>
Date: Thu, 22 Oct 2026 01:19:33 -0700
X-Gmail-Original-Message-ID: <CAMRc=McHwNAAF=d0FaUeoY0Bcv8X-p3zXOnrE+9xNooowVFajA@mail.gmail.com>
X-Gm-Features: AclHuK_AE5P1i_KQjY8EOQJ0YbnPm7AzhF_WP2EfOy_sZ7E75edhTeIDclkrobg
Message-ID: <CAMRc=McHwNAAF=d0FaUeoY0Bcv8X-p3zXOnrE+9xNooowVFajA@mail.gmail.com>
Subject: Re: [PATCH 1/5] gpiolib: fix GPIO descriptor leak in gpiod_get_array()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 21:43:28 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> On Wed, Oct 21, 2026 at 10:36:13PM +0300, Andy Shevchenko wrote:
>> On Wed, Oct 21, 2026 at 12:02:06PM -0700, Dmitry Torokhov wrote:
>> > In gpiod_get_array(), descs->ndescs is used as the loop induction
>> > variable and is only incremented at the end of each iteration. When
>> > krealloc() fails on the first iteration (when index is 0), descs->desc[0]
>> > has already been acquired via gpiod_get_index(), but descs->ndescs is
>> > still 0. Consequently, gpiod_put_array() frees descs without releasing
>> > descs->desc[0], leaking the descriptor.
>> >
>> > Fix this by using a dedicated loop induction variable and incrementing
>> > descs->ndescs immediately upon storing the retrieved descriptor.
>> > Additionally, since the fast-path array_info setup only executes for
>> > the first element (index 0), simplify the bitmap_set() calls to start at
>> > bit 0 for count bits instead of calculating offsets from the loop index.
>>
>> Can you start doing cover letters, please? The problem is if I want to give a
>> tag for the entire series I will need to iterate over all patches, while `b4`
>> has facility to do it for me. Also with --base it would be easier to see which
>> base you have used for the series.
>
> Alright. It was supposed to be a small patch so I did it in my patch
> queue, but then it grew to series if 5...
>

That's why b4 is the way to go. It will automatically send a cover letter for
anything more than 1 patch.

Bart
