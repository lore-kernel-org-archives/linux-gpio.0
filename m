Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F0A368D5C
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 22:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781303041; cv=none; b=e4y4UbVnnBs7qP5gZGJrYYVc0rJX+7FkAggkzQag6y3vru2aw7k2XiOhZTsaRtzAAq0eqgvhzcYDsf6boys/7SzLQS1VbpHUC7YKvv/RjJEBKINlLttXwy7l+v7QpQUQzEDaQ2+Z/6Jsvee6IgbfVodArHg1PWd3lrjik3BmaD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781303041; c=relaxed/simple;
	bh=bXP3sa7rifXth+VPZwtIhI8rPqb0L2XD4ZVqATgc4Oc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u27STOZIgdCIJJMPaHtdcwgNTKQ6sTXBQ1Aq881HC8mHujUCKOCZGDkYIXsFWvYbr1Ff7AEoOBGWJnuCAu0pPVwCkDOhMaeWcKeLvwGJF4Artv1vEYkJ7oM8JK9QM8VROK3Ff9J5n0aNsJ8weZpXl5lDYMl/cD4HjxK3HuW1IbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2g4+/ZZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2g4+/ZZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9DEE1F00A3E
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 22:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781303040;
	bh=bXP3sa7rifXth+VPZwtIhI8rPqb0L2XD4ZVqATgc4Oc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f2g4+/ZZIyU2wVo5oofIMr6SLQUPSoE7peY/KPlBLLjTmAWzZAi9eFfPdghrX/fkX
	 qrPnl8Bkrlw9DlQi0mzs8idzF2a9tGvDHDwHVf3NPoscjwBOHcSSfsZLCWyNXJTlid
	 eoVctntfqITt30e6+cbBNyzJ6kBA90sGD2S3jRM49bEieJF2j2w2hIv81QER599Abl
	 g7uPEJ/mFVObpDsXhM+l7RETXAW6Z4LVw0rK2QU0qtyfgBuRArXFlhhE7IcYPHBAKw
	 pt80GYSH24ujqF53Ap+BDJcoH6LOMWAcSh5XUifc/za4VjJCD1b+VofcpgvVNLmrtf
	 5DHKzIghRHSSg==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-399389dae01so27271fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 15:24:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+zKg7GyrfJuiFJcM8Jz9JGulZtG0bDXnETvYSSlKRQ7HDT6QRTGNn/sEHfGKo4Kxk8ud0dc1wBmeMP@vger.kernel.org
X-Gm-Message-State: AOJu0YzEZQBWcLC0YQE6pOHny2htl9HkhjYVqTKA8Q8c2f4q4Yty/xUv
	8lXC+ttye3SdJ+FqcOIK4ZqdHd/WyWWqAOdsx+awE9DI1yRSfZhlQPRxvR/v4zX1TiFRCRpnqwF
	hdQB5rB4s+OMwbO0fVxbk8aH7/1Fst2A=
X-Received: by 2002:a05:6512:104c:b0:5ad:3035:9e59 with SMTP id
 2adb3069b0e04-5ad30dd8e8fmr295424e87.50.1781303039652; Fri, 12 Jun 2026
 15:23:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612215216.1887485-1-robh@kernel.org>
In-Reply-To: <20260612215216.1887485-1-robh@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 13 Jun 2026 00:23:47 +0200
X-Gmail-Original-Message-ID: <CAD++jLkEm5Pk2SOULp4GePwPCPO=xe_4pFvxOhZ8VQadhaYv+Q@mail.gmail.com>
X-Gm-Features: AVVi8CfiQrMKbi5s5aF5f3ZvdRjPtAwhHHk1Y3Lrz2g0YWsrIN4iMr3RSS7ME2k
Message-ID: <CAD++jLkEm5Pk2SOULp4GePwPCPO=xe_4pFvxOhZ8VQadhaYv+Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: pisosr: Read "ngpios" as u32
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 11:52=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> The generic "ngpios" property is encoded as a normal uint32 cell. The
> pisosr driver stores it in the gpio_chip field, but reading it with a
> u16 helper does not match the DT property encoding.
>
> Read "ngpios" as u32 and keep the existing assignment to the chip
> field.
>
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied.

Yours,
Linus Walleij
