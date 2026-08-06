Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08293D3327
	for <linux-gpio@vger.kernel.org>; Thu,  6 Aug 2026 21:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786052306; cv=none; b=r0OgiRKzj9nWJl0TO92m0KyGHRKj0Wm3JpFv5axllVDtMZyJd7ycQHoISWZftbvWp5f7UPtIXnrA3AXsEUL+xX2urG0lIa6rC6c8hjUyOhtZ7H7hGaqJM8z3OBcCP8bkoJOCoxCmEc1k+pdcfIYBu+K7JAHUs6RGxokU6hO+XpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786052306; c=relaxed/simple;
	bh=PME66k1ZPGjMqAI0fID39pbrgVPKz89plDt5NR1zROQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hlxt2et/YBnfBT2uLALKityy1u25d9V7+97ntaFfiYsaLnBJBKUcNz+8sx9paipQMZ9AEJQ5FRdTO8LtQm53eDTbLIHof07clFuWiTbas04San/LoyQb6ZjvlvID5+GblmWrktwyXs+pJt/YzxwThS1aras0eZ9aGtoRjdH5x30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S8yBh6tt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S8yBh6tt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F2C71F00A3D
	for <linux-gpio@vger.kernel.org>; Thu,  6 Aug 2026 21:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786052305;
	bh=PME66k1ZPGjMqAI0fID39pbrgVPKz89plDt5NR1zROQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=S8yBh6ttBKrxXAkh7OuGXWHhlrocD7x4UZdBiceBuey40M0AlxeJArvlrlWWsCdy5
	 +TxjLgdhGIdIPWnmHXUNhKe3ohAC/FNeVNDzjnXsmKDrFu+5s0/HhxNZF6KlIa95Oa
	 ixlRyfZqegnbqOz8N8jNtX0AldUmMYLUf/q3wLlkj8Ha8391Txs9PiFe2spdfA9fZO
	 VNB1kG04eBBNOr+3A/c94+uWsg544lJqfpQo5HoPeWNWo9mJOSFU89Lr1UWct8ciic
	 UYgxeJ6qxZvcreokAlnwKvLC3MFvXaw0SQmX9TXITFIv8obDTo2ldKVB7bKB7g7v8Q
	 xL4jGi53njS/g==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39fa5e3a428so11094371fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Aug 2026 14:38:25 -0700 (PDT)
X-Gm-Message-State: AOJu0YyS7jCFeoqig5p3OyjHoEjhPVICEptOVw60RsdDTaQ+MtTxlMA2
	eoFmt4bMT5hUsIhjuUFSYEM8KFA2Ej8Wqi1dedfiWDIGQAkA7UeOXGterMKNsfe07tmr9ZvNjRI
	lJj/Qlf2ZiLkv0G36wSaQFnXkeZFGkQs=
X-Received: by 2002:a2e:be0a:0:b0:39c:956e:77de with SMTP id
 38308e7fff4ca-39fd14e6c93mr9302821fa.6.1786052304299; Thu, 06 Aug 2026
 14:38:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-sx1502-v1-0-6434d51fe909@jacques.com.au>
In-Reply-To: <20260805-sx1502-v1-0-6434d51fe909@jacques.com.au>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 6 Aug 2026 23:38:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLnrn4XKnsgh37CxkDqFxTgVeE7je61H4UDFryH1Ce_Qgw@mail.gmail.com>
X-Gm-Features: AUfX_mzH3xAm_ZIYAxTuYcixQYQ_l9XeIjKDjGrRwn3dsLUTVr6UzyuHOzTuXJw
Message-ID: <CAD++jLnrn4XKnsgh37CxkDqFxTgVeE7je61H4UDFryH1Ce_Qgw@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: sx150x: IRQ handling updates
To: Tsz Shan Chan <tsz.chan.dev@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tsz Shan Chan <tchan@jacques.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 7:55=E2=80=AFAM Tsz Shan Chan <tsz.chan.dev@gmail.co=
m> wrote:

> The sx150x driver currently hardcodes the parent IRQ trigger type and
> always returns IRQ_HANDLED in its interrupt handler. This can cause
> issues when the interrupt line is shared with other devices.
>
> Patch 1 returns IRQ_NONE when no sx150x interrupt is pending.
> Patch 2 parses the interrupt trigger type from firmware instead of
> hardcoding it to falling edge.

Both patches makes perfect sense so patches applied!

Yours,
Linus Walleij
