Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3DA34E774
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 14:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777301716; cv=none; b=iwlw9IuUdysQAYa28u4xib+vdN88qwI6ObMspgPI7r0Pd+oYUVEgMqgipLxIoSuc7CRUxRezlcJeV6+2qR1eu+2wZOM/vxbjKTrzpaA/cUn7IzgbO8SXw8Ux/grz6IyFxxY1VzqUGuq9eSNMkfA+gUA7IqDmHjYk85fpG1ySHeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777301716; c=relaxed/simple;
	bh=rOuK1zkmU7ijWnk+6JvlDMz4FTRnKdBX3MjNsz9ZsKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/LzodqgUbnan0m5dZtRfljkOUKLu5QFh1Xk2Uwd5xm5GAcEtl1lIZ4YWwO1bX1ozoxjyHy08KeBRYhY+GqfddCsaCXhtV7nrWVz0OyWVivaCOUN0IH5B7+Uikc+YFyfRhdhY7Uh9JmliQ+vIJqrCQmWJ4uP7L2dHMFDgPgDnXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTnfacBL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTnfacBL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E0BC19425
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 14:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777301716;
	bh=rOuK1zkmU7ijWnk+6JvlDMz4FTRnKdBX3MjNsz9ZsKc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZTnfacBLphDua4doZXw2G7VKqr61VgvYQN/HkWdNjcYkZMDzxCvIdKMyO1O+6G5/0
	 7T6XoSUvrXj+9zdpbyHOwgPOu15fir7gX0kNUT60fbbPe1519tcb1Mry8gTYjqWJaH
	 ATY3OU2AMYy0i/QCwxYXMx85O8N7+Gs5nfjd4HOXl3LwVZZHuQ1CHYiEnnk5tdN6Nm
	 tmquChsniluSozUp3636k9tfxmuhF7fWFXoo0U+Z2s2mcisDQ/q7BeUW9mDRj4WeDc
	 rfOLi/fSFINPsdFQBr20klJh0gdxb+FqMWHWLOiFEg0vge1PfMid4mDIj5VcM2r6m9
	 8xfaV5vOe24lA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a01c80c34so100761811fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 07:55:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8j5XTJoo8FIM8kOTr16Yg2ujz5sUD/DPtIeh1kC0qi6to1Uw4PhC/pBNkDL5J2E1nLDhQBGKSMw0ts@vger.kernel.org
X-Gm-Message-State: AOJu0YxFa5DQx52mtXqBYw0ma+xH6J7eKEPgw1X2nKtsQIb8GJYPO26Q
	XCZENXU5Qt15Vk2nPmMnKrJcwNpTAYq4KsnTdnuTqVZZMl0m2KaDYPuWFJJmJIjdi7z2tOBgQrc
	8+U8c0/+w5V1S2mWPm8kLaaVThEhXkWRdPDiJsHl+8g==
X-Received: by 2002:a05:651c:e18:b0:38e:e6fd:65b2 with SMTP id
 38308e7fff4ca-38ee6fd6850mr114061591fa.21.1777301714101; Mon, 27 Apr 2026
 07:55:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424-meson-build-v2-1-d45fdfb8b7f6@oss.qualcomm.com> <PH1P110MB1603950AADB3F49485223F1D9F36A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB1603950AADB3F49485223F1D9F36A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 27 Apr 2026 16:55:01 +0200
X-Gmail-Original-Message-ID: <CAMRc=MeELsJmW8xzhvDiuaeucL94oHw5rtvVWpmiGLBUJDANPw@mail.gmail.com>
X-Gm-Features: AVHnY4L4XXeovn7y4kvQL9xnpFudBYCndDov8SkdXdDBu5k9Sc5Khh_FalceCD8
Message-ID: <CAMRc=MeELsJmW8xzhvDiuaeucL94oHw5rtvVWpmiGLBUJDANPw@mail.gmail.com>
Subject: Re: [PATCH libgpiod v2] build: replace autotools with meson & ninja
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Kent Gibson <warthog618@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Erik Wierich <erik@riscstar.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 3:28=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
>
> > -----Original Message-----
> > From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Sent: Friday, April 24, 2026 7:23 AM
> > To: Linus Walleij <linusw@kernel.org>; Vincent Fazio <vfazio@xes-inc.co=
m>;
> > Kent Gibson <warthog618@gmail.com>; Viresh Kumar
> > <viresh.kumar@linaro.org>; Erik Wierich <erik@riscstar.com>
> > Cc: Bartosz Golaszewski <brgl@kernel.org>; linux-gpio@vger.kernel.org;
> > Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Subject: [External] - [PATCH libgpiod v2] build: replace autotools with=
 meson
> > & ninja
> >
> > Port the project from autotools to meson. All build options are
> > preserved with the same semantics.
> >
> > The goal of this change is to produce the same set of files as the
> > current autotools approach: libraries with correct SONAME/version,
> > headers, pkg-config files, GObject introspection data, Python extension
> > modules, D-Bus interface and configuration files. This is done to enabl=
e
> > a one-liner test command running all available test suites.
> >
>
> I enabled tests and the python bindings explicitly, but dbus gets built d=
espite libraries being unavailable. As part of that, my build failed:
>
> mon.c.o -MF dbus/manager/gpio-manager.p/daemon.c.o.d -o dbus/manager/gpio=
-manager.p/daemon.c.o -c ../dbus/manager/daemon.c
> ../dbus/manager/daemon.c:6:10: fatal error: gudev/gudev.h: No such file o=
r directory
>     6 | #include <gudev/gudev.h>
>       |          ^~~~~~~~~~~~~~~
>
> I haven't had time to debug this but might be due to options being `auto`=
 and using `allowed` vs `found`.
>

Hmm, now I see that allowed() is not really public API for meson build
files. I should probably rethink using it.

>
> And one minor nit:
>
> The Python bindings README.md calls out the command to run the tests [0] =
but this patch doesn't update the post-migration directions.
>
> [0]: https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/bindi=
ngs/python/README.md#n110
>
> -Vincent

Yeah, I don't think it's worth keeping, so let's drop this. I'll
mention it in the commit message.

Bart
