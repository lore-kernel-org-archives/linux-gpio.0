Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910392;
	b=BrG6KoArP7Hj9lsOhcI/wxRAI+aTmuqiZaW4a8E3SiQkRBwImqsMDoeVX6ZSDXejzHiU
	 V6ttKlckhzM4fiaIKMjt0HhkutRU73qaGOrWg3nhsR82G2pVko5P6L3JpbsEOgzXHZhM8
	 NCyWQMs5kWfEIQyQRSa39RdlmwvueR/4M7uEvYtV0EVM47UxgjBdLoV7pc6T6ifKAQZA/
	 ihDHGYLSRjH+sSi4JL2nGHflI2cUfCBO1bgquexXZ+r44j7ITFsVXpl4vmsCmgJX/lci9
	 /Fhjap7ASdGx50szzg4n7IuL39/bOTp6pLVV27v5/5MmWSSkVDoizqhb2nuACl5qW2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910392;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fVeT+3BNfNqDb7R7lCpMKjeQfLaYJROPn4AJADkSt68=;
	b=LXTfXS8DyGwX86+3JzFo7t8jgtDM2jw4+ukph2DMvAq4Go2wXQ/rbwbo1NyZItAFXuo6
	 ahddjwQg/5crOYPmOdnExsGihlUQ4nZ1bGCq3n8tGKkZnk4xWlFcZ5OgcG0afT25vBa8R
	 +k6xWuX6QwP3PGOhz+tYHgy7TnTGvVu3oI1pDar9BVDa4IOcJAvQLtYvAzuXkSwSC+e3x
	 V5gfYGHjwLqQweWrj/GbeM8f+loD0FlAeWYwvynjyQbsrV2sntlk7m6lpO51JhWIMZiDk
	 6LmzZ9Pc5jYQhGclJJ639XE8zLDb4J/9ANCFUAc1ug/f+faVl547YqRCeBUSIV7Y0fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K5iPa7jJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775BB606A330
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 10:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K5iPa7jJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B8091F000CC
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 10:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794910392;
	bh=fVeT+3BNfNqDb7R7lCpMKjeQfLaYJROPn4AJADkSt68=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=K5iPa7jJO4O1Ny56x+UYre1hMiIN4q06fwDElC4QwXyvKcMUscD5OULvLgaFAYq5X
	 eqbfXwm9epbdfQWQL5xOtUA7I4k5FUWYIcEmGDRaiWqmQ+i5U2Ez6aumo8nPZyqKYu
	 HVYN9Ic0CeDt3ZkG0598tbhFqIk30JsWnM/TsdYAqkcjQFqKNWMFc5wud0g9moNxM3
	 iSRjzJDe/Cbi6UhGYLcmj3sSrX6R5ES4TKHAQCHpO97M1gAOJ1DHtqSpHjxl2xGG54
	 IiYumfgjQdRT4W/KEk/RrwK5aPP1hxKZSunX+WQzgtFmwZ2xvp8qR3dvzuNqevpraf
	 dPQpkPVX/2jPA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c17a1775fcso2828137e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 02:13:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEOBkIgbpruHRlqyfMRT+44ydOZdobd8C5nUBUtEmkPMI9Lm5Dsy4HZAbYFmf3pSEJDVfAk/B6OyBP7@vger.kernel.org
X-Gm-Message-State: APuU4Z9wSRHNnXhPlXR50fBIV6GHMU39nJZSNlju1SIffXFt8SLGOZn+
	njdsInqASSsbWlq+RslRbFB6nHllB3D1WmiMzJdo1nCDqpLa9XAdbKDRsQqQ/Cg1iKx0H9w6bgi
	a6Rgq3/m0bf3lOWQF5LgRTLhw2Ltyqws=
X-Received: by 2002:a05:6512:2399:b0:5bf:b8f7:656f with SMTP id
 2adb3069b0e04-5c170b1c2fcmr5286367e87.16.1794910390853; Tue, 17 Nov 2026
 02:13:10 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107-a210-pinctrl-v1-0-6ddedfb0b76b@iscas.ac.cn>
In-Reply-To: <20261107-a210-pinctrl-v1-0-6ddedfb0b76b@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 11:12:58 +0100
X-Gmail-Original-Message-ID: <CAD++jLmk9qMP_fXkYEV5de9d-xu=GhHWkfAXws3kxwXORq1WxA@mail.gmail.com>
X-Gm-Features: Aa3M54rHFkXM7b8oZyPnRAYA_-IYWZ6f85f3wqy9H6Dh9cQVnlkurrnqDxyrOWM
Message-ID: <CAD++jLmk9qMP_fXkYEV5de9d-xu=GhHWkfAXws3kxwXORq1WxA@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: add Zhihe A210 pin controller support
To: gaohan@iscas.ac.cn
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 8:36=E2=80=AFPM Han Gao via B4 Relay
<devnull+gaohan.iscas.ac.cn@kernel.org> wrote:

> This adds the binding and driver for the Zhihe A210 pin controllers
> (AON, PERI1 and PERI2).

Patches applied, very nice series Han!

Yours,
Linus Walleij
