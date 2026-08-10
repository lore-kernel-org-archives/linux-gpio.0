Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960D4443ABB
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 19:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390947; cv=none; b=e/GkLxy4KWr6FcNli4187Z+XJKAw6QnMEyhvqxHSw3YZhBJxMp/QNSAUPUGB1at8iMZIrvzr5Lckfm70wf95gQV+enBmCHOvEY06ZkbQnTF4ijAsHv1KZ0Reot0olgBtVaPpWmg3gCuG9zy6bR2NqveZhohBgC5yUNUIiqcW7Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390947; c=relaxed/simple;
	bh=a/RorDak4AbNVbw/fWC8eA91U4vFHIR3vGa//TAL5kU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h0K9krAp4qNZZxlx1HX+ZCgEflzkBoZ0mEzmWgusEjiF+t/X8BT5AtpAsWdszCVwohdwcVd9NlmiLWOQI9DG4qwQMFMPmppY+yyGONp+f1xmmzxtAVX6JqehQUjUY/smkmREh/eDLYIfdlhSl8A45Y8XnE+Ydp8NQkQoV+FDI6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSLGM9fv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSLGM9fv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C16B1F00A3D
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 19:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786390939;
	bh=a/RorDak4AbNVbw/fWC8eA91U4vFHIR3vGa//TAL5kU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kSLGM9fvZI2I6QdHwXN0GjtPaULcvCw9vClBJvqivQxrdMkxYyJaRVbE3dw9Eg0pk
	 gV9irYScyYu3xK17ROFreMHuX9kjNrCsAI7rTWmkA8bsJv37uaRG/Q1i91vBEsdUgF
	 YeOFxPs7saOgvEvi4Zeb+YNk8YhPmK+vMCPBiRYFNUkY4TLRLuxOq4Dc0hZFhhI8e3
	 tKJkrH7B5676yvOgh5CfKkNSh1T1uN2TG66MEnlhrdm/SUiD7x87+TLkC78ihLb5y4
	 UiFCyMjEmhKX9kMCNnOdxIEpJLkERQOkYray6+KOiu7troydDHQ8l4Mmgk5yO3hUFK
	 CuDJ7XTxoQmKQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aebd52488cso2360662e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 12:42:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro/GY8CZJmF8H1NDaqsb3TA7wcJoAARikBEeXJlDBtl8U7ih80UXZLYOU6c35CrAz0keX5VzU1aiQtQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwMe6YHcIaHB1jGCV8DJNs3DORR4P94ogi+SeZ9uIvX0pu5+g/H
	pJlK29vRabxfQetuNJExznR7KUvS7mAL0PuiS600G4OSG/eu3iOeKUYpoHd0BVVbQvwfFnNxrvz
	SuMoe+Q1Ac8KLI8Yh0QA9XBimq902Hjk=
X-Received: by 2002:a05:6512:61a5:b0:5ae:ba8e:2ef2 with SMTP id
 2adb3069b0e04-5b3181d3181mr686062e87.51.1786390938286; Mon, 10 Aug 2026
 12:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
 <20260806-longzhao-upstream-cv75-v2-v2-7-6b09707c5fe9@ambarella.com>
 <CAD++jLk0LoOJk=TXin42AL3_z_7eVVkvMnYr1S8090C6A_B+dQ@mail.gmail.com> <DS0PR19MB7925690FD29D578D8AC5D10EDADE2@DS0PR19MB7925.namprd19.prod.outlook.com>
In-Reply-To: <DS0PR19MB7925690FD29D578D8AC5D10EDADE2@DS0PR19MB7925.namprd19.prod.outlook.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 10 Aug 2026 21:42:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLkUPU0eujvWc5Hn1tEu4n451LvkuGGT=j6OfirJENpRgg@mail.gmail.com>
X-Gm-Features: AUfX_mzNR-BpdsCoy7KeBCm5BOABzsx_ocJuW04mgEWpmksgWM6rzG04G-gloAk
Message-ID: <CAD++jLkUPU0eujvWc5Hn1tEu4n451LvkuGGT=j6OfirJENpRgg@mail.gmail.com>
Subject: Re: Re: [PATCH v2 07/10] pinctrl: ambarella: add Ambarella pin controller
To: Long Zhao <longzhao@ambarella.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 6:02=E2=80=AFAM Long Zhao <longzhao@ambarella.com> =
wrote:

> Thanks for the review. I will rework this to reuse the PL061 driver with
> per-variant register offsets, and evaluate modeling each GPIO bank as a
> separate DT entity. The duplicated GPIO implementation will be removed.

Thanks Long, I think it will be easier if you break out the pin control
bindings and driver from the patch series and work on it separately,
the same with the serial driver at least.

I understand this can be hard to test on the hardware, I usually
put a few patches "underneath" the b4 cover letter, and then the
b4 send-email will only send the cover letter and the patches
on top.

Yours,
Linus Walleij
