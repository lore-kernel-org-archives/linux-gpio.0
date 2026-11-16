Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829984;
	b=I6tZW4aGP4jrfc/nvCdb8F1I2EfBB5yudsZjIXo3b5coR5KNFt1vr4KvVlCZL2YF04H+
	 hQSzhgi2bIci42ZiTBl30wPeyAIkHhRydUpNmDu/xVpETeSn/Mnz9lTqsAc7DJjEQglZE
	 AVnhYsmqJ8RChvnjKQlbYyclensrgsg5TVr1Edz1OrAPf5yvcIYP8m22EKblBgaowzkUM
	 0daTVRNpG/6huWtIwD4LI5grGN/Oq3m6iNsDM4LPZSjgKHOd+Dmac7d0XUX451ZoCrI1u
	 7eKOQSHIDD/5smdmot+cqtZTSznmrU2JoXlKmj23rZIiYoU77PRhqs1MxtyaEYFLZfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pO7ejxuisYFiK67OM4MpgvsVQ7/7ICx6J2Ag4S25/oU=;
	b=jGnb4FPqiNa4wfagQrSORDjoC5QO0LhqDIqCNPh8V1hZhKqcXYs2kPUyaJsiSZtJreKS
	 ikY86Nu/CjFIs86hhv1NdkWU7tc2OF1gBr6PtShECaH6WBW5lKjHfEoqmsKqlYztpvLrI
	 9gFCpcqe8nECG7n3iWRR347m+h6ABaCeK+i1ZobuIFk9ItdjxWNfK+tjk4TnrHlj3ctmv
	 sYtSdDhSQucdMlS83vVYeis09TgYWI/vzAz2YdP2LwDhKw6oGffWQHdfkKBpCP3EdkUnz
	 GwGhMek/zDdu02S3CIBEPOZu61GdcsRulcv6uGiQC25QkIyP5UkjLFm2UZ7jR05V84A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="EQorfjr/";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F78B606A339
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 11:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F78B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EQorfjr/
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e10a70540so1815929f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 03:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794829983; x=1795434783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pO7ejxuisYFiK67OM4MpgvsVQ7/7ICx6J2Ag4S25/oU=;
        b=EQorfjr/le+xrt6rRx0aqewV5C/72AyI7slViP9I2mMqrY2frCMiC9eA2kU6PldTfe
         d2ppNxxBW57kub0UzJYDi2m1bmxBnaQkiv+DBn7m73b82wtWpXZge2XEBVq8Yj5BdyiG
         YuY+Hzn4cGfJDC2pvnbKrEDdfYWt2Z2iBDbH4ycXbvMHzeqt/2lqu3i70CUXVOK26kmu
         GVLINhavriOSnCa0I1E/mKgT9MiAv+t0eJFkLeN7vlyZTXhcdbFV3CpeBKR3d8JeJxZI
         3rV3PATeMttVTD4o/HvUX4HGKlhQviYoK1XMcV4K8Zc9LjGTSHhnLxeKxHdxvvktLTto
         fhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794829983; x=1795434783;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pO7ejxuisYFiK67OM4MpgvsVQ7/7ICx6J2Ag4S25/oU=;
        b=ts+TvOIfO4lKaKzGLDyscPlKxjnWO7imzRQ683bzkprvHb+zl28Qgiiem/ihdn2ivL
         95ZCTEm5d9HGMhcbI1WhteY/Cqew0fLST9fRzDqBdp/46a/2d3ujyL+NxX1owWDcjost
         dMVEr0X86z9vKekY+Vy8epegEpj2EClNmxvNv7D7i2efuGx5N3Hwfx5aaBOtFMUT9JhA
         eZKbTsKKzYft1Nh4ZZvH09KMNgM0UYdIt5xMQtMIponvSppdqklA0yqGAQgwljIkEh63
         /rdJX5l74mJgPI+uIACV5w5L3PetZc42oO3/ev5EjZspdLHtf4FoMVdQMkNVrk20d6Ku
         1Zlw==
X-Forwarded-Encrypted: i=1; AL+hErGOL6fNzrw4elM/IKRa0Sj6n9ecrbZhfqT2qpcozMRfDwDTht/95nU9AaYDyHo73wWaMayJqKVF+A9Q@vger.kernel.org
X-Gm-Message-State: APuU4Z/CshFlN4Gn++4H6V7T1ib1rnBdOAUoavM3YWIuQ0Ur8gfx592U
	Aou/5x3kX7WL/6iJEIfA/pvm37jurCBMpKGFbd8RV1l3ns7WLrFJH5NK
X-Gm-Gg: AZFdTZeurJoPQOg0YVBCY/21gVkjZBGnWzPl71uFOJjbg0ITr2dl8iZVRoe6L8ytHHk
	IzU9Dyki4pAqcrx3orO+IjKPdF8XTF7F/Movw+tbtikXDNL1ustqFHGRG61qn2Gv4tm5wxmGTI4
	zEQiGZNF/asxaD3ZC2bCzzjr6eWoG9AWPXl5VlMQgpgvZ9cgtSxwFHIx3XwQvPVuSDiMvOKbeOs
	sbanSVjcUb1z1W13Bp4zpZrzqSMzGa8VkXr2q3EGk1rRYEjJ1pUGx1r+2d56Ay8nrfgVwMxDtbF
	p7Sy6quFAJLPv9sIiklDePx3wvwWJN4Zrqcd1fspWved5/8OSjdq8f0nUO2BSyFAA3AZtCg2al6
	RJbQfsUSubL0bFVxnClSSiQ/GjPkiTVvvhNtBbnCeZYQ1YwZ6AqXEGxDxdnKBRLBXG2uSwENtKE
	ZysiGH4v/gnS/Igr7CrUOpJEa6PpBiRBBnaKedJ2lxrpXf1yFxpUdE8kYOAywGv9cj7YcjhguVQ
	SXX7ZebGCqvBYfYS1vAfbrgEnLnEaY3wHbnTtyZM85foeUiGQ1nfmbuy5K730qTYJybYmUtahfB
	koOb4YMCzk91C3FLZwoP2XII0ObglMd0q0+otwiK7bbt0HgSc8susBN83bI8j+yWXw==
X-Received: by 2002:a05:6000:2c01:b0:499:1c0d:4568 with SMTP id ffacd0b85a97d-49c741b14a0mr24577066f8f.48.1794829982872;
        Mon, 16 Nov 2026 03:53:02 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5a32d336sm23686370f8f.0.2026.11.16.03.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:53:02 -0800 (PST)
Date: Mon, 16 Nov 2026 11:53:00 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Alejandro Colomar <alx+linux-hardening@kernel.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, linux-mips@linux-mips.org, Ralf Baechle
 <ralf@linux-mips.org>, Joe Perches <joe@perches.com>, Alejandro Colomar
 <alx@kernel.org>, linux-hardening@vger.kernel.org, Krzysztof Kozlowski
 <krzk@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Andreas Schwab
 <schwab@linux-m68k.org>, Andy Shevchenko <andy@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Daniel Scally <djrscally@gmail.com>, Danilo
 Krummrich <dakr@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Johan Hovold
 <johan@kernel.org>, Kees Cook <kees@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Linus Walleij
 <linusw@kernel.org>, Namhyung Kim <namhyung@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <zanussi@kernel.org>,
 linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: Off-by-one in arch/mips/bcm47xx/time.c (was: [PATCH v6 02/19]
 string: Add strprefix())
Message-ID: <20261116115300.544a33ec@pumpkin>
In-Reply-To: <avriaVSTl4jL0OEo@ashevche-desk.local>
References: <cover.1794667407.git.alx@kernel.org>
	<0eaa4ce73a2b164fd49e3a9f71244a2e3f45b7bb.1794667407.git.alx@kernel.org>
	<c113f651d1ce1b2d42ab9d0c59ae5a0cd17ddb6a.camel@perches.com>
	<avi54hgKgovNHfKy@devuan>
	<avriaVSTl4jL0OEo@ashevche-desk.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Nov 2026 13:00:57 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Sat, Nov 14, 2026 at 08:49:21PM +0100, Alejandro Colomar wrote:
> 
> [...]
> 
> > > And these are all candidates for converted uses to
> > > whatever is the function name or steq:
> > > 
> > > $ git grep -P '[^w]strncmp\s*\(\s*[\w\.\-\>\s]*,\s*\"\w*"\s*,\s*\d+\s*\)' -- '*.[ch]' | wc -l
> > > 946  
> > 
> > Looking at those, I've seen a bug in BCM47XX, introduced in 2224de9d152b
> > (2013-10-29; "MIPS: BCM47XX: Fix clock detection for BCM5354 with 200MHz
> >  clock").
> > 
> > Look at this line of code:
> > 
> > 	$ grep strncmp arch/mips/bcm47xx/time.c
> > 			if (len >= 0 && !strncmp(buf, "200", 4))
> > 
> > That strncmp(3) call is wrong, as it's really behaving as strcmp(3),
> > since the 4 is off-by-one.  I'd like to know what was the intention.
> > Was it meant to be !strncmp(buf, "200", 3)?  Or was it meant to be just
> > !strcmp(buf, "200")?  
> 
> When in doubts, preserve current behaviour over refactoring.
> 

That entire function is strange...

David
