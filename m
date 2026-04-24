Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659C73C4545
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 12:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777032913; cv=none; b=ASerD51clOebpRvqrGpqdR/ROJo83UH7/vfof2Rm5bxOODurhVbnOJYG/nDUoDJU15JPzBwx1e9SVWZEqgogKKoDwfb7xuANeYqE1ymvdpoHoZTfLZ0gbAr/5Rsd62oePLjZdQ3wA+wMIAmv06cXk6ZhLfcv9VENAkPrrTjW2/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777032913; c=relaxed/simple;
	bh=6EwiN6fexNa7KKbyzfw57Tb/Y7WAh/MDCibLJ/SjbXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M01BEN3qQSFkn09NIRd9KXHclx70HnLg6Dqm7D0AEbb/wEsmh8ZyYXtrJFpQi4+Ld1chyFEKKDQ0xckbwgvcxA4pFHEgMPU4KnVe9EKLTNY6BC6LZILANZtZe287cxhACHMPxtWupnDd4rYvqwUtXu3e7KoCzxR+xPZCL/7rwoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hlJjT3ed; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hlJjT3ed"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED616C2BCB5
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 12:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777032913;
	bh=6EwiN6fexNa7KKbyzfw57Tb/Y7WAh/MDCibLJ/SjbXY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hlJjT3edjhXKhxv3+EBghB/oau8lzSBXgk+4+sDHPKRjbzOHiqmApFZ2aVXo6OtoT
	 QarpQCddEGVqOmGcFwTuMgXYgUOv8zMRcA2kXIPsDfTeR7vdybQo7DrqlHuBVGATRK
	 kzkqkukdbyfhshvbgXeBQvlcpFHz14L/K5Vpd72gI84eZRsvnpIWd7IJeKYkAXEzdg
	 mUC9HZWer2rc5Wk+qBqcypxINeiB/TwjoXaH/87lSRGfOvOqi5Mep1yVyrx1S35EUh
	 nHZYwCnF2vap//WbTgglehW6pGuig48pg60VMLZmKiazAU6w6RD1s9XAaErcdLkzi9
	 gFxlXc1Gn4KQQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38ccde812ecso76626441fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 05:15:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+KkjLLbDB7TaTBIYqqmriLIgOLn8g6Nej85QPTPak/xag2YZgiKLr6NMxi7DO1GGba5RMTgBlnGryc@vger.kernel.org
X-Gm-Message-State: AOJu0YxIJdeLTi+EFzWZhkqlKXcR5U7ENLy3cE+x2wCJ8e6TZT+20sSy
	Q5cLL4DT8dXzjN47zOfPujUeYZZ1NVdTgUNltV56pwu41yb2vDXAImmhT2UaYve4WDWTTAnKO3/
	lHnspXZXLgdEeIgxJRWB8BUMAW9lVyQVet0CfmQLk8Q==
X-Received: by 2002:a05:651c:50e:b0:38f:f8f3:6c46 with SMTP id
 38308e7fff4ca-38ff8f3aef0mr78245731fa.8.1777032911666; Fri, 24 Apr 2026
 05:15:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422-meson-build-v1-1-a63a7a8b0d2f@oss.qualcomm.com> <PH1P110MB16037F48B385E4CF1C42ED569F2DA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB16037F48B385E4CF1C42ED569F2DA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 24 Apr 2026 14:14:59 +0200
X-Gmail-Original-Message-ID: <CAMRc=MeXo33fUWXYEcPnFOYrvOtYiefnzX2T=9dMSkWvACG1_w@mail.gmail.com>
X-Gm-Features: AQROBzCbqPxinjPBciqvcLsM8rxaYut7ZHgdGSrDol8h8VZeoW9RT2MOt32rcnQ
Message-ID: <CAMRc=MeXo33fUWXYEcPnFOYrvOtYiefnzX2T=9dMSkWvACG1_w@mail.gmail.com>
Subject: Re: [PATCH libgpiod] build: replace autotools with meson & ninja
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Kent Gibson <warthog618@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Erik Wierich <erik@riscstar.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 9:39=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
>
> > -----Original Message-----
> > From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Sent: Wednesday, April 22, 2026 5:28 AM
> > To: Linus Walleij <linusw@kernel.org>; Vincent Fazio <vfazio@xes-inc.co=
m>;
> > Kent Gibson <warthog618@gmail.com>; Viresh Kumar
> > <viresh.kumar@linaro.org>; Erik Wierich <erik@riscstar.com>
> > Cc: Bartosz Golaszewski <brgl@kernel.org>; linux-gpio@vger.kernel.org;
> > Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Subject: [External] - [PATCH libgpiod] build: replace autotools with me=
son &
> > ninja
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
> While running testing, I did get a notice for a "deprecated" feature:
>
> NOTICE: Future-deprecated features used:
>   * 0.64.0: {'copy arg in configure_file'}
>
> https://mesonbuild.com/Release-notes-for-0-64-0.html#fscopyfile-to-replac=
e-configure_filecopy-true
>
> https://mesonbuild.com/Reference-manual_functions.html#configure_file
>
> Used here:
>
> bindings/python/gpiod/meson.build:  configure_file(input: f, output: f, c=
opy: true)
> bindings/python/tests/gpiosim/meson.build:  configure_file(input: f, outp=
ut: f, copy: true)
> bindings/python/tests/system/meson.build:  configure_file(input: f, outpu=
t: f, copy: true)
> bindings/python/tests/meson.build:  configure_file(input: f, output: f, c=
opy: true)
>
> This may be intentional, but figured I'd mention it just in case.
>
> -Vincent

Thanks, meson 1.7.0 from debian did not report it.

Bart
