Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF284A1DE0
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 20:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886408; cv=pass; b=cCZwteAlx1wRXv0Zac3RkR/RMPtCKb15jUFzbVbYGHxJFLC/z0f3Y8th6sQNOYYaS5TJdZJXXrU6ibOV0on/RLl5XLIfKkQSORpTcISBEkocU6O3tK1pZep23FPTabfctYfaRIaYexYtq7msK8re8E5mhwFNyVeKEocH8UZP7vc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886408; c=relaxed/simple;
	bh=v6TVfXTKVxrz9QFCIxsDL9oMH4UbJ/LAus5tXSrEGYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WzPNWyvXNsWlg+A4vdXF0fgXkccRjWehEEsqr7ETFvaM8l0NhoA3o3fFT22M/cxkBx4JQlFQI3DlYxEjHScRDh3gnmNbV34cHOcBZlFNhEZuiDgSQXDokuKdBsM8epxhFDrQv9FylaCKN6bqL2ovSbYP7QzO4eEzv8dpDkMWuYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ET+EdqxJ; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ET+EdqxJ"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so3693444a91.3
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 13:26:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790886406; cv=none;
        d=google.com; s=arc-20260327;
        b=kCDKK7WDBuck7lv7dWjH0EStUAVW5OkSvJKeBUSpy+h/0pUHQV9cv8J0Bn0+y7Q5zQ
         9BSAt/4T7B7ZfEGjvz6TNKGRZAAIyrfxsAx6yzwcmm9M/w4sIkJZ4vXPkGqVw6HYwhc2
         7VLnb4Pn0WpW1CKdavI25L9pTs5cDacSP0OSc+Y3uByNedwarqsOz4NKqmaTswv9Od+P
         lhZ8TRKuuHwej10VwRiM+zv3KCpWDUgwnVNnEQtdgE6ADLlbqapAsl7K6zRRVsqC/2GJ
         g2VdFZKI9CynLTlZ6zLrn2hZhZraHB8gVtoQPHIRKah80m1UF65SGgJco3qbGNSds5LB
         b9CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v6TVfXTKVxrz9QFCIxsDL9oMH4UbJ/LAus5tXSrEGYs=;
        fh=LZpyY1cmM85hYjgxdFnHnEbxwJzIoKd9rMYmd/OMa0I=;
        b=PNA7aAGaMkQIXhb8rc5cJA3NhOMYZU7+/JJsTCQC7HRmAxDKwYcaGcV6Qu9PSH7mYB
         YiYXq4Nm2nUnJy/7jTVLvSr01zMjSSlklpf/NoFTjvNbbEnkE6wsw4nf9+DC8p2Xv5yM
         UIJ9x4Tk9GdPFg3+wXjlMTIZTdvfRvTlW7Saz3Gu9ZI/AA719be2vYds5LNeY0CxIbjl
         zxRuIqvYpFe5XN6jlCegRPYwb33x1f8IysoB037dWYJoDKk7zyvh+srZNA0p1qGomTOL
         ssOBCMAKCQfq2rCXBRLUfeueN1F9IJCL11nMU09/SYvawJ6N6Nj1hYJdGhl+f4t/GgHt
         6X8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790886406; x=1791491206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v6TVfXTKVxrz9QFCIxsDL9oMH4UbJ/LAus5tXSrEGYs=;
        b=ET+EdqxJf28CMztfvAN+a+3CH7wRN5EmQcy57T5G0DxTItxyCpllGwLCltwDMZCSjh
         6Sfc38AfPQKzr8odbgdEr347DLQDSsTrh0ApZu3LRGeQbaavxR5pKqgHwAlx+wSCuq+/
         wP8CZH67LY4EmDMx/lAP18EswWpGPJzruOnLB/f7oSnVFdHuQDcWsdG/dg2wgNuWjdDb
         cw+FKCnDMhb+ECPLSAIyj2/WXEZG6In7gOme1fcnSAu9WmTfk12ihEgKDvsG4jsN5btX
         S9UjJxoAZy7w5AamGU/4DpHG6DY/1rHhnwTIxS8pumBkvsX/jAdf5emTr70AdmOCmXRk
         o2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790886406; x=1791491206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v6TVfXTKVxrz9QFCIxsDL9oMH4UbJ/LAus5tXSrEGYs=;
        b=J8x9DTTkXzoTMiyGKnK7oHu/PLM+19lGv5MiBvKLXgAnZSlimaH3fR/VwuyoqX5yJk
         gGPGA0jtJye09285c+Yl8TvtpiDccwlfcsRxEM7gryXfxVlm3yAJzeZBlKJ54gSR3TGz
         i8xSs13agPaU2qD6yye7kUc2rfUmC0NxUL/srir8uj1B9J11lcmBchPRKn9HXIn+zM6z
         xwkEQbQDmJj3DJTyQ3b+6AjNHViMRmzVLCBL8BWVk4CO7UXMAooyVk1ajJ2icH1YvSCu
         fRPUNj0FValqmBaEge2x27vYvIZeP5Fxz8b3FSBP8vsvcT9bTADoRMQbzuaKQTqCv5Y/
         6eZA==
X-Forwarded-Encrypted: i=1; AKwUvBxZdnZm4xRtV/lBGruflO2RbeLCr6h3FBkegpn97vtN/hAmMv5e+y+0e2tXqWU1QL2E+IAwXluv/+za@vger.kernel.org
X-Gm-Message-State: AFq9FYIxVe+W3BN/4mZBRxpv9cMF7t13FOWDdHemna0qc3kB1rId7dku
	FJYd9t3JuNDjl0O/6Ll5duWovo9wUvEeYyL56eUHvEpj2zLmyDKCvGS4RNZTw1Vvbr9iWEZeA+R
	0nNx7xs4l0QgV0whQcBok7MSIl4UmnEM=
X-Gm-Gg: AYBFou0HWJ39+PYVLvTyGGWAD+JRlmGBZhTC0UMG95VGi00raINypMObtncWeZYmjtj
	7gzOUeLjbHykiLKBwMlTl0I0zU6N8Mm4WYlhq/Mma3JymethP0w5Lp3W29nQuK9S9+YENvnpR7n
	WOmZicAU8KoV+2tLFi2yVuIUBlYpl0uUPQRDBOj8RZS36G/0Y0jLgkX5v5c9M0VJ5fYSgMdy1Dm
	K115fyntzGWYp8Hbt8vcGRglxUhcpJE7rF/rn4n/n6w+HyELT+j2WjNbhKz6znBJ8JdHNl4jlJP
	Nl8BvKZqCYpakVJHByzHn6C2Dk3+esnpQTBdQ3Bo6nxmkpVD0735Avc72VBUQGBvKQJ/ejM=
X-Received: by 2002:a17:90b:2f04:b0:39e:6c69:f46f with SMTP id
 98e67ed59e1d1-3a6ceb1b955mr639282a91.46.1790886406217; Thu, 01 Oct 2026
 13:26:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929203634.32998-1-pmazzini@gmail.com> <a15d179f-8a43-4b4a-8bd5-fc0afecad6e0@arm.com>
 <CAD++jL=wEKZ5nRofe09heO8uUa4Cd12SYz3+XPhsStioQ5XTXQ@mail.gmail.com>
 <d9e249b7-baf9-4ad3-a3ae-b9765feca5d8@arm.com> <CAD++jL=bhQ8Pj12wgCi8RaRTEUcrXzhHm+EYA67dBEvn8P_rCw@mail.gmail.com>
In-Reply-To: <CAD++jL=bhQ8Pj12wgCi8RaRTEUcrXzhHm+EYA67dBEvn8P_rCw@mail.gmail.com>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Thu, 1 Oct 2026 21:26:01 +0100
X-Gm-Features: AclHuK9su90nDg_1A2BHnYBV31GZYMfhNVL2X1sfHL0TTMmKMafI4E752265Oww
Message-ID: <CAAxh=js3PiveOSst0brWjw7q+pOXTUbKNahOUcwyEuM0oW0gpg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: dt: number the IRQ banks from the first
 one that has IRQs
To: Linus Walleij <linusw@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre, Linus,

The B288 only has IRQ banks for PB, PD, PF and PG (banks 0-3). With the
current code it would need a made-up first interrupt; with this patch it
doesn't.

Which way would you prefer for B288?

Thanks,
Pablo

On Thu, Oct 1, 2026 at 8:28=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> On Thu, Oct 1, 2026 at 2:31=E2=80=AFPM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> > So we could revert the DT patch, and take Pablo's code patch, with a
> > Fixes: tag, but that would create some broken combinations meanwhile.
>
> I see it like this was a bug in the DTS file, so this if fine as-is.
>
> > And in any case we should add a word to the binding document, to pin
> > down what's expected here.
>
> Can we enforce it with YAML constraints or is it too open-ended?
>
> Yours,
> Linus Walleij
