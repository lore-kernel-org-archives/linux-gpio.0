Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8987234107C
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 17:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771523261; cv=none; b=VsaFYtD3xkWsq3MkBMBHJbPXhFueu7BsSxaqHFZ3KWjiLLOxnbsxfkxzxJ76Sp+4sJZYaR+Z06KcDcign9BPYOihpKxXdtmMqDk7Sdv2PWXPgSLXKOi0WXEIHY6VWrSpGM5zmPFArpVjZEXlpCuGg2IhooEbiscfbtB4Myyfz8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771523261; c=relaxed/simple;
	bh=UVs7gOidbmt6oOnZ4Xr9TP0l/QbXtRBOYq/AhMjUzI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aLyILcXcG1TZ+jMssC+vZwlTOEG6l9SwUDfDfVHInh1lNV0ZGPOI91awMCBGc+M+/BSMNHEUeVJiGIbdlu3SYzC4NG8AoOniRx5YskWkV7klpkTywM6ZnVA3W1Lyt8t5gLx/q9La1z5ORRopwIzWGNwPNQyOBkRwiTp9EuDa3rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nOFI+HPy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nOFI+HPy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54DF4C116D0
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 17:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771523261;
	bh=UVs7gOidbmt6oOnZ4Xr9TP0l/QbXtRBOYq/AhMjUzI0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nOFI+HPyVHc81f3DhMYJF6XA9Nhb3ljERp0lZB/9OYWiW5aFVDw8u1lpO0zWIIzoz
	 qEOzCsDP3gfIGzVl59zK3W+H/T4OQXaCoD+uz9NCcth0sIkZZC5kECWqNyfN9JbmU0
	 9xcTqDuO5yNMplido0hAAD5yT1a+x7d667Aw/jEpEg8ABa0hv0cL7Z7QrgQ5jaT7x8
	 xglxWJIxonagMZG8aQ0r+VSmCCJ6Le54pQJckq0DJwY1z71W3++3ghS5gPuE/OcAvF
	 7I+hFOI+7FTSVHSf1909hGaTaqYtk4RmHKWUdqrgDng7aB1TiRS7+Mx5Z32Ts7iZ0U
	 1xImcrHVAkiPQ==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-797d509a2f5so14170427b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 09:47:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWrogdfyIpzkKWlUQoTpUWjIJ6B4lfHtbcZOOEs5glNmxXOtTe+4QAJAsns6Mc9pdaDiHhrhxN9rNVK@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd6+NkW3YYOXYG9+r9Xjv3ZFTcQTR/0tuXLyl8We7oazZwfAJH
	MFdPz2hMb67SCpOdpSv28YHJWr9N0TuzR7viIVXbITiHAIisvwp9EsGhXaL6gZzEZ9rEInmTMVe
	s4voMRp8+dfRUvXRzbcPQnuwZIzS+qrg=
X-Received: by 2002:a05:690c:e361:b0:797:ffb6:fd5d with SMTP id
 00721157ae682-797ffb70279mr38827607b3.19.1771523260625; Thu, 19 Feb 2026
 09:47:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214044531.43539-1-ethantidmore06@gmail.com>
In-Reply-To: <20260214044531.43539-1-ethantidmore06@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 18:47:29 +0100
X-Gmail-Original-Message-ID: <CAD++jLn2HLjzN8MAGYFes=ehExVn8aaCEBspkJv8XE9JeXT-8g@mail.gmail.com>
X-Gm-Features: AaiRm53b71tl-VbDTTw6kFslGZNdEUnkn7Bdin4zAynyZzamGnID2MPN8OzNQeA
Message-ID: <CAD++jLn2HLjzN8MAGYFes=ehExVn8aaCEBspkJv8XE9JeXT-8g@mail.gmail.com>
Subject: Re: [PATCH] gpio: nomadik: Add missing IS_ERR() check
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 14, 2026 at 5:45=E2=80=AFAM Ethan Tidmore <ethantidmore06@gmail=
.com> wrote:

> The function gpio_device_get_desc() can return an error pointer and is
> not checked for one. Add check for error pointer.
>
> Fixes: ddeb66d2cb10f ("gpio: nomadik: don't print out global GPIO numbers=
 in debugfs callbacks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>

Great catch!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
