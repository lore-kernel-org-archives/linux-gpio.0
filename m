Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9981B142D
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 14:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669671; cv=none; b=ALJEcjA49/rBhkqmRWTzNDP1Uf54LgoabQYsCrmmnoc/zmoLZ8gemXcL9JpRipcu+mmquT6kgQCWg5M3TPraXlxE0XUR94y5guKF84kS1fHy4nHsVNMxFfoewsofkwCEozZV5OgLfcTOfVh296QkYtk/ixRhQE/zZE1UV6hc9dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669671; c=relaxed/simple;
	bh=icuPs2B4QFfLsKJ38YJ08fObVs+9ZJnMQpHj6+krw1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQJvXsegNHYDhs38V9q+PaG+6oEswx4wgCtOab38+bTHltyo1VNIM+qLGXXJfVBiZkLyYavINa36tGhLGp8VE76o3FqJWvGobjEK1ij2OU5Ygvin5tuzhiLRQRNKmSiXhjwogFw/leK1ozIxvVaNyC60CCLmy0OmREnY8Ipkf8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RoBG/hpq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RoBG/hpq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A01D2C4AF0B
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 14:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773669671;
	bh=icuPs2B4QFfLsKJ38YJ08fObVs+9ZJnMQpHj6+krw1I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RoBG/hpqia+HVYMm3ag0XnK9qy5/PkT3O7feLeO09O2pbQIfl7jQ37IoK0chQ0iGK
	 ckwuaoqZ6zLhfzf4pUiuKOtU1i54AFwCLg2uYASdWpyZLZopQuT0DM2m9ToZCZZsTo
	 G3pvTdAQI5OPp6M+NtgwrxyU7UZeGhrOQW7OCHtwJP6miu2jWyTKPHIJmA5vJVInSJ
	 /PuAc9Rh43Zan1/qRIt4+y7SNcRGOnxKvk+B6rM5bEMEtqPJIWem0k3E0wSMRXDzxK
	 XOlwxrrKPCgzJZIJ7MrI6xRXnuAbZyBwjUkPmTasiBkHZF39ZFX2ZOGjrFITQxwgBf
	 LCGfGRfGQHFQQ==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79a60975dc5so356467b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 07:01:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWZYfmTl/raoHwO4/SozPVxIKA/ZcNZ4ymRi+kbods5BHscJdd7S5OokLMbQQQ0nU+edqpUHVun4KTP@vger.kernel.org
X-Gm-Message-State: AOJu0YyAtlPQzrnjvgZiAGi3S+h+EHp8aEfe9Jly8bP++GSGqwpqojIK
	kQqiTxk5nbuYwRgAiBl9AJjktj1rShlZiWKBJA9ZBLNR9bMiWsLsHonvrb7v2/6Us1440ADeHjQ
	io2WzX/Wmd8I+M12hvibwzML5v3i/Ars=
X-Received: by 2002:a05:690c:c:b0:79a:467a:3c57 with SMTP id
 00721157ae682-79a467a4014mr44717547b3.54.1773669670981; Mon, 16 Mar 2026
 07:01:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312193717.12221-1-rosenp@gmail.com> <7jwgbrijeldghk44tdg2be5q7o7vuj5np3nlbl2pxuln6c7ll7@ntuquxxdnfmm>
In-Reply-To: <7jwgbrijeldghk44tdg2be5q7o7vuj5np3nlbl2pxuln6c7ll7@ntuquxxdnfmm>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 15:00:59 +0100
X-Gmail-Original-Message-ID: <CAD++jLnTJGt2YXo6ASXEjPPsMbrr+Mz3RKcCVeUpaWEMPm6DOQ@mail.gmail.com>
X-Gm-Features: AaiRm527HlMvMf70RMP51LH1S6r3tIVHbSLAV8tVZzSohcjCv6bE8KOjkGMLXvs
Message-ID: <CAD++jLnTJGt2YXo6ASXEjPPsMbrr+Mz3RKcCVeUpaWEMPm6DOQ@mail.gmail.com>
Subject: Re: [PATCHv3] gpio: virtio: remove one kcalloc
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rosen Penev <rosenp@gmail.com>, linux-gpio@vger.kernel.org, 
	"Enrico Weigelt, metux IT consult" <info@metux.net>, Viresh Kumar <vireshk@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:VIRTIO GPIO DRIVER" <virtualization@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 7:09=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:

> I wonder if it is worth it anymore. Why combining allocations is better w=
hen we
> are ending up using more memory ?

For the same reason we are starting to use Rust in the kernel, despite
it sometimes will take more memory essentially. __counted_by() enforce
the same type of runtime size checks as Rust do on arrays.

Yours,
Linus Walleij
