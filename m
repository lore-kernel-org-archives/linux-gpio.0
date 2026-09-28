Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD9C41D125
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 13:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601082; cv=pass; b=d5+ZDuYwr5VIQqxmu8RRHERk6MO+a/dGAlk6GwA+SmwVJRjvcpXxZDDtm27ztqBwpBxLGkXbO0LVN5AbQvjaNfrCuD31WnL9hCErCKfeLbuiccgATtaA2OGJLQ2qzt3lGsmWxplFAIkjgUv5rA3TR9D7nmxeNlKqisV8Rq0ouEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601082; c=relaxed/simple;
	bh=o4r5F2fgvwBkN4M4LzHhDPy/9BpkJ+Qa5ATUM2N8jqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T5uEpCRPe0j8AX9SWTGj1ijg7csle1WblwMAcmMCjezOO7YYSAwJ5vz6K2EGIg+mjeuN9Q2d7YslRaGwud00Jt1zQC/CeSIAN56alSmCKn4IFP1ThyHqYrS7VxTFwLuBtvu+Nkw2U0BzK7nMGesF/EhnicQu9t7q2oaPdldqoGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kX8GLzED; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kX8GLzED"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2dbdcb4f59so241595366b.0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 06:11:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790601078; cv=none;
        d=google.com; s=arc-20260327;
        b=K4sr4pgtzSE4CDcS2XbcQ1klsdsyfSCNoKp65vLbX/PgC1PYDah0n2cH5XgFvGR77I
         wCtFf6XbL9CAK6Zj4WK+RZrOyQAppsB2vwbRHIhbMXK1int+Vj9y0k0wQXdzYYzpSrwT
         uR5B5/OToGr/hcdDjpHdMJXGSSncnHpQkmXjKQ3JzCcVUFKLA8wkX8SB98QWWd2ZwE2p
         DY3H/vWunhWhDMPycDWroANIaQ/5RgRc18uG6aBIWsNp/Q2EypO+CT2Dd8rw/UPT9BAQ
         gTbB80N8Yqf0a20cQ5V1VTw6Tj/LEILbaDX+SMDqmB043whecM/jh8X/CLT10ZqiMiGb
         Eyiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lQueGXrz4y0mf/YW0CKD4m4LFRs8gTKhhd/6y7bqJSs=;
        fh=EYeSQtvoXZherHkyPgj1oKJ2QJH1o1Uej2M3Gxue1zc=;
        b=r782jngIzRothGJvH0hdakkLhZM1FhGzvfIKgW4CE073bd8p9ehT4kh0yu5xpJXKr8
         qMLbRbtSCrbmh0Poflv8Y+BaQ+NhL+IHI1ALgtkWogBunBglYEU2GNv6aSZDfbaMaibM
         K1XPwuW2k6ccZz+OeGAoOpF9RotX0g9C0mdx/Bvw34HYOVEvBeDhdV76MBuzdRCcZx5o
         rRK0CMor6z2HeFIyBksLwhic5CF3DJJfi7pPAcbhcA8q5irFrqWoVOPHJo6U1URXcYKE
         srAgVYUqx2qfVu0Hq+k8VurQzdCYrtzuVvKgN+qt/2uD8r3G3PLyYliCSfIEe+H0hq9P
         Fjcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790601078; x=1791205878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lQueGXrz4y0mf/YW0CKD4m4LFRs8gTKhhd/6y7bqJSs=;
        b=kX8GLzEDtUZc8XKDp5fA5RcpnsJa+daZxGbuvKDGqD9c9vKHZWSKbDSr2NpZBwQIcW
         qSThZZmZYf+a6LRcJtmC6KDfoX4o+Jt0hZKQICy2TU2FRFyNRh399KjdnEbYdNk0ghjn
         h+AnHU4Al/qSUlP3YRiLGP9kbCElQw13Sb9lSi0gXtPJSaPXSh/ARN/7my0XTuudtw7V
         lf7v7I8LrXbaRkjBDVhAGFPLIzCE0RuNapBtHlISJXslLweFPg20fAWdPo61eXKS1lsy
         lmrpzeYLf27P/dKlNN/xGjuc+WuQSbLWoW0jW6rjuCZ4IM7C/XqLzjy2NTkRig/380U7
         D0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601078; x=1791205878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQueGXrz4y0mf/YW0CKD4m4LFRs8gTKhhd/6y7bqJSs=;
        b=HpePL9izhYtdc3lkn7b6NqhV4fpikkq+5YxExh6wau50Ap7FguwgOp1ZUqjiwGA2UF
         fdTn4xjbL+Odj6HXXRYk6mwiS0D0QUFH7tYarnMz32lyzO6QOyTJHnYdMqhyqJM/Ut1r
         U2IY8uP79nsIUHIfHMTzP9VPBztH4eHpKWYFBS2g/aHYU525nPeI2V7MbR3eTOu6j6V0
         x6rCoHq02TPt2RSiBujF9nTJMAAF6dbHldQTlZta9OzktZdawk3g9XAhAu6CtM/h5MMC
         jfRy+MrTJBbYajvDg6xkJ+OaKyPmBhCLgY2OZtqJHxYEkFKGta4px2yQrgQKQtjkJwnu
         9h8A==
X-Forwarded-Encrypted: i=1; AKwUvBy9i2GGcJusRj29x3wPR+1IWUyX8aPuXCVV18Y1K5mlypZN/w5aLyEXnsIE0OnQyUn5ySxzjGn+B9x6@vger.kernel.org
X-Gm-Message-State: AFuF++lplb+ZbuVe2TUWAk3BwTL//c9JjjkLT/eXraDgDHP/kljDl4WA
	45m1C5Zrx20ekLfv14b+UrUgSLzZZQkqAosfJgZ39gBWUCWnfQLACn+5M4p99O8O538UxpSXwLX
	rtwE1/pksYiObqiaceW4XD/t60O4xTh8=
X-Gm-Gg: AYBFou2e63Xs43XqNma2ZsXV0CP5z65R7UBukDMOKZLAAV3txBQARmWU6tyJrUPBVLt
	OZESptOVkHe+ugRv7zHdNyE5gm43w6YMWNQBeBm+BJVcDSyuuWPpeeTa0JLbqRARa1+ackWIK6F
	k4VLsTbJSDVs+fwzlMZInBZpOMAAaZm8n9Ul/ARrvkNFJpJShMx6fcXfDG+IS6DK4GQOF6VvtCP
	m1kx9ehXaryGE7Y89xhcAjS6pIG9EJ/F/11GW24Ci/ouLyie4W+QLHlJYYGF6hJNgNoNjabBRKf
	RncQqncZMaVUPtNMPGtLGXW4dbOmEB4APJgn663r+TPR0SRpdIQOzOrnEbHgmRhN4o7JVC6jAN3
	WPU+uHFL6LwNU/Fs1YPpLuOiI/sAZaYhnx+Y4mO4X8LP6N7kWfhH4baFSRy2PL01Mk/iCckJwDn
	Y/RPzUmsLGxASxI8+pCVCTmnb4Ir8ccZZL2bAnSbvy
X-Received: by 2002:a17:907:930d:b0:c2d:e067:275d with SMTP id
 a640c23a62f3a-c2de0674acamr162299266b.2.1790601078194; Mon, 28 Sep 2026
 06:11:18 -0700 (PDT)
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
 <CAHp75VcctaQpSpKbr8i+LPfE8Ukazyn8=KhwsSa+4sbhvQ=WVQ@mail.gmail.com> <50a29ae4-bae1-44be-9dbe-79a1147accf0@kernel.org>
In-Reply-To: <50a29ae4-bae1-44be-9dbe-79a1147accf0@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Sep 2026 16:10:41 +0300
X-Gm-Features: AclHuK9datk0SIrirqG4Wm6GEpBsJI2Z425EMVFQsLXPnhF6M-rCXvPDBPrj8CI
Message-ID: <CAHp75VeHupSXCBUyoUdPXY-GvBcupQ9kczhr-M3=WLkEzDKyvw@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Hans de Goede <hansg@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, Lixu Zhang <lixu.zhang@intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 3:35=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
> On 28-Sep-26 13:34, Andy Shevchenko wrote:
> > On Mon, Sep 28, 2026 at 2:13=E2=80=AFPM Bartosz Golaszewski <brgl@kerne=
l.org> wrote:
> >> On Sat, 26 Sep 2026 12:07:27 +0200, Mika Westerberg
> >> <mika.westerberg@linux.intel.com> said:
> >>> On Fri, Sep 25, 2026 at 05:34:53PM +0300, Andy Shevchenko wrote:
> >>>> On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg wrote:
> >>>>> On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko wrote:
> >>>>>> On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszewski wrot=
e:

...

> >>>>>>>  drivers/gpio/{ =3D> intel}/gpio-graniterapids.c   |  0
> >>>>>>>  drivers/gpio/{ =3D> intel}/gpio-novalake-events.c |  0
> >>>>>>
> >>>>>> These are interesting drivers, not sure where to put them
> >>>>>
> >>>>> IMHO they should be there too. We are maintaining them both.
> >>>>
> >>>> Do you send PRs to Bart or you just rely on him to take the patches?
> >>>
> >>> I don't expect these two drives to get too much attention, and they c=
ould
> >>> be contained nicely inside intel folder and that would help Bart to
> >>> identify that these are Intel drivers. So your bandwidth would not su=
ffer
> >>> even if these two are added there. Your call.
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
> > - USB IO (I think we need to agree which tree it will go through, my
> > bet that media tree is the best), for that we need Hans' consent
>
> Routing the USBIO / LCJA GPIO drivers to the media-tree, with
> Sakari likely doing the merging for both works for me.

Sure, Sakari, would it work for you?

> Now that I'm working for Qualcomm I don't have much time anymore
> for working on IPU6 / IPU7 related drivers.

--=20
With Best Regards,
Andy Shevchenko
