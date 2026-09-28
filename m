Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA918489FB9
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 11:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594021; cv=none; b=JmlH/UzAlvZR8jM4S4uXWwOzTnmX1TA+mWfF4jOrdu3usTG1qK4/TMbMetCqyBfJfWsM0pQftAXwd1330+vKwrwABN9ZTtXXpZ1tTPuyq/XKGBeGn648s9Bqu1+gtkvNP4Fovjfv8DebPoxgUe+PfG5UGf4v5jjbfkh4auza3uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594021; c=relaxed/simple;
	bh=aJZPQ4edWA3lYZncuoWmG0yMYspHWYwYNv20v/qP7HY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDuJ09op1cSg/hOKDQ3HbW49jIKJDc9RdWHFcMff9fkwzsFNH6GFSob+Om+FYRMoY8EzETCtgEw8qB8eNKJYd94gc9dgjsrlaaBWyok3K9wXGdatsuw1tgMXJphv362TWF1oRPbK8XSAIiBdhWKD5jbsUz++5eBVLdsMbveduy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XbvN6hWt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XbvN6hWt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D311F00893
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 11:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790594020;
	bh=MIHe+XRPNgxt21DF1Wo59grNY4bnd1tV2cyDv5alb7M=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=XbvN6hWtq7Gc6Z2nSfExIXRWIJEuNkPnluPptsPt5vYaMsb1PibVuweoNDB0fdm+L
	 KEfRU/D0PcGyf1jpkgKWvzbtBBoNNe1LkO55cPEe9Hr3sKjAPIeMqoOwxGjjZbW+FW
	 1TCRBnUFPJkw2NmzEIKRADFH27TV9vZnQNu5mteGsD5pCH0Hi/BOWa0/WEddp/NLU4
	 wGAjNIkXxYaDcXWRDeX6Jlx4lRbJw+843iQNseVFVS7vjUV2iwmuj58IK6jlnpv1tn
	 LdhXPX5hJq9707rwynKcK7D9Cveb7c7USTK57gkJCmPTclMCo5nVNn2JdQoy0hhvBF
	 7UPsospz9ejSA==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a59fa3112cso23205111fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 04:13:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzUZma70Bj8y+351EhRODDTDARBPMC1idX7QFjchE5QX5lKk0WOzUINktl9GMTVA/3V19n5HjiG2d63@vger.kernel.org
X-Gm-Message-State: AFq9FYK7PXSTk9qRmFXM1TqfF3HfErUwAZEhk1YizLuDSn8dCFa5B7/u
	228TOOxxaNfu5Jjx702E2UlttRXQgAhrdIZzQp9otQWGOzU4aotumUN4R8ITpYPKODY9QV6vdmu
	62IvM4fEBAhxXMIrGicYLDu2LTORAtLTS8aENnP/vmQ==
X-Received: by 2002:a05:651c:211d:b0:3a6:687e:9cfa with SMTP id
 38308e7fff4ca-3a6687eaa09mr10595471fa.18.1790594019511; Mon, 28 Sep 2026
 04:13:39 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 07:13:37 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 07:13:37 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260926100727.GB106095@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
 <arZRZfa7AmDxmwoJ@ashevche-desk.local> <20260925125433.GY106095@black.igk.intel.com>
 <araGjQoaffMhDMLz@ashevche-desk.local> <20260926100727.GB106095@black.igk.intel.com>
Date: Mon, 28 Sep 2026 07:13:37 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mc-C4ptY5phhAkpq7DbE-+=G5h4XByYdj2Xx5sVS-vvrQ@mail.gmail.com>
X-Gm-Features: AclHuK_fRLM3I6TJlNKsPiv5TMy0l8-w-ThsibnU-y4aZY0oE73nB9SQryOtCsU
Message-ID: <CAMRc=Mc-C4ptY5phhAkpq7DbE-+=G5h4XByYdj2Xx5sVS-vvrQ@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, 
	Lixu Zhang <lixu.zhang@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, Hans de Goede <hansg@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Sep 2026 12:07:27 +0200, Mika Westerberg
<mika.westerberg@linux.intel.com> said:
> Hi,
>
> On Fri, Sep 25, 2026 at 05:34:53PM +0300, Andy Shevchenko wrote:
>> On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg wrote:
>> > On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko wrote:
>> > > On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszewski wrote:
>> > > > In order to avoid maintainer mistakes on patch ownership: move all the
>> > > > Intel drivers into their own dedicated directory under
>> > > > drivers/gpio/intel. Don't touch Kconfig options as we historically sort
>> > > > GPIO drivers by type, not by vendor.
>>
>> ...
>>
>> > > >  drivers/gpio/{ => intel}/gpio-graniterapids.c   |  0
>> > > >  drivers/gpio/{ => intel}/gpio-novalake-events.c |  0
>> > >
>> > > These are interesting drivers, not sure where to put them
>> >
>> > IMHO they should be there too. We are maintaining them both.
>>
>> Do you send PRs to Bart or you just rely on him to take the patches?
>
> I don't expect these two drives to get too much attention, and they could
> be contained nicely inside intel folder and that would help Bart to
> identify that these are Intel drivers. So your bandwidth would not suffer
> even if these two are added there. Your call.
>

I'd like to avoid a situation where we have Andy's Intel drivers under
drivers/gpio/intel/ and other Intel drivers under drivers/gpio/. I'd prefer
to move all of intel GPIO drivers into drivers/gpio/intel/ and have Andy
gather changes to them if he agrees.

Bart
