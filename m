Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794307951;
	b=yZVcODyfa12XlYWAIef+7r4WjzrZDp6qNuIvdlNNkIPTq2pLB+2ag4SvvHFSFBt8WmbI
	 ZyBqUdG6GLlWPLOe9zLZhAfcXq99OVyxIUIkmC8aGxhpFbX3wvJKm0KBBgLERZOJmsmyo
	 /zBJV5c+uAEH4cCWis+UaNjyp+dhahOQdWDnFDLw6fo5A2HwzQCOdZCA2QQSWcbPzlMsw
	 17sDleBBkufv22nRo+ATmthTqjzmToTVpRVNHwFdRsgig8uLB3Vk3k+/v+s12JKJ7N/qJ
	 uwjPPdEdkNDVFbhr8hTzBWp4oPYsA8eOLnby20XpN0NRGVwO/vbHnX/GuqwpIENZSNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hz1/GqxJfr5fovZK3WCpsTphS4Ees9ZlA9FefTtrxKA=;
	b=ttFkVOuoMzUTd9tobNlWb2GvoCJx/+e2sjNUfMEZUS7n7JG+BhwEiNw9AoV/gArrLAPG
	 JQ9WTHu9e8Wx+yMkF4lRDTn3U97/QDVj3mrOeXm9gOkpXvb88rlN+xWT44N8Tq3Nzaol6
	 7DVg+cHFAyrV+wPSQ4tXYoQsx4Tk/ww2W+P5DStPIC1sHSa4n2EGdbRWwVXC4ibPi+D6f
	 j685JwCTC9GEhaIrbOBPei/KIaWhbdgapW9CgAekEc9d3AM7TlV3MHGv+FfTpiX+de+90
	 W+N33dX48avhZ4s3VglqdK/3XqcbC3dgOggmZFyu/TApXdkU1+48E6o+Gc8Ffo1F6kA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G2yKUg4k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE6E606A32A
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 10:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EE6E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G2yKUg4k
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b308fca7c3so17389097b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 02:52:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794307950; cv=none;
        d=google.com; s=arc-20260327;
        b=C7lsSauGhyQ+M64He3sSHYTqD2lKkdQkZzn6ShrXLFF7ALPblCcyBRvK4RFMbukAuk
         q8/alsAFmujZOD0eTci+DbOFaB4r522u+Orla7kRc+WogVMgK5I33WuNUkKv4FX3un2d
         PdSusa8KkyDoA+KwM3bO4uhH8CbRSDTaOg3CIUzh1ZfIADhDuLnf5HpAq9OEW/LzZ0Rg
         dFeWmdyDao85z4GiSahMjVtqM7AcYjQ1rm29DXhH0P6miduPXqkiHq7Y6QG4UHA1wLui
         8aItoP8Kz4BDzrfkRrircl7Uk7Oiy0vw4BUy84Mk4XWE+dHRoXM4/5yQHl5qNnn2F3o5
         BYRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hz1/GqxJfr5fovZK3WCpsTphS4Ees9ZlA9FefTtrxKA=;
        fh=bh123Do66TNK/zz+4uYt8PKweX/wFN6rqw1crEzah5I=;
        b=dDKTFbOyXdrxoxhE+bCS/5/MfQLcMLFpszIPqbg9P2LHjPt1peGN41su5BD4/3SOCU
         /zLQptT4BbuzxItQU1TChd10xzPvA4utj9wjxKqzFBqGDqeyo3rW1h4oLEpso8IS553f
         q7s4Qu1r54Zr3AJbnBmlgC9yeD8uZJicty0N+Di0sVYNvpx1VWMSNxYPj4kwcui8WunW
         tnz8Bm48rN4l0u/ADD4tplvfcwFGQInl/zybxAgT/3o1i9YNl1d3PwmIX2nPQL23ThOJ
         EOjYMMy2zoSlaDkMd5lz0kTILV6GAoqSG3vEUSYt6nIEBEgMQqGgyEAYNm9xuqBfeQbT
         PwUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794307950; x=1794912750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hz1/GqxJfr5fovZK3WCpsTphS4Ees9ZlA9FefTtrxKA=;
        b=G2yKUg4kkkNyrAQLdA+svzeZn6bsiQXP/vEdrNCmE3xn8ePwe7ypVchrXLzPlmsfmW
         lzJ/znIv2TTl48zXBASM/vBEzAZQnZV3IFI5K7mcP1Sn/aQJmC0Q+3u8jnETQdK+OdKT
         UMrinFt0wmlR5B7U/Wi6+upm+BxqtF+PZgq6G7oUC/R/Rve1Wc3Qgg9fKoBY1jL0KR5y
         wgYtSJTLX2BHOwgJdKHSOoj+wx6LNeG9PNM34mQWbkp45RbZKXP4v4JWPrUO0bsZObJ2
         PjKKSQAC6V527ZMIejd5C4uGw2iRY5wETwfo5byFtMVf+095etPOYZnI4Z26jWNMjqMB
         xylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794307950; x=1794912750;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz1/GqxJfr5fovZK3WCpsTphS4Ees9ZlA9FefTtrxKA=;
        b=Oo9e/gZ2na4EJ4JhHAtRCf8SL2Ecj7GWxRurywKVL6I3X1a9lfFbBqYw7Hyhzpp/7W
         CaSK8MliCFVkZa/XgqaAmQ5fIpXpSFap6ywI2u0mbW2r4WmS0p5emFW6pG+BM5qaM6OU
         PNvlMgHB3twRmusGzMISkmZNzjJbFQaVndyaLmqZ/JogFtdiLuujiJf+UulUm5B41EP6
         rnECJVQuZxNUqzGMEq/kYXzUNiXIdWFKoQhbYKKB98LAZrllZV9t7Z3SCXfx6fhP+LMP
         9GhkflpAiy9dRQ9KiFp1PMi/O3kodG5NNtCfi+/BpLJjnr+2D1CTgFJgzNK5DwnnCEHK
         wjug==
X-Forwarded-Encrypted: i=1; AL+hErFTnOPEUQKpBKhPecUiES+kjv6M8+uvxdjJR2IEvoUhXADzFhQBpsWu1c9DLzqBfcN3lp9y4jQOuz9C@vger.kernel.org
X-Gm-Message-State: APuU4Z+8Ql4fB4RQuROQOsnXnjJzkQxXd9nNDi0lnp5IBcF9RLRfC0V6
	7bTYNPE3DGF7dLAcpniAV2QxyZx3NHvUVuFh+nBpMLBT/Tb8Q4pCeqI2b+eOqsvIFB51a7y36Pd
	rI3zu5A6tZlRtj62bAnLXDHVrPAd7ZDU=
X-Gm-Gg: AYBFou0iDL0HzlY0tULE2XYVaNfbzxmvR+oQuxtMkv2qVnps/Zc9ymHzSOHYNa3akZ5
	IOZ3dW/xHLXniqf0PJsd+NbArgvmiF21lVg0D2lRWtVCJwuu6louBRbgvw4Bkl7l7f50r6NaA+z
	49CZw6MdbvFtwc/8RFL5eyJ3r3SLRV0iAM19fXEy4sC8JX7lkXHkc24Y9yWG6QC80p3JkX48PzE
	BCSVhAN5zpLxV8IWTGmk/Gbloqczt/6bIUnJCTV/EbBjBVZcrGuAmwq0rKJGE8ZnyWi0LP0k5uh
	rZv/JGmTILOamxkmD+XEEuNP/bnME80hlIp2+SrfXGumiVNf34nYvz3Pj3mMV6iupcyQB2OYrVF
	fk3rhpVcoTajsDnnyuHAwOhp2OvfO5NA92sHzCL97/aW7iJOQdbw4JZg0dpuLfPy7vBTy4333V6
	d5/o5mKwqZs6r9VekczTxUNqq0Nu6sptIp2JLVZmMAVCQadzbJrYky/XUQXNWuR6nj1ZtfNmkzG
	/KndgzFvxintFuah13tiPZebU23NCO+INifuaMKrdzAK9wxKaGfI6bUyLfn9g==
X-Received: by 2002:a05:690c:4804:b0:8b3:4022:d81b with SMTP id
 00721157ae682-8b39281e93amr14763687b3.4.1794307950215; Tue, 10 Nov 2026
 02:52:30 -0800 (PST)
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
 <CAHp75VcwiGHB73ny8iSvXeFdjbTKUpnXZPS5iD7NwaMcJ6q-7A@mail.gmail.com> <l7ppjeoqvc6hblk52a6upei4ee2caahe2ltiur4gwig3ez7d3c@dmzzy22ixvlc>
In-Reply-To: <l7ppjeoqvc6hblk52a6upei4ee2caahe2ltiur4gwig3ez7d3c@dmzzy22ixvlc>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 10 Nov 2026 12:51:53 +0200
X-Gm-Features: AclHuK_OONOCVTyFsjjRyXe2igkmpzvumbiGAvSGjLyAIyl_gOSbE4gZk1U_Cc4
Message-ID: <CAHp75VdZpqt8PzVypQ85U1OjxszXOmCP9MKv3ozQOh-UVFnR-w@mail.gmail.com>
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

On Tue, Nov 10, 2026 at 11:50=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
> On Tue, Nov 10, 2026 at 11:12:02AM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 10, 2026 at 11:00=E2=80=AFAM Bartosz Golaszewski <brgl@kern=
el.org> wrote:
> > > On Mon, Nov 09, 2026 at 07:28:33PM +0200, Andy Shevchenko wrote:
> > > > On Mon, Nov 09, 2026 at 02:07:46PM +0100, Bartosz Golaszewski wrote=
:
> > > > > On Wed, Nov 04, 2026 at 11:21:15PM +0200, Andy Shevchenko wrote:
> > > > > > On Wed, Nov 04, 2026 at 03:03:47PM +0100, Bartosz Golaszewski w=
rote:

...

> > > PS: is there a way of using match_string() with non-const data?
> >
> > Why? It's an input parameter, it returns an index. Whatever you
> > provide will be not modified.


> What I mean is that the following change

> +               ret =3D match_string(merged, n1, sec_props.array[i]);
> +               if (ret >=3D n1) {
>                         merged[count++] =3D sec_props.array[i];
>                         sec_props.array[i] =3D NULL;
>                 }
>
> Results in:

> drivers/base/property.c: In function =E2=80=98fwnode_property_get_names=
=E2=80=99:
> drivers/base/property.c:607:36: error: passing argument 1 of =E2=80=98mat=
ch_string=E2=80=99 from incompatible pointer type [-Wincompatible-pointer-t=
ypes]

> And I don't see a good way of working around it without doing:
>
>         match_string((const char *const)merged, n1, sec_props.array[i]));
>
> which is ugly.

Ah, got it! But why is the "merges" char ** and not char * const *? I
believe that will fix the issue.

--=20
With Best Regards,
Andy Shevchenko
