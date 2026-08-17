Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089C541E6A0
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 12:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786971439; cv=none; b=uwtfmTYJ9TCukV2jUUwEPXzYLqIfbMIAOfa7Dv8qpwImTTWJYyQKpvgyfxo0hh62ma7K9j7A6Ze9xoBnYyixpiwbueqnFZ59d1pQ7655Ysh2u2cc0pmjynxV64+QGat62Aw++xE+0zOzYgC8+24wJaoMhBww4+j8lXwnW0EPlQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786971439; c=relaxed/simple;
	bh=/BIsi9PY+Fil18OFwk36lg/migCZgU71LLGi3zckc5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ooenU0yvQw06HufQk3M406Iql9omG1eckBgBkcK+Ue6FDHY9cwlJtD+XMMkTakb88wxhfOHFGQd7uZKk+4fDQaArejFJ5G10JCrJbRaZHO1YVV9aejlNx0k7PyA7V2+evD/AeR7aCt7ykrlru/YrlUxzeG2w1cTbNsU55yuWfPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmhobpQj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmhobpQj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C621F01561
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 12:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786971437;
	bh=yMuUitFtpxg4HIwjXPXk2NVd+fQLMlZkoGPUZSp/E0U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OmhobpQjoS+6L9WtCoV3faqmSY8+5uu0hUcCDQZH298uinfRO7U1LU8Fc+m/S8FCx
	 MCIET7CjS3P1UVolUMXP4WX0qXFgfLIjT9b6FzDozJe6J7LJCHqtvyOgcrcv6k4aPn
	 N/rAPxv928QWcFRRWUOvKU1H2CqNI5b7ja1XEm0cIh/SJDcGUgO11ZCt38Dtfmoc5k
	 kE5SE+WgPLkug5z6u+HvQiS/nHGxpwFPDmUO+3dL6iFbq1t8fbhQlAydqQWAIyB8e5
	 CEWVTh9IW0yP2PfHNzVYXdY29gCsiIHgWhlJErt4ROPdFJxeji+kSLSyZFExuA8509
	 MTFGVOXQUpwRA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so4010997e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 05:57:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp6J4apd2MOohaBxmf07pvM7hE2YR7YVhhRh8r6AschavIn/mMASjfYJ63x7TXN+1Fo4vyuWeoSp6Fk@vger.kernel.org
X-Gm-Message-State: AOJu0YwsmrFRRoJ+waY7lKdmyZGUb5zKFAxi9mmzuqVtkufL+QxDTFL/
	T6jhvf6k6a7SYneinGcmJFsEpKQIWJV/ssusTzDMRaZUGaKKl9oN9JHX2jP724GGhr0m4Eyz43d
	LzOJadJD4EurSrPOrPBVNZWj8fbbkqWw=
X-Received: by 2002:a05:6512:48d0:b0:5b0:1433:13bd with SMTP id
 2adb3069b0e04-5b453baa6d9mr4605381e87.9.1786971436523; Mon, 17 Aug 2026
 05:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <MN0PR19MB6091DB524E7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <MN0PR19MB6091DB524E7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 17 Aug 2026 14:57:03 +0200
X-Gmail-Original-Message-ID: <CAD++jLnDJRJMb2jrmTO3WSKHw+5t9uWJsibp47N1UkdYe54gzQ@mail.gmail.com>
X-Gm-Features: AcwNN1Xvw2LSRWcZSMjKKrZ79yk9hYmZyF8Kta8zS68H0_RKHsWW6aSjf7zDgKo
Message-ID: <CAD++jLnDJRJMb2jrmTO3WSKHw+5t9uWJsibp47N1UkdYe54gzQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] ARM: stm32: add STM32H7R7 and ART-Pi2 support
To: Liu Changjie <liucj1228@outlook.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Antonio Borneo <antonio.borneo@foss.st.com>, 
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Liu,

thanks for your patch!

On Sun, Aug 9, 2026 at 12:08=E2=80=AFPM Liu Changjie <liucj1228@outlook.com=
> wrote:
>   dt-bindings: pinctrl: stm32: add STM32H7RS
>   pinctrl: stm32: add STM32H7RS support

If there is no build-time dependency between these two patches and the
rest, could you send them separately based on v7.3-rc1 once it is out
so I can merge them to the pinctrl tree independently of the rest of the
patches?

Yours,
Linus Walleij
