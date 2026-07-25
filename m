Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75D438F947
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784970693; cv=none; b=NPWe5NHOvRgcDWrT4nHrY7HzMS5EgU+7SPmlC9UWPP4x7ttXgv1zyPCrizybgEzftsgqIJo539ZVzGfk1Wto3c3xl8yPW5/TNuJBjhAYIkp5JPKALklHuoJ6fOn+8t/2WBJkKTeJ9bp17t3cYCXXoKXfN7wrrO/QIDxe4wNWYR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784970693; c=relaxed/simple;
	bh=6R0Ikomv5cWU5z8x5Zcvwjfe3hrjqxonu1617TWYlM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E0EyGQfhr9pla2+8GA8oOwk/fihYpAKoSG/IWcACOzmYx1/FwKMLf4QK3DPgKnUJfY2otuhyT5h6BpD7zyR6yO2MdMjUHSLt4jIS63muoKvHYKljrGifd9xenWoVFT/6YXJE+miSAit2/KZ2afFw7LRMkacDWtza8lMdLVKFmyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=konN2uPN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="konN2uPN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7271F00A3A
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784970692;
	bh=6R0Ikomv5cWU5z8x5Zcvwjfe3hrjqxonu1617TWYlM8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=konN2uPNhRes3cQjmf1NHk722qi3VtooVHBbbM1e++J7O71ORFo8hcKLBBXnMgYDS
	 eiDAArdL3IghCeS67WjP+itK7/AmkhDKFHfogKRPMgX+IkV3qvTCFtUx9q8ZTiL/0+
	 OxVjXq2UNIqrHtWfAcnHBs239+XgxeXdbxBO/6exA0+3ewoNFhQRv8piHvDITGUWJE
	 NFZJw51WRnBFqR7VPBawy7R03508GcYCAbj40uLiXlFTBxoEZ4NkcF6U1oNDR7Xg/k
	 TrrbGuX1VlqEqjr2YMSsIbYQEY3tHQOlg4gQfXoHID9rsTd049KtyAhaasLapQJHux
	 gYHYNX9U+oX/A==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b0231a3e86so1068278e87.0
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 02:11:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqU+p4SZT5vdB5WuGvFRXmNDohReg3IIOYjiEH48uAWgYJRSMo/UqMDd9wDYKz1lM+nEt0BB15+BfQ+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8WfjrUAgWkZU3Tt7HPivvSC4rfl6AQdTA1LIlE05uith1U9xR
	npSgOvf+5ealA/kpzJ2goFUwvQrRd8zSZB9Mc2Jt7JqhtifWzlLHZuJhs0nSigMhhMQaPdcE2C7
	frOZ5Bl/1T/E+QhVcdqN/cK+QogbNgHM=
X-Received: by 2002:a05:6512:ac4:b0:5b1:5379:8b6d with SMTP id
 2adb3069b0e04-5b2c1b04349mr253931e87.23.1784970691513; Sat, 25 Jul 2026
 02:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718041311.2605172-1-dmitry.torokhov@gmail.com>
In-Reply-To: <20260718041311.2605172-1-dmitry.torokhov@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 11:11:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLn1he5vrfWz+iX1ERfEr8qgEvdHQEghguwprHSQX9CT0g@mail.gmail.com>
X-Gm-Features: AUfX_myp4DfWs0MWcB9cJ2J8QYK15LxI_HmuwPqnhpYY6J1VaBfvVjRCiGx36No
Message-ID: <CAD++jLn1he5vrfWz+iX1ERfEr8qgEvdHQEghguwprHSQX9CT0g@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpiolib: of: remove redundant IS_ENABLED check in of_find_mt2701_gpio()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 6:13=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> The entire of_find_mt2701_gpio() function as well as its entry in the
> of_find_gpio_quirks table are already conditional on
> IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448). Remove the redundant inner
> check.
>
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

OK then
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
