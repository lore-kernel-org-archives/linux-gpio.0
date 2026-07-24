Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A3D3368A3
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 21:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784929551; cv=none; b=B3JGVhDb8DYTVgoFaa4NmcBshyuF11z71ZZVmaQdIY300AeK1Tjrr6kDgIA2Nkfb/KDShy4o2bNvy16DSGXeeISdkBMKUJ4A2x/wtxZty0DMG2BYcHzbFcmZUpdCvIJhw7S1yfawLCZ5JudaKOfMvNyARHSy7x7RAw1D6HfkvRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784929551; c=relaxed/simple;
	bh=mYuAyjCy5Bynzez0tedD016Te+sewPaFENA3OUP2FZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q2yTC5BcaawBgtIg+X7uP6Ac96ddxWQK/YpFfvjBAyxX7ceA0VgoJWuzFx7oz7Akb4gl1C1q8tKumVgP58YeMhBWat2twg5qpdHZh0kmajx+Pv6lsvfVaL1CZM8PTW5DdHbCyLntb8pzyJDPE3rgE4E9smonzQU2Zenxhy6LV/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACU5fO9v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACU5fO9v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA1CF1F00A3A
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 21:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784929549;
	bh=mYuAyjCy5Bynzez0tedD016Te+sewPaFENA3OUP2FZs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ACU5fO9vWNtq0AJ0Lnni6kljYrnjUHDG4sPnDXlb7fy6Qmx66wNgMnEHm7MmgZ3wb
	 sq1EbQIgBGjnnxEaFJy8HpgYMVJbgZfqG5OGckcwMUYQcHWJrvfJ6B8PyDN4X7xCQA
	 OpBSUpvepC44A3zjGxo1vMyiKm/5VOwxFPJXKGJynlG3nZCFjq6MNrIu874mjEh1Hy
	 yQd44+vEAicNyGcuZ3x81tGnqE0pKZNZf6e/Fk+G+mYSWk/92s9l5kN7LPAwmyUllu
	 Aek1hMBaGEMF3pKL11JP2VTA9C0XfL/We1cmNqeqsNP9tPMcIfuFc7HnM91vf3p1Wz
	 iDXUzn6hE2rJw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b2a8e4c77eso796884e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 14:45:49 -0700 (PDT)
X-Gm-Message-State: AOJu0YxaDmXAr6NoMfHCfnvRHSHOoRa3soRBggkKCVqiHMaIAVWBWGJx
	rP6M1SabT97w4yp56WCs23/U5devdDwD2z/P1J2F+EG2tQKHDRKAnA5/OUTpChlg0lEjUxfFqWl
	j+B2WF9ltfQfL3eJKOh+o8TXG50Gr5QM=
X-Received: by 2002:a05:6512:118f:b0:5ae:a9ed:24a0 with SMTP id
 2adb3069b0e04-5b2b2f821d4mr1857096e87.65.1784929548505; Fri, 24 Jul 2026
 14:45:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715192415.1326037-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260715192415.1326037-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Jul 2026 23:45:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLnkB=+tA4hTB_rqOVC8_DdBM4L3ibVGYyC=aMHJs3o7_g@mail.gmail.com>
X-Gm-Features: AUfX_mxxi3XBOJFgeJdGL5ag2zVd7kORcZX3P2JSpCK7TsVcXyHJBkypb2jksHw
Message-ID: <CAD++jLnkB=+tA4hTB_rqOVC8_DdBM4L3ibVGYyC=aMHJs3o7_g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: legacy: Kill gpio_set_value_cansleep()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 9:24=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> No more users.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
