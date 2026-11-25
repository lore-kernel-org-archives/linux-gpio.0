Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632247;
	b=k9OY6WBcvwG9QPqjUXrCARUOXJKTFgTpcoc++z1SAtJ+P+cFQsVE6aauVJFXTRvC0Ukb
	 IoyB5/MvvhGBXvMzhxT7MJDCFmOGApzJpgUhBxUOQULXh/2mm2lIO8ybk+/n2D9pRkRkM
	 uzSxsN5zvbFvWkK8Q+zm3rF3fDUB/9x6Ulujx+V7LxL39F1+vv0UlGnqRSsF3N0vAIq37
	 XQLkbsBE3MkRYhSERqx9G+DNnvpbp6J62f8FLpioVhdXo/xexQDw6UEBWsi3gXJgln4j4
	 PaqNIecSx7jjLYi/m+a8ZBtNqlPL41z9UV8Y7vC06eEzMb4GZg7SSYzv5Q4B2fSrs9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632247;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=z88aGwPIsjieg97Hit4hBKSS+J9QlhpwflV2QuOiGvU=;
	b=C6hdZNEAyXkyOI5kOh6icFJyI+mc6T30lFhSbLkNDaJluFuD6/PLc7GcGPxdJHEEsuTQ
	 JMbODr1pS+FXOuwrAmDXWk/fjewiT++kBVOA/klF67EJbYqAynZIlc91izdJiM59PZNyR
	 UB+l+EfWf4MCqsrFDbR2zQlG7EghCPfynFJbnBioZoRcliEnCEJDxdGzPcgZLqlsYUq9m
	 5sm9WlHej1oSPUSmiVpFJgv5gldGykxJz6yfno5tswx96+7IdvF1/Mn6nWOYXuJESO7eA
	 /HR83MRuwOCx299T5JoY9mgLisDk1HvlqTTfJPmkJKUUnjt/8ezqStcbZj8gHHZh0oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="VYUKE/H+";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C785D606A31E
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 18:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VYUKE/H+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A73A1F000CF
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 18:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795632247;
	bh=z88aGwPIsjieg97Hit4hBKSS+J9QlhpwflV2QuOiGvU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VYUKE/H+ze7+LIVZKsJMtgxO2LwFwTbJszutLPd0SoGvQ/DhZ5UOlg2cuGtj51Y25
	 BhuEYDutYwdyeOd6GsKCux3CgbhRktYCdDY6j4rFNfujjeGyZ7VoK4wtpigL36EEzZ
	 7W1Cq+Rj3ps2bTdL+om6F5P/xtuS9Aorivy1hTdi0s/kIj5ouNU6m3IFlgKWnncAjI
	 ms/ig8kiiX2umSYM785x70QATxuwCJpUEn7K0QWwXPowa9iosE/g3Z2TcozlHeK62T
	 DKwlI97bulmh+gz249hoQnmV5jgNc/TYvGABZuCf6t8yiLzKO6Gi7weiNhQgFrKav5
	 O/Da7IH6yc4Lw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3acef9307c7so49154441fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 10:44:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGAweEkdsetmpsCWVAUaXgwn5tbgezKfMOvM3f/oX4pei6k9S7lssgsnYmUGOsASntpxWVqdoeKjb5H@vger.kernel.org
X-Gm-Message-State: APuU4Z+Hq0tGm7AMaWNJMEnxPlVIH4TFyFztOAcu4W1tfqeUFV4B1JzR
	QaAmAIlYOyMZ8yBRQSjqobEVTiSrQM2gJDzgMkS6dUg7M9HCW4oj2r0vUaECCtCQ0m6CvqYVEvL
	JLpXZybpP+qLA9uWmQiYQtbw0y9lj5tA=
X-Received: by 2002:a05:6512:a345:b0:5c3:235b:52db with SMTP id
 2adb3069b0e04-5c3235b541fmr887496e87.39.1795632246205; Wed, 25 Nov 2026
 10:44:06 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-superm1-pinctrl-power-improvement-v2-1-3b294116c835@amd.com>
In-Reply-To: <20261111-superm1-pinctrl-power-improvement-v2-1-3b294116c835@amd.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:43:53 +0100
X-Gmail-Original-Message-ID: <CAD++jLmuAzLD7grswJgTQurJ9BYJqEL3pYzSPXa+qemBgWHhsg@mail.gmail.com>
X-Gm-Features: Aa3M54pfJxk2k-lMiewwxJZsIRlDHOcyZCzrE27YbgJRp0NkyRZyxALSJufZgOw
Message-ID: <CAD++jLmuAzLD7grswJgTQurJ9BYJqEL3pYzSPXa+qemBgWHhsg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: amd: Steer GPIO interrupt to low
 power/efficiency cores
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 3:43=E2=80=AFAM Mario Limonciello
<mario.limonciello@amd.com> wrote:

> On hybrid x86 systems the GPIO controller interrupt can be a frequent
> wake and handler source.  Servicing it on a performance core can wake tha=
t
> core unnecessarily.
>
> Prefer routing it to low power cores, then to efficiency (dense) cores,
> using the CPU type from the x86 topology information.  If the system has
> neither core type (non-hybrid), leave the affinity untouched.
>
> The placement is applied with irq_set_affinity(), so userspace is still
> free to override it.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Patch applied!

Yours,
Linus Walleij
