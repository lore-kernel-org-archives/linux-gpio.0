Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C1F37756C
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 17:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706241; cv=none; b=ULh4U/C2X/nSzhmPL42EorvgyzpZl2Ffr5qSoFVnds8r0dFEftdoMknI9P78xaAFbzaHjrInCPL/NDz5e7GxYAABMOT21TAGUFfErh0tlF+TBZEo7Xwr/XXKfjeswcyiP7Na0pq5SB+8V0VEiAXHXfun6XtaisgKVZ3gonV3VzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706241; c=relaxed/simple;
	bh=dPtINpGc0THsD8i+iSTCVKkzGVwgBEY9nOGXOsGp8/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l/tLTYuuqc68xryj3zhQ8QJU1aWzCUV+hfLZH9jJFznor/RZdAvHQuju/v1mb0oG9vL0zMre+AF32c0i9oifWzvY79H1JTsf6Wn24Lri//+YCWt5YZzdS4ZWOcVFbGE2rQ/d5sOz3e+vWaJYk4nupulUZG0pffUpaxKU4Omwoj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOzkBMBd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOzkBMBd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A551F00A3D
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 17:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706239;
	bh=+HbS6OGHC3S9Ng6WMAV5mXPftcOHJN651CKHFACUBAc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bOzkBMBdSN1avjIGz+miaoKY66CZdPUGPVtBQ4legGONz693fH3HE5xd9ln/iXqGa
	 pThIm6/9uSJvszLRzoy3CCv7WFlavqdw2xWMQF3iF15EZnMYLi7i/kycRamUOFjZNG
	 uE9ywIQbDYVGbfrck5PcUDK9NIUuYTU2PvgaBGDGWinqY55+Dfl2jtP7yH+m4lW2wJ
	 iIWC/9wU2dXTwEcpQQCNZZgbD45c3AlbqHTumG9LOKeNAKXGqyCFNciI74zQipdpjf
	 Bk0lx5GhcNjAuHx1SFytIoMrSMZjD4sg1zu1GyCm80bBLYuzcAIPENvJQ9Cr2LPUni
	 +7E0gYIOy0hKA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39c9452244aso12943211fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 10:57:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqoP/BT6+5cdYD5Gup6g3p/ERDCmxAHSTgIDpXaAZVXVvxzNZ7fO6EIJn/ywG/bxKWXf2qNu26vBSQH@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw3xk9KM7XSTvZa91R3hqwA0GeJLjzTQ5opr6Gor3L8oUHk+AP
	IJyNYHuEbbbADYgUp1e5W8NFjKJHNn1q9kBYq8UYKo38ESRoCuNrXsJOtdLRb7vzIjkaTlJi2aL
	ge5VTLrktUioU114Xl/Vb6acz4ZK+QMw=
X-Received: by 2002:ac2:5222:0:b0:5b0:1af0:2a20 with SMTP id
 2adb3069b0e04-5b02367487cmr29774e87.4.1783706238329; Fri, 10 Jul 2026
 10:57:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704122123.73004-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260704122123.73004-1-pengpeng@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 19:57:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLkjx398O4YcggO7Erqm=EUHodZfgbNNfGpAk3MreKshog@mail.gmail.com>
X-Gm-Features: AUfX_mw1n9wOi_hX_G_WRU_Th29WoZhs2hlWtaarWgwQQLtiQcJypTXqiFGpVgw
Message-ID: <CAD++jLkjx398O4YcggO7Erqm=EUHodZfgbNNfGpAk3MreKshog@mail.gmail.com>
Subject: Re: [PATCH] gpio: vf610: add missing MODULE_DEVICE_TABLE()
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 4, 2026 at 2:21=E2=80=AFPM Pengpeng Hou <pengpeng@iscas.ac.cn> =
wrote:

> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
>
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
>
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
