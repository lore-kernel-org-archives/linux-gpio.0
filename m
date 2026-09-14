Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A752F442FA0
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 11:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387000; cv=none; b=STfROaQxO2ljpjeBO0kj0hSQmVe61qYLVqLZC272ouLqrQ6cRrNFb55mJFHLU5oSKHGx4gEbBOQkkSYCd4SyFuBaiJ3j5NCG4ICpYTdO/MLX7d5epTaqupR0rqsTvL4VazdMdB/otbGP17uqlClfL1s8cB/5F6jtJ+I0M1Bf+o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387000; c=relaxed/simple;
	bh=zl6RLbN0ehdwyMkDD+LioONhrz2f2sfFDQCznJm/0No=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EgSCs4/+xpEYY1S6cmQmYYJGqbtncih7fbk4GrSG1QeoMuUAFXdMLcNqTejXWaAVpgCs2A9Got5qVc83AYLNe9t/v9Lf8dGVWsB4gYyd0JNt4cOVX7ez33mzDicXWq9KCGKBt0wZTU7zMPEMNHi83M2iVMNysLcwYyCWnYwWYQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dAm70dYH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dAm70dYH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F171F00893
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 11:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789386999;
	bh=zl6RLbN0ehdwyMkDD+LioONhrz2f2sfFDQCznJm/0No=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dAm70dYHClYU7L6N3HHcMKcXK2SKNwMxQmtKxNStuqY+eLHCIflpglYUx6VXWcBHS
	 vRTx4moxiZdr1TUOFoLOJPlXHb6Ix3vMQGv6RK/AOptd3wuQJBqa+QrF59EYbiih1S
	 4u2hNN/GSKEOB++Tjk6nIJHBhI+0p2cwUOmab2b9gP9Rb7Hhf5M0rs3Vo1qGsZ11e5
	 XipfrtvzHy+bBsmDYSlYJ03PNk0bnmkzQt01k12mJh7V7uoxSR4JPqjVRvnRh80OLz
	 MrTbwv6nbzpJqQwurjLg0bGNwf8QUeB0URTL1guABxcvf9j2WLYxKlyLnMdtxskP0Q
	 Y1sQWjddaUgPA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b79784a6edso1778160e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 04:56:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy2S9VZCurGoK/WeJYddf/GuXqWe/v4Qayq6VuYKFyJnNhXMGrEvIuUavrCTUbcMgfkT0r6aQpxR3IQ@vger.kernel.org
X-Gm-Message-State: AFuF++ng1Al9Nmn0vZ64qnimc/zrYFng00MrNmN3/VA1cBtDUj/ku+4X
	moSWcdh7bqyvrjE9WucJ3K7cdSCvv2gh68cf56x+0NGngJfcGuEK2SskDN+2C1nMhJh/mj9Munm
	ikUmaBer9AnmBCBP/7HfwCP3HMLRNqX4=
X-Received: by 2002:a05:6512:1316:b0:5b4:a9e1:b8a4 with SMTP id
 2adb3069b0e04-5b8ae68de4dmr607304e87.25.1789386998045; Mon, 14 Sep 2026
 04:56:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814043028.12548-1-phucduc.bui@gmail.com>
In-Reply-To: <20260814043028.12548-1-phucduc.bui@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 13:56:26 +0200
X-Gmail-Original-Message-ID: <CAD++jLmyJyGYmTh5fNQWfXMfaNpxyDVuNgYMoKqLDDNrno7VqA@mail.gmail.com>
X-Gm-Features: AcwNN1Um4x_GuLYTshuoggwXFWR_LD0P7MNh968APH0FnapvyZbiYjgof-pZSJE
Message-ID: <CAD++jLmyJyGYmTh5fNQWfXMfaNpxyDVuNgYMoKqLDDNrno7VqA@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpio: realtek-otto: Handle errors from optional IRQ lookup
To: phucduc.bui@gmail.com
Cc: Adrian Ng <adrianhoyin.ng@altera.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 6:30=E2=80=AFAM <phucduc.bui@gmail.com> wrote:

> From: bui duc phuc <phucduc.bui@gmail.com>
>
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no optional IRQ is available. Other errors, such as -EPROBE_DEFER
> and -EINVAL, should be propagated so that the caller can handle them
> appropriately.
>
> Propagate negative errors other than -ENXIO.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Looks good to me.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
