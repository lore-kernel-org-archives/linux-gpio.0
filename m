Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8BA2571D7
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784971704; cv=none; b=dSELXTwOf5cqnhfkFoahoEZ+TQba4Cj+iv4N1wtM/VZCpu6HWZEwRTsze7i1bpxZygZC6vIlLuh9jM+3stoqJFoo8gBBhLtVRIRDfmNiCMSLYPb9it2+dJKW3dq1jXvbCqcChSnD65R7DC0AXHEKo815B5Mi+X1LGTLeVlkb9Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784971704; c=relaxed/simple;
	bh=pIC7rF6lErCSsMWbjNR3Q5aviCldho8K3rsxptcBkyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YuXFagkaSS2jZxr0cKkwFSwiZKPX27FBQDFp0S0z1YHMBwrZQSTzLbwdLnSwT+laFmdzhDnuDRn0AYcw8B6EHx9vC99ETdzRSYrvSZZCfC/ME8uvjI/4Fqfi4gCU5jT4CRyXeSdVlKb1hUpFceG0xm+CBba6XCF1axb1Nnu+8Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EMvz/Ctq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EMvz/Ctq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06BEE1F00A3A
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784971703;
	bh=pIC7rF6lErCSsMWbjNR3Q5aviCldho8K3rsxptcBkyg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EMvz/Ctqt3fk/DCpJSYXH0eb9kvqq2mcyxlZaPh/Jrg6I+9idk5Aa2XfC45ImX5mB
	 uXG2hdigueYI3c7KG2qzZJ9HGS4fVFPXe8pbeEm7w9cdM0by+JsdheRLuZNWKAb1HX
	 uqgS9kQGuG4zGrKkTbS0DSveQYRnAYVrLLqLDfoej70dDLlElcEnf2EyYb2PsPx3fE
	 NqgoPXSfcQ2wA17Gk/58qwXwf+hZCMS96b0fHlM0cZb8rkGkbnp+zi8VcfFwn8oAig
	 gojo2N0gYXL9yQEXMz0yZmUaT3JDvEjx5ZsvgQJ1msWo707c1tyY+PYJHHbIW8Uq9u
	 AcrqTv8F6M9Mw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39c923b8c2aso12626721fa.2
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 02:28:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoHJ+P/DPTBTxvNBHql3FV+CvYJoxX1AOiZmIQCdtnNowp51n6CjeP7MNgYQ9vz5SsMTMnM+vrAY+Ui@vger.kernel.org
X-Gm-Message-State: AOJu0YwYusmnfUVfXEK6TybBBV5hU8J+7d8JyLbBcFYBUhZKDKoGrkuc
	zlmoiDjzfOt4IvGp86xAEWW9qWLDMzZsGSFZoZGJnSmftHSKdHXPoa7KWfh+ACdcTk0SEoqCszW
	Lis8etWYWTxp1Y6vdG3PLuMwWLoe1Wq4=
X-Received: by 2002:a05:6512:3dab:b0:5ae:c5b2:9cac with SMTP id
 2adb3069b0e04-5b2c1b2edabmr308663e87.33.1784971701141; Sat, 25 Jul 2026
 02:28:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710183439.996923-1-adilov@disroot.org> <20260710183439.996923-3-adilov@disroot.org>
 <CAMRc=MddZxoi_=QCFYp1PM8OwsWbz-Tsmoa7TMkQ1bh+qf-pdA@mail.gmail.com>
 <3d6b8d6ab53aadef56e68c925030dd3b@disroot.org> <CAMRc=MeKB-rH35Jw0Z7vKVuk9=d3M0x5a-LJwgim3fuUW26xWQ@mail.gmail.com>
 <ba21d405fd51a7dccd9ca5eacc0385bf@disroot.org>
In-Reply-To: <ba21d405fd51a7dccd9ca5eacc0385bf@disroot.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 11:28:09 +0200
X-Gmail-Original-Message-ID: <CAD++jLn3ubs-Q1vqzr4WZFa6D4Fh=2M+8b5EFVrmou++jrxCEw@mail.gmail.com>
X-Gm-Features: AUfX_mxeLijErspX70RL-2EZ-6I7voVzeBlMHnaxC4Gedp7XFobfWjFkllf46Ds
Message-ID: <CAD++jLn3ubs-Q1vqzr4WZFa6D4Fh=2M+8b5EFVrmou++jrxCEw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: realtek-otto: decide bank_read/write by device endianness
To: Rustam Adilov <adilov@disroot.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Sander Vanheule <sander@svanheule.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2026 at 6:17=E2=80=AFAM Rustam Adilov <adilov@disroot.org> =
wrote:

> > That's irrelevant as there may be devicetrees out in the wild and we ca=
n't
> > just break them.
>
> So, what is the solution then?

Make a endianness-dependent quirk in the driver that retain the
current behaviour for old device trees and accepts new ones?
I.e. enforce the right behaviour using code no matter what the
device tree says.

Yours,
Linus Walleij
