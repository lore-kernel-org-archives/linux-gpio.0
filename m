Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEAF4E0B68
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 07:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061891; cv=none; b=cegWPYa9USZgQKzPodNFFLyz+ek4ehapBZoQJeruQvDk3RMVwQGsC60VwkcHnjxyAyCJoQlaGgDjEsTe1V4UPVPwZUQvR3VPCOAeJcmSbXa+MzA1ZbfOjjuRVND3SZWlI9LpHXzT3hYe6y2fUfCwruuI0hbpq8Cqv5xLYwsFQtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061891; c=relaxed/simple;
	bh=jv6MlIuZXXaVscNrKeKjACmCF9DaajcuzQUfRu2mAFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OdwuQGSWc2unakYVD/eNf5n4zlTzCC+WccwkPx5GSsTbpEGQHsJT62JKJFKKYtekrzl+dF+EKI7fdPE+dmerz0bQGS/uMTXOlMOND5k3jI44pUToBrjrLtJiKbAFKDlLeAsiErahHuF80r0DxEVC01Ht7wEJgTqTP2/qLKhjDSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5byt1AG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5byt1AG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E3A1F008A0
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 07:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790061889;
	bh=jv6MlIuZXXaVscNrKeKjACmCF9DaajcuzQUfRu2mAFE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=a5byt1AG2ujcSfM+RR7j9cz1KjAzXibSWOuFJQ/0h/JQpfaz04mxmXP61RUh/aVXy
	 vo1byg+7aGrWooKr9mk5fUUXnHTgA6UgYcPHOPiUrOi+vrQRC+4eD9uZtGKyjEm4Jz
	 i0JBxBub7tvduMTaeuK11Mv3KE1yHrO1C+nY+vAY17a81Lmdz0ol3+6GdWRvEcaPY2
	 JiuKq6V6Ve0DV3k6Fl4ntpxBZqKj9wEw1LGAT9rldh97KmTeW6FmPrbWkFpQQqrNJs
	 e5XXfqwVZrw2FtbY2L8ECFoO7dMl0B4jxHMhggQSG29ZcIZxRCHbTjJhcHoUKmpSy7
	 Yw81U2cuHJaJA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16cd1so3488544e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 00:24:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw+cMdRmgnNiD+fnDHOnBqmvv8fpWiOXpkqTFB85GDtPx/2WXCclOIqeKswZC0d1xzsCwggKtRUFtEX@vger.kernel.org
X-Gm-Message-State: AFuF++n08ERmszKTiCa6Qgebtbzefo2mtA5EIRuwF4fzUSZZif/5Mjit
	DA45C9VILT0TYh6H9to3/uhJ0RMnR1uzCtukpTSuZc7aHt1rgwVfNd5lVRnsAfmXMWe5DvTdt0A
	qtxxeMKb1nVUbAls0ZDdQZj7yoRWP7AE=
X-Received: by 2002:a05:6512:23a2:b0:5b6:6b8:1fc5 with SMTP id
 2adb3069b0e04-5b8c18226eamr4364173e87.17.1790061888255; Tue, 22 Sep 2026
 00:24:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com> <20260921-cv75-v5-v8-12-282ff5d98dda@ambarella.com>
In-Reply-To: <20260921-cv75-v5-v8-12-282ff5d98dda@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 09:24:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLkDOPyStRwtoeUysCCXxOFUs142xw8Cdcm2CCo5MghP7g@mail.gmail.com>
X-Gm-Features: AclHuK_MFbUz-mrJnpdTRjizQpZ1o1JRe1ZMXbr4OoxUHWYI1Yt8b8NWQaKPwv4
Message-ID: <CAD++jLkDOPyStRwtoeUysCCXxOFUs142xw8Cdcm2CCo5MghP7g@mail.gmail.com>
Subject: Re: [PATCH v8 12/18] gpio: pl061: use cleanup helpers for locks
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 6:23=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Convert raw_spinlock critical sections to guard() from cleanup.h.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
