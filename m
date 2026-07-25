Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCA123BCF7
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 13:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784987886; cv=none; b=p7ypa4Uo9narq8sGwsmyHUQD4Jj6cYsSdhkez4Yf5bnszRIyz63i0xB8W6CVs+m7mcBM/nXllX2b9oY+UkohqLKypIChXT6N1pZpUc7nBbLAhuZtteienU4NL+D5SOXl4uKe+vLwOVCyPFBzCPbre3z1uF08MK4WZ5gCOybhMRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784987886; c=relaxed/simple;
	bh=UV2wzaf9L7tGsiIlJQfh9rFGNkdyg3QBcWTgp2q7DPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MSkkHMzPjx3/1rJGBKfxxuLF8cMP6tzYXo/F/jYwobsmrho7oxpVy36jXthjK08VF3DDRWUpMFKkGw74ufWxFCKN/Gn5mHWQ2h+BwOyqwRLr5ZLHzFycj7ntvEA1JLWftSVBZFtvrvkE14qMYBL3axJgRFJDbRfYOjNsiLFQ9ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gx/QH5I6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gx/QH5I6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC251F000E9
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 13:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784987885;
	bh=UV2wzaf9L7tGsiIlJQfh9rFGNkdyg3QBcWTgp2q7DPQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gx/QH5I6Z9OmMGNIxGvWHdGHBi9h/wwgZ9+IApTL5cRKM435hkNBcog2wH/vU0cfs
	 dxI7ZiLR4gUd0PJOCbQaFlNHWkGxeXh/vc8vHiqt0KppCiOE420l83taQ9VLrquy8v
	 9m+hkEIEMGZn8/TwQzo06ewwykEC0wSzFakoPetYYtMHKi8MguHfVzQ9qVie4vHGvf
	 mmd8mSkrU2CiphougMO2TfXfAZCSAU5SZtKyO81xTJ8qEZ3UHXfK/n3i+2qhp8KKi2
	 bKNEXjevRjamzkNuuOT/B8m4MeuUQKaqRU4H7kFNvdyCBrBTYexioL3f4gy49/TZCi
	 w+SnV4Bts8wfA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b2aab18795so1298296e87.2
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 06:58:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrSoLmN7t0K0k0ZlGKgpclCrUgD/RsCdEPtQDunfQ5x6SnuzRNsrONvBj7PmVlw9j7w4zBQA36LE1ij@vger.kernel.org
X-Gm-Message-State: AOJu0YxM9Et1ymBdu1sg3k/ZLgAmVVNVmCmtlnmv8OMuKMCQaSIeo8QR
	Auz0Yg0rLuy8oe1X1R3IvwiEgpesvLFGW1CBPowRcD6obBqzpM8He9PAkAAXQ8MepaE+jR5M09g
	XTlbg+7/h7aj6poB8HAGnN7fbejiDRAk=
X-Received: by 2002:a05:6512:1386:b0:5ae:b0c0:16bc with SMTP id
 2adb3069b0e04-5b2c1b0d6f9mr425471e87.27.1784987884347; Sat, 25 Jul 2026
 06:58:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724081838.33428-1-phucduc.bui@gmail.com>
In-Reply-To: <20260724081838.33428-1-phucduc.bui@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 15:57:52 +0200
X-Gmail-Original-Message-ID: <CAD++jLnTn0-JRRgdwQ9JrjGPNh=xYCm383EpJ2KRHVTa62bsgQ@mail.gmail.com>
X-Gm-Features: AUfX_mwQXgShpnRoEippIQd9zz16-KbmaWLZK_Eldina9ONsGWNUjxo4MHIfJ5M
Message-ID: <CAD++jLnTn0-JRRgdwQ9JrjGPNh=xYCm383EpJ2KRHVTa62bsgQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: restore cache_only state on resume failure
To: phucduc.bui@gmail.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 10:18=E2=80=AFAM <phucduc.bui@gmail.com> wrote:

> From: bui duc phuc <phucduc.bui@gmail.com>
>
> When pca953x_restore_context() fails, cache_only is left disabled and
> the IRQ left enabled, even though register synchronization may not have
> completed successfully. Restore cache_only and disable the IRQ again on
> failure, matching the state set by pca953x_save_context().
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
