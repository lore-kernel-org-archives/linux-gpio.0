Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59AE34B1B6
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 17:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771522361; cv=none; b=nJcAO9ddkFPeV+W7UCeVeAK5xGa+lpe7uCpa/PE8VL4eL2C+OyeVqjQjMuWXpbVp+EA/hkNi+fCpr5zNTbBA5tkhZ+bxQArZAVy8Ekoy2IEbgsyQ//9NX9J2vwt45y9TY/xtezS/by0itQxp+O1dHL7RhD0T0LgeusKDEoX2ReY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771522361; c=relaxed/simple;
	bh=Bb/7uka0raO5CVVj/T4WrXDnULjXxJE5UN2ijVO7yLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cXyfxZIARoFp5w803rzTD0bUxGkQLWk7gmrsywu+k+CXytUdL1JKjVj6taaU2SoazS581EDKGrkb07bRkmNmfvrBaYWGfkEXq3O5Bi9A4ckvLyASDMa6wgcH158czSktl7OoTTsjvvy/8Suz3EQgnTvvtlzkmtOg2/7+Qh9t8/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzMtlic4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzMtlic4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839C5C19423
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 17:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771522361;
	bh=Bb/7uka0raO5CVVj/T4WrXDnULjXxJE5UN2ijVO7yLE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bzMtlic4r+DBbiXowx+IsOWdlTf82QO3pZBJfCKTJF8x4M1Hs9lNh5maZFdpmJklh
	 m1ByVUBzCRN5EonA4sZzv/+XpV3fi/9sxHUug22pG5GY4PMIRZ4vyVgvAfHt7Q8ow4
	 0DEUfoNM0oi20VC3FW4kWjxTaBWzCptk/A5957uGpCec33pT4f9XUXFkH3xTKPBsHG
	 ytI/EqaVQIx3Wdn/6+QVPbdeyaqBRbD0L7JpmyhKcllSn4OlK3ihHCAcguhVaIRg1a
	 J0QwjCa5GQypXnaVE+CQjk4yqo/nuBdnQaGX5qjVmpWzxHgziySeOPkgzuaZGJaWGM
	 tif6JiaX/FWLw==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79800183233so16172957b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 09:32:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW6htAdu/wuY0+HSoDsoJ+dGp4GQLAUF60WiOX70lpt/i+FHdLJm0eGMQIOyN4ynKPxobUHW283DxTJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6N+V+EZWCGz2FAo0akMIeF8mGoKgOLnBiKCbiIZgZH+eG/9oZ
	ui7ToHHMCk0SiiYcj0YCRuh3p91qe5uscRkHp0QMs0GwLNuDiBSihFQzjez+1B+haeUoy3KTtpi
	9/doBeZAgmjqyQ+u64uED2AWCe60sIuY=
X-Received: by 2002:a05:690c:6303:b0:796:3858:a084 with SMTP id
 00721157ae682-79807cf462amr19793217b3.19.1771522360836; Thu, 19 Feb 2026
 09:32:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219-gpiolib-set-normalize-v2-1-f84630e45796@oss.qualcomm.com>
In-Reply-To: <20260219-gpiolib-set-normalize-v2-1-f84630e45796@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 18:32:30 +0100
X-Gmail-Original-Message-ID: <CAD++jL=x1cYPQWL9VEv3ELR3wyBDY3FV-8MZ6m1gDb16hPNCUg@mail.gmail.com>
X-Gm-Features: AaiRm51ySc8zVy0QGkwVpo7MjfK_OR1vBU1SHH-FoDbbCu-gpTY7cn0HLt6GeNc
Message-ID: <CAD++jL=x1cYPQWL9VEv3ELR3wyBDY3FV-8MZ6m1gDb16hPNCUg@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: normalize the return value of gc->get() on
 behalf of buggy drivers
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2026 at 10:51=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Commit 86ef402d805d ("gpiolib: sanitize the return value of
> gpio_chip::get()") started checking the return value of the .get()
> callback in struct gpio_chip. Now - almost a year later - it turns out
> that there are quite a few drivers in tree that can break with this
> change. Partially revert it: normalize the return value in GPIO core but
> also emit a warning.
>
> Cc: stable@vger.kernel.org
> Fixes: 86ef402d805d ("gpiolib: sanitize the return value of gpio_chip::ge=
t()")
> Reported-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Closes: https://lore.kernel.org/all/aZSkqGTqMp_57qC7@google.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
