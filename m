Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A00F39C637
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 08:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737260; cv=none; b=EebkOOgCrO0vQe37mpQ+vxk9SpoiUJ/gDiK1O/kBPc4JndtGJXhz6j51kTJLIOCxYpBev4hzuvCh3EqOXXL8yxuL6/3Uek7yaHEIyKad57j3LnK/iAkwdcLLKTRWBKFkWk6WCcKXlPJi6JVHgDqFUnDC5rn8vOm8QeARUviq+oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737260; c=relaxed/simple;
	bh=+DFX+JFdROcnq6jEh2o363A8K9lUP25gqrvMNIQlWZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=av8pB3PxvPQyqQE79QXfmsjVesqrQB1XTrr6P32yrl8BfzNkrXIW/+HDC1JUg0/mrnj4TjRYjikNxGhY2+ZiYfgX3O1RF0ha4wXQ/79BmrvQO+2TzF7ZBsjEwWD/p2fu2Oj7srssfoOnQjcBrwbRV03IcH8FUyBxJJZQPXdJolQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=opN/vfu0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="opN/vfu0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77C4C2BC9E
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 08:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773737259;
	bh=+DFX+JFdROcnq6jEh2o363A8K9lUP25gqrvMNIQlWZY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=opN/vfu0Q1a8PKsVobqc60PLVJr3K//vhzQpEYRzhwA69bu+qoQJOcqOxl11oezci
	 t4bbU4ThwJgD6mZRm5c35V5aqZQmZ0MWjl3iKP/Af0Q87+fF6+ULTTc3OYH7/JkeXl
	 iPfPb0NQGFnEGohNDfEkmR3HuMnDqRzShhZzlMiohOAwRJOyv8rOE3T7BUfV931Ree
	 /EchHDM4ugovnxn4w+5OtXoAv5+Bb9ZAWfmTRocOenmKkFA1x6w3xc6+/QluVo+P70
	 YAm6crqkpNdHVRh/mszFY99xaFVskMyxWrosyicJau7k/Ul6BscOp1HtVxnK4evl9U
	 7YHaarfhqNVlw==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79a610a32a6so9317037b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 01:47:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5l8KJmb7Lekt8tOAUVEcYgZYBXNUVTSmIsWxRkBHsC6qE4EjyyWvyjFtx4+RN9SI9HE3AHCU1FSu/@vger.kernel.org
X-Gm-Message-State: AOJu0YynkGsVHrJhXxJHexC5WJHkT+SprYc/sE/YjtakwTnCAPAfSrjy
	aMFfbLg6NkRJegxeY/juWDFyehhNdgQthzlDenjjh7phZxTDaeXwm8X3NOCf6QmbDaflFB5jMCh
	lPSKo/GQbj9IY8HOVZdZ8aM/sISGKj3I=
X-Received: by 2002:a05:690c:6607:b0:79a:649e:2662 with SMTP id
 00721157ae682-79a649e393amr15059727b3.46.1773737259107; Tue, 17 Mar 2026
 01:47:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-gpio-shared-xlate-v1-1-0ce07a1362d2@oss.qualcomm.com>
In-Reply-To: <20260316-gpio-shared-xlate-v1-1-0ce07a1362d2@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Mar 2026 09:47:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLm5M4BbFP4HuGFX2Jr8PBYgLzCdQqfRE3t3N-dqNxqEFg@mail.gmail.com>
X-Gm-Features: AaiRm52GHsficTdJkMzhKtcnc6iZ-zUWjRKsclujeRRybTXP18fNXpnLSg8L6vs
Message-ID: <CAD++jLm5M4BbFP4HuGFX2Jr8PBYgLzCdQqfRE3t3N-dqNxqEFg@mail.gmail.com>
Subject: Re: [PATCH] gpio: shared: call gpio_chip::of_xlate() if set
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 2:52=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> OF-based GPIO controller drivers may provide a translation function that
> calculates the real chip offset from whatever devicetree sources
> provide. We need to take this into account in the shared GPIO management
> and call of_xlate() if it's provided and adjust the entry->offset we
> initially set when scanning the tree.
>
> To that end: modify the shared GPIO API to take the GPIO chip as
> argument on setup (to avoid having to rcu_dereference() it from the GPIO
> device) and protect the access to entry->offset with the existing lock.
>
> Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Closes: https://lore.kernel.org/all/921ba8ce-b18e-4a99-966d-c763d22081e2@=
nvidia.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

That was a tricky one!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
