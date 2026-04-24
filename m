Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0703E928A
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 20:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777063130; cv=none; b=PMJhvH9ez39oeCfmeoTveniBBQnqlqusIXfLLnX3PkDR57ttoTZkuOGbclc5/s1+1G0EfhBENIHwrlaFUw4NH74bO5i81RDZrL/3zoizGSrC0iClUKdkqXDAhlKg9P0vQHO797xgMstR+NYR722Yp/NnrnrSbFndGYJ6bs8ENkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777063130; c=relaxed/simple;
	bh=EGZWobRDd1pQ2qAOlqgF79jWqIefJzqPKT5YQuglEmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FtAB6CTjP0BAvD5DQr6nsUA4dQZKl9TxTH90o2Q7cglOSxvb1QZvMHBbDJbMds6bwt2KBTOjYjRf3lLeIuAp4B1zZEgsFBNAJt2cjOYYqeiALIucNl/PtOQoL6d0AhN9oh0uNWxL2zcpIHONQOVF2aGXd069w5Unp7NWAnJuzqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bYmZ6VEE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYmZ6VEE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B00C2BCB4
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 20:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777063130;
	bh=EGZWobRDd1pQ2qAOlqgF79jWqIefJzqPKT5YQuglEmM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bYmZ6VEEm6UNUb+khHlbfkSd9okr5pwLNILwKbbCkQ8DJIsR+H96hAH0xM+fDS+9s
	 GzWsDNPoO8yghaLzjRQLmxNif9f4LywDUpVxeU1ap59ovoBWuNCgge4/aAi+sfAhNI
	 r/CXn6y8AlMBaihSRij/GIsPWRx1f6zrJ3M0rCaYVw+Mqwld/iXsZQ0XP4eHRvEjNt
	 1SgoHj0EDKrZgw0mwYekd8pUcXix9mXRr7Xr0dlyYoMFaBDEomeMLWuvRLTJ5qR6j+
	 myaV9kI0hRHF9yW6rQLMfjf69csqMrTFcZkVUHFqM3JsEjpp5uGlRScZGcqDA07vkV
	 UVzhCDEfGe3Ag==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a2c9c5ff87so8954297e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 13:38:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+LDyVwQ4DbUWIzvXeLmZyA3STK6BPb41Lczm/gf68a2P/OEt9gQNZCUKbyyKU2q79s3wpDsDq0oS9t@vger.kernel.org
X-Gm-Message-State: AOJu0YxChPE1KRqnXIPEwhnzIeraRsrbfOMPqjRXL3OulfU6KEAICfRI
	l3yoz6rgy0MYMTsqSw8wGmcCxTgj1g2lrotIUaujWLHVCh59ajpi5OCXPClTt1UtFqqQCWgerKN
	k3jJKXF9JkAaDJpcgwBhf8yYBQR+YMgU=
X-Received: by 2002:a05:6512:6193:b0:5a4:1cc7:f744 with SMTP id
 2adb3069b0e04-5a41cc7f91amr9828104e87.6.1777063128768; Fri, 24 Apr 2026
 13:38:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424115920.54707-1-mohamedaymanworkspace@gmail.com>
In-Reply-To: <20260424115920.54707-1-mohamedaymanworkspace@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 22:38:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLnKNUS=VONsgFwX7s3Uze2Dps9C7UX2f1g+0Vu6q5Gn_g@mail.gmail.com>
X-Gm-Features: AQROBzBPDbyXgYyf-AYvDLF8jPftmP7znr4goFmliPg5OUP9f0ac20UYzZXLdi4
Message-ID: <CAD++jLnKNUS=VONsgFwX7s3Uze2Dps9C7UX2f1g+0Vu6q5Gn_g@mail.gmail.com>
Subject: Re: [PATCH] gpio: ep93xx: use handle_bad_irq() as default IRQ handler
To: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 1:59=E2=80=AFPM Mohamed Ayman
<mohamedaymanworkspace@gmail.com> wrote:

> Replace the temporary fallback handle_simple_irq with handle_bad_irq
> now that the driver operates with a proper hierarchical IRQ setup.
> This ensures unexpected or unmapped interrupts are clearly flagged
> instead of being silently handled.
>
> Signed-off-by: Mohamed Ayman <mohamedaymanworkspace@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
