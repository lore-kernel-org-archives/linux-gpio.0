Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C29376466
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 18:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790619125; cv=pass; b=NCajV03wTAeMXZJCGA7X4laoZGbMJCMo2eRCKCQ/lLzKoEHgWT4Gk0dlgU6vAL6jujMVXnRTrwR0u8D/CfO7PFgVlPLs4uZ2IElqc4M2PjdWgh0sDTqhzsVxgmQ532ckep6nJBYUKAyiTyhcL6oAXx6FibPNIl++BalTHChzm5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790619125; c=relaxed/simple;
	bh=MgxnUD9L28eKWiXcCEz6WJpbWCvTj6fqFwYCGaeh1rU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cLDwqei5A0cHJ+SAw9/E9cNlYygNF12XmwZaVKskwGdJpFmgyBfMnI4qLGsOAgWKe2P0rruF0qadV3CVDowmy7ldR3dIyIt0uV2fsxK5ae0Sb24ELEws7C1mmSwy1MCItopgfBR7lpAN/r88LNtvcpFhRFqLDnGb9JmSK93pA94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmfG3bgM; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmfG3bgM"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6aae37d33cbso147245a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 11:12:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790619121; cv=none;
        d=google.com; s=arc-20260327;
        b=GPUB/QSPWZF0UIsG76XW4MPbphZhvcyof+6eXJ7GZv9Jy0t/7xRfzCSiwWbWigFf/O
         YfPGMeZ1P9NRygDRkuDmtwYm1TAHO7DfFrY3dQJpD2mNr/zzuY6Sk8PAuwv2Nn+BRoLB
         IHj7FaEIiquJtI/oH5g4O8NvORJJ4RRHwCGHe/lGPMAgon40AJnA++yek+DxUafSQIfV
         pp+KkY55UcN6uASU0SPRruvEuU+RCqGArmHRpMTUGnjxEPEzC5EaJ4RtkPxlRHeKZiPE
         7ZxBhHv/er3Pm81HpieFeVO5UjdghRVf74XSUNYzOQKWbX8l3ZAcuAwpfNGx3wqS/kGi
         6KZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8LNrgeaw36SYdp5eyTd2uXjfWYLmv/ZYBOuH0wQAoZA=;
        fh=xujG+qDYzFBkY04XYK2l4cFwMEuzkouyXaEPKyO5fP0=;
        b=P2ZUvC3qjxLxDeDUeNyJqR+snRJ/OTm5qU07eez0c1C2ClO/tc15Ll1aBBb3US/Mdr
         dbn7Yi1vlxoyMUq6fVJTz3I0G6SMlIsT9gr3mRpAMHqtcfHpeq+S0TUkc365iuV6SDI6
         xCOlWp8zzT05TLsI3Byrvw1Ic9QclgMieRfj3CaYq1dHJekTpH/TyDP3dXOsaAMsEz46
         EQ/8zQ+xZ8ioWuL+6Uc0qdDReC1EXzWOsNGxVpg9r1bmdMGDPx2MO8J3kdJ7BvwTEbFl
         I/RWhRtvh4OU+cwUeB++oZnnnSVHmectKaWLGaMf7WQAx3vOmEwhq8Ue5id/K70wTxli
         gQ2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790619121; x=1791223921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8LNrgeaw36SYdp5eyTd2uXjfWYLmv/ZYBOuH0wQAoZA=;
        b=EmfG3bgMUabek9LRu2d7NAjZxEJ8cir4gWf1t1UzfiF6KakEWR+1m0ibTaRNjduXO7
         2EanGdxVM/0VTw6DpV7vr1dU5YoT+oTH0fbOd8OLfFA8McwdCH4JEBUpvB4Tbwdi2hMV
         uP4+x8p4MqhimXkvl9kPIFIaFO9wXP5fKvbZgXg3wsKo5XsL80nQGaNwIzQF5AOqWF+z
         AbXeh+xo2zmWypN8RwEnY5fLQQfzmlj3OVxaOP5g0mB95nFWvpLODhFcF4mVfDIVh99D
         yL1ko99cun3Qu00MKCjIDdpVyc7X8r6whqu9ZCfHExcxnCoNkp22Y8wmrCItGdqv4Lju
         HlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790619121; x=1791223921;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8LNrgeaw36SYdp5eyTd2uXjfWYLmv/ZYBOuH0wQAoZA=;
        b=g0sTbMcI8mP2030p5gVX042GPbfZ08cUVDZZI2+q4o0CHIKbACjGTPPp0GvkaYSKed
         oXIoKQTlTjSHHJaFhJDQcJgsmMnGhEGLUlKHBDkTuOo9qlkN97Q/q1wLFs9MqwPwdnA+
         T/mU5hbN6T5XGTTF75ODXcAnJc6tS/y8zu3Ye/sfR536v6gTw9VMYFSNe+okh/Tl+Ook
         r77XEwEBmoRvAb78HE13BI7VgKeFg5XkIVJ8t8qChlAbu3Csyp5SzhgSVstu8wyeG4Ib
         WsyV90BoqsenpSbptx5RUuDsppyZQV6gv9qpk5WUNTuvRezMYueycIgXD3Vz4oWT506/
         Afsg==
X-Forwarded-Encrypted: i=1; AKwUvBylPYMoMxOsrHltklj0b2TFZvRBIfnA1VMfmxkQxwgGj/LQYDDEwWLwhvAliQ4otZeTKtrpe98mPuEI@vger.kernel.org
X-Gm-Message-State: AFuF++mMdkoBvV+lVtlPkysnsbd1YcM7JS3m+VIiSSmUnwXJzB5jzdIM
	NWdwACspWanYL3tWDluc/9q/Ar6NTPkiiesxF8AZ8yB42rBqfBt2eXR3tyvMZuO+knKy9wzyVpY
	7MerUj/1ioS3KNyOp+fP4fEh0J9E4HcE=
X-Gm-Gg: AYBFou1pu1dt4XQxfgscs3WA9B9slPkaySf4VWiO+OHJ7tuxcxb8KY+STUBWtrTOjDH
	/j2jzCTXdZ/MUZLFIau97AsD89q4YlmQkJPcPvX49lrD8lQeQuxpMlNe1Aea+vAQeGl/378Sg+5
	JFCJrOY4viujMWjx52H0DyHuqle0/8N2xpDRM9GYlpH3/rOKSAtf/UX5g6O3n5CYehhHVUjarRK
	VgN14YGv8M2V6uubZWIyqu0PUpnR4VeN4lwH2CIBok9qrGh9Re+TGtBVPSAeVc0AJ1etBzYsizL
	AgaocN4XQ4O9oiwmAtK0Q/idkNgrgMH/rV4xZV685rmiCP7gS6YsUU2gfFp022GUPgoUTc/HvmA
	fzz27TholU9P+wOv/VJlPlsklSBCZFFZ4SzcHS/Hf3rmhYM307HBlsZJYQi+deYRXI2yMIXLgIs
	uvI35soTbs37Q86hXJTrqD41RwKaNRSzfbqjy8eAUH
X-Received: by 2002:a17:907:3e21:b0:c25:833d:3839 with SMTP id
 a640c23a62f3a-c2df4d2fbe0mr5932066b.15.1790619120069; Mon, 28 Sep 2026
 11:12:00 -0700 (PDT)
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
 <CAMRc=Me_sAdbqLq6s9sQ+Ti2_CfE8uHbAVqhe=PPpu8kPGkn9g@mail.gmail.com>
 <CAHp75Vf=2nN1xX=2jB5nj8AO4VQSAcXBg+xFQe5qk_A+Z0Uq_w@mail.gmail.com> <CAMRc=McRXuoLrfDKW1FQRGPS4HB2VwTCm0hqmBrV+=3fazhK2g@mail.gmail.com>
In-Reply-To: <CAMRc=McRXuoLrfDKW1FQRGPS4HB2VwTCm0hqmBrV+=3fazhK2g@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Sep 2026 21:11:23 +0300
X-Gm-Features: AclHuK9Pv7EE_q2KoKqsQFvNL_eU2PA1i-v_gExEP36cFksyYbZboQ8qROlGcac
Message-ID: <CAHp75VcnNS6=3yEwu4VEKnmicu+fU=KfR1dy+wuHKdxaPDh73A@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, Hans de Goede <hansg@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 8:06=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
> On Mon, 28 Sep 2026 17:12:23 +0200, Andy Shevchenko
> <andy.shevchenko@gmail.com> said:
> > On Mon, Sep 28, 2026 at 5:13=E2=80=AFPM Bartosz Golaszewski <brgl@kerne=
l.org> wrote:
> >> On Mon, 28 Sep 2026 15:12:18 +0200, Andy Shevchenko
> >> <andy.shevchenko@gmail.com> said:
> >> > On Mon, Sep 28, 2026 at 3:25=E2=80=AFPM Bartosz Golaszewski <brgl@ke=
rnel.org> wrote:
> >> >> On Mon, 28 Sep 2026 13:34:44 +0200, Andy Shevchenko
> >> >> <andy.shevchenko@gmail.com> said:
> >> >> > On Mon, Sep 28, 2026 at 2:13=E2=80=AFPM Bartosz Golaszewski <brgl=
@kernel.org> wrote:
> >> >> >> On Sat, 26 Sep 2026 12:07:27 +0200, Mika Westerberg
> >> >> >> <mika.westerberg@linux.intel.com> said:
> >> >> >> > On Fri, Sep 25, 2026 at 05:34:53PM +0300, Andy Shevchenko wrot=
e:
> >> >> >> >> On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg wro=
te:
> >> >> >> >> > On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko w=
rote:
> >> >> >> >> > > On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golasze=
wski wrote:

...

> >> >> >> >> > > >  drivers/gpio/{ =3D> intel}/gpio-graniterapids.c   |  0
> >> >> >> >> > > >  drivers/gpio/{ =3D> intel}/gpio-novalake-events.c |  0
> >> >> >> >> > >
> >> >> >> >> > > These are interesting drivers, not sure where to put them
> >> >> >> >> >
> >> >> >> >> > IMHO they should be there too. We are maintaining them both=
.
> >> >> >> >>
> >> >> >> >> Do you send PRs to Bart or you just rely on him to take the p=
atches?
> >> >> >> >
> >> >> >> > I don't expect these two drives to get too much attention, and=
 they could
> >> >> >> > be contained nicely inside intel folder and that would help Ba=
rt to
> >> >> >> > identify that these are Intel drivers. So your bandwidth would=
 not suffer
> >> >> >> > even if these two are added there. Your call.
> >> >> >>
> >> >> >> I'd like to avoid a situation where we have Andy's Intel drivers=
 under
> >> >> >> drivers/gpio/intel/ and other Intel drivers under drivers/gpio/.=
 I'd prefer
> >> >> >> to move all of intel GPIO drivers into drivers/gpio/intel/ and h=
ave Andy
> >> >> >> gather changes to them if he agrees.
> >> >> >
> >> >> > Okay, we have two parts missing:
> >> >> > - Nova Lake driver (I would need Adam or Mika to step in as at le=
ast a
> >> >> > designated reviewer for that)
> >> >>
> >> >> Acked.
> >> >>
> >> >> > - USB IO (I think we need to agree which tree it will go through,=
 my
> >> >> > bet that media tree is the best), for that we need Hans' consent
> >> >>
> >> >> So far the initial commit was picked up by Greg and the other two w=
ere
> >> >> signed-off by me with Acks from intel people.
> >> >>
> >> >> I'd do the same thing as for nova lake: Israel, Hans and Sakari as =
reviewers
> >> >> and you queue the changes?
> >> >
> >> > I'm fine with this route as well. Since Hans replied, this all depen=
ds
> >> > on Sakari's answer.
> >>
> >> Does this include moving this driver under drivers/media/ as well?
> >
> > I didn't consider that. But if Sakari wants that as well, I won't objec=
t.
>
> If it doesn't, it will just keep causing confusion.

Would it be a problem? That's how int3472 is handled now:

INTEL SKYLAKE INT3472 ACPI DEVICE DRIVER
M:      Daniel Scally <dan.scally@ideasonboard.com>
M:      Sakari Ailus <sakari.ailus@linux.intel.com>
L:      linux-media@vger.kernel.org
S:      Maintained
T:      git git://linuxtv.org/media.git
F:      drivers/platform/x86/intel/int3472/
F:      include/linux/platform_data/x86/int3472.h

So these can be done the same way.

--=20
With Best Regards,
Andy Shevchenko
