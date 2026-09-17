Received: from mta0.migadu.com (out-175.mta0.migadu.com [91.218.175.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED334A8FD3
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789637217; cv=none; b=HHMnZjmjNNczAzPP9/s2YaHkFCQPyqTOIC8pu73C4d3f9mtyBhZwAS3DMYGWXpQhIdISY+pMUzpTnyUomGGpI164gfO4iH92B6N5yWQDyN9XVs2BheXmi1NE11QdzQrjR441UNJl/JjOKjVQbLq1kSBtaAbXVJ38oPJBqlgM2S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789637217; c=relaxed/simple;
	bh=70fTPYZRskV8k02IZGAPyXa5Cwpj/pkH7yTrXohP0QM=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=EdYHvz5N9kydY3Myk8+I4Z/aj38k91XKaEd8nbK6QD9O6txkh6+oCx6cSs2kOtSqif2diNj3xPsO+d4ROg6NlazyNI8Tj7fWpLS7o/re7lUBKCuxwW20djOVLWtkj2fyGCMp+QN4npGqrhAMm1lIo22Xo43l8Znz5qlmvxwpRUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PM/mYwSU; arc=none smtp.client-ip=91.218.175.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PM/mYwSU"
X-Envelope-To: linux-gpio@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=70fTPYZRskV8k02IZGAPyXa5Cwpj/pkH7yTrXohP0QM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789637213; v=1; x=1790242013;
 b=PM/mYwSUvPjjTsoRTaQlR7dXR+tHoiAJj64yZNEtZK7xBfdUreR7IrS1ShO1f+D3zlqrwfZj
 FsTWY5Xhwjk1cTBCYDhbpmGczQ1ok8PepU2jb8kS6hqXhzvJEU9clI5vXHyc2xaUaysYcIs9RWk
 vbmiBbY6O8yxYM7I0LCviEuE=
X-Envelope-To: linux-gpio@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 440cec54e8648081;
	Thu, 17 Sep 2026 09:26:53 +0000
X-Mizu-Trace-ID: 440cec54e8648081
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 17 Sep 2026 09:26:52 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Frank Wunderlich" <frank.wunderlich@linux.dev>
Message-ID: <e4a859da5ab7f40d9de53dfe605d29f510d1f1f2@linux.dev>
TLS-Required: No
Subject: Re: gpio-hog names
To: "Linus Walleij" <linusw@kernel.org>
Cc: "Bartosz Golaszewski" <brgl@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <CAD++jL=KoKd4gLcyxuTTT904oR=EFeVkqQF-iD6qcc-GwQ39ug@mail.gmail.com>
References: <55267dce42a63e5210c34e49747f564f5cc0b0cf@linux.dev>
 <CAD++jL=KoKd4gLcyxuTTT904oR=EFeVkqQF-iD6qcc-GwQ39ug@mail.gmail.com>

Hi

Thanks Linux for your answer.

Am 16. September 2026 um 15:32 schrieb "Linus Walleij" <linusw@kernel.org=
>:

>=20
>=20On Sun, Sep 6, 2026 at 9:05 PM Frank Wunderlich
> <frank.wunderlich@linux.dev> wrote:
>=20
>=20>=20
>=20> Until v7.0, GPIO hogs inherited the DT node name
> >=20
>=20Where? In debugfs? /sys/kernel/debug/gpio?

yes, for me it is the preferred way to verify gpio-states...is there anot=
her way to see the
names (unit-name from dt) except dtc decompile (where i had to search the=
 gpio-number in hex)?

I only know gpioinfo, but here all gpio are "unnamed", also when line-nam=
e is set in the hog.

and for 63/79 i see only this with gpioinfo (without line-name):

        line  63:       unnamed                 output consumer=3D?
        line  79:       unnamed                 output consumer=3D?

with line-name it looks like this:

        line  63:       unnamed                 output consumer=3Dpcie3-c=
n14-hog
        line  79:       unnamed                 output consumer=3Dpcie2-c=
n15-hog


It looks like this shows only the line-names property on gpio-controller =
itself (have done
this on the pca9555 i2c-gpio) where it looks like this:

gpiochip1 - 16 lines:
        line   0:       "BKEY-A-PDN"            input
        line   1:       "BKEY-A-Vset"           input
        line   2:       "BKEY-B-PDN"            input
        line   3:       "BKEY-B-Vset"           input
        line   4:       "BKEY-C-PDN"            input
...

> >
> > when no line-name
> >  property was specified. This was implemented as a fallback in
> >  of_parse_own_gpio().
> >=20
>=20>  Commit d1d564ec4992 ("gpio: move hogs into GPIO core") moved hog p=
arsing
> >  into the GPIO core and removed this fallback.
> >=20
>=20>  Consequently, GPIO hogs without a line-name property are now displ=
ayed
> >  with a ? in /sys/kernel/debug/gpio.
> >=20
>=20It seems like so...

just an example on my r4pro (8x) with pcie2/3-hog


defined like this (mix with overlay - basedt only defines hog+gpio, overl=
ay output+name) [1]

	/* 1L0 0=3Dkey-b (CN15), 1=3Dkey-m (CN13) */
	pcie-2-hog {
		gpio-hog;
		gpios =3D <79 GPIO_ACTIVE_HIGH>;
		//defined in my local overlay
		output-low;
		line-name =3D "pcie2-cn15-hog";
	};

	/* 1L1 0=3Dkey-b (CN18), 1=3Dkey-m (CN14) */
	pcie-3-hog {
		gpio-hog;
		gpios =3D <63 GPIO_ACTIVE_HIGH>;
		//defined in my local overlay
		output-high;
		line-name =3D "pcie3-cn14-hog";
	};

root@bpi-r4:~# uname -a
Linux bpi-r4 7.0.0-bpi-r4-main #1 SMP PREEMPT Wed Apr 29 19:40:09 CEST 20=
26 aarch64 GNU/Linux
root@bpi-r4:~# cat /sys/kernel/debug/gpio=20
gpiochip0:=2084 GPIOs, parent: platform/1001f000.pinctrl, pinctrl_moore:
 gpio-0   (                    |tx-disable          ) in  lo=20
=20gpio-1   (                    |mod-def0            ) in  hi IRQ ACTIVE=
 LOW
 gpio-2   (                    |los                 ) in  hi IRQ=20
=20gpio-12  (                    |cd                  ) in  lo IRQ ACTIVE=
 LOW
 gpio-13  (                    |reset               ) in  hi IRQ ACTIVE L=
OW
 gpio-14  (                    |WPS                 ) in  hi IRQ ACTIVE L=
OW
 gpio-21  (                    |tx-disable          ) in  lo=20
=20gpio-63  (                    |pcie-3-hog          ) out hi=20
=20gpio-69  (                    |mod-def0            ) in  hi IRQ ACTIVE=
 LOW
 gpio-70  (                    |los                 ) in  hi IRQ=20
=20gpio-79  (                    |pcie-2-hog          ) out lo=20
=20gpio-82  (                    |PHY reset           ) out hi ACTIVE LOW
 gpio-83  (                    |PHY reset           ) out hi ACTIVE LOW

root@bpi-r4:~# uname -a
Linux bpi-r4 7.1.0-bpi-r4-main #4 SMP PREEMPT Sun Aug  2 23:22:35 CEST 20=
26 aarch64 GNU/Linux
root@bpi-r4:~# cat /sys/kernel/debug/gpio=20
gpiochip0:=2084 GPIOs, parent: platform/1001f000.pinctrl, pinctrl_moore:
 gpio-0   (                    |tx-disable          ) in  lo=20
=20gpio-1   (                    |mod-def0            ) in  hi IRQ ACTIVE=
 LOW
 gpio-2   (                    |los                 ) in  hi IRQ=20
=20gpio-3   (                    |?                   ) out lo=20
=20gpio-12  (                    |cd                  ) in  lo IRQ ACTIVE=
 LOW
 gpio-13  (                    |reset               ) in  hi IRQ ACTIVE L=
OW
 gpio-14  (                    |WPS                 ) in  hi IRQ ACTIVE L=
OW
 gpio-21  (                    |tx-disable          ) in  lo=20
=20gpio-54  (                    |?                   ) out hi=20
=20gpio-63  (                    |?                   ) out hi=20
=20gpio-69  (                    |mod-def0            ) in  hi IRQ ACTIVE=
 LOW
 gpio-70  (                    |los                 ) in  hi IRQ=20
=20gpio-79  (                    |?                   ) out lo=20
=20gpio-82  (                    |PHY reset           ) out hi ACTIVE LOW
 gpio-83  (                    |PHY reset           ) out hi ACTIVE LOW

> >=20
>=20> Is this an intentional change, or should the fallback to the DT nod=
e name
> >  be retained?
> >=20
>=20No reason to since debugfs is not ABI.

Imho it makes things easier without looking in schematics or dts to find =
the right gpio :)
And it does not require changing dts to see the name again.

in my current codebase i have added the line-name property to all hogs, s=
o here it looks like this:

Linux bpi-r4 7.3.0-rc1-bpi-r4 #1 SMP PREEMPT Wed Sep 16 20:45:17 CEST 202=
6 aarch64 GNU/Linux
root@bpi-r4:~# cat /sys/kernel/debug/gpio=20
gpiochip0:=2084 GPIOs, parent: platform/1001f000.pinctrl, pinctrl_moore:
 gpio-0   (                    |tx-disable          ) in  lo=20
=20gpio-1   (                    |mod-def0            ) in  hi IRQ ACTIVE=
 LOW
 gpio-2   (                    |los                 ) in  hi IRQ=20
=20gpio-3   (                    |wan-phy-hog         ) out lo=20
=20gpio-12  (                    |cd                  ) in  lo IRQ ACTIVE=
 LOW
 gpio-13  (                    |reset               ) in  hi IRQ ACTIVE L=
OW
 gpio-14  (                    |WPS                 ) in  hi IRQ ACTIVE L=
OW
 gpio-21  (                    |tx-disable          ) in  lo=20
=20gpio-54  (                    |lan-phy-hog         ) out hi=20
=20gpio-63  (                    |pcie3-cn14-hog      ) out hi=20
=20gpio-69  (                    |mod-def0            ) in  hi IRQ ACTIVE=
 LOW
 gpio-70  (                    |los                 ) in  hi IRQ=20
=20gpio-79  (                    |pcie2-cn15-hog      ) out lo=20
=20gpio-82  (                    |PHY reset           ) out hi ACTIVE LOW
 gpio-83  (                    |PHY reset           ) out hi ACTIVE LOW

> But if you think that *looks better* then by all means send a patch!

I have not yet looked how to get the previous fallback back, but if this =
is the=20
preferred=20way i can do it.
Just wanted to point to it and get opinion what's the best way to handle.

From my PoV i would send DTS patch adding the line-name properties as fix=
 (for
backporting), but i guess this behavour will affect other users/boards to=
o where imho
a driver/framework patch makes more sense (will not "fix" gpioinfo).
So better patch both?

> Yours,
> Linus Walleij
>=20

regards=20Frank

[1]
https://github.com/frank-w/BPI-Router-Linux/blob/7.3-rc/arch/arm64/boot/d=
ts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi#L589
https://github.com/frank-w/BPI-Router-Linux/blob/7.3-rc/arch/arm64/boot/d=
ts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso
https://github.com/frank-w/BPI-Router-Linux/blob/7.3-rc/arch/arm64/boot/d=
ts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn15.dtso
