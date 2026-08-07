Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B145A286417
	for <linux-gpio@vger.kernel.org>; Fri,  7 Aug 2026 20:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786134737; cv=none; b=Do2vaufToDlxMms03zzTIUfZEwNs2w6lh8ra8UksKQfcOviN3AHIlBb2LDs1dE7pWPWZazB6C/YpWQV4gpsXAIXihjXA87HFxXNIIRVmgY5mF9PHI/DIyhKEuQjrjYf1+DZes2sZhUy1TN/i+ToukRApD8/PycNgW+ixGwQ3uH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786134737; c=relaxed/simple;
	bh=Jjw0D+7UzIFdWSRMPIJ9oOfgPUCv8NDoXMgLedkkPTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gUhOWS6WWuBQNNCBk/jMgkjXCJREi2vDGWCihQxn3/3I1C+4/dvW4McWcHXU6TRGM7sI0B0d+k4aGt6V0CLXmkNxbfj/LqvNH+vzulwJD9OArFiq/4za/JRdBIFwmkTqvTa0wGnBYKahcm//dabGon/4OgirXsIkdE9JoJa76NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mH6nbbdW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mH6nbbdW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E7C1F00A3D
	for <linux-gpio@vger.kernel.org>; Fri,  7 Aug 2026 20:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786134735;
	bh=Jjw0D+7UzIFdWSRMPIJ9oOfgPUCv8NDoXMgLedkkPTg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mH6nbbdWQqzQrsCFR+BZaBuT3v69/5P9J5Rxmq/ZBwYDneN5DP9KzvWOPF5os6VXZ
	 mjC82O2mtFdhwZEHnmdOpI3Bb6AibcFXmDtQMOvcQBcLAxuf7D8fyKHb7ViE7UL1Ns
	 EGkWdSDXp75Jrzf4/siLKO+b5WiXX50luALVzm3tHllG6P2q0QnvbtVaueZ0mIlum+
	 M4t9SxlzRpjAyix11LGCjk9TZeanfRLeCuBf5XfX0HjKLnECvVC+ib+YCkItsCV/If
	 /YaKjXMKgjT9MDE6wzwqugUNv33SehZvBh7CPgixhx5cCWbblbu62/zxgYjJjqxyo/
	 /1ENv5kxRK+OA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b14d1f9315so3079731e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 07 Aug 2026 13:32:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrfKH4lTwu/dx/G+Tv6lRo5VaoTgoXAjn1KzDz4tcG806jKkSMM0VmQNANxdPAG0jRdhGZ7PPliJptZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyODSRBlqK/Xa3AyN6StIRHSiyDt9s3zVoFy6FnT2uuLOr6AZJO
	w/FCQzHKbr+w70c4SEeo0yDib+9GO3xlaCgZ7fEkHc4hEAISAPzeRV1YKV+kNyEu04Ke7uzhb8G
	i1RmHbjLXuvayGdffdUSimAubWlgIDJE=
X-Received: by 2002:a05:6512:258b:b0:5b1:5362:a974 with SMTP id
 2adb3069b0e04-5b2f4b8fc15mr2881298e87.20.1786134734083; Fri, 07 Aug 2026
 13:32:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-pinctrl-generic-mux-fix-kconfig-v1-1-5abebd6f1a8d@analog.com>
In-Reply-To: <20260727-pinctrl-generic-mux-fix-kconfig-v1-1-5abebd6f1a8d@analog.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 22:32:01 +0200
X-Gmail-Original-Message-ID: <CAD++jLn+vgLzGd4W=urzM=zKp94r_X4zfBWF-KtNyQVyqkLuzA@mail.gmail.com>
X-Gm-Features: AUfX_mxWbj6CKpsrX0Oj9qYTv2LgC2UFvYowCuE80haW6IQQc8AFcIG-0-kB-f0
Message-ID: <CAD++jLn+vgLzGd4W=urzM=zKp94r_X4zfBWF-KtNyQVyqkLuzA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: fix PINCTRL_GENERIC_MUX not always being selectable
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Cc: Frank Li <Frank.Li@nxp.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 2:20=E2=80=AFPM Alvin =C5=A0ipraga <alvin@pqrs.dk> =
wrote:

> From: Alvin =C5=A0ipraga <alvin.sipraga@analog.com>
>
> CONFIG_MULTIPLEXER can only be enabled indirectly. If it's not already
> enabled, then CONFIG_PINCTRL_GENERIC_MUX cannot be selected at all in
> menuconfig. That's because it depends on MULTIPLEXER.
>
> Follow similar consumers of the multiplexer core and select MULTIPLEXER
> instead. This way the driver will be visible in menuconfig as long as
> PINCTRL is selected.
>
> Fixes: 34acc5a8adfb ("pinctrl: add generic board-level pinctrl driver usi=
ng mux framework")
> Signed-off-by: Alvin =C5=A0ipraga <alvin.sipraga@analog.com>

Patch applied!

Yours,
Linus Walleij
