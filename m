Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C664052A6
	for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 19:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797907; cv=none; b=qVZFTk8DwWJCbHVT63nxq9fiyuPQoUR79xn9wgzN9/Wjk/ZEyx2jlxRiu9dMm5csRP887+fP5DgVHTCL/cxWAKG2S73aZ3iuy6X5I/+AOa5zkqZmhTEdjhKLpTNMYtuPxBkrQJ4MrbZmNznKhjc9yF39NZpGysR5l4rpkVWEmKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797907; c=relaxed/simple;
	bh=28vNH1Qx5CHEfufA2QMW/Kjb4DhEWirwiyOHH9Th4JM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ouuSNIEEB5kqF4/E/2mGwk8s42QKgNYWaO62UBueVDQR6tTxUHhVTr7iondriGnNQKACT121l0fdbWWXmiHF+eQSSw4u6I5tfdBex5OeO5fOyG/bB2KclQgMOwcaqz0W8LwDE6tdErWVWpOybL9P9tx3WIi32c2A0tIYLF7yg24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uyg7ne5I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uyg7ne5I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B831F008A2
	for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 19:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790797903;
	bh=28vNH1Qx5CHEfufA2QMW/Kjb4DhEWirwiyOHH9Th4JM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Uyg7ne5IYs5AOq0k1KlwLdqlbnly40msIFJTt211g8PE32k/GY4l3MQ/0ZqbeTdkV
	 E4z3OHRsHRTlEPquK+zRN3kkkEgexm5nxuMcAr7elNTA0SKiDFQ+aEfpnhdEBZ8UmV
	 jpip5OPojzh0iVs93gzAPUv4NUX9xgMst0ClNYxtaCwc/fRWxgFVtSrsO07cgLYnAv
	 C3GLpErMBoMDVTIMwViL2o6JRcPtD0i3O52awI4JXHh6tIlHw3tPwn59HphVm5MpQC
	 mrD5Qvh6N7GTMKWtTXuWHdo6X0LcmAQAou5AhwuQ/O9fXn86NOLdSyRTwegecQ3ezi
	 pH+mfUh06lVng==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1e428so1747557e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 12:51:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzagwEzRra+lgNHahMvx6EwOgCAvNNA6KgGI/kWlBqB3dHVzMqpcoJig6G4EU2/GEnh74p1UkMmaTVi@vger.kernel.org
X-Gm-Message-State: AFq9FYJelBp6tFaXMs6bhpxewlZ64oGA6bFGlgRbDx25+3Pe6tjYLBu8
	4Ld8/cKvQ+B3rpRV3mAbXFWnWKVb7avIoxS77sYqN3kwbgz2PySkxawYDvNkzyX9DA8ES/jC6s1
	8Pex/MZ30YA6O+XSMHyaWml4HZzmd1I9bARxGxnMQQw==
X-Received: by 2002:a05:6512:31d4:b0:5b8:f0cc:3774 with SMTP id
 2adb3069b0e04-5ba433b494fmr193369e87.9.1790797902425; Wed, 30 Sep 2026
 12:51:42 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 30 Sep 2026 22:51:40 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 30 Sep 2026 22:51:40 +0300
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <arzDYjM78QJYhbQS@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHp75VcctaQpSpKbr8i+LPfE8Ukazyn8=KhwsSa+4sbhvQ=WVQ@mail.gmail.com>
 <20260928123446.GH106095@black.igk.intel.com> <CAHp75VfxMwLMPDQr9f=3ea8Z+5zja=kT01o-fhkyrc-V1rh3Hg@mail.gmail.com>
 <8fa77d7021ddf66f344c139d3bbeebcdb47ebfa8.camel@linux.intel.com>
 <CAHp75VcqqsTSiyGxeZeNXHAVM2ujux26Nmc5C4CNJA-Fqxn5Kg@mail.gmail.com>
 <CAMRc=McV2tpejQp_400B9u1ZJ9M4To2-uJYJp3D+XZzNeO+_jw@mail.gmail.com>
 <CAHp75VejKaoUvCYnOErrk8AYy1dLDA-u8jZghZqi5rX6hSQY7A@mail.gmail.com>
 <CAMRc=MciOaDqMtY7nb7Zz=XZJpqUKrfiSTJGZyBzfFTw10OjXA@mail.gmail.com>
 <CAHp75VcpK-Kv2tfR+fAuTWE15b2j34M8X+_UEkBGz_V=QJPbEA@mail.gmail.com>
 <arwXRBDZI5ottKmL@kekkonen.localdomain> <arzDYjM78QJYhbQS@ashevche-desk.local>
Date: Wed, 30 Sep 2026 22:51:40 +0300
X-Gmail-Original-Message-ID: <CAMRc=Mf24zebQ8tykeODrSjqR2y7pbL8mPii3vRqsb4aTgrQXg@mail.gmail.com>
X-Gm-Features: AclHuK_dLdpT-UzucoTZVFeFT_yo_fxn8n0I_utbT08DBzcwrwnL6nMhXBbe2zg
Message-ID: <CAMRc=Mf24zebQ8tykeODrSjqR2y7pbL8mPii3vRqsb4aTgrQXg@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, Lixu Zhang <lixu.zhang@intel.com>, 
	Mika Westerberg <westeri@kernel.org>, Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Hans de Goede <hansg@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Sep 2026 10:08:02 +0200, Andy Shevchenko
<andriy.shevchenko@intel.com> said:
> On Tue, Sep 29, 2026 at 10:53:40PM +0300, Sakari Ailus wrote:
>> On Tue, Sep 29, 2026 at 06:09:20PM +0300, Andy Shevchenko wrote:
>> > On Tue, Sep 29, 2026 at 5:05=E2=80=AFPM Bartosz Golaszewski <brgl@kern=
el.org> wrote:
>> > > On Tue, Sep 29, 2026 at 3:31=E2=80=AFPM Andy Shevchenko
>> > > <andy.shevchenko@gmail.com> wrote:
>
> ...
>
>> > > > > > in any case my series is blocked as I have not seen
>> > > > > > a consensus on what to do. Or do we? Bart, Sakari?
>> > > > >
>> > > > > If I didn't make myself clear: I would love it if there was a si=
ngle source
>> > > > > of intel GPIO pull-requests (most likely Andy) for *all* intel G=
PIO drivers
>> > > > > even if they have additional reviewers. I'd also love for them t=
o live in
>> > > > > a single subdirectory at drivers/gpio/intel/. Otherwise, it's st=
ill chaos like
>> > > > > right now, just worse.
>> > > > >
>> > > > > This is in line with pinctrl vendor directories. I also don't se=
e a reason for
>> > > > > moving Kconfig options into their own vendor submenus if we keep=
 the top-level
>> > > > > entries sorted by driver type.
>> > > >
>> > > > So, as of now it doesn't seem like an agreement among all parties.=
 My
>> > > > opinion is that it's good to have PMIC be separated from the other
>> > > > code, although I don't know if the camera PMIC GPIO driver that is
>> > > > used with IPUx is good to go under the intel/pmic subfolder. I als=
o
>> > > > believe that camera related drivers are the best to be handled by =
the
>> > > > media tree (as it's done, exempli gratia, for int3472).
>> > > >
>> > > > At the end of the day you will have a single PR from me, but it wo=
n't
>> > > > include camera stuff unless Sakari agrees to send a PR to me (whic=
h I
>> > > > think won't be the case).
>>
>> That'd work, sure, but there are often dependencies between all three US=
BIO
>> related drivers (main, I=C2=B2C and GPIO) so they'll all go typically vi=
a usb
>> tree in that case. Having them all be merged via the media tree would
>> require more discussions.
>>
>> > > I thought we agreed usbio would be moved out of drivers/gpio/ and in=
to
>> > > media? That leaves intel/pmic as the only subdirectory IIUC.
>> >
>> > Hmm... I cited the int3472 MAINTAINERS record to point exactly on the
>> > variant where it's left under drivers/gpio. Also IIUC Hans' opinion is
>> > that GPIO drivers even being USB GPIO expanders for camera are still
>> > GPIOs.
>>
>> Indeed.
>
> So as I see now there is a consensus that
> 1) it's good to have Intel related GPIO drivers to be in 'intel' folder;
> 2) the USB GPIO drivers are still a GPIO and should reside under drivers/=
gpio/ (somewhere beneath that, subfolder or not).
>
> We do not have a consensus on:
> 1) PMIC separation to the 'intel/pmic' subfolder;
> 2) USB GPIO route for patches (with them still be somewhere under drivers=
/gpio/).
>

If they live under drivers/gpio/, then I want to route their patches though=
 the
GPIO tree, othrwise we're adding more confusion which is the opposite of th=
e
goal of this series. FWIW I'm fine with it.

> Unanswered question:
> 1) do we need to consider gpio-tps68470 (camera PMIC on Intel HW) as part=
 of
> 'intel/pmic' or even 'intel' in general? Currently the Intel HW is the on=
ly
> user of it.
>

If it's not intel hardware but just happens to be used exclusively on intel=
,
then sure: let's leave it under drivers/gpio/.

> P.S. It seems a big deal to move the drivers from one folder to another :=
-)
>

We're doing it to make it less confusing for me. If we do it wrong, I'll st=
ill
keep on picking up patches to the wrong drivers or ignoring the ones I shou=
ld
take. :)

Bart
