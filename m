Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B2048124E
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 12:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340573; cv=pass; b=qVf+9OnjTBnQFSIjsE9LXBmNcSkseDn7H83RBBwsWXL+HmM6irzol1PAme0lc0hyLch84WiP6WeGeyoxik41A4HQgL4UNOyfZ4jNce51aQZJT9Jo5Il0hlIbLbVRed/AzjrZqQobXj+s4Is6eplaMLKX4yLuVKHvtsomC8axFp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340573; c=relaxed/simple;
	bh=xwK25Er/UyTdN8xX3u3ar9ULjVXabUcm1PASpwoLyi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RcOfwPaVkE0J939KNAiorTguhP1GLTLkcqSVb5Ors6F1xkfu1WKOAnP2+CEMVZZpAfqoog5NGmJM3YqcuUtvEW7Jw3aRk6hNDe4Z/W9YvQVdilTL79IONUtRJqDxPftQKllsazcn3xB4uCqczxjZezVI0muQo4PvlyNFBem/akw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAM68r6Q; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAM68r6Q"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a1f611461so52807566b.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 05:49:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790340570; cv=none;
        d=google.com; s=arc-20260327;
        b=YFD1dzXfM8JicF+di2dEGJ3RQ38r2QcuMPyOxQpFrQf9ooxhRqffdwCkKeIHx/95hk
         JcZWVp+NIGUZbc39dUI5IUGS0+2987fBHDL3ikpawBE9vDjJNqgso/e1zdpOAIas0447
         Dj+kXlyYSkjx8245hyVKXNPR2Cv08tJLK9qfDjRgp73T6vxBv4ZNIUu+4X8N2ypxxc1h
         /iIIye4UqSxGHZQ4FTNU/Oj/139SutPlMf8c+Yng5B8i12qmsVDxoRf3FH9/QZnuWOGl
         cE/h819eIvWPyEaTqbFjS4yvYaX3dt1auZVQZcmTPpoLCmcBYH56GbFDvWePyBJjMHqJ
         iz6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TtIS8EApTnblvzoeUBrwBUCbydvF8aeUGatUpWHCCRQ=;
        fh=QBTDnQexoCjFv8HSRKkNLSh/qEpFBFZXOcXlYsG9jd8=;
        b=YUsUqXeFbkK1EKpO61DAgI90iGJmag3lF3lFG30bgfmJ4YTJ4BhWpDbCK3UDU2SLWL
         4XWepXJsMgh8wrOg0ZvL/v+RzhFgl5ir2VE3vykjCgTzlJq3nBOe18+knd7H+mmp35Zw
         5/Ov5bpPChyiesloBtWUldUauVhnKWbW5wxN6N3Wz7MjTERGAEBrtHfn94kPRhyhF0DF
         8F2cxnNQJDb3/3j0A6QqCNU+zfwtUuTtfdcKhmRmY2LChsePLdazPqQaJVWDYKHujqxE
         Exh5wOlsyHzZmqKHEuC5gnflwFI0bvdhlUr5O0q3e4Edj9L1Xgyge9uAEdk+rzWylsBn
         hlUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790340570; x=1790945370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TtIS8EApTnblvzoeUBrwBUCbydvF8aeUGatUpWHCCRQ=;
        b=mAM68r6Qo6zTrbK5IrJhTyuUAOLpXwz//bpsm3QlH8JduNJNcv1WvqqexWjmsys5Jw
         FSAPUdLkYLe3ehyWlTmu4cybygdC41G+2K/9AolkFab+TucXJHiSmolmhJk8cgQOhtGh
         u/ZrHdBsIcW1W2fNgfOaNrBS1C11oHw5XoczSj2e9bkM4Te8jp7Q90uaFvRUE0vaZsQW
         dHpQs7XNSkK2diNwlQLnoWff8jC9wAUeMiHq8oa2ZUakyjjY1WSgrcYWobsbCKt4VZxw
         WycS4DwQY910VOsl00YU0sFpVCgbdulsrRMWh/IBHWCEImYYmgtVLi26L1NgSv9oAPRQ
         9eEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340570; x=1790945370;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TtIS8EApTnblvzoeUBrwBUCbydvF8aeUGatUpWHCCRQ=;
        b=fd6Pk/QbZioyJLqxSE7CJQgrxzjTX4/brpQu5Rm4r3YPgDxjvvFlsVJg8i2oa6iFqH
         kkHkQmsdaG6MhVgG7ll2mmdtOjAAd7jNj1o5FlZL6dav3x6lFpHu5QAJ/lyqHZ4/UZFz
         4GWQjbnc93JRQQJk430Vgyone3GsFnPefBLT7MiVQXUbi1DasBZWek7Rr609pGyuGGfJ
         wBUMmFjmQ9dferUwm4igKKPanbqju4PQyqHyLokR0A2nlr4wmt3iWSh8k4w8KyPP0vxy
         rxcgEhifgZQfuMJOgdKsV9NriSqcMMQejQDYqST6rmu108PBj7Rnwy7U9291msU6r/ue
         XrkA==
X-Forwarded-Encrypted: i=1; AKwUvBwNOL8oiRt7SHAirpAKuwg9UV84G+zNRBNWNherNUvVnguaWB6sCCLJae2ietivbMlDj5PNQDqP7UpS@vger.kernel.org
X-Gm-Message-State: AFuF++nQ8ugwDv0G8zcxMC7+bsjyPIiXLc/Eq5XPzb8uRfqMsBDuDDzy
	NcItZMUw+LRQcjuPmFvB4vNKk0IFvpBi5V3aYNUbOb01My9F6vBEQ4jqm092xc5mCqHNjBby/Wm
	ZS6BWoL00dxRK2MdhFlGJSWr74O7CQ+4=
X-Gm-Gg: AYBFou1dChTCSsXfpnR1tar//fDyqt10GEzYf8RYcvfju4USZ5vCS3MLAEplrxLNzRJ
	cmRLQuSStEjsVuqcbHzV2DS2OIPy/BkRUUs/CE1gBaJqZEB3OZvxxmdxpxnjqyMnz9Y4tPvwdiV
	mJK1snKcNZiU3w2vW1FEsC7J7lHi+QAXZ3Hk/bBJT4EHwziaDRBLToo+TBMb2ZjrsXp0L4kK4tn
	B+uBThzbwqH1k5llAzDIrgN6V5lVUxFg7ZbvHlEr8gIM0RZsRioCWoOAq52m9QGfxGg6/c4H5WJ
	mXVM9iaNCjQSVN9wtkJUgui3HOzZcXH7zTPeFL0JKTbhi2fCLMiQZBO06f0i2PszCAo9mDJbmGs
	mvbLLzRlIw5Gq1AhaIM7Dl3kbA81/q1AtlWTogPVhvACEeCJWfUfGay6M6Ekolh+9dooeN9ODO+
	RmJitTuE8tKkZOel9tDMEVtCowJT06yf/ykEA0qasxg6ms6REQ+Zc=
X-Received: by 2002:a17:906:9fce:b0:c29:d0a8:79d3 with SMTP id
 a640c23a62f3a-c2ac2334081mr530795966b.14.1790340569589; Fri, 25 Sep 2026
 05:49:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
 <arZRZfa7AmDxmwoJ@ashevche-desk.local> <1299262d-a9f0-4f2d-8456-bb40a3078f95@kernel.org>
In-Reply-To: <1299262d-a9f0-4f2d-8456-bb40a3078f95@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 25 Sep 2026 15:48:53 +0300
X-Gm-Features: AclHuK_kA9pocaktebhafDtwbGAICjNyxWcnIMclsLHy5_vqYuNz5aHt90y2SE4
Message-ID: <CAHp75Ve4hCd-WVrNvdmSOiCo8j0jXBbnvOvxoFh7-Rj1ctnybQ@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Hans de Goede <hansg@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, 
	Lixu Zhang <lixu.zhang@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 2:42=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
> On 25-Sep-26 12:48, Andy Shevchenko wrote:
> > On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszewski wrote:

...

> >>  drivers/gpio/{ =3D> intel}/gpio-graniterapids.c   |  0
> >>  drivers/gpio/{ =3D> intel}/gpio-novalake-events.c |  0
> >
> > These are interesting drivers, not sure where to put them
> >
> >>  drivers/gpio/{ =3D> intel}/gpio-ljca.c            |  0
> >>  drivers/gpio/{ =3D> intel}/gpio-usbio.c           |  0
> >
> > These are definitely not going to intel subfolder, they have nothing to=
 do with
> > Intel HW, they are against some custom external (to Intel SoC) HW.
>
> Hmm, those "external" SoCs are only found on Intel IPU6/IPU7 laptops
> and come from camera designs for OEMs done by Intel's camera team.
>
> I don't care much either way, but for all intent and purposes these
> really are Intel USB GPIO expander drivers.

Fair enough, I can move them in a separate patch.

--=20
With Best Regards,
Andy Shevchenko
