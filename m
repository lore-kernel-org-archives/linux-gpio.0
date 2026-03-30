Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3428735DA60
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859891; cv=none; b=qgnBaS5EdPf9VFVcDD0j0dfOR//l5T1BiD2+k3Md3ETabl5cOJH+1fyiFCWF65/A9F5i8oMlhf3BR6ELZiYIspPCdAEvK2sS90zksLxVCN2wbfwshvn7fJsv5futwSjEdvcShVSddj57aIm24LKLylSww1EQcVUhCGrN3UeoKiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859891; c=relaxed/simple;
	bh=bo5boUpVussCu9LKGUJfl9LMpilojp9jcVgDy6oRNmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mBQjnSrTDS22enMq3ADKDD7/OEwxKlIvVStLtZF1WXDLL3D4gvJKEmXbJVTAcQc8rccLEpv3vscMYEEQNDTVmqRBvTAYycF6NRbc13ioUzxgUYOm65scjsXZf26o9HUukxK0WqxYNfQGWmMjWONqA92d3HGGsAL9fPwCPnUKh+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0v6MaAN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0v6MaAN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0527FC2BCB4
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774859891;
	bh=bo5boUpVussCu9LKGUJfl9LMpilojp9jcVgDy6oRNmA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o0v6MaANjgobpLTrCsyhRXFsE2qi4hHLUFfG7EIXmm/eqlt8geQEy7NaM22OPpQAZ
	 ovMAzTfwUZ+bge4a0TbLhf5hH1eDWjIuOdq8Bggia7nUeYVa9IA0NRorzhdgogJMmN
	 PNHbfZli+JLXbGaIfghJrt/DcEm/QPOjm+J8lMYzIyb3XcOxcseSR8Plka+4BU6AvL
	 Qhc6VlWctFhIRpwdB3P3FhoncsxVF2bnQubMKMN5nAKtjPgI/XiTVZWouKSqA82WQU
	 6teRtD5Aopiq7XVGbKOoBFO1Q7N2fYddzCCn2cpODHYjutRiYosudLvBtAnsiuiYr9
	 cD/QTF5A3Oy4g==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a279ce9475so4650003e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 01:38:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXLFqdS3PLZ5mAS5SYuRdB4PAE+nNw5ayg5KKaV4EZP2e2mhCk4fantJkS1jh8o9FROEWyOP4z07WmA@vger.kernel.org
X-Gm-Message-State: AOJu0YxixoFC+OEVvIowYPj8itZNhoKpMiFQMPEt3Zb/1JkM9IwvghUz
	YEknogzq+Kp52dXfvHDSqpMcrl5UxD+hIARfcgOTfSjEbY2u1wx3Rusw4lC1UdgX7jyzy4ye7ig
	ts8KR0de61P8DlvBqy0xLb9N//SG9QPIyHcTWKMuZvg==
X-Received: by 2002:a05:6512:1153:b0:5a2:a82a:163 with SMTP id
 2adb3069b0e04-5a2a82a023cmr3400210e87.20.1774859889667; Mon, 30 Mar 2026
 01:38:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330-gpio-hogs-multiple-v3-1-175c3839ad9f@oss.qualcomm.com>
In-Reply-To: <20260330-gpio-hogs-multiple-v3-1-175c3839ad9f@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 30 Mar 2026 10:37:57 +0200
X-Gmail-Original-Message-ID: <CAMRc=Me9TeeAs+rQE3aDPJNLZnG3gv0-CDqE9eZvu11ofguMnA@mail.gmail.com>
X-Gm-Features: AQROBzChCMlhF45M8e0t9IdtJbxQ_0XSd_QjvxFtSudpFtuC30cYtlOSEoJYKNY
Message-ID: <CAMRc=Me9TeeAs+rQE3aDPJNLZnG3gv0-CDqE9eZvu11ofguMnA@mail.gmail.com>
Subject: Re: [PATCH v3] gpiolib: fix hogs with multiple lines
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 10:36=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> After moving GPIO hog handling into GPIOLIB core, we accidentally stopped
> supporting devicetree hog definitions with multiple lines like so:
>
>         hog {
>                 gpio-hog;
>                 gpios =3D <3 0>, <4 GPIO_ACTIVE_LOW>;
>                 output-high;
>                 line-name =3D "foo";
>         };
>
> Restore this functionality to fix reported regressions.
>
> Fixes: d1d564ec4992 ("gpio: move hogs into GPIO core")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/all/CAMuHMdX6RuZXAozrF5m625ZepJTVVr4pcyKc=
zSk12MedWvoejw@mail.gmail.com/
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Linus Walleij <linusw@kernel.org>
