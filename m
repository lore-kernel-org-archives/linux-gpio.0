Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209FB51118A
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 12:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686285; cv=none; b=B8KqFCSGSGw/e9K61jHO6Bqj8/0w3PGXphsY+x3uDhG27H/FDl4ysDj5N8bS0Q2eL5Ot1PIXEnckCCyvcqn/7CUA32hq1RrtaK5fbg6j3vb95tSnrpQq9zEyWZ3aCBU6x8712HuVTpUecPHRZQMAzs0QBKTqfHkpmovyhv50Qo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686285; c=relaxed/simple;
	bh=/Z8oCDWp5KVU2yQD9rHxb/RB5ienic3I5kcuA0RaQaE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNxe6cdFl6hnrCdmUNAVorZA7jokuTTk1/ArDCm6ily9OQd5+x4LZID93ou39k4uf/KkjCeQ7Uhs1c/5MiTbJh5EXogHMoV372tzeKbEt0zjRn6J/IOiOFKJNhYV7Pp74Hpf7nGaFQjwCL13i12K6jcFZfnTWq4VeZVlB6MsPnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CV0BpNH0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CV0BpNH0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8231F000FF
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 12:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790686283;
	bh=d7fpDvacXNw3GSyQhBFDyxZejtlU44278yWNlsl1WdQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=CV0BpNH0V6sP4HEVdt7xpdxIiN/5oNs7oZCFdHEe+GSPCjJCZGKtKd6EcGQOVyPmV
	 s57upnfhmPNJKkFpIPZmSOvxRRRm44PlveF/TUezCiMWIBY9EaiGSf8vwBOdycE248
	 1EB61+cY51azE5EO2/ZTChipE6vQeCS7GlBQg2LsM5NzDEpIVt47sWBj56I/7lDOb3
	 poEt6yr+eABOmYudwT4pIHG+Z4MRWnB+fvZ6YG3lB0T8DF9Wb1nTOFJbLsaFGsx0P7
	 6aI6yQf4Ke2pc9e2LAdxFc78D7ssldY/NOrLaSCq7QwWmkvORc9HQycm/Ve7OOAde9
	 UOtHRdebOyLGQ==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a49c068e85so30954761fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 05:51:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxW2gXfU/aUQfe3kY1a7uSqfMneGFlUDj9QCPETEHEuv98BsnNzvoz32SImeNlYVIf9SkvFOPbteM9l@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/XVTmmvjGghJ3Nyaq6qmfscfjYDGFauWFMJ1tOIAcnW/W7lTd
	b8MtihHRXXa7504eRCdXxf5WjWzOaDRjn3NexMg4kbpc2IN6EJBDtVyIc7ZZ9oUnIMqQA0gWpan
	/mDi8tsSKe1R2IVnP51mdNe41eXcIAibYEGn19KKCUQ==
X-Received: by 2002:a2e:bc1f:0:b0:3a6:5dec:8675 with SMTP id
 38308e7fff4ca-3a65dec899bmr24323391fa.18.1790686282504; Tue, 29 Sep 2026
 05:51:22 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 29 Sep 2026 12:51:21 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 29 Sep 2026 12:51:21 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAHp75VcqqsTSiyGxeZeNXHAVM2ujux26Nmc5C4CNJA-Fqxn5Kg@mail.gmail.com>
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
 <8fa77d7021ddf66f344c139d3bbeebcdb47ebfa8.camel@linux.intel.com> <CAHp75VcqqsTSiyGxeZeNXHAVM2ujux26Nmc5C4CNJA-Fqxn5Kg@mail.gmail.com>
Date: Tue, 29 Sep 2026 12:51:21 +0000
X-Gmail-Original-Message-ID: <CAMRc=McV2tpejQp_400B9u1ZJ9M4To2-uJYJp3D+XZzNeO+_jw@mail.gmail.com>
X-Gm-Features: AclHuK-FU8VWWrwBkRVBjtL5-IgfHkmi5D35P_WhV9CiaZttNyHXqrZxmqkWGfU
Message-ID: <CAMRc=McV2tpejQp_400B9u1ZJ9M4To2-uJYJp3D+XZzNeO+_jw@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, Hans de Goede <hansg@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 29 Sep 2026 14:45:59 +0200, Andy Shevchenko
<andy.shevchenko@gmail.com> said:
> On Tue, Sep 29, 2026 at 3:15=E2=80=AFPM Alan Borzeszkowski
> <alan.borzeszkowski@linux.intel.com> wrote:
>> On Mon, 2026-09-28 at 16:13 +0300, Andy Shevchenko wrote:
>> > On Mon, Sep 28, 2026 at 3:34=E2=80=AFPM Mika Westerberg
>> > <mika.westerberg@linux.intel.com> wrote:
>> > > On Mon, Sep 28, 2026 at 02:34:44PM +0300, Andy Shevchenko wrote:
>> > > > On Mon, Sep 28, 2026 at 2:13=E2=80=AFPM Bartosz Golaszewski
>> > > > <brgl@kernel.org> wrote:
>> > > > > On Sat, 26 Sep 2026 12:07:27 +0200, Mika Westerberg
>> > > > > <mika.westerberg@linux.intel.com> said:
>> > > > > > On Fri, Sep 25, 2026 at 05:34:53PM +0300, Andy Shevchenko
>> > > > > > wrote:
>> > > > > > > On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg
>> > > > > > > wrote:
>> > > > > > > > On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko
>> > > > > > > > wrote:
>> > > > > > > > > On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz
>> > > > > > > > > Golaszewski wrote:
>
> ...
>
>> > > > > > > > > >  drivers/gpio/{ =3D> intel}/gpio-graniterapids.c   |  =
0
>> > > > > > > > > >  drivers/gpio/{ =3D> intel}/gpio-novalake-events.c |  =
0
>> > > > > > > > >
>> > > > > > > > > These are interesting drivers, not sure where to put
>> > > > > > > > > them
>> > > > > > > >
>> > > > > > > > IMHO they should be there too. We are maintaining them
>> > > > > > > > both.
>> > > > > > >
>> > > > > > > Do you send PRs to Bart or you just rely on him to take the
>> > > > > > > patches?
>> > > > > >
>> > > > > > I don't expect these two drives to get too much attention,
>> > > > > > and they could
>> > > > > > be contained nicely inside intel folder and that would help
>> > > > > > Bart to
>> > > > > > identify that these are Intel drivers. So your bandwidth
>> > > > > > would not suffer
>> > > > > > even if these two are added there. Your call.
>> > > > >
>> > > > > I'd like to avoid a situation where we have Andy's Intel
>> > > > > drivers under
>> > > > > drivers/gpio/intel/ and other Intel drivers under
>> > > > > drivers/gpio/. I'd prefer
>> > > > > to move all of intel GPIO drivers into drivers/gpio/intel/ and
>> > > > > have Andy
>> > > > > gather changes to them if he agrees.
>> > > >
>> > > > Okay, we have two parts missing:
>> > > > - Nova Lake driver (I would need Alan or Mika to step in as at
>> > > > least a
>> > > > designated reviewer for that)
>> > >
>> > > I suggest Alan to be the reviewer if that's okay for him :)
>> >
>> > If he agrees, he can provide a patch on top of my series to move Nova
>> > Lake and add himself to the MAINTAINERS at the same time.
>>
>> I agree to be the reviewer. I have the patch ready, I can send once
>> your series is applied.
>
> Just send it now, in any case my series is blocked as I have not seen
> a consensus on what to do. Or do we? Bart, Sakari?
>

If I didn't make myself clear: I would love it if there was a single source
of intel GPIO pull-requests (most likely Andy) for *all* intel GPIO drivers
even if they have additional reviewers. I'd also love for them to live in
a single subdirectory at drivers/gpio/intel/. Otherwise, it's still chaos l=
ike
right now, just worse.

This is in line with pinctrl vendor directories. I also don't see a reason =
for
moving Kconfig options into their own vendor submenus if we keep the top-le=
vel
entries sorted by driver type.

Bart
