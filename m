Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54127361940
	for <linux-gpio@vger.kernel.org>; Sat, 26 Sep 2026 16:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790441777; cv=pass; b=queuuMkkyPuBMZy7h9s5pdfnoi+Dq1ZyBPzBIuh+Pta/UDRT7+eOEQYKa3tqJKZrKT81TP6upqvNYX1uKYak3wz0kSBxh3kdutsoBbtzmRloZpuZJQU6iyUbjsvn5xY0jyoPwuPTxUqqn73PaFHxe5SnxfMr/G/p1FfjVccmo44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790441777; c=relaxed/simple;
	bh=BFLuuX4oE73MpHMuvzlTcQtgZLxzLskCRkVBezS9eyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fOuPpZ+YY91spKqQDXZU0BG/ZTz6smovwDH3ki3Nlvykh3vCTxzLM3CuFwdGa6CsbPkgNYjkf01TyLICXzcCnxJadAkNb5bCsu3lnAWnolMG/7ObQXiL83le55Z6pSZcvrUwLG7KU/TfbUUabHRndjdpGElkgnd5qZ3I/duz4Nc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWTgj+tf; arc=pass smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWTgj+tf"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aaea1cb2e4so1988956a12.2
        for <linux-gpio@vger.kernel.org>; Sat, 26 Sep 2026 09:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790441774; cv=none;
        d=google.com; s=arc-20260327;
        b=BSjGX68QgygUnzij9pizg779kUC/lAhnQgL2Q4pflHAApTsOnVqpu+R0WprDekeRYF
         MAOdUm7h53MHaBtAJHkDie0a+tcclIJClvQfba7ykf5dVYPnKsXu/a/EilUN3/o3csCO
         papsIdwhXV5xFc4+HQLYeZVRyMCJGj8u0bR9So3XUvhxRXKCNPDZrBgrW5UvEszt71WS
         YZkTgkWlGOm2PMY9HWBWaw7js3NHjUH9D4vOcNes58rSL7fM3+Q3D1R1T0Znn6HFag5T
         RYeSnsnV4wRVxn3O9tp6zxLNYuI69Q/Co91URR9R39BuVip9xYRqkdSmiX3oaryobWLM
         pQTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/jNPRD3oMVaVsh6veaw1NKnURjzIQQ+FNTYBf29LQZ0=;
        fh=ZrsZc1DtOln3JfTPuU0ssjXtjnEp72ed/bOmsluFe1c=;
        b=DAut/wfvfvwzOzFauVekqD2H0zScBqd1MWMxJP+4jiTpbfYxsTdawmcpoIbLxoMYs+
         OKxFzrMeRfKhJLD4k+++LUKqN+Ap1j1XSjtMa6FFKt/xn6tyiqGCf3gjsqJyGRes3f8u
         uxTbCgAa4wFZQ8hAxLhC61zqlMDIdJbrgKXU5TQxTWxD5UsYQ7CTMtO3EJSYOfScBrev
         5E122f/MnKQeDSF8/Yuaav7d35dhRPpxh/va42J3Yg+dpQMK5e6IorDt/RBhrXOEK23t
         q6STlf7y/qKA5DdfmdUr+zTI2xDBdz9HxyE7cM6kyplsiSTxIK5PSB52/Aj38q7ulcjV
         28ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790441774; x=1791046574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/jNPRD3oMVaVsh6veaw1NKnURjzIQQ+FNTYBf29LQZ0=;
        b=WWTgj+tfnSi0s6N5lHGiT/XRCdCfI3g0HaQu/G8o5aTo+Wc7GlINB9zMtywfVuOpjY
         uMPAp72AcPHc7adl5gWmtot8ylurOcNZhYHzFv/HEjFiR6jcGNUsYJqtW6ZNE4DjVMxZ
         TsqZgz3NG6sFN7Du9hwbgSmUQLslsSJddjafQVoJ2LuXiGuuXNuIElX3l5G46nU6wDgP
         GZicBk241AHgrOY+PcEvRbMSm8wCCm34ShgNoEEKDsf8D8quo6bBT8ZdAbs30WzRE0+o
         pcS9zMQiVc5OhPXde3BCTsQofBsaqcT8JYWfCCIYV2VB9BnrSYdoC2caXxdeVb3s8P+0
         5LnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790441774; x=1791046574;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/jNPRD3oMVaVsh6veaw1NKnURjzIQQ+FNTYBf29LQZ0=;
        b=kZd9ToFRi7vseXmmFzTQrcmPrqIH8b2Q9ba83WpYEwxgPZZLPlznJmktKfkloAnP4h
         jqqnRCqydVOSd4e9yR+IpRACr+ndgGvL+sWSY0/6NvC2t4s3zsOY+XcVHeCMAB3ar4D+
         sS7q48AEtZP2cH7hNG35P0mHA+RdePdDVJBeIU6x7Mf3xYjTmbx3UODGbMdEg0LQ+iyd
         7ZGpsYjW3YARd6XO2jsMakmo6lZf22UytobnJEiVKIadZjNOdDcZhDM+dk5YzovymPx1
         JDJFVSuuXfq9QYpD+bNvjToPIcetIdmbmqIRlm0iszLLmGrT6retsgGKdpizk/LCgHpN
         21Qw==
X-Forwarded-Encrypted: i=1; AKwUvBytBB4DYIsiHSLBbvNN32mz/nxuC4FaVn/PpOXzEZLQXDcoEYvAfSZEJec7slaATcyxoclufOOz+E0A@vger.kernel.org
X-Gm-Message-State: AFq9FYIhqGNmOz/WfA1VpajpUIqQd362erx7fCFxpCCH2dl+wBZOX06m
	IOudSh+Hy6vXpjNTMIx2IH+g1KYfxBradmaXN93K7E6d6s0pt3JsDVKW+k+t3gkEqn5sfF2MjD0
	0p10VVrLIxlc/WEEjBY+9IC9TwEyw/Vo=
X-Gm-Gg: AYBFou3/DtlZbsmE1ccroQnmTwCSlICXiO26B717LY7Hw9CAELickr9gPP7obrOiLy0
	2/n8MFr9ujQTXz+sgIYZAV2kqUKyzFeEzLXaTMKVPt0PJ4jo35iYq2W7eS8zwUF/AiH1Qi/h2N/
	qtJEf0v6T0g2n+ZpbFcOHU9Q6aFs1DhC2TCqjpuJZITHFvHDmfeNW6jGxdXkUZRBRTRM+CF60LI
	Z1Gim3LXatsRxpf5DJ05dnhHz8VCDGzxJdzgyZW+L09BAFAtVN3BpJfzScvVDbrYoqdqZdgX2s3
	XwDlcRZYdZBzIgUQu8QPCem0VpV5/mUkJzfL/0QDzf1s+eIP/2ttcDpOfYriLARYWZhBmCs57BV
	iYZBKw2WBXVZIZ+vNc7dPZz5/XSdkS+dFjfmhKz6q6ef22//heucJSrynjg/fKVlJHBEm/z7naW
	X1dPetx4uTYVP/wrMwfy0VjwlQR7sDMJUV55qm3izfArxfYbt7T4Q=
X-Received: by 2002:a17:907:e153:b0:c2a:c793:be00 with SMTP id
 a640c23a62f3a-c2ac793c83bmr563678266b.15.1790441774263; Sat, 26 Sep 2026
 09:56:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925160913.1648565-1-andriy.shevchenko@linux.intel.com>
 <20260925160913.1648565-2-andriy.shevchenko@linux.intel.com> <ardbPbkc5IyZWsZo@black.igk.intel.com>
In-Reply-To: <ardbPbkc5IyZWsZo@black.igk.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 26 Sep 2026 19:55:38 +0300
X-Gm-Features: AclHuK9n5gUoraVKhWUuGL_-FGzi6edyz4lY6gv-HdsfU8bjWPEV9o9jeXqIE0A
Message-ID: <CAHp75VdUHTZstgOWTGxyYua_PayNXnikgo=iM6kUCWjsTkqb8w@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] gpio: Move Intel GPIO drivers to the dedicated subfolder
To: Raag Jadav <raag.jadav@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Junjie Cao <junjie.cao@linux.dev>, 
	Runyu Xiao <runyu.xiao@seu.edu.cn>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Peng Fan <peng.fan@nxp.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, 
	William Breathitt Gray <wbg@kernel.org>, Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Hans de Goede <hansg@kernel.org>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 8:42=E2=80=AFAM Raag Jadav <raag.jadav@intel.com> w=
rote:
> On Fri, Sep 25, 2026 at 05:57:03PM +0200, Andy Shevchenko wrote:

...

> >  drivers/gpio/{ =3D> intel}/gpio-elkhartlake.c |  0
> >  drivers/gpio/{ =3D> intel}/gpio-merrifield.c  |  0
> >  drivers/gpio/{ =3D> intel}/gpio-tangier.c     |  0
> >  drivers/gpio/{ =3D> intel}/gpio-tangier.h     |  0
> >  9 files changed, 50 insertions(+), 38 deletions(-)
> >  create mode 100644 drivers/gpio/intel/Kconfig
> >  create mode 100644 drivers/gpio/intel/Makefile
> >  rename drivers/gpio/{ =3D> intel}/gpio-elkhartlake.c (100%)
> >  rename drivers/gpio/{ =3D> intel}/gpio-merrifield.c (100%)
> >  rename drivers/gpio/{ =3D> intel}/gpio-tangier.c (100%)
> >  rename drivers/gpio/{ =3D> intel}/gpio-tangier.h (100%)
>
> These are already in good hands but I'd like to be atleast informed
> about these. Although I'm not sure if it's worth a dedicated entry,
> so I'll leave it upto you.

The patch adding the respective entry to MAINTAINERS is welcome, if
you think it worth doing.

--=20
With Best Regards,
Andy Shevchenko
