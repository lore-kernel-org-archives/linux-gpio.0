Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5813A0EA1
	for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 22:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772146065; cv=none; b=i+TEhG36Gy+uugJRDQ6SNXURAwZLbBwUSikl/TCnUeHJuvwNiu1M8Uyl6OBNa8BriBDjcXn19NeIwqzKpJyGa3mBankvoCK5POOwUY7l3mM72whyN6/X2rq+k2WAGtphrwsblpafc9TD6hkcfmurfzHqG1d285kKDntOEHN4Ec0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772146065; c=relaxed/simple;
	bh=APviAckhtzsGqbkWRx3zBDJ8cA44GDRByy6wgZmyjLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OYnLCiEg4no5xiK9hgGXb3nK1gd2ldEtIzL380Q23qNKIu8mSkbnt8VsJF73UqlT+qjN2wWFiDvzTJ2pdUICN7760grCTBfXV262Dj2RkeTED7IHGNY+rBuASt0Geh55nCwrf0ABdV10rBmRH0Z5rD0DOuXNR5Bix++G4aho31k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9jj9L4W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9jj9L4W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2202C19423
	for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 22:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772146064;
	bh=APviAckhtzsGqbkWRx3zBDJ8cA44GDRByy6wgZmyjLw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l9jj9L4WxRTkuqb1p9CA8axtAWgNH+10W7KZi6fsr0qmiCrqItJesci/oDzMMJDOO
	 FbGWLfaQHMYXXU1uEuihA1QebIOSqNlAKUooujoMOrSKg1uLTTuEXR9zZsYT1lW5Ti
	 rtsZ51R/2Xn3/splCeK+tgACllBmMJzPVjgaCVJvxmD+Eztqcc7x2Ml9IKrKaNzwky
	 f8nmRcFf1apO0xhfILO2aTMsVq0bhZ86c9Z1tujPPsBSiLeyrK1nR0SQniqzoagoKJ
	 CqbSvDSW3ZCeeQEybb8FRjAve9++0x0m0RZ/s7D+KQImDS1P5cJtP/G40lPb4Xr2LW
	 lHr2QBk2fplOQ==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79868eae536so14116837b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 14:47:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWTcqqJFoF13f9gkK5/EevVg7sgbRzLRrycDRgy/B0C9Q5y47weG5mFRRMVY5cgZGybfetxtQehVfak@vger.kernel.org
X-Gm-Message-State: AOJu0YwjS2zyW9Hxfp/EBhD3+ZshmlDqfKW7zG5L/CWCa1jvY0fF8Pw5
	hrKKQmShwmX9e7DV76sGJlJZn36BdFRynGOvErT62F+qWVQNtssuMxCpIFKuo2Y9KiV8CJyAqse
	vKkwQjNa+xc3S8CuGkstlJUr7CtOr3Ds=
X-Received: by 2002:a05:690c:c4ca:b0:798:6d23:17fb with SMTP id
 00721157ae682-798856036b5mr9743137b3.63.1772146064031; Thu, 26 Feb 2026
 14:47:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224-stimulate-fraying-29ac76f6c55e@wendy>
In-Reply-To: <20260224-stimulate-fraying-29ac76f6c55e@wendy>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Feb 2026 23:47:33 +0100
X-Gmail-Original-Message-ID: <CAD++jLnNPudpxYd8-rNTAudqX2-apM6uZLyBRYxagwtT+LqeaA@mail.gmail.com>
X-Gm-Features: AaiRm53hBIqaR9Y0t56WzlpNeyG3WpNnXjDcRAEXl0GxKf3ATmgzHkurDlKjTjw
Message-ID: <CAD++jLnNPudpxYd8-rNTAudqX2-apM6uZLyBRYxagwtT+LqeaA@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 0/2] pinctrl property checks
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 2:39=E2=80=AFPM Conor Dooley <conor.dooley@microchi=
p.com> wrote:

> Here's a !rfc version of these property checks. Nothing has changed here
> outside of a rebase on v7.0-rc1.
>
> Resending because I managed to lose the CC list on all but the cover.

I applied these for next because why not! People have ample
time to test them now.

(Dropped an extraneous newline in the first patch.)

Yours,
Linus Walleij
