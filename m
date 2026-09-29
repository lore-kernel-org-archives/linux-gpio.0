Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891CC524B03
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 14:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690748; cv=none; b=Nr56Gq2z3x4Ze8xY1nTFR4QjfvCz5yF/wpDwVL9ldqyzwWBpGlz09pJ2dMGiulBuR/5wbGgwCiT/iyUcFBVpgRDuhy16TR9BbFU4AwoGPHv8WEcy9XlvRGibJQaLGnWFQJ2083mAsp18hB9whlx9g+NEYtk/naFNi68gw+plZ+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690748; c=relaxed/simple;
	bh=VWqrz0PQBQafrnuUvM872YR0gmn76hR2P3X1h/x+F9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rXwcsrQpY/Q1WrQeiIZGn5F53EaApk8wuoDGhszsCzeath43o4zu9h/NM5IJWe14F0K+rlZppH54uxReN+vAI/ckRa+A2ZtVYNbcqbPXkf5tENsFv/rUDdlmPl5SFOv2A22NVkCLrL0JWioNwo9LHmT08z9gNH7pHLs3aurYXuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SfrhS//v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SfrhS//v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB96B1F0089D
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790690746;
	bh=VWqrz0PQBQafrnuUvM872YR0gmn76hR2P3X1h/x+F9Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SfrhS//vFDb/V72TazPP6qVZ/v6+2vTK2RXmFii+OJblfS+hdtKJuozAJEOpROlv7
	 6OAUNZgkoP4qzvS+oIFfh80wVrURoWzRUPGh64JCVPUObIixQlYstPfQ4YrT0OScdC
	 rLDkRssVBRwvVgzRkXAdOT5sIeHnooDrodJialZGtSBnzXWPUW8KbLEf9V2KCzi1zN
	 5jUcIBxTB71OT31QTysW3BPsa+pj5RDJLDtZWwPeZnpvL1hkx5VCP+tT2l6hIdSNDJ
	 lRWCSHMnCMQPg6p/ZMbkgjQmRVSdYlhJA5yKmfj2ROzfPq7eKSuVUzMIXS//5PKFEe
	 z7ZBfGYdtcuRA==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a49c068e85so31780951fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 07:05:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzRSqAPUr6FDrsfRxrDI9ToV9T5euRA6YSNNJvhWQfOy3+iDUDwGlL7YiNU63YQuBjQZHVMH0+cKBix@vger.kernel.org
X-Gm-Message-State: AFq9FYIbqYXBpm6YhNoYtn7sH+uF1wXBEzfoqCXU1ysrC1R9tb1msX9N
	Ug24ojMiUHsdZhXmyrDrvaGUDaSle7i2z2mnb6IMPX8rkOZ8O2laMxthtyeWjGWq+HIu/13pFZo
	BB9KGJDeNlrxIDH0NbgxK4bRpk2q4SuPj5Lx8hOxuZQ==
X-Received: by 2002:a2e:a590:0:b0:3a7:635c:d563 with SMTP id
 38308e7fff4ca-3a7635cd713mr10714931fa.26.1790690744454; Tue, 29 Sep 2026
 07:05:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
 <arZRZfa7AmDxmwoJ@ashevche-desk.local> <20260925125433.GY106095@black.igk.intel.com>
 <araGjQoaffMhDMLz@ashevche-desk.local> <20260926100727.GB106095@black.igk.intel.com>
 <CAMRc=Mc-C4ptY5phhAkpq7DbE-+=G5h4XByYdj2Xx5sVS-vvrQ@mail.gmail.com>
 <CAHp75VcctaQpSpKbr8i+LPfE8Ukazyn8=KhwsSa+4sbhvQ=WVQ@mail.gmail.com>
 <20260928123446.GH106095@black.igk.intel.com> <CAHp75VfxMwLMPDQr9f=3ea8Z+5zja=kT01o-fhkyrc-V1rh3Hg@mail.gmail.com>
 <8fa77d7021ddf66f344c139d3bbeebcdb47ebfa8.camel@linux.intel.com>
 <CAHp75VcqqsTSiyGxeZeNXHAVM2ujux26Nmc5C4CNJA-Fqxn5Kg@mail.gmail.com>
 <CAMRc=McV2tpejQp_400B9u1ZJ9M4To2-uJYJp3D+XZzNeO+_jw@mail.gmail.com> <CAHp75VejKaoUvCYnOErrk8AYy1dLDA-u8jZghZqi5rX6hSQY7A@mail.gmail.com>
In-Reply-To: <CAHp75VejKaoUvCYnOErrk8AYy1dLDA-u8jZghZqi5rX6hSQY7A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 29 Sep 2026 16:05:31 +0200
X-Gmail-Original-Message-ID: <CAMRc=MciOaDqMtY7nb7Zz=XZJpqUKrfiSTJGZyBzfFTw10OjXA@mail.gmail.com>
X-Gm-Features: AclHuK_bsMCOZtLrUWL95SwI-0lCshARGsgrcXW2Ask3cdoimum8AEXwpOm32xs
Message-ID: <CAMRc=MciOaDqMtY7nb7Zz=XZJpqUKrfiSTJGZyBzfFTw10OjXA@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, Hans de Goede <hansg@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 3:31=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> > >
> > > Just send it now, in any case my series is blocked as I have not seen
> > > a consensus on what to do. Or do we? Bart, Sakari?
> > >
> >
> > If I didn't make myself clear: I would love it if there was a single so=
urce
> > of intel GPIO pull-requests (most likely Andy) for *all* intel GPIO dri=
vers
> > even if they have additional reviewers. I'd also love for them to live =
in
> > a single subdirectory at drivers/gpio/intel/. Otherwise, it's still cha=
os like
> > right now, just worse.
> >
> > This is in line with pinctrl vendor directories. I also don't see a rea=
son for
> > moving Kconfig options into their own vendor submenus if we keep the to=
p-level
> > entries sorted by driver type.
>
> So, as of now it doesn't seem like an agreement among all parties. My
> opinion is that it's good to have PMIC be separated from the other
> code, although I don't know if the camera PMIC GPIO driver that is
> used with IPUx is good to go under the intel/pmic subfolder. I also
> believe that camera related drivers are the best to be handled by the
> media tree (as it's done, exempli gratia, for int3472).
>
> At the end of the day you will have a single PR from me, but it won't
> include camera stuff unless Sakari agrees to send a PR to me (which I
> think won't be the case).
>

I thought we agreed usbio would be moved out of drivers/gpio/ and into
media? That leaves intel/pmic as the only subdirectory IIUC.

Bart
