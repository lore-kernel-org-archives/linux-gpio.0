Received: from mail-ej2-f23.google.com (mail-ej2-f23.google.com [74.125.228.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A9F43A7FD
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 13:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.151
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601180; cv=pass; b=YdBg6QPyRArsygwFpB2sqjKVXQMAMw/J63YBF47NnzhC6x8v4fG0mQ1pdR5kz3g3g7shZCNt7FWqqbhzTOggwfrT63WZzAuLbBg03kEl0WNLHqxemWNc6ZwE9Li774ueOIMYusht7iLzEstlrRlaawCKl5SqhOq3NCA+F3quxCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601180; c=relaxed/simple;
	bh=TY+ThFmrQAsZNlvu7YOZWhJoc8nJAE/C5wpQs0phEYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E9q7A+2+fY1CcuuevcPxJN7d7wrOFy224Z7uTKQnouoaIqxiHaGLAYs/0OrfP8KO6arbO95khMk/Y+iv3us8jfuvTl+sqQTzmnvJHusgU8A13U1QuYyjSG7MmhaYVR5ssE1XStANpeOIGR9dFX+3yzf9M1uf8r/dj6GA9h4Z4dc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFoKVZb5; arc=pass smtp.client-ip=74.125.228.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFoKVZb5"
Received: by mail-ej2-f23.google.com with SMTP id a640c23a62f3a-c2db9cc3b45so197717266b.1
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 06:12:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790601176; cv=none;
        d=google.com; s=arc-20260327;
        b=nu96lBXXcHNBbCm3h78FS4luErTJOPoVsSiuqt04Nio+eKHLwOnt20pOddoPcF641y
         OCXaBOjbNk3NxbDWfKNAOOJwLISW6QZccbe9eIz8HRO6JU59awqLL0P7nOYDqq4YrHRg
         3nZ+mVFowZUjdLCSy6a2xE4aHPiqZv+qXY7PHStJUcIgFQ+Hgb4byYBw9yg5Ow651tuU
         gf9PzavrrRldmd4tO9NBkN45Gh8+vw0THDne+ptVsLk2wI6ib3kyaAg6HAD0sGzNa3ji
         1NNTrhpFx8QQr3t1e9qCihytEFVBAIlMhDtChzIjpkpugrEI7PdXgjd52PN5Sbi1Xve3
         LbHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rDASPrdfaubIXsRWgoMkCtVEaCp5Ede6IMXhIica92c=;
        fh=TucZ28uwidA0cMsNchpN6DcjF1kEpBgdtSXfXSkJ6jQ=;
        b=rSUwBzfJQNvdGSTl72l9dHCKwHxaeSSgi81aIoFNc7kMUKG3D+oxCrPISzV0lsvw5y
         CNfdfQLq1uYAfGMQ1SmxxTBq2D8BVzfHQ16bSLxhvpcPK7yUzS4aW6ZKyx6+uPOLzCpQ
         1C+Zci665dlJsGgfoIfRxIJYq/5YroR2AI/WESvm872AxebUVDIw5yfVJKEQOZpTKaNC
         S7u+sB++o6bUPCeWg7flrfzv8ISXBzRr+wrv5qOw+36LBvmNpd+LpNydEhjbA0CQh2st
         siQrHxZ1uGS68xjIYH0/JNf0Zp9zF/MGjoHZkCp/lgOCoq3Z9TvhwKdbxCr6mL+3zZg2
         rZnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790601176; x=1791205976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rDASPrdfaubIXsRWgoMkCtVEaCp5Ede6IMXhIica92c=;
        b=bFoKVZb5SiEakBwou8iSQuv1E8tDT42VM7+9rP81L1PPziZA4AuB1JBN3qt7aNoyQF
         tgBqOtaMJ8b1kk7OZDMvIfKD4PmdTk1Lr7mgDwrWagUTd7Ztjq4SRqYSpFu6xDhvlEtD
         RN7ORZ0If7DdEKX3+JtyeoIiINCJavCiU8iAezEXsSHJ41eopMeyKrRXcvHoz75HBlUJ
         RqDE74+p0BozDbiGitggooqD1NVku7znnNUN2pHmNrbX3xz6e1N4xz1JORMa6MNtAp4P
         f4gS247HQMjLISiACIyJGkU8SUqcgi0jDwMia8dknjuaB4IyAAt2CSrjKtCC+QDKN0VP
         hIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601176; x=1791205976;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rDASPrdfaubIXsRWgoMkCtVEaCp5Ede6IMXhIica92c=;
        b=J0sQIDfWGaEC64H4s8IskttpHQ5SL4EVgzd7U5snC8IYIdEo3J+CLRyIuJXZs1Leiy
         iacVYWgYb+Pkp2qtjPKaQIol9zwiZh73UN46Oq725mdcpZec4T2RfvP/x2jLLgCkQ/uI
         qFoDjuhIhnRSAcodfLHNT1RvBP73fuHESuEUBjZQtWdWX/tOEKGhnxEa5EcXu2huuKmY
         u1GhWYXIsJXLhbtzKBAOAg2K7zBW0EiN0/K8LpnuZVvpsBuHer8dwT3emRjCP0ty4NAC
         T1QSoEzFZupB4xCTjljhgHcV9FeEe6lZBeSyg8jCZZaXLkce24ocyPl3UAWeKEdZLbuH
         +Drw==
X-Forwarded-Encrypted: i=1; AKwUvByj5WOWDaBwIO9GTxlfVHjAuEbbPkz2CLu71AaojqwRIl+REbL1z6vTRYMFpco0IPzQ1nDnXSmZhA6o@vger.kernel.org
X-Gm-Message-State: AFuF++niCgHgWICRN0cNswt3Rb3zU3i31qqg8YQVajM1Gv9Q4qUD4f0W
	bRix96mg4H8gBueV3WIZcxwWV1h0lWhEcDNZNhas8KYJtSVOGjHVCWUiX3iMGa/C7PtQKInhuIJ
	7RvTDY9VKe6rhXvQc23LiATDGfHhsOM8=
X-Gm-Gg: AYBFou3w62wVp3iUvHayaW9tjzC5y3x6+zD5uC7oHiURCckbwY+XctlBouOdwwVTu/i
	D/nVruzn1EgH+jsrgxplIEGhjQma7vCFg/INp9nvHUtVMq+gC6E54TE3sSrFgPAJkAAS2KRr2Pt
	R5VQBfwxotZLAMfi10OCg/qHyEi0hOBL5zXoJecmm4gr4cSLzq7tJcav9wI5VRWf/22bWdqnmlX
	H2RQW2r+Z3QwocMP1Gmm5ujXfAY5QbCTT5M+4IDOENkMvoK+BoUBbp/6mmjwG7ErKhQrmnnuhr7
	gn3yA+F06qJrdA7YpOVeXlPs38ijqNTkCBpPNN/Gche8i9ksRxzokWV+Z3Vp5s4vTP4HKrLR7uZ
	PKXZ5hZTbdq/MTYSkKJoW3Q5r1wBByM03RXjNjAbjCZtij2uw33awP9LbYFGJQIiIsh7caX4FBB
	cOHbuP39Li+335Y0FTxYTSE97Xooa9XrSc0aNMDza6
X-Received: by 2002:a17:907:1909:b0:c25:2c70:50ed with SMTP id
 a640c23a62f3a-c2ac241d7ebmr1055032066b.5.1790601176429; Mon, 28 Sep 2026
 06:12:56 -0700 (PDT)
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
 <CAHp75VcctaQpSpKbr8i+LPfE8Ukazyn8=KhwsSa+4sbhvQ=WVQ@mail.gmail.com> <CAMRc=McKAR7VadTYtTfU1kAHSRidj_AdhBbDh+2zNpFWhjA2mw@mail.gmail.com>
In-Reply-To: <CAMRc=McKAR7VadTYtTfU1kAHSRidj_AdhBbDh+2zNpFWhjA2mw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Sep 2026 16:12:18 +0300
X-Gm-Features: AclHuK9kaWFJSBjdPxIHqf-E6ip7w6ANRaAz8QcchZ0uEi2iA2EKPRa6rY_CF9Q
Message-ID: <CAHp75VdGwVf2pCXzmQoY5zvgSf0KsRH8hU9Qt45iZmEG0KMzCA@mail.gmail.com>
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

On Mon, Sep 28, 2026 at 3:25=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
> On Mon, 28 Sep 2026 13:34:44 +0200, Andy Shevchenko
> <andy.shevchenko@gmail.com> said:
> > On Mon, Sep 28, 2026 at 2:13=E2=80=AFPM Bartosz Golaszewski <brgl@kerne=
l.org> wrote:
> >> On Sat, 26 Sep 2026 12:07:27 +0200, Mika Westerberg
> >> <mika.westerberg@linux.intel.com> said:
> >> > On Fri, Sep 25, 2026 at 05:34:53PM +0300, Andy Shevchenko wrote:
> >> >> On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg wrote:
> >> >> > On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko wrote:
> >> >> > > On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszewski w=
rote:

...

> >> >> > > >  drivers/gpio/{ =3D> intel}/gpio-graniterapids.c   |  0
> >> >> > > >  drivers/gpio/{ =3D> intel}/gpio-novalake-events.c |  0
> >> >> > >
> >> >> > > These are interesting drivers, not sure where to put them
> >> >> >
> >> >> > IMHO they should be there too. We are maintaining them both.
> >> >>
> >> >> Do you send PRs to Bart or you just rely on him to take the patches=
?
> >> >
> >> > I don't expect these two drives to get too much attention, and they =
could
> >> > be contained nicely inside intel folder and that would help Bart to
> >> > identify that these are Intel drivers. So your bandwidth would not s=
uffer
> >> > even if these two are added there. Your call.
> >>
> >> I'd like to avoid a situation where we have Andy's Intel drivers under
> >> drivers/gpio/intel/ and other Intel drivers under drivers/gpio/. I'd p=
refer
> >> to move all of intel GPIO drivers into drivers/gpio/intel/ and have An=
dy
> >> gather changes to them if he agrees.
> >
> > Okay, we have two parts missing:
> > - Nova Lake driver (I would need Adam or Mika to step in as at least a
> > designated reviewer for that)
>
> Acked.
>
> > - USB IO (I think we need to agree which tree it will go through, my
> > bet that media tree is the best), for that we need Hans' consent
>
> So far the initial commit was picked up by Greg and the other two were
> signed-off by me with Acks from intel people.
>
> I'd do the same thing as for nova lake: Israel, Hans and Sakari as review=
ers
> and you queue the changes?

I'm fine with this route as well. Since Hans replied, this all depends
on Sakari's answer.

--=20
With Best Regards,
Andy Shevchenko
