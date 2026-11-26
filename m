Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714551;
	b=d5R9JmunW807zovWzKXQ+eLMqEIgDNfkBfgrA5oby/5mNzHaNSLu1r6MPJUgVyJ84mPs
	 xT4g1ikN2ZV6yYiwMufhRgebZS7yBkbVs9opzGyM9l1Er+AwCWoSa7wT+CvKTwo9U0Dgb
	 drckcljk+WGuioX52nSTWx1ZASnBIWtCWIAUvz260iGigTnzP9ziqF2tZ/EChUK+JunJo
	 zxKYefUWjjkt8Ld3yL60UTmnh5Gt62rImFHlntT2ZFJdOMzkehdav15Bgl6e9NHpZ/IGn
	 r8f9bStv8Dz+MWtDB2TFSllenStQI9P/WtwXnf1rBgqPPT8BGdUq2iaeXdheGHdt2Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=qX7hQvpKRLbWPJiO5CVxnjE3ZLRTJ3WKFWSTYSfxc60=;
	b=ok8fsQAvkcH1PMRrFsJ8EXvaeKsQ+aDzV+pHZBVFA0EL3PT5xN59kgcVSc1NmYZXw/fp
	 4+1jAJ8Es3XsV3beuyH7R8xnJk9UU6rJFWab7yiyO5tE6XCJORPXdE4H9YB9HQgwOgqX2
	 i9slxzVSCJWe8AYJehSaPiG9cJt25BX/sgSPpliHXPx9AvxEWMC5JlKTp+W2jxohQRC/o
	 B1Ky4Wq7L6HflJzqSi+KhKHyCBW015bNib40BO4c5iwU1sXsElT04j5W16XwQcTU882or
	 G6F19mHNIRjwOg779hsNwvr+IX72+Ikl8jVNBNLzWOGxnCMG0M6iJNzRgw1xw7EptDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rg7Orkih;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82275606A31C
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 17:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82275606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rg7Orkih
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so73340465e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 09:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795714549; x=1796319349; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qX7hQvpKRLbWPJiO5CVxnjE3ZLRTJ3WKFWSTYSfxc60=;
        b=Rg7OrkihCTmGhc1xxci3wg7S960TTY5WDen6YEsgW1kwGkE67xsLRVBHU59R/yhBBa
         ycxd9vHKhZY/23vf8rHlwRn7DDoPx9zsYIMVS0KFKxVO3yOZ+SZHpO1osBAs/SpIUXkQ
         sDy9QS8ktqh7zqIwsV9FCSxT/33h8poIH+JqjKk7QO2M7SXxiKPWcVCyANJHhxcZQjU6
         /cDMoPjfmPAC3C7rS/m5Ws8Y8QldZj+6sbex5z/FhVIA4OGhEigDEMbq5UOHeFBDy/Es
         oVtASoMf4ASkX3byclT135IpeI5S2UOP0d8UmbxOlSc7VNq6S2uotMmRd8DCMp8WXI87
         0+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714549; x=1796319349;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qX7hQvpKRLbWPJiO5CVxnjE3ZLRTJ3WKFWSTYSfxc60=;
        b=ahhiK8OeInFHmXJx0CgXZqNIVCam9AmKWRDX6y7Qgj5oaX4BWlteAgu08w+jvPEI2N
         dhQQjomtbFG4IwJPbsJdFVeNjIVZ++udkUy8gcLj1N7tnrsTn7BTt9sWValnlXpQdwJL
         mVaOUJzWoK30TQIqFpPAQ2u8ssNm2EAujQMo4NS3K2WpwT7o8g3rlf13SP/qw8yIgBb/
         nh6lk24mkSbmqh4aRhpgFeh0OE01q9rTieXLE2tcPiZgRbVMWF3uxn06D4ror33s5DZd
         buzbR6wQGfwrnWfH8wMkYUP4ba/12Z6yKnaC5rDYSIpMgVdsf3pZxpeyX/j2RiLZNydf
         4RaA==
X-Gm-Message-State: APuU4Z+RWEAl8DWJkzfeeLPIjxaDG+gP62BYkPwXSXkIQwPllKI+6lbm
	FiYN8tGaVcUN7k0RT7/00bpDP+6E5HAHy55LQYheHYsD7jnG7ZtN8+S6Ur+sAA==
X-Gm-Gg: AZFdTZevgdoT/hZHJfTnMYRtIEuOqRZQ2B40HsVdDNIIy5Vs9n9DAQaNKbrN4/2o1SH
	Ip0fwLGbjN5zXQCvHZJINjTomXmmbP8aNCvebw/JQdl85Ec5k6OSQZzTm05vCbKuTF28tC/h8S9
	ZKPuKf2kOesMC8g7zZyV18tntHOpZ6s2DksVWWi0+fYxoN2HUB//B5mHX4uUa+SrVlHdyWuvmo2
	12IJzyt15Vat4AhTXyrIXXmCy9r0Be49ENuQFxBNQapAH2E01dO5Xgvvi+nopTQqpztlDj2Ll8R
	dmlzBxu0D2zvQWr/rpZ0QdmuxH9zv5mu5QhgTqSOOzE+sOwTvoSDLHsvBlvhDFbRBCcx4Lp4gRL
	tRamw7L1HFQSaXJgGC7JQ1VYA3bpZGJqH4OcFAG6EshxhLGXCbpDJ9JPBIb+UXdkf7jHVUZ0hFz
	Coj/sfuA6sD5+JEaAg4xdfeKF7dRyJvKTTnMqIFZ65CNoTtUaayM/RsWHGe9L8GnnAJ5cNJ2gYr
	2KBqb7/Q3YeUZ+3eC9ZDje+dVSudFo5/j2vD3tyge2FfYp/KFPJKps/66H4Tk1thrpPmmKyIVNs
	3zSHGQm1C/k0QMGLLJFeC8Dly4CnHlwDKzzLroBqdnwKgFDnrsj8OZ5QBZtRnu5Ew4Fa7DIscnB
	Rsp8hBoHQrJIRNsBuCs+ITmT90X/izmid+2So9r9u3slGYHVmv8tJ6VRlWURBf6ThHHOswuJWB/
	dwrye4Q/aNAD3pUDR0U+G8meuIaV7VB8EAeceB1P2fEQtwX9/pAfPfj1vii6Vxi3moEeSQRqByd
	PreV/xu3yU0nzLkgjcRLtbiF3znY/Khc3oZL720nhDh9Hqc63rWp2Lf4wVmfRX9BGhCQ/YhBNqH
	q3smevzG
X-Received: by 2002:a05:600c:4f84:b0:4bb:8701:a2df with SMTP id 5b1f17b1804b1-4bb88809950mr448141145e9.17.1795714548844;
        Thu, 26 Nov 2026 09:35:48 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm397758825e9.1.2026.11.26.09.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:35:48 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Alastair D'Silva <alastair@d-silva.org>,
 Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] pinctrl: sunxi: Drop unused parameter from sunxi_grp_config_reg()
Date: Thu, 26 Nov 2026 18:35:47 +0100
Message-ID: <AalbXD-rTNOJWAc97z7puQ@gmail.com>
In-Reply-To: <0defdc40-a96c-4df3-aadf-3c3db3c48b7d@arm.com>
References:
 <20261126104954.441427-1-alastair@d-silva.org>
 <0defdc40-a96c-4df3-aadf-3c3db3c48b7d@arm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 26. november 2026 ob 13:02:59 Srednjeevropski standardni =
=C4=8Das je Andre Przywara napisal(a):
> Hi,
>=20
> On 11/26/26 11:49, Alastair D'Silva wrote:
> > sunxi_grp_config_reg() takes a pctl parameter that is never used.
> > Drop it to match the original signature.
>=20
> Ah yeah, looks like a development artefact. It's indeed not needed, so=20
> changing it back to where it was makes complete sense.
>=20
> > Fixes: 8b367fc08be4 ("pinctrl: sunxi: refactor IRQ register accessors")
> > Assisted-by: LLM

This tag is deprecated and should be dropped in all patches.

Best regards,
Jernej

> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
>=20
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>=20
> Cheers,
> Andre
>=20
> > ---
> >   drivers/pinctrl/sunxi/pinctrl-sunxi.c | 5 ++---
> >   drivers/pinctrl/sunxi/pinctrl-sunxi.h | 3 +--
> >   2 files changed, 3 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.c
> > index bf4ec4665e2b..d30a562315aa 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > @@ -763,10 +763,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct su=
nxi_pinctrl *pctl,
> >   		else
> >   			val =3D 0xD; /* 3.3V */
> >  =20
> > -		reg =3D readl(pctl->membase + sunxi_grp_config_reg(pctl, pin));
> > +		reg =3D readl(pctl->membase + sunxi_grp_config_reg(pin));
> >   		reg &=3D ~IO_BIAS_MASK;
> > -		writel(reg | val, pctl->membase +
> > -		       sunxi_grp_config_reg(pctl, pin));
> > +		writel(reg | val, pctl->membase + sunxi_grp_config_reg(pin));
> >   		return 0;
> >   	case BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV:
> >   		inverted =3D true;
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.h
> > index 7c2f29e75519..3060cef3705d 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > @@ -328,8 +328,7 @@ static inline u32 sunxi_irq_status_offset(u16 irq)
> >   	return irq_num * IRQ_STATUS_IRQ_BITS;
> >   }
> >  =20
> > -static inline u32 sunxi_grp_config_reg(const struct sunxi_pinctrl *pct=
l,
> > -				       u16 pin)
> > +static inline u32 sunxi_grp_config_reg(u16 pin)
> >   {
> >   	u8 bank =3D pin / PINS_PER_BANK;
> >  =20
>=20
>=20




