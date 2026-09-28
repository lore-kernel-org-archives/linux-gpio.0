Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE149364E9E
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 12:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598332; cv=none; b=Ju+HLka5ioAvygG/HCHkZRc2n0UvEotOvkKyasch7TZDKhnSg7GzGsLd/DgH6RV07c/oGeXdmWem6XUcgwtmqNrHWiyaJo/oqwdsljDrv86cTw8jR4rBCx9ywREpD3XLx/oeTtH71Fs+SXTQAJ6es1GtoOYSAKVaaRWOeyuRRRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598332; c=relaxed/simple;
	bh=6KXZGDccTowOCe7DkoXI+G6EwSeuc8WeDO+k1A7RlLU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ww8dGfUNFehhz+15rU8TITzzlyv2QUvuHD1lbAjPC3N9hlRzbunF2Jep+41ULw+Bp1dZSed2ITBdyV7cie7e0RF1butBk2py+VnLLNptHPZPY7cfvBBWZl0Y13GW0T8HSrCncm2a10e6zWJNBxGBYM9TjWeM16lGgdaAF/SRjaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZEEAxfmK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZEEAxfmK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6846D1F0089D
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 12:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790598331;
	bh=m8U2j8WIZrZfe6A+5k74fV6Juf7eHbAPKW8okrtsfkM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ZEEAxfmKmox4ULUjFNp6w0mCYa+7X+5VCvfDNjnscgWJDhhMxcCJwl7TITWvO1faA
	 y03VRnhxMs3PnFb+g9AifDrPgGUWeoORZ/zAi77bBpYtIENsTM8I51kmbS66oURZ1c
	 NHErbYMLV7daSOSKRCwtw8Btzsqj/J2yg2m296B2uxXCN1fSgUjmKMzB9Tp/I4wJjx
	 BaoEFXuCmBEcCsCo/MNHO4dgNr5EPjZEa0iMaCLibitLktTmzxPRwd677GpuISfYNB
	 WlS4M5ZmgK6DFgGSHDrZ9kDlvagFFLECjDG9Irz+f6pp7w9p6UH/SoKjk4H1E3ckq1
	 HT/sXCHEBcqjQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8e6ec4dd4so2081455e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 05:25:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw184VxJkma2l2Ebrbv5ZWx3LUXohTBjpBf97G3s8+slcbCVV/RCVxWjpx5HF0mxe7K/LL3FaUx4ieU@vger.kernel.org
X-Gm-Message-State: AFq9FYLNDkRQzvjK2rYEXGu/I7j2R+m/1kADzsP5TnWBGp66zc0kJuab
	PLodDsgDfWj6rRs+d7E2FyoX2ohfN02C5FupCMwAS9eVooCMNB05sGfBBNkkRnb65kpi6QbVUEY
	U9jc01hPyfUiu+iqN6kfs++qzCQpY1YUhCiGVzLc0ww==
X-Received: by 2002:a05:6512:114e:b0:5b8:fa70:73f4 with SMTP id
 2adb3069b0e04-5b8fa708572mr1008765e87.4.1790598329898; Mon, 28 Sep 2026
 05:25:29 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 08:25:27 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 08:25:27 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAHp75VcctaQpSpKbr8i+LPfE8Ukazyn8=KhwsSa+4sbhvQ=WVQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
 <arZRZfa7AmDxmwoJ@ashevche-desk.local> <20260925125433.GY106095@black.igk.intel.com>
 <araGjQoaffMhDMLz@ashevche-desk.local> <20260926100727.GB106095@black.igk.intel.com>
 <CAMRc=Mc-C4ptY5phhAkpq7DbE-+=G5h4XByYdj2Xx5sVS-vvrQ@mail.gmail.com> <CAHp75VcctaQpSpKbr8i+LPfE8Ukazyn8=KhwsSa+4sbhvQ=WVQ@mail.gmail.com>
Date: Mon, 28 Sep 2026 08:25:27 -0400
X-Gmail-Original-Message-ID: <CAMRc=McKAR7VadTYtTfU1kAHSRidj_AdhBbDh+2zNpFWhjA2mw@mail.gmail.com>
X-Gm-Features: AclHuK8rJfLDVUbQ7IzhKPdQP1FMeS9jpT9w_nzciqR09r5LOk8iOd0fD19F3wA
Message-ID: <CAMRc=McKAR7VadTYtTfU1kAHSRidj_AdhBbDh+2zNpFWhjA2mw@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, Hans de Goede <hansg@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 28 Sep 2026 13:34:44 +0200, Andy Shevchenko
<andy.shevchenko@gmail.com> said:
> On Mon, Sep 28, 2026 at 2:13=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
>> On Sat, 26 Sep 2026 12:07:27 +0200, Mika Westerberg
>> <mika.westerberg@linux.intel.com> said:
>> > On Fri, Sep 25, 2026 at 05:34:53PM +0300, Andy Shevchenko wrote:
>> >> On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg wrote:
>> >> > On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko wrote:
>> >> > > On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszewski wro=
te:
>
> ...
>
>> >> > > >  drivers/gpio/{ =3D> intel}/gpio-graniterapids.c   |  0
>> >> > > >  drivers/gpio/{ =3D> intel}/gpio-novalake-events.c |  0
>> >> > >
>> >> > > These are interesting drivers, not sure where to put them
>> >> >
>> >> > IMHO they should be there too. We are maintaining them both.
>> >>
>> >> Do you send PRs to Bart or you just rely on him to take the patches?
>> >
>> > I don't expect these two drives to get too much attention, and they co=
uld
>> > be contained nicely inside intel folder and that would help Bart to
>> > identify that these are Intel drivers. So your bandwidth would not suf=
fer
>> > even if these two are added there. Your call.
>>
>> I'd like to avoid a situation where we have Andy's Intel drivers under
>> drivers/gpio/intel/ and other Intel drivers under drivers/gpio/. I'd pre=
fer
>> to move all of intel GPIO drivers into drivers/gpio/intel/ and have Andy
>> gather changes to them if he agrees.
>
> Okay, we have two parts missing:
> - Nova Lake driver (I would need Adam or Mika to step in as at least a
> designated reviewer for that)

Acked.

> - USB IO (I think we need to agree which tree it will go through, my
> bet that media tree is the best), for that we need Hans' consent
>

So far the initial commit was picked up by Greg and the other two were
signed-off by me with Acks from intel people.

I'd do the same thing as for nova lake: Israel, Hans and Sakari as reviewer=
s
and you queue the changes?

Bart
