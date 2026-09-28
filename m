Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59D44F391D
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 17:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615167; cv=none; b=jzuwvPzCuyrveZhoPJfAEJW/BFlK5DMwCh8QVD6Oxi8AK/g7D9Wp+p/D1/vRHL0PQ7B+ScLxCOuoxb1dnj3ddf9ZcyyGoKgtVDbAgEl+Lgi2ILdFtSJVv8Od/UWMWq2/wUIE+sRkp5OksjclxwXEs9oZ5XDLd5UCVIlyDkdWHOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615167; c=relaxed/simple;
	bh=ZwQQ4PADsEkfGBnnofatDEEtUl52BWmnC7dPdvYhLag=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mnm+uY4PsLigIMToTuTUj5Y9qxkwgUxNM+X0tvyhfitXgraR2sVlvGFjkcHo1kn3rKPoE85BEiI7STj3bxKvbUPSwUszJEqXbbSzmIyCe7TuD5mGxS/Yu3thaR7pF8w+H9bNDLYFIwon6UkanvFTdKhYiMhtmTiYwidQbJK20tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gvtcx1So; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gvtcx1So"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA611F0089C
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 17:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790615166;
	bh=ZRX9axqjAUwF4WycBzgVU3t0vgEdtfe+eo8Q3cFoH7Y=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=gvtcx1Sorhhvb6qM6zz52/rGmfBjwY1lb8mQBhplRZVj666Oye9TZFg+dTZe4UPRj
	 vhu0/0RYdpeuIwmhzRYHAiqYygdkEqSAS2I6qAmaRKb5uWg0jOJazlTlP7nom0Jyqs
	 QtbLG40/6mH5hmckjl1DoqR25InMMFlQHUieNJ2rfbReqRqu611GzreUX5I3VdH/PT
	 956PeBYUpNxIX8ApbkKFzU1za9uqRqCsWZk5tvZgINa3DrzKrNWOWHs5QfQXjgB8F3
	 eokFvqVI0jwBae4ByhJJ1nsUprbmfsT1CFWgHPtTHWmY+8RaH4fMpXEnR7xUKxqvph
	 wqNFJrEoT1SAg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8f333dc2aso1668969e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 10:06:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByrs/eMkPqxcTjwSGZEr7ekBX1JLCi27ydq6MRGjhmDuIZTv/G4DI+3SLLMSpOwrUq9r3O/6RyZCXM/@vger.kernel.org
X-Gm-Message-State: AFq9FYKc+h6XJ0B1IjQFhu6V1M15MEa0VRmXH8UELJZ4BdfMzuTbieDr
	JkfKLjPNP6ZIabRmr02Za0MBWKeL/s8TRfHxZ2SH4vAS9ZZpxVvib7XJ5kIZ4ifwwqksNnhp9N2
	ZFBfhV0U7HiMARdCldKBdhLoruWZUappyztooYn2O2w==
X-Received: by 2002:ac2:51d4:0:b0:5b8:ef26:9308 with SMTP id
 2adb3069b0e04-5b8ef269320mr2895296e87.26.1790615164981; Mon, 28 Sep 2026
 10:06:04 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 10:06:03 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 10:06:03 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAHp75Vf=2nN1xX=2jB5nj8AO4VQSAcXBg+xFQe5qk_A+Z0Uq_w@mail.gmail.com>
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
 <CAMRc=McKAR7VadTYtTfU1kAHSRidj_AdhBbDh+2zNpFWhjA2mw@mail.gmail.com>
 <CAHp75VdGwVf2pCXzmQoY5zvgSf0KsRH8hU9Qt45iZmEG0KMzCA@mail.gmail.com>
 <CAMRc=Me_sAdbqLq6s9sQ+Ti2_CfE8uHbAVqhe=PPpu8kPGkn9g@mail.gmail.com> <CAHp75Vf=2nN1xX=2jB5nj8AO4VQSAcXBg+xFQe5qk_A+Z0Uq_w@mail.gmail.com>
Date: Mon, 28 Sep 2026 10:06:03 -0700
X-Gmail-Original-Message-ID: <CAMRc=McRXuoLrfDKW1FQRGPS4HB2VwTCm0hqmBrV+=3fazhK2g@mail.gmail.com>
X-Gm-Features: AclHuK8igD_j1w9A39H51G6QVMsOtdgVrRO-80kojDPgN9vn2-Rex9-X226m2Dk
Message-ID: <CAMRc=McRXuoLrfDKW1FQRGPS4HB2VwTCm0hqmBrV+=3fazhK2g@mail.gmail.com>
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

On Mon, 28 Sep 2026 17:12:23 +0200, Andy Shevchenko
<andy.shevchenko@gmail.com> said:
> On Mon, Sep 28, 2026 at 5:13=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
>>
>> On Mon, 28 Sep 2026 15:12:18 +0200, Andy Shevchenko
>> <andy.shevchenko@gmail.com> said:
>> > On Mon, Sep 28, 2026 at 3:25=E2=80=AFPM Bartosz Golaszewski <brgl@kern=
el.org> wrote:
>> >> On Mon, 28 Sep 2026 13:34:44 +0200, Andy Shevchenko
>> >> <andy.shevchenko@gmail.com> said:
>> >> > On Mon, Sep 28, 2026 at 2:13=E2=80=AFPM Bartosz Golaszewski <brgl@k=
ernel.org> wrote:
>> >> >> On Sat, 26 Sep 2026 12:07:27 +0200, Mika Westerberg
>> >> >> <mika.westerberg@linux.intel.com> said:
>> >> >> > On Fri, Sep 25, 2026 at 05:34:53PM +0300, Andy Shevchenko wrote:
>> >> >> >> On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg wrote=
:
>> >> >> >> > On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko wro=
te:
>> >> >> >> > > On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszews=
ki wrote:
>
> ...
>
>> >> >> >> > > >  drivers/gpio/{ =3D> intel}/gpio-graniterapids.c   |  0
>> >> >> >> > > >  drivers/gpio/{ =3D> intel}/gpio-novalake-events.c |  0
>> >> >> >> > >
>> >> >> >> > > These are interesting drivers, not sure where to put them
>> >> >> >> >
>> >> >> >> > IMHO they should be there too. We are maintaining them both.
>> >> >> >>
>> >> >> >> Do you send PRs to Bart or you just rely on him to take the pat=
ches?
>> >> >> >
>> >> >> > I don't expect these two drives to get too much attention, and t=
hey could
>> >> >> > be contained nicely inside intel folder and that would help Bart=
 to
>> >> >> > identify that these are Intel drivers. So your bandwidth would n=
ot suffer
>> >> >> > even if these two are added there. Your call.
>> >> >>
>> >> >> I'd like to avoid a situation where we have Andy's Intel drivers u=
nder
>> >> >> drivers/gpio/intel/ and other Intel drivers under drivers/gpio/. I=
'd prefer
>> >> >> to move all of intel GPIO drivers into drivers/gpio/intel/ and hav=
e Andy
>> >> >> gather changes to them if he agrees.
>> >> >
>> >> > Okay, we have two parts missing:
>> >> > - Nova Lake driver (I would need Adam or Mika to step in as at leas=
t a
>> >> > designated reviewer for that)
>> >>
>> >> Acked.
>> >>
>> >> > - USB IO (I think we need to agree which tree it will go through, m=
y
>> >> > bet that media tree is the best), for that we need Hans' consent
>> >>
>> >> So far the initial commit was picked up by Greg and the other two wer=
e
>> >> signed-off by me with Acks from intel people.
>> >>
>> >> I'd do the same thing as for nova lake: Israel, Hans and Sakari as re=
viewers
>> >> and you queue the changes?
>> >
>> > I'm fine with this route as well. Since Hans replied, this all depends
>> > on Sakari's answer.
>>
>> Does this include moving this driver under drivers/media/ as well?
>
> I didn't consider that. But if Sakari wants that as well, I won't object.
>

If it doesn't, it will just keep causing confusion.

Bart
