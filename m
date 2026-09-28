Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2335C547046
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 18:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618901; cv=pass; b=seXJVBxnrn1ZoXIEGNZqitMraECwThewVnKCiE9M5c1VKVGJBqXsOatV9wY4ePfRfxcOvW21MUnobL3pDN5WTo72YfnsudafA7EMIxXwj9mAwTiMMtD4nP0FMYvdy0a9qbhncz6OoSJrtLO5DOfkkjXoMZZIhIQnhJVbBItEZ5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618901; c=relaxed/simple;
	bh=mcRtwH4UlFrqEVpmX57yJTECpN3GPGqw+mx7gncmkyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uFwbT3B22qwohCj6zthBiAyXGXoHt1/3JfnjlIaJUoWaq0YPe+ReKhEaKA40Zx5SBLFlboQQBTy5dWuk0bAAYwg475MINTMMGa0Sm6i+PFD5ABCU4XT8ENIV7pTBzk2SqxUjrH9MrlNsLA4ae0w6b+WL1T7GnmacdFATe8mdxig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/MZVWL8; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/MZVWL8"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2dbbf409b8so290853466b.3
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 11:08:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790618898; cv=none;
        d=google.com; s=arc-20260327;
        b=e5pk3/uWntLu8aFkLte964lMnucq+oScOc6o93xph0L3P29PI7y9qVNdsfWxKnesWP
         iBF20EjDSFDoaFLIdkVnPEXAXXpwxh49+LyylG7xnDgxQojMWobpLZsyaYJ0aR7IfKD3
         SNXxy/1BfSuZ9yXnbb0ayAdQ75x4MWny+VDOhS8MRxanbOlSnaiv/dfylhB9mh1jzVgq
         vmNYNG6BjnPSKfXMtQSRYKwi/8E+nOWahMzR2cxYUxorKtN6dJBwiGTrO4Y5SkujKbza
         AdIhaVNli/LYOoD+owq7agFhmEvLMuJWtoiVq3P65lca56kiEMtj/L7YQUWRzmE3cEFp
         tO3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+V2ar5MRuC35hvkbrJE5OWPvTjqRTe6YcdztCtqkXTo=;
        fh=IUUrev+pURlDnQrkobRymZa8BQdauq0P1vUQ/CrYW24=;
        b=JJISMcOthtX7YJrgHlURlhf2Fa/etPurMBqF8SfImSSuMtNiTcvQFOh7aDqVo72s4/
         GAzmOsKpQzbCNjjFm+SSPxluk1VnX8dy4GXfVVAWkbq2YHGEWYuS8CKAj5RbgeXLSB+n
         vp2HOu3n9/WJVWrYiCAZHNU+3QH52YtYL4f/lKHzA2EK4Kd9SVlkzUdCk1swaUgpxMot
         7uML41aYT/Ikq8dvyZxcr5kQfaWa74GqugTr+OcB5x2RrDYu+Iis6VH0N8zLrdlD3iq6
         osfdtWYyk6uGNGIH003Q4LZvENeG09y6lriP1kJ7dmgpOf2v/9YjC6IDcJbhAh7gt3dk
         2aYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790618898; x=1791223698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+V2ar5MRuC35hvkbrJE5OWPvTjqRTe6YcdztCtqkXTo=;
        b=H/MZVWL8538RabLkhORczHMI87kKDJnc5YrbJCOrIpsFfV97gQ5bwFaek3Zg2+Y+Kp
         VeEPxzOBjygMZuWF6yvdvPjW1mHhkesFIxcpx2g35F8g21LHrJJwK6wMKogl1NPJ4RQR
         yZ0SX2SvL/Bi4DNnJrARN5gF9NgbGm5WM0CrLJggcigMGLLJHaM+Iz0V35eCQEW2Q6Q/
         H5/fTFQCcCg6JqgH13xsbTthDpCgmFt4YJAGVg5JIGJ/WTjgrKWW4lBZBBWlEiIZC/je
         Up6U18t06iXNjGhKWc+Ig16don71Ob8N+7GmHi+Zl9nG3/rU0ailKspp5MWzBGNzM4sB
         OC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618898; x=1791223698;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+V2ar5MRuC35hvkbrJE5OWPvTjqRTe6YcdztCtqkXTo=;
        b=0K/IVmZ2OTGYTJuV9TTqFsIgIxiz1NcRcY0aA0TM7pMz7/kgJQ723/McIdTHdJ4vgS
         /KzhPDoY3FoakMB92Pwp4IG1C7r3e5Kts0BhiH1qDssKiMqyM3hHYJl4pFgEgUTu33Ok
         tpCGtuCzleKr4iwBvO6MYeMtzK3NZjDxPADOT37CsP4JPE19SfA+2UvVf1kWFyIZkVRt
         jNEZw/WpV+5Q3OeqOfgp8eBCTJO/M9+OZtKd6LLc3jxSHHMTXsPNCY3ln6URL+iW0BAw
         Kfm2Sd7ilvy+IGACKxl8xTVPnhyKh86KM+keG40NUHkoI4JZU7Y1nFJsanI1hP4jD0G1
         GeEg==
X-Forwarded-Encrypted: i=1; AKwUvBxc6q/RTLYIxWEasItZnHStAXNfpEMT90YWFQVhQrFcqUGeoxwn8rZIm1ipxlxArgciH7ua8O4+92U/@vger.kernel.org
X-Gm-Message-State: AFuF++kbRY32U3IrF5YnpORVcmm4lqcUBKgj9NgZaeuS8uVQN8Yu/clX
	Bv6h9TWMjNkqFGw5k/tdD4g6R4fLcxbhp6RvGxILkTDf/uyt/JyJowvOclja0AHPtV7DusugTKG
	dIJm00K/8aSfklKtJ06ynQ0Lyklh/O3g=
X-Gm-Gg: AYBFou39jzym5jUacXeZCIpPhqsh6fn8bRQuuWX/Ytad+sl89Ma0FSUDHs9Ytn1nd0j
	3B3jBht5FzEllSuPkKXmsUkQtnpKAQol/RlXScz/Hq0nUhJYWobmg7XN2BRoPPZjieoDZfYoCHO
	oGvF5YPDA6s8EMsHorSJF7eaZ2cfkm57lUOte8B8XEaGKk+KwmWXClb6BkpoUnwc8lJ9kfoxa0T
	jdgD1Ezlipf5GVrt9oQbWNCqhRzGfTnunNSBQajaDhCYj0VePXGQf1MACVy99igat6sBdNP41iq
	2UVFBzn08bMICSJWwZPFXCeMQaa08SFI6HeINY3GQ42s8ZbgDFnyiPhrbEIV3yW7gbkKoXmM32p
	qoJWuN8qXqGsco0Wlgt3GGoaZr9nTmDbtv8UV1VlZwWTageOehp0qbYev0HraTfhAEXMg+NNAco
	K6G7idA8aAcnll3NGrWJKlFrEBYg44zH65GIFGZEiv
X-Received: by 2002:a17:906:6a14:b0:c2d:ca78:ea83 with SMTP id
 a640c23a62f3a-c2dca78ed66mr435466566b.38.1790618898070; Mon, 28 Sep 2026
 11:08:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925160913.1648565-1-andriy.shevchenko@linux.intel.com>
 <20260925160913.1648565-3-andriy.shevchenko@linux.intel.com> <CAMRc=McxxVyAN5gdbegcaUgk8sKRrEAeg+5Oqs11B5AtEM0-vw@mail.gmail.com>
In-Reply-To: <CAMRc=McxxVyAN5gdbegcaUgk8sKRrEAeg+5Oqs11B5AtEM0-vw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Sep 2026 21:07:41 +0300
X-Gm-Features: AclHuK-W1Uibv9PT8_q1X_FGeq16kfb9swrUsm2qhNpfUiRtMGKTa02TPGf2uVQ
Message-ID: <CAHp75Vc0QXteRFbiJ_OdJeTW8Mq3-2vCkbF0FNiuuM_LJ+71nA@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] gpio: Move Intel PMIC GPIO drivers to the
 dedicated subfolder
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Peter Tyser <ptyser@xes-inc.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, 
	William Breathitt Gray <wbg@kernel.org>, Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Hans de Goede <hansg@kernel.org>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Raag Jadav <raag.jadav@intel.com>, 
	Junjie Cao <junjie.cao@linux.dev>, Runyu Xiao <runyu.xiao@seu.edu.cn>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 8:10=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
> On Fri, 25 Sep 2026 17:57:04 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > For better maintenance and development experience, move
> > Intel PMIC GPIO drivers to the dedicated subfolder.

...

> >  MAINTAINERS                                   |  4 +--
> >  drivers/gpio/Kconfig                          | 26 ----------------
> >  drivers/gpio/Makefile                         |  2 --
> >  drivers/gpio/intel/Kconfig                    |  2 ++
> >  drivers/gpio/intel/Makefile                   |  2 ++
> >  drivers/gpio/intel/pmic/Kconfig               | 30 +++++++++++++++++++
> >  drivers/gpio/intel/pmic/Makefile              |  5 ++++
>
> This makes it a very fine-grained split, I'm not sure we really need this=
 big
> directory structure when - so far - we got along with all the drivers bei=
ng in
> the same directory?
>
> Look at drivers/pinctrl/intel - there's no such deep structure there.

These have a separate MAINTAINERS entry and not that common GPIO
drivers with the rest.

Basically the whole series follows the split that we have in the
MAINTAINERS already. One patch per group of the drivers / MAINTAINERS
record.

--=20
With Best Regards,
Andy Shevchenko
