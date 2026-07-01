Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2583E364927
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 08:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782893861; cv=none; b=hK6eGnZyKHgeR/OVLDz8NkOC8bEbyB35fTIq4NiNPCKEyvUKJ5x55C4uzF8u1IsEzA3ngM7TYkTNQQi4UDziYpTccz21onNo8gT91+k75Nn+Or3hxW2Ry530Ra76tfIr5v4E/Mr1ExvGawi9QGFeLnk69JfhT3hPdUSvnrRMrkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782893861; c=relaxed/simple;
	bh=7ZzAF3yeVyhvS1C8NOqosE3dLLNvqUJdcQifyae1v4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IE2w2bDtuOLlUaHvUXLsiQu64XWJRE2R8v2sWUR6bcjljj7ddPlWDoMM2S6XvTaswgJqhd83bb99covtIhlFaP4eJ3WNJxbmZhWuvKyRRdNoF0uKsnLo9srPpCC0/WkdkCDFQKiCFaWK2weX5mV27xEuL+fmanVO31ohiv7yBnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qw2aAMsQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qw2aAMsQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85251F00AC4
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 08:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782893859;
	bh=7ZzAF3yeVyhvS1C8NOqosE3dLLNvqUJdcQifyae1v4o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Qw2aAMsQo1zbo7CWVV8LG5hkkCeONghjAjG5/A47Z3GCjfdBEXVM3XCLQmvPJ2XZs
	 bnQm2OrvIkG8DGShSUa+q6EqCdSxMzHJx8b0XuxxwwwZ9oOPX9ELUcfMz9Zo/Jvsvg
	 lUVaPLVk2Lxgmnp/W5T/RVlx4Nj7mO5DdzJJgGh6zYosqwGaEaGOq6jGZEkcEu71e8
	 isb3fp1hPye1ExpVtJDwhAnGgL5dGmOQsq8cIDNrDW6EXiH65JSo9zprN2iA2zl/d0
	 Z5NANaB5LFSeOvxUiQv1SrqHvbdCiheX3qpdQOr7+M7Hd4I5r/1RjJ7WFZkrbUzxcC
	 pFdGjmwLXuMiw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aebd52488cso371218e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 01:17:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq81rBSb83eB893SzOzc2tf47hL7jDizL3/EH1yWWcMmB75sSwiMM8O+QuGGRssKy+oM3RB7Sd9wHgk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4MdsFgo4brncn/cOG6ciNUHpQGKjEk7XpsbNb6XF5YYnp+rz7
	Hpd2EK57RIMA381uYrEQcPqgpUcjg103fKdVyZZbc7eqaO8+I7BrOOna3LRXzFVoMclKxOZUKku
	P1Hx+eXjaplUEL/3qcP0EKZz4faO7r5Q=
X-Received: by 2002:a05:6512:138e:b0:5ae:bcf6:b07c with SMTP id
 2adb3069b0e04-5aec6795a7fmr143250e87.4.1782893858641; Wed, 01 Jul 2026
 01:17:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-gpio-swnode-drop-label-matching-v1-1-db1af36cf883@oss.qualcomm.com>
In-Reply-To: <20260629-gpio-swnode-drop-label-matching-v1-1-db1af36cf883@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 10:17:25 +0200
X-Gmail-Original-Message-ID: <CAD++jLnGTQQ5wHeWjxju245P__eMjL+yXeu69JRcWS1K6Yc2ZQ@mail.gmail.com>
X-Gm-Features: AVVi8CcRnR8C05DDeiFKIRK6VYenfHJh4p5GtavyLsyqgQL7_wooc_56sUvYIFQ
Message-ID: <CAD++jLnGTQQ5wHeWjxju245P__eMjL+yXeu69JRcWS1K6Yc2ZQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: swnode: remove deprecated lookup mechanism
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 12:55=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> GPIO software node lookup should rely exclusively on matching the
> addresses of the referenced firmware nodes. Commit e5d527be7e69 ("gpio:
> swnode: don't use the swnode's name as the key for GPIO lookup") tried to
> enforce this but had to be reverted: it broke existing users who abused
> the software node mechanism by creating "dummy" software nodes named
> after the device they want to get GPIOs from, without ever attaching them
> to the actual GPIO devices. Those users relied on GPIOLIB matching the
> label of the GPIO controller against the name of the software node rather
> than on a real firmware node link.
>
> All such users have now been coverted to using attached software nodes
> via the fwnode address lookup path and the kernel documentation has been
> updated to recommend it as the correct approach. This allows us to remove
> the old behavior.
>
> This will allow us to leverage the upcoming support for fw_devlink for
> software nodes in GPIO core.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Nice, I like it.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
