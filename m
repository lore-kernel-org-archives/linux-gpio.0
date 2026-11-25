Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795615147;
	b=ws1vGHLqvvqcdR3vwpnssdABE5norwYMbNIJ9dmUFOn3IEBB82HlA9s9qUBNXJRkaS0k
	 ZCRjQTsEqSpjn9RUO8jnvapLxcw/+4tOi3yFD0aNga4NsuE1RCJxhMVX1XaeAxOVGCo7W
	 XYj4XKeXkm7gcTA3CrjlmbmEXTvH0yo6KO4koKv8L01l1B2NPsSS//IboVQwpUQwNvFoY
	 f1K/OUmrU41MarX1CqOWmOpAeIUaiX0n3YSU0x45WC1wudqnvp1uvqrk2jTSl+atEamxR
	 QnmjncAojRTuTppklvddjlzLSpcYooTKQitlOHbBio7eC/2PyiDybySBgIbuFLDlRXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=09UPLto6axokpNWgG+6ModtbjIWY6madfxL1sFeVDTE=;
	b=2XUmccae56l8PwqAeMsYVZq8XW2JVYjmxgTgAa6O8UShBbNJWX09CO//m6+wgpbba123
	 5JUTWIdvkh0EsArVHM7noo72lPvLL0owscDULqEABtbWz7aE9Xtmy49dSWuHgox8zDEgB
	 j7Pr7NDBqrKSnmXdb4CNeok6reGWnqUpi9+8sPoQA8e83uK+ehuYqhE9upWYWyB2l8BZV
	 fv/c2bRDzSIvPosKoDtwATQEgye4b0jv5pvbXjIzLZvOEKPoBeT+/c6AKsWtJhM57kpBp
	 6s4qLHXTxWHNSkOXUAQ855fhJIBMR6ViEKL21tFbF+sDqGU1X3ilG2+53tVm3uau6jA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Wmyd/y0D";
	arc=fail smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15EE606A321
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 13:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C15EE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wmyd/y0D
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a42b34e930so5056466f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 05:59:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795615145; cv=none;
        d=google.com; s=arc-20260327;
        b=gXvB63kw77P1nMid+bmhPcC+OYNtx5Hg9h+2m7DemPVzXozTZnQNrXzwmrLN4eqRF8
         NBdT4CxlK2XL1FRtF1iAMAXoqak3HAeBDDvt9bIxEZQh0vhYqXcWnAANmw30HUI6zkDe
         kwepbJ1dkRn1cq7NcM7qmDcM1MOvZQQmIH8ToVgrghFnZQoe2qoDXFSzm6djOHAX/nmK
         QfWFAxeCEkUBBLdZ7RPuP8+RvKNIivOJyt9GQPPQ61pmPMIorCnilymc+7aLoFtiGbt7
         Lsb8B9+/5AWezImbZF8laz4IkxVg/nl3hD3cKObDNaO/d9u4GJF3fNhwOCu9xvfNp+66
         Fk+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=09UPLto6axokpNWgG+6ModtbjIWY6madfxL1sFeVDTE=;
        fh=mwx8ev4A68h0KzYYNcK/F9O52/UqvgpEuzaOfP0GQ0w=;
        b=m4aljyExIcIEeMHzlX/Q6SUdpP6M9uZ+iQkmcgwimxKXONd+VKAnaPlXiF56HTXCM4
         akESd2IFh8886vx8TTKRC/hA4tW+VKUC2vh8CKBRR+S/ZKfd29WrFGxT5NdR1HC77pxI
         BUSq8WACR88aZcAZ2cqAtbRyv85Bn7EIlhmnCaI49o5a01xtQx+A8YVBSyPYajTMkM6y
         UDRFJsXpfyV5kBndccIJ5JqdkQhA0RLKdr8ea2rwqKA/5NDGhrCEVgOAHA4ErP5ZkVKY
         JVgxxuzfdSvKrDd/5+8jsdWOKYISLuXW8IzqOxjSa76IaPab0VpgRlttCagPVdNpnHhS
         YxiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795615145; x=1796219945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=09UPLto6axokpNWgG+6ModtbjIWY6madfxL1sFeVDTE=;
        b=Wmyd/y0DLovIGl2bT8rvYbNpCaVeCRx2typ8roczSOcFM20V1I4zDlREol3Er0tywQ
         H1F/1d2u3M7q6LeZKpuKD93ZpSkLRFYCFYM3WP7GirEDjZg4gVCmXxsrmfM+AW3VB31y
         CHk5nBMwo07qh5XaomSLQ0R6Jb3+cpIjHHzIrTi7iN13sAxAeaITwl4sLDRec6fUKSbJ
         KjD40arUGqjhjl6OKB0Febh/m92Imc+nFIWXonuqenHf0ZpimJLflZrUJamOiBTza2vf
         Lrk1ow39lYiN08Jvhzckmvyt2dI1LVvJiwE5cBk29X0d8yRoPUtMltMynSkuDG+miYIk
         lMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795615145; x=1796219945;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09UPLto6axokpNWgG+6ModtbjIWY6madfxL1sFeVDTE=;
        b=lPjS/N5x9tlUMp2ocSERNzrQX45DxO8KgnNHeFyDcVchpKCg54Ohh8vPxqZoa9+alF
         haqJtGwVxbqJqgf+vGDvTchqhf8kn7ShawQMCzAazPIw0NcqcEiAzr47sguyfNcObV1A
         D+N4n6S9UQbdlPG3c5lpxMDmm4NNZ3RBB5m8nxwbHjTloNLqoRcBLaRb/942CA0brP1s
         CdQKPe3AcSRaTxyBkSxzgnOcuU16lsz2hHoE8wq8ChrZKwgQpu6Yl6Cz9eydYMMSguqh
         EaJWJHG6CDObVyFKAVIJaQSE3iHwyNtRGk4wJER/sWwLIzZR+BtgzwMs35yDP1ETQ4Oy
         xQNw==
X-Forwarded-Encrypted: i=1; AL+hErGqB0rJtgWPvWOFImcuuUQ3Ohn+bA+bQtrho8uB2XY8uQPB5FThLrT7877zWRLkv12mar/xy2L8+LX6@vger.kernel.org
X-Gm-Message-State: APuU4Z9gN2OM3m1YZ5s0qd7xZbh1EoOo3SBkoi0f184xek6tNrvQZBcS
	8bTkTdR/fXf3r1dvwoouDgWu7sMct5P+vNyEr0WeJbyOhviyBbxCQSXkqQhyy0Uh/YLTIkr2l0k
	Hz1HBkP4zKlVoIaOFK9D9nGhgKg2Q//M=
X-Gm-Gg: AZFdTZcMJesfXx3H4LifNF07WL1pNouf0iRxKLtXWVLZSjsxXHhpjuoS1X+KMYJqivc
	0y/E557Aja8cQI90IfVtrkTXQkOTf7AuyFGagKucQQB3BlYizKnQTQiMDC5HKjWYtGc78aEL05E
	GHMceVEIdXlQL7prkhN1JT4cq2bRnoBBp/IpyO++jA9bzwdesBdqpwXu0klhaUcQbBPGuCJL6Wd
	p9ksXTAyS/itRdsCjeJan17JkM/xqLo5S0NoG2cbbdk8JIwTVgf4IqFoD1RowF+kcK9b/t51xQm
	nZjFWMTkHEtKp5LztYbfZzHpKobUDe/fDcYqm8R30xH/dofGfecOTyxk52YM62+/h/PAhLOhOG6
	VqjLwETUBSmvo4G7EYPLT4Ne1PDKw5ipoyYUCuJs=
X-Received: by 2002:a05:6000:4014:b0:4b7:ae36:5493 with SMTP id
 ffacd0b85a97d-4b7ae36567emr11689293f8f.12.1795615145005; Wed, 25 Nov 2026
 05:59:05 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com>
 <awXJd59jTHM2bIlD@ashevche-desk.local> <awXKVXS0kIGnA0lD@ashevche-desk.local>
In-Reply-To: <awXKVXS0kIGnA0lD@ashevche-desk.local>
From: GaryWang <is0124@gmail.com>
Date: Wed, 25 Nov 2026 21:58:53 +0800
X-Gm-Features: Aa3M54psDnYYcIAEdsGV8up86M6nPP0lMFvOZv_SlI_4KubbZ_Jtr3McMresRDQ
Message-ID: <CANYHO6q7Cx1ah7cJMfyeu83v80VAFcx-2TQNNWM6kNSv0zB7pg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] upboard pinctrl support for device id INTC1055 &
 INTC1057 & INTC105E
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Thomas Richard <thomas.richard@bootlin.com>, 
	Daniele Cleri <danielecleri@aaeon.eu>, JunYingLai <junyinglai@aaeon.com.tw>, 
	Louis Chen <louischen@aaeon.com.tw>, BillyChou <BillyChou@aaeon.com.tw>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 1:34=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Nov 24, 2026 at 07:29:32PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 25, 2026 at 01:10:34AM +0800, Gary Wang wrote:
> > > Add missing groups and functions in Tigerlake & Alderlake & Meteorlak=
e
> > > for INTC1055 & INTC1057 & INTC105E.
> > > Add support "UP Xtreme ARL","UP Xtreme i14","UP Squared Pro 7000",
> > > "UP Squared i12","UP 7000".
> > > Fix pinmux-select set CPLD GPIO OUT not function mode for I2C pins
> > > on the AANT0F04.
> >
> > Make the above bullet points to be a regular English text which explain=
s
> > all this. It sounds like the second sentence should be first to start
> > with what is this and why. Also don't blindly copy what AI provides you=
,
> > edit the text that it's correctly split on the paragraphs and in each
> > paragraph use full line length (~72 characters). Each paragraph should
> > be separated with a blank line.
> >
> > This comment is related to all commit messages in this series.
Ok.
> >
> > > The pinctrl-upboard is provide additional driving power & pin mux fun=
ction
> > > through native SOC pins->FPGA/CPLD->hat pins for flexable board level
> > > applications. it's probe from ACPI device id AANT0F01 & AANT0F04.
>
> Also you ignored my comment about how this series is supposed to be appli=
ed.
> Intel pin control drivers are maintained by me. The rest by Linus. People
> won't go through the code to understand if there any compile-time and/or
> run-rime dependencies between parts.
>
There are no compile-time dependencies for each file.
All pin groups/functions data will forward to set default when pinctrl
upboard probe.
It shows an error when run time dependencies are not mapping to right
groups/functions.

> > > To: Mika Westerberg <mika.westerberg@linux.intel.com>
> >
> > No need to bother Mika, he is not maintaining this code anymore. :-(
Ok.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
