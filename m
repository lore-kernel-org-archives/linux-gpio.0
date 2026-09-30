Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9775F4E430E
	for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 20:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790799828; cv=none; b=DF1WZz8dpI6UFzxrdxJsODH18OmVLG+8//Br1Unyn0MFQehg017ERsw9G8f+zzdVq3xCHJT+ywnogHmx8w5uajSwLnKwzp8RGU8ZkHmTiP1MIAgfAX2fb3HEyr8z3rDNu6Sm5KRI8i+Hs1C8YphPAYk/uHYivGija0Tpkqu1PW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790799828; c=relaxed/simple;
	bh=L0dkaVtfuTmg4syEz+TKVgAz2olc/AFTXSrqZmU60Ts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S1alNUUYIjEPFnA3c3cZalpc8+qeG8P18G4P4AYr5aAY0tqTxPcpPLD3IBVFwiiMzpdWybAjcCEsUqsGBd28BF0ii0NOPiQXqu7lKS2n34OC/QNDd+46y4bZFw4ZgPjKqw2Rm6KXwI12+wCVcLM2y/auiRUv+XbpiuTy6DWD518=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dUpy1nhL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dUpy1nhL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23BEB1F0089E
	for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 20:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790799827;
	bh=JC5D0IodTmhx+Qqdo7Ut3cyuUHNGM6ZCDDWIRKx287A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dUpy1nhLiGtHY4IS64mmd8OmhGtv+U3xlEzHQGblmSlZ/5rVUE13SRqkmLPlO/0ub
	 nqkiPsMdRlBRXxBqBmL3fCCtw28Roar7IMmzJomqCML9nm9oNZSM01naapmcSZppN4
	 HFZArhhJtu0H1Ooof1Z1ezGQwHIg0feSZRfWVkDNwf8eguFDDrhkT9C6UGlIRwy/q6
	 R6zLCr/kVRnyR69sqlVx3ShFZz6BEf2leglXMKM06ExhlmMsebjLeEZqsB2g/Ey/e1
	 hd/9O0bUB9ov/4M0YqqWzikGULbncc35QNQDK12rLFSfX52D8jAPam2SflbfPKQ/9/
	 T/grxnuXFMvEQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba390408cdso1955735e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 13:23:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzUVZNI8r+E9VIJV+ItqcsR35p1VGRJwFT+CR1YmgQsJmmqrjUiIUyAuQfho2trrPhd8lNur0WgfNKQ@vger.kernel.org
X-Gm-Message-State: AFq9FYJP295/o5BmO0ZhwSDskFM1fnpPnjisBM1Xr+LV/A0fBFFB+K8a
	wJnYchz9v2TpEkbAkgI1ZLyI+0ALe3FwlJMSOESACZTXNBzacBlmqaoJze1+43qKHuskUTEkoFL
	xZnkgDDHjBKoTiccIUiLmTXztrJk7NrM=
X-Received: by 2002:ac2:42cd:0:b0:5b8:99b1:4889 with SMTP id
 2adb3069b0e04-5ba406062c6mr881138e87.57.1790799825916; Wed, 30 Sep 2026
 13:23:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <179070265834.12871.48183786512201899.idr-bug-79@gmail.com>
In-Reply-To: <179070265834.12871.48183786512201899.idr-bug-79@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 22:23:33 +0200
X-Gmail-Original-Message-ID: <CAD++jL=qHEKW=yjdRU4Fbd+4EV0JGh6pYzdF+aECPmKwEU1Qow@mail.gmail.com>
X-Gm-Features: AclHuK_yrvfJH-yn1NxioOIIm32U-2QzAW1MTjJdswvtLfvL-cvqOP0MdqHNx10
Message-ID: <CAD++jL=qHEKW=yjdRU4Fbd+4EV0JGh6pYzdF+aECPmKwEU1Qow@mail.gmail.com>
Subject: Re: [PATCH] gpio: exar: initialize the ID before registering its cleanup
To: Sang-Hoon Choi <csh0052@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Changyul Lee <lcy8047@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 7:37=E2=80=AFPM Sang-Hoon Choi <csh0052@gmail.com> =
wrote:

> devm_add_action_or_reset() invokes the cleanup action immediately when
> registering the action fails.  gpio_exar_probe() currently stores the
> allocated ID in exar_gpio only after registering the action, so that
> failure makes exar_devm_ida_free() release ID 0.  If the allocated ID is
> nonzero, this leaks that ID and can free ID 0 belonging to another device=
.
>
> Store the ID before registering the cleanup action so both the immediate
> failure path and normal device teardown release the correct allocation.
>
> Fixes: 5300ebb695fa ("gpio: exar: use devm action for freeing the IDA and=
 drop remove()")
> Reported-by: Changyul Lee <lcy8047@gmail.com>
> Assisted-by: LLM
> Signed-off-by: Sang-Hoon Choi <csh0052@gmail.com>

This looks right.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
