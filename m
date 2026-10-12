Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046A7361961
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 09:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796753; cv=pass; b=QoWbsl8BvIb+HHMz8Sr9pvjvhO3C5I4lSvZPjWXMRCvE0HXlMoNowtrdjFhJTPRnoxmsqFND4qzr9Gj+TdSBGdikzBKO5Q7DY2H5KisCqHFQWMp+Z9qvuy7HqUjjEdXi0jukr22fwHK1lfIZ7D/+aWBQ89cR8QPz8PVFkLG66aY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796753; c=relaxed/simple;
	bh=BzLE8AuiJudHf0vx2hSK9ysChmOCt+AKiZt7J9X7MUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZkYfAiHX4kG33H8ndlGt69P5P05/pWavMyy3muRjOTmZxhYLyj4qsCtiSLcEvUEiDh4bjKFrT8vcin97KD+tFWVRiCTsIw+62oScSSUxExrycwEn2hez/g7DbwWVp+Zb5hPW24Z4VFhaMZh3utO8ijJj6IKpspsDz/KbhVF0LFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oJhOJStg; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oJhOJStg"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so2391402a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 02:19:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791796750; cv=none;
        d=google.com; s=arc-20260327;
        b=WNU4u0Lxeg3WxeD4g72uIGmuPMPZe/y+vk2v4Sb65sAPu6hHbcGVQ1Ukx8+ci1fi2t
         THbBih5ElbqyDdUJLTOo65AVumj9DHl8AO3xqrIZSnbBzC818C0uOFVlw1ZSayNokVDC
         OYoDXeX3Y4dOkBO75ZrpktdqUc02tGrswnOz7rqYhUjNf6Zf+pLilJsXC/uNFILHs+Eq
         dC5y6x3GNEfbt6N45v55YV8k6tMNLpSfMVDmm5dXTarO23GYhkfAZipeWdgSEfy+MCnR
         OdGRW3dZ7oJyK4EslFlWkxdTGqLlqz2ogjyIIxPgLMEotyDA+e73JqzaLWSA5ALAdhev
         u4xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RDzCL2xabPYSUwu/5d7RPJ+k+ygaIBXDpjnjlx7KGzc=;
        fh=y8ZMVVY/gUzAdoeFRNZON+JokKY3LY6RxCeMayhY/Bs=;
        b=fvi3xwWnST3CSGyspy8Z+B/2sA5cPWIrV0wpI6ZsGVTg9YthTENyeUO6uKzdaASRuI
         /M5qp7Ch91QWIUIzPMVwABfQpSgW+wJvBtfPQOmOpIm/VOwtBE+MLR8e6PlJY09scMVk
         uZoXnuIHBLiDuTI7QPoD4w5RNo4UG54n/pho7drp5OfXcssHOBdEkM9QREp4lJRZK/KW
         a6BdcgxduTetCcRgRoAMKjfcoR+Xev67r/ShHQoW2lpwmshWxckHXMyDfvv6Jgt5g/jo
         4huqHYtAl1IxlD12bp983pCW2Ab/1xhPcrQctURbdtBPKX4mXRLkP+j0wWB3EsSCwbZp
         1qQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791796750; x=1792401550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RDzCL2xabPYSUwu/5d7RPJ+k+ygaIBXDpjnjlx7KGzc=;
        b=oJhOJStggfP9Gw/3A99Lf1yTvpnnV1tgozXytWeLe2qcUSAXFXSztylvTk2p9K9Qye
         7WBcys6nx2tmI90BnfMH+IbYy6v+LTFGvrytO0bkWyvEYZYQQINlPInEoUlMZuxBlQzi
         MaGdIcp643o98/KGgNyAUeUojhJndfbQF8WZuIl5/AYX7H5veEAneCWdw0afumKnACkv
         3Eli2pixmBUiT2q82b/l6MK8pk3B2yObdrlvylSs6aDjyGB/B/kNpUAYlwk6JsGvAI1W
         TfLmsKwCUppgStBjBPrFJ7hBe6E+Zy9Lg5+prYkrC2Tm+pHQxmRNd35MBMGzWMZ/oOf5
         zzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796750; x=1792401550;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDzCL2xabPYSUwu/5d7RPJ+k+ygaIBXDpjnjlx7KGzc=;
        b=lXY89tSNQbiJAeNSZ97npfJ5XkFGhLEyJofeE++V2JHj+c0oYozcf5/na1tP2MgBH0
         AzkdDsbSJ97AgVD3rHkUP1FwyXAKgwLwCQWyPkJO+NM5KBS8A24YJW8B3PS5RHrEejkb
         t9bHR5XmkRtX5ESNsUNXZEelwLDeDRZk7yVidsxeYA7oGQKLM4fpxJe33+F+6FACXxOs
         tDPnlJu+LstZKkRUWxh91beAtttjdJVW3wybrJORATwP/nYMlc09SSbFb7a/3kyevMwW
         yMKZzL2dJBwbUSeYWHNIw3+bmbZF1n5U9FvfGtpPggNqwzbp7DpmIm6gHaQ+WCc6dz8S
         Rprg==
X-Forwarded-Encrypted: i=1; AKwUvBw21Tyfub3VTUhjHcOBxxo+l/qL3tNBoQcKubQE5fWvRjEMcj52MAK+6nFpxIXyXvUQiZ10PZi6tVih@vger.kernel.org
X-Gm-Message-State: AFq9FYLqHsn2g74QmSG2SArEFeo+Ml8HqRUDvRR4a8cwwJ3nD8rz7W5K
	IxfiRZBRvzaiKCHShxiF5fBwNhws4iUWhbB89ft7SaMWZZo78EBCNjLRFOrZbnmBKxlDtoNFBQQ
	YY+vyoVeCyPXaRN33kz+P65ZiSFw1MkA=
X-Gm-Gg: AYBFou1RWjP7vW58AnBNtDe/kZBF2/wUF3QvkZVzFnSMKfCoiZariZGELY+TkIEqPTt
	TKQcXTjBJW+OzmVQAwICfc+deh1xCAiA6EMk/0Vy7TWwcdSRHvAEswlKbevs1rTPxfl3s/iva8e
	KUIa3BFf9kk1kozlDS3cSHKbibNMo3NftBwOyA8E7fkl7N+KZojNA+AmKcmyv84MM45fe/0qQ7F
	vflMCbg4sB9lKPiaXKC3S/aLoqZ4SuAfqifR720JRpd+UanA8YuK2Jb3YfljcqCAF6XPPaSN6tL
	k5d6fwslgfS118lhgYzCNai+T/iwxdkvcS/e/TMat45mL+xGhsmOTFv9ta6mcVUILRqtCos7ep4
	fqAlVYvjU0qmcIqgEsHzah4/pnRQd11zutM2fuS8qrbjhDCPQVVmVS4AXwMt9zSrC6q/Fj3NNCg
	KC4KwKzAsl5/9FY0OgVu0JmVUkLfT9JzIabW9kS30+
X-Received: by 2002:a17:907:e109:b0:c31:e19c:fc4f with SMTP id
 a640c23a62f3a-c31e19cfeb2mr562736966b.14.1791796749871; Mon, 12 Oct 2026
 02:19:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-2-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-2-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:18:33 +0300
X-Gm-Features: AclHuK_t7SCC_fNqTJ9e7JfRmqFuaCbc-sDfdo-4CcqOLhnBhkL21_Jo8x7VqS0
Message-ID: <CAHp75VcWZSoMRvdBECyD5AM29+JWX=s0PORFM-QSMCNPD8wkCw@mail.gmail.com>
Subject: Re: [PATCH v6 02/13] gpio: mxc: fix both_edges bit operations
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> gpio_set_irq_type() can be called concurrently for different pins on
> the same port.  The IRQ core serializes per irq descriptor, but
> different pins have different descriptors, so on SMP systems two
> concurrent gpio_set_irq_type() calls for pins on the same port run
> without mutual exclusion.
>
> The read-modify-write of port->both_edges is performed outside the
> port-wide scoped_guard(gpio_generic_lock_irqsave) section, so
> concurrent updates for different pins can overwrite each other,
> causing missed interrupts or stuck IRQ lines on dual-edge triggered
> pins.
>
> The original uniprocessor MXC SoCs were not affected; the race
> became reachable on multi-core i.MX7 and i.MX8 SoCs that reuse this
> driver.
>
> Convert both_edges from u32 to unsigned long and use set_bit(),
> clear_bit(), and test_bit() to make the modifications atomic.

Is bitops.h already included?

--=20
With Best Regards,
Andy Shevchenko
