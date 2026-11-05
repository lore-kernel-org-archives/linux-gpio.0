Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793889918;
	b=OQPQYLAlWPmnxQY1cDgQP6tJJ0kQrwiEfwnttuqCKtf8kiO9wqsqYHTEi6CYV8rRWx0B
	 c8/jNP3spnDkIOJ6gp+x5Dgb/qfirUQ8+JtoiNrVq4jeg9XgVCbmlOD8/INVTzaPUP3Uo
	 yWefBdnBHkeSqaSvfBhTKOxUWY0xa/YPSEbgQgFNzAJOwWZXoM6hWup4lA63h675/D8Qf
	 YB4q5kLw68L/gR3dzJwkujq2GGtUl64nRFhSkdIj4DnDPDSWY0VF6CP1u6xutfKPbAjNM
	 N2a0CvNUGZ6EQDsAxetu8zL7uE/vjhb9LnUje44HoSCKw8R/vXSbV764FlTX5wQEnyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889918;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=cD/za78aIZc354Wkm+PT+YZotcIG1wFBDSCEol0PFKM=;
	b=IZSM9VeMZvYuVMPoexL39PfiDSWyOmdrqgQ1F6i/9YXjQQrOoP3zyHl6Vjk/A09acx4X
	 yKNrg+1fv/mCGx3aY8vPMpBVUfCMr2nP6AUdvnpRjU5u0Iyh17dBpZdN3YwQtplpWf7oQ
	 xNyzlY8zCPBx4FnVfuFaVVQI2DDYJ1RQTE8BUSKXgHEpWUDFuMWyFxsoHh1TSDKOd9TgM
	 NbcKQ7xcF8hSV8dHJVVEld3bSSYOrkfeD592auIF/THHJazhICiuol7LWDwX/Diu71v2B
	 3zBP0UZKa0SpXe5amwbq7+/1ViizdfHm5V51WxG91HqFtnFWaxwaB/G7okoukuDfwFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VgKfGeZR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 2632F606A337;
	Thu,  5 Nov 2026 14:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VgKfGeZR
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id D47D81F0093A;
	Thu,  5 Nov 2026 14:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793889917;
	bh=cD/za78aIZc354Wkm+PT+YZotcIG1wFBDSCEol0PFKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VgKfGeZRUnarlENyG1YxF2ZXVQDrGsoFF8LUdG5v7UgFi7wNKyZIY1AgGvSZ/NbQS
	 flp30tInD+Z47xvVofiHJ7OgFJPtJWo1K7SdWulOHX6BBK1llbHFAibYDwvoqIAHLX
	 TR8ljetrF5uzCbMSevqWW80lFdyf8t3zinb1hOuZZ20B8/HEm/kVb6wIsNAI9TOfq6
	 n0cnTQacajyGcK10fA8XGVECaRcUOe+fE6xkJlJY4aW/mQTLoNT1gL++RvYKFlBRdS
	 FXnrBN4cpSFT7+Y3GCNZOXo7ICotShI1rDBjoevZrlaf2AjzQXDQPsb7O3dK3zKThP
	 vCUxXgWxgVaPw==
Date: Thu, 5 Nov 2026 15:45:13 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Raag Jadav <raag.jadav@intel.com>, 
	Junjie Cao <junjie.cao@linux.dev>, Runyu Xiao <runyu.xiao@seu.edu.cn>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Peng Fan <peng.fan@nxp.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Peter Tyser <ptyser@xes-inc.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, 
	William Breathitt Gray <wbg@kernel.org>, Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Hans de Goede <hansg@kernel.org>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v1 0/5] gpio: Move most of the Intel GPIO to the
 dedicated folder
Message-ID: <y5aamdx67etg7dgzwbjorb65qikacw2zsnjomkkklty63dya7f@iapehkxib3gs>
References: <20260925160913.1648565-1-andriy.shevchenko@linux.intel.com>
 <gxfngcnnkgkk5zrmsyrmqam6bk2ti2aflipwsutvce3dtgc7tv@nu3mmjfrt75u>
 <CAHp75Vdocfk5b7GkL21z4nKv4mNcGMF4Y_aZP_sPPeL16FrsdA@mail.gmail.com>
 <auyUFrrAYLobE_cy@ashevche-desk.local>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auyUFrrAYLobE_cy@ashevche-desk.local>

On Thu, Nov 05, 2026 at 04:35:02PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 02, 2026 at 10:48:42PM +0200, Andy Shevchenko wrote:
> > On Mon, Nov 2, 2026 at 5:33 PM Bartosz Golaszewski <brgl@kernel.org> wrote:
> > > On Fri, Sep 25, 2026 at 05:57:02PM +0200, Andy Shevchenko wrote:
> > > > For the easier maintenance and future development move most of Intel GPIO
> > > > drivers to the dedicated 'intel' folder. For now it only covers the drivers
> > > > I maintain (as per record in the MAINTAINERS).
> > >
> > > I wanted to apply this in order to see how the menuconfig looks like
> > > with it but it doesn't apply neither to next/master nor v7.4-rc1.
> > 
> > I will check this as soon as I can (currently I have something else to
> > address which is more urgent and it's not related to Linux at all).
> 
> Actually I can't do it right now as it will be a race with the incoming
> patches (for example, I see gpio-sodaville change in the mailing list).
> Can you tell me when it will be the time that
> 
> 1) your for-current is present in for-next (so no merging conflicts)
> 2) your for-next is closed for new patches for a few days?
> 
> Only with that I can achieve some good result, otherwise you will always
> tell me to rebase/resend and while I do this, there will be a chance of
> a new contribution that continues the loop.
> 
> TL;DR: I truly believe that the best timing for such a series is just
> after the -rc1 as a first batch against for-current *and* for-next
> (same piece assumed to go to -rc2). But of course, we may resolve
> the potential conflicts.
>

Can we do it during the next merge window? After I send my initial PR,
you rebase, resend, I queue it and send it to Linus in a subsequent PR?

Do you have a public branch in the meantime that I could play with?

Bart
