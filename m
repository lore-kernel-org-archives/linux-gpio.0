Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2FD2ECD32
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 22:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782858676; cv=none; b=tshkOBMVjdabjawBqilDBM4RqmOwIgk9nmO+5l+VqFlwV0nrv4ccTw+Phsw/p7G9bNoPCeeJBcZHGXWrpRzLgRVvr3T0FY1mGFME/ExR8QX48Wg1Z6VTBW+UvBx7boObMduTk0NKlC5GOXNxuTD6KsLfWF+w8ame8xWKX4yESgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782858676; c=relaxed/simple;
	bh=5xJeaRAiKHKbp/aAstXnsYKTpc6E8XcGidN9PLbZJKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZtVOT16SNBy/KXJ+GYnt0lgXL76aGgLF7aVK9n8Zy/Z8frKXLU+IqZzPnpYmf9Dkbg8b6uBt5jFGm4sXFby/xJ1dqQM5IY8bGPy8QeaHk/lth+jxlIBFwoSPNAqEOWWT2ijVvCUmY4aFaA3urbQpvVs6t9wdNYAVf5IQbhuHZG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0FIWZsT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0FIWZsT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 001DE1F01558
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 22:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782858675;
	bh=5xJeaRAiKHKbp/aAstXnsYKTpc6E8XcGidN9PLbZJKo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=n0FIWZsT64s808ZN5DPQCSd38F9dqMBDTr122mpLWcKUL0U57cT8ZcAddOD67hQNU
	 fNZ/8wqFSf8V6QQ228spyMlKPuVWnIE1blXFXK731BSImUJTcPxQSskBwcSj7WMei9
	 bXTBGXSxdkxkA+p2/YC5Yr7EsI6B5AWT2ZPn98tudaS3IIKwJvjNlg81CSz6Xk/yaS
	 OtQKvHGIunLV/piayMiPOg7kYP8cq15wEvsVGwK78KB/Zeo6Q95TgTPU3926joVlqe
	 dV+nJsISLi8KftA6SfEI3tcM2ChKiKeuxCISq+bL9mXRqaL8UGhdyoLEuMNq7Kwwwy
	 6IrIeWkGYLfXw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aebd52488cso1983179e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 15:31:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpGMzt3FtwKIer08aIyaFfKrjRZiie7h8YX0NEnkhSvzD9Qgi/73UosgLKPJrfgCEks8gWEbFA8MSbq@vger.kernel.org
X-Gm-Message-State: AOJu0YwaUkxjbSnWUidi+WwVPdyelEWaw1x4nyE1gVrmk3zxOfXzfsEi
	bGRfoJGsr3++bB2V+syY1FordyWl4BC7X1fWT1Vlhuj4j29UowFZc4zaJs7unTO3uX5D5vpkSy2
	SEHwlGKzBwSOinU7A9am/QPXn6jH5MUg=
X-Received: by 2002:a05:6512:1389:b0:5ae:c286:c54e with SMTP id
 2adb3069b0e04-5aec286c65bmr321902e87.47.1782858673751; Tue, 30 Jun 2026
 15:31:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625115718.1678991-1-v@baodeep.com> <20260625115718.1678991-2-v@baodeep.com>
 <CAMRc=MfpXEFreGynUtAJfvW+27OgKiTOEZvkddt5U0+QG4cYeQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfpXEFreGynUtAJfvW+27OgKiTOEZvkddt5U0+QG4cYeQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 00:31:01 +0200
X-Gmail-Original-Message-ID: <CAD++jLmX-6bQeYnFz1RY2pZYO6M-WTKusknXLC7qBwKSJD3sFg@mail.gmail.com>
X-Gm-Features: AVVi8CeD_JGR0lMhBhRY5S2FOUVA0y7Fr83_izAzoDl2Cf1SkECqUOqmnWip8_E
Message-ID: <CAD++jLmX-6bQeYnFz1RY2pZYO6M-WTKusknXLC7qBwKSJD3sFg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: shared-proxy: always serialize with a
 sleeping mutex
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Viacheslav Bocharov <v@baodeep.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 5:02=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:

> This looks good to me. Linus: do you want me to take patch 2/2 as well? I=
'll
> send it for v7.2-rc2.

Yep that's the best, I'll add my tag.

Yours,
Linus Walleij
