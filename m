Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E5A3E0252
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777370210; cv=none; b=dgnnGbh2yXpv9F0NASnJaNRdq5NS6JsnmdMU6Q4ASacP+JLc96GoyOK25rlpavWJBjRpBV2E2ef9yPn7Wi9r8+y0i+6iAiAbbcHPK3/ahNtjXy9v4k91hq1mI7W+TJzjPATCbKd+KdgtsZbmmGhyhMNE+ebTWwsYnS8X+0TRsFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777370210; c=relaxed/simple;
	bh=DnQaI1tge8+mep+9HbUSLDRtaYQgBTNOxLOXwTwEKaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LTEWcCM121w+yrCiR3Dh441AuEndObsm7WZzK10TJQFqjnNI5tv4Q2UobvnTDype9OXu00mZLfZi2VBjNCJ9ULZL5/QUYdSnXkJbw9RNlBdUH/XNgYk1BA9+guLVhVkbqrzQ1yEtDEMTv5AJYoC5WDdsH1stk6GlpunZc/6YRNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPISabTs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPISabTs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72DFDC2BCAF
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777370210;
	bh=DnQaI1tge8+mep+9HbUSLDRtaYQgBTNOxLOXwTwEKaY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QPISabTsmd28pYP1T4MA84NqcX3fod81Qxc6oZjblS9BsATRDPuJ6paB2yxAGcYzM
	 RuJxOVDbt3bzvKfLYL7ry4uShEQibpHkhETeV5c1TA8x011Xc6k2zMqOL4vZ02uodW
	 6keUfIYWYz3OIhslezT6XUs5HwcKyLpvaE0v+RczTcTJc6t2TEyBvgsSwJ0j948ydV
	 cggBJ9Jg6e60NcakvX0OybBAd/yq1+3QFFlTVEfYlEjeD1jLDgKfe8Nz6g2Z6FQsQj
	 cMfF/oypVnb4NYta4HE5m2mPs/0R7NK3U+6ccXIS+yq4sIkcvbn3FeZdHxaTyA4UOB
	 P+ok1JMVkS83Q==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a2c77c62d7so12118961e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 02:56:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+NmMXymDcRw6rd2HPEXbYhGnYKaJ5XwaYstskqb1lecVPIola2R1c/aWzLGOaktER6zkyND3D/rJCV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6h+ksrDk5ndEx7LuprvMdITNT/M7YQgTky+y/y8SsBdYWS0ps
	bfpDhhvEyUFjN9rtluRYRXwSQUgmdt8UMYZFOit/Yka1hzPp+cYZIwVrXCv2DsP0H2D4VxbKsic
	eULjLQ9th5bPgGEH8vAXkamUgOi9qbAE=
X-Received: by 2002:ac2:4e01:0:b0:5a4:1900:92b1 with SMTP id
 2adb3069b0e04-5a746614456mr807051e87.32.1777370209202; Tue, 28 Apr 2026
 02:56:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413102326.59343-1-dev-josejavier.rodriguez@duagon.com>
 <CAD++jLmFudox4+zThr5bx4aAadrpdkYrNn84eORhbU_t6gxZvw@mail.gmail.com> <aeo3RXm2xNZuD-bO@MNI-190>
In-Reply-To: <aeo3RXm2xNZuD-bO@MNI-190>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:56:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLk2Tsfks0SY5CE+D5cc5siwY1e+SJYpuimc8-yXEhdmUQ@mail.gmail.com>
X-Gm-Features: AVHnY4Ls2MZ9-3arM8l8vcxsc6CaZD-vKdKeMHOz3efL81wO8ALPvxu6yQa3K2M
Message-ID: <CAD++jLk2Tsfks0SY5CE+D5cc5siwY1e+SJYpuimc8-yXEhdmUQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] gpio: add PMIO support to gpio-mmio
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: brgl@kernel.org, wbg@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 5:14=E2=80=AFPM Jose Javier Rodriguez Barbarin
<dev-josejavier.rodriguez@duagon.com> wrote:

> > I think we will usually only merge infrastructure if there is also a
> > consumer/user of it going in at the same time so these patches will
> > need to be prepended to a driver patch.
>
> Thank you so much. So, as far as I understand, my patches will be applied
> once one or more drivers use those changes, isn't it?

Yeah just put some driver patch last in the series so we see "OK it's
being used, looks good" and we (Bart) will merge it.

Yours,
Linus Walleij
