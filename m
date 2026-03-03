Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73B237104C
	for <linux-gpio@vger.kernel.org>; Tue,  3 Mar 2026 07:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772523271; cv=none; b=P4BEZ7A5BGOwUgCTuvhNjqsHLl0XKH1MNhSPyFzqD+4k5W5i6tKspfT3L5K9vwMLD5bAquKXSEtcnoI/w+FX7gk8RgSOKmL+YxXr5HBOfvzDPVK036tXPpVgt4AY82dhgHSrnBH/zEfYnVnmFcxQfNQcHGdFIGaM8ttV4rsJbus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772523271; c=relaxed/simple;
	bh=zVV0NCaniVIFi7GE1AKPE0lpZi3TXQKHW5/CTeMIYLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdVm67Q4Kywm4aN0iPGvnKTq5MTmrCWtpQOr07NUrAa4WNjBk3Pc9k94uktDNyxaDCDI4gX63YJ6uF2x//EVBtyBc/oZpLU8q/SomdvX7KiX7ksWyjno6WF+FPjoJGVYgfSsyRUsIkeXpZVRRrJdKcv8jb+kCnUYzAZzQwpS0k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=txxjX/mp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="txxjX/mp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA66CC2BCB0
	for <linux-gpio@vger.kernel.org>; Tue,  3 Mar 2026 07:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772523270;
	bh=zVV0NCaniVIFi7GE1AKPE0lpZi3TXQKHW5/CTeMIYLg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=txxjX/mp2KJZaqiL9ZJqjgbPH04h1XJX/EGcDCJg/SfMYbHi+LtORX6EwLf/wOWPd
	 w61EpO1clEB7Mx+qQa2v9mMq/h9HkrZea1tXqR0j2HM6d4cRNB/QX8iMLfmq+bd8+9
	 nmMviCRwe4qA9dsb7ZCG01trsrtpYsuCxlcA6O3GRJwN4NB7cD8Vj+2e4/ZyS8krJs
	 4DtUWHHgeB/kp6vpgMy9M3SA7LzT3wz+MiNd4i0FXxDOBpu5xlNBYkWjlpFwcZ4cJW
	 NSbl4X5iGvQ2ABv/ajj7DCUUxNULTql2rkN3R1qaZgzVbYHODvA6CcPbWQoDzzZ1jb
	 AGQP0b6NtY1bQ==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64c9cabfe5dso6492506d50.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2026 23:34:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJ00qdnz/qtD0IW9/cWBMaWcPKl8+HkISNgOnaOzlrcd5QXc4f1OYLYmbnKFXaC3j3GwgiP6X2XYQM@vger.kernel.org
X-Gm-Message-State: AOJu0YyNhg0DsJ9N6m3qJU5eDIDfofd3/TYVLmUw0pD4cQyMxrtUWpLM
	V8ivb18Paf4XxjcQtGwY+eoHT+PbhD8nhuaeYBfhiH24LjbbX+FAem/LPZBF4PcnyWNqMaZNG8r
	cCsapbZOE/FMOp5MKTNk6z5CjXTphNxQ=
X-Received: by 2002:a05:690e:4185:b0:64c:cfae:a9ce with SMTP id
 956f58d0204a3-64cedb514ccmr622513d50.7.1772523270130; Mon, 02 Mar 2026
 23:34:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303-mssio-v1-1-ea0fdf3bf202@gmail.com>
In-Reply-To: <20260303-mssio-v1-1-ea0fdf3bf202@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Mar 2026 08:34:18 +0100
X-Gmail-Original-Message-ID: <CAD++jLmDphb1OP1y+YJeBpwZZ-H-f_oZ836Uv6BtE-iG75-HXg@mail.gmail.com>
X-Gm-Features: AaiRm517uAgxnadmG7vOG2GxR2Wmqlb_Rsg7MADyIUOMfZW6UpQeGpdorSLrOr0
Message-ID: <CAD++jLmDphb1OP1y+YJeBpwZZ-H-f_oZ836Uv6BtE-iG75-HXg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: microchip-mssio: Fix missing return in probe
To: Felix Gu <ustc.gu@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 7:13=E2=80=AFPM Felix Gu <ustc.gu@gmail.com> wrote:

> In mpfs_pinctrl_probe(), when pctrl->regmap fails, it just print out an
> error message without return, which could lead serious errors.
>
> Fixes: 488d704ed7b7 ("pinctrl: add polarfire soc mssio pinctrl driver")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Patch applied as nonurgent fix.

Yours,
Linus Walleij
