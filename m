Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794301961;
	b=Sw96e38lg8uueGqgVL7eYKYNRt59NJek0vAoUvam2GTYiVIsxn9T5T45ITS96TgJipMz
	 /qIYCu7FdybPVjh1ZGmyD9VR2yYl4468X1TunPl+RauBvSEZDdG0zUzvO6vBEV3TGE+0g
	 5eZYGco9/SZVE1Vj7Vt8lXE/TduPb8ZyQb1HvTFPP+4wXoncqI8ieLSMU3uMo2uH2YRxk
	 bzRrUQxXIIiBsCvqrvzsx4CQVzGgmJdcZFb0QKA6QU6ZLCUJw0fsQWZaf3aFzxYhMN/41
	 RJFlMSP4KPs6MyxyT9ftee2ylrOYcjfnc01DLk6yso/j+BO9K8hk198BBqvL7113fdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CL+mYaY3tGDnGHrtpelaQSBbIHf49nURgXV9HJQUfY0=;
	b=0pjeT3ryu+qnGSumyy8bcxEFHLEXWC9aMcrzhB/0MdjILuqOhdyX5C9oUZ5dYG/Mokct
	 X8LbyDAaAsUdLAl2oMUUlZ26OilxVWjZ5vwEnVu2HS7NlEddR76Tc1yjcpjECOn70lnIo
	 3Vin1q5tl+YZ5Ek8nQlaYR0Vw4HQxXsrCGHKjN/jyebGOe0kQOs9JbhsaxNuZ5eeko3zA
	 lbvsYCLgSvqVOxYg8nqPzAFERo/F2z+73rvp2bADNatMc7RZLE3pmsAPTF7mfjpHwwQRZ
	 v/Zgq1QaiKy5EoXtVHXT/p7xDA8VfwVDHUy8ov7K0pTFPb25rCKa4xa8QghqAryMaSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zXKLOI63;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A79606A326
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7A79606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zXKLOI63
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b305312e4fso14479157b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 01:12:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794301960; cv=none;
        d=google.com; s=arc-20260327;
        b=Fdzo6B5fZ7yqAl99djB3KjJwKqaiU3GzmWfk+MomNttxIAA4ywPfcj6Bnc6dhGGPUf
         m4CckuyQXVI8NXjYcgmnIcjzhBBBZ4aVs0+KWnRxycETIFLs+0FVJ1qo2mZiqNwwipII
         fH66GAOOiU4te9pSECxvuA2T2x62cSW/z8nlKRxQbrPXAL6w5fEL6ZA1XViLtCZE3loE
         Ivan9bKyhzd6fvGYlmKi7ux3KcArzf6Ny0/2XhZsAnJdVFeSKq305+CYxPFDJ9SkJgu9
         w6CCBlD144r10RNHlwCbV1gnIi2+F6myO7xrW6/a8BX7KUqLXxza7fqpB0BLsMuFuBFW
         2GVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CL+mYaY3tGDnGHrtpelaQSBbIHf49nURgXV9HJQUfY0=;
        fh=sNz95JMR2gjY2kcwh/v0vOTzoNhzbhuokqdnT3jBv+Y=;
        b=VRwQr6kz/WIZU13eJwuQzLnLLHvbcsf3DDoxjtnadYm//rRIr4m/bXMoV36Xm0VaNi
         wyVPH5fhW3soezYXXs7EwYv/fa9zwbbbAw3vagUvQaoCFFwoQHWOuX8aX4hs5NKxw4Y/
         LmZIq0bOGx/oJ6MVltUzQWOjBxYpbSy8hjDDfnvxG+6n9aayrFWlxjHCnVjHYmNCyv54
         lWEeQ4Ji98GfLKUPDqk5/SkPbhN+pnyaBYmseVN3/ZGJBLJ6TQZgdICqothZZSmuY0dI
         bTWpDaNxj4tS7Pb8suWI3KJUllN31XvilzBfsLYdZ0D10Oc1tIl4TNCjaPjTT3w3qaBF
         mGdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794301960; x=1794906760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CL+mYaY3tGDnGHrtpelaQSBbIHf49nURgXV9HJQUfY0=;
        b=zXKLOI63QCscfYZHZY4+Myzicd3aopoC7ck6ONm/yWOwDd9HV1/45+T4CD9+NQGcTG
         SlNX7swBaKhRgHML4wPGgoeSBIi35vGBbJSSz4yimhH3cIFRhcjsbCyjb9Uu/ORVkgD6
         hsv+pqcRKb0uHQ/jo7P8JQs3ZK6hvlZjj1oof/XjmAN9/VfK/6x0zq58UrGVPVenk8Du
         3XU4RtAafPfiVRYCDA5qoTR7c7CTBlHqK+BsdQtwJe7rfa9Kr0DBbBdYZZ3bpmYeqIPY
         93hSDDNLGk1fNgdbjh4PX7UbjOYPTKMD1Lhw4NO63Yj/9bYTocSAjc6Wvo5ijvVNmQ+p
         jmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794301960; x=1794906760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CL+mYaY3tGDnGHrtpelaQSBbIHf49nURgXV9HJQUfY0=;
        b=sMQSo9ds8oQZn+MUhXbPLi5WG43SR+ftT7TnXNd9a+riaKzWPikw/TzJsql4Z6GYi/
         92mi7fA/z99RSEwUSGfVdu//QrRd/eZYTz/f99XFCBuZ+PEjbCwDSxzE60QkzCxQcJEa
         sQzBIbSalUD2VLysBABTyG01A2sU+9TKzbAKLAdsMnVFjtDs7PMqDj6zVmEZIcY8mFPs
         TR0J31yapBxq4hTjLTCIW7Gn0NRPC0VsOJnYEh3bbK6sGWigTMUFjswhSOXbadDDvX+Y
         6gbXXOuBekfhlCOI89GSSUSmQAv37CQleHWUPfmdjFVdNeKsbvqHqCZV0PepwOl7R5MF
         FfKg==
X-Forwarded-Encrypted: i=1; AL+hErH2QOby6fpHH/LWX+XiFA6qK/zGZJ6xjklaj1x41SptCwCeqHfmJ8gNj9gKSRkFZ88S0byLA2gb5175@vger.kernel.org
X-Gm-Message-State: APuU4Z/uyFam8GZs5VXNAV5bAyM1aCS80g/iWrqca+8i/PF9of7xvT/S
	NPenOChE1+WaaLH6WU71qo4SyQXsws+v7Hc24A93AxjqMMtlTUhONj/VM4Fkh76ApbPywUvVvhm
	P7gLtSgwo5ol5oen4bKWtE1+yiGClRHw=
X-Gm-Gg: AYBFou2E4ekzb7vHx+102N2OOV0wTaelCxDO9jTZ3Lpu7ykwieS68XGSHSNaHyQAE+4
	x3fYSNQi4yBwQ9xpe+BFyzS9IBhShdsTo55GhVdrlvckQ0aSvU3FamqHzklMDPtiIkXs6S0ZCoc
	g95WHhHz6zphKbKvwdPLIiKYpit2zneWzVS0sbxGv5zbduPfraOJ8Q6pgbHxxvSI3+7AsQ8Tq2r
	qZF+IA9GT4LgwxJVPeHIxR03PRDonqP8oaDAfHgZF1O7tcwv90yBDSGdO1a2Byi4UI4LlELIvmu
	msPSVQ7WWNv9glbnix18OwMP+bUeI8N1gfB2PbgFaZUoXB6rw6F7h5pkLTc8FTHp3qAb30B9twR
	oz2z/PFW3x0vHZFIQ/bpa9uHk1BwIOZfZ0bLWTvMxjjKlAlu32A7b32AWIqXctG6p90dC2i9doz
	YgdwGJ5F46wfV3BUTBJGIS3UlXqpraf4epnoMEkFlLPHCFvHj/fja9R23w+CDkoboqXF0S3qE71
	CsW3pLCydsMPpYfTlVKkEH+cKgDaR2RioaRpGenM4spLcEIH/fFJxlfPdly5HE=
X-Received: by 2002:a05:690c:1c:b0:8b0:a01e:2cc1 with SMTP id
 00721157ae682-8b392bd3a6bmr12222497b3.53.1794301959730; Tue, 10 Nov 2026
 01:12:39 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
 <20261104-fwnode-for-each-prop-v1-5-6e28fe1c72c4@oss.qualcomm.com>
 <auuhy40x1BMoW96-@ashevche-desk.local> <7sfr4ljlwbehal3or4dmy5jxbjz6ya2lf3dq3yptr54wym5tea@eqaexflmocih>
 <avICwdxyi-W1Y3PD@ashevche-desk.local> <ab73ez55exen3ew52svsxfinwsuatppdodu2e2zp6izjwwqwwu@2imxzxwclgtl>
In-Reply-To: <ab73ez55exen3ew52svsxfinwsuatppdodu2e2zp6izjwwqwwu@2imxzxwclgtl>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 10 Nov 2026 11:12:02 +0200
X-Gm-Features: AclHuK-j7UjC7_2X91Fl0h3tqgy10rRsGsXGtMX-1tGj0PKndsOn6ITWu7Xe30s
Message-ID: <CAHp75VcwiGHB73ny8iSvXeFdjbTKUpnXZPS5iD7NwaMcJ6q-7A@mail.gmail.com>
Subject: Re: [PATCH 5/9] of: property: implement the .property_get_names()
 fwnode operation
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:00=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
> On Mon, Nov 09, 2026 at 07:28:33PM +0200, Andy Shevchenko wrote:
> > On Mon, Nov 09, 2026 at 02:07:46PM +0100, Bartosz Golaszewski wrote:
> > > On Wed, Nov 04, 2026 at 11:21:15PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Nov 04, 2026 at 03:03:47PM +0100, Bartosz Golaszewski wrote=
:

...

> > > > > +               names[i] =3D kstrdup(prop->name, GFP_KERNEL);
> > > >
> > > > Can property be statically defined somewhere? We might want to also=
 optimize
> > > > these duplications with const variant (here or elsewhere, for fwnod=
e generic
> > > > path, I believe).
> > >
> > > Please rephrase because I'm not quite following what you're saying.
> >
> > Can prop->name come from something that is declared as
> >
> > static const ... foo =3D {
> >       ... .name =3D "bar";
> > };
>
> You can't know it for every instance of struct fwnode_handle, so the
> answer is: no.

I believe I misput my question. If there is any potential that *some*
of fwnodes use statically defined string literals for the property
name? If so, kstrdup_const() and friends may be a better choice here
to save some memory (which is getting more and more expensive these
days :-).

> PS: is there a way of using match_string() with non-const data?

Why? It's an input parameter, it returns an index. Whatever you
provide will be not modified.


--=20
With Best Regards,
Andy Shevchenko
