Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431133;
	b=WiKFlpwLwPdkSt8H0QBieG652rYCngMDYxFK4SGrTcZ2J+JOPVWQG6AhAt6BohteRO9j
	 Gz4HISCfx3XfnAghhN5wct7JVgxUb2gxNgwPiDcYREPFt3Zn0snp755JckyJygtoBMlHP
	 FEa5zjsQz00mgHd5Ksg0WUD/NwfC3FR7pW7gGows6+iBZk4+8tXqvul4XIqRairIDzEYA
	 1iA3yE6TDQ1790LyqDhb7oz2CJEnsB3P4EADEVDYEwVcv5sn6R9bY6lSGfqkybQtmMebA
	 W2XgSov9zkirFoLIZOGIKs9Y79E1ene8W/tcoTbT+DngKrPVxh/hzMMbvHtGWnzuf0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431133;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JTasMFBqaRsY15L70Zurue0gD4jVURvqrqPudJvkTBo=;
	b=x9T1PTKknUv0+V1hLWENYapsPOr/9ynhipuGGWAVw02dSXcV/it+aG+xieq2lsJTVMmc
	 PmxjxOvenfSjSVr0ixKAXqRa2B7ispH21SGX6N+1rIgHO9nk2dYHmLSJo7a9kkQ9F6vC0
	 8lPBila0DV11S14NKPhNOpjqzoP6+RpAum+WPQsbqeJ52MLJkZw0/BNgtqJk7vpzYj1xs
	 nJ4Aog1yxpEB8G+6IczkNBL0RutQxpkVokVS19G1smwQl01tC4vYABKRcOf+qCJOqbqWI
	 qfpRYepxrbIGs6y0cSFMy18w/dK45tmXulAyRvCN9ZZxe3eUTcALWvlmBbWaahiKyAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a2nApcz7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0AC606A321
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 10:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a2nApcz7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8511F000CA
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 10:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795431132;
	bh=JTasMFBqaRsY15L70Zurue0gD4jVURvqrqPudJvkTBo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=a2nApcz7STeO6wS0P0aS9GTaZe6RvjXRzXXymZAvyy8LPq27wMZq9uWeRqjAA6Dce
	 y24VRlG+dP08bYKXagwR071bTyblg4lXQppY7QVcEro+Wq47AxRTu0imfqP3esfkcr
	 gJcZvlpUe1x/6asYuANQJrcueBggtHXapfIdQRWE4A/PRTdLOHvLik76UMKu9cRFVC
	 O0LZFWABJqusVvD0gFV4gz4nrv1kNlhajqmhqdYiyRjjWmtvbLu3NzdlCvMjD5WXir
	 ssuqei7AEFvxIEriHeOHJtswFi5GDbcrUHYIXWL6vKrgz18GdK54ViPp2zcNGsmg2F
	 EsV4qtAqo8HoA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ae7d1ce1bfso27573501fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 02:52:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGLHpuiYPCKV3Z4VeRCcLw4C9S1gRrbxgXbsBKhnYMmin5Dzrc9i9NgIx3IEYWTFqbopSK8TkRBBi6K@vger.kernel.org
X-Gm-Message-State: APuU4Z8tLQ5I4K2Zf5g7mFutuS2zMBnIl8teNaooZeyL/yv8jjYzhC3t
	u73b9AZSjT49j2A4siGvNIk1epm+d8ls5P7zNCWt8Son1vblm4jW2CQUb+6KQ4bkiGZfMqcywMC
	sv6hHpsJvsf9G4bPxCjztfI07PVHX1xI=
X-Received: by 2002:a05:6512:1052:b0:5c0:c5e:3d7 with SMTP id
 2adb3069b0e04-5c1bc81d5ffmr3938544e87.52.1795431131102; Mon, 23 Nov 2026
 02:52:11 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <nh-fc54eb6a-a671-409c-bf5d-51ad5828438e@google.com>
In-Reply-To: <nh-fc54eb6a-a671-409c-bf5d-51ad5828438e@google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Nov 2026 11:51:57 +0100
X-Gmail-Original-Message-ID: <CAD++jLmr3v+SV3yvdH98KK9T5vEDyBBWkrw1p-7Sp=KdA8BQYw@mail.gmail.com>
X-Gm-Features: Aa3M54o-0uo7piOi7NSkieIAZ-qhHuki7FyaluWFli9bVB-DlbSxnE8QzXP4K9w
Message-ID: <CAD++jLmr3v+SV3yvdH98KK9T5vEDyBBWkrw1p-7Sp=KdA8BQYw@mail.gmail.com>
Subject: Re: [PATCH] gpio: avoid undersized array bitmap in get fastpath
To: pocj8ur4in@gmail.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kim,

On Sun, Nov 22, 2026 at 5:38=E2=80=AFAM <pocj8ur4in@gmail.com> wrote:

> The array get fast path passes the caller's value bitmap directly to
> get_multiple(). The bitmap is sized for the requested array, but
> providers such as gpio-sim process it for the entire chip. With a
> 128-line chip and a one-line array on a 64-bit kernel, gpio-sim's
> bitmap_replace() reads and writes two words when the caller has
> allocated only one. The second word is accessed even though its mask
> is zero.

Isn't that a problem with gpio-sim that should be fixed there?

Yours,
Linus Walleij
