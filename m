Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516743FF1C0
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 10:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887763; cv=pass; b=mdzohWhVJJH7BnFj0UC96gEyFrDzkvnSsAIXX63BPxRy0XiDv4ExtReRWOnLEu5cgJk0XA4rZuSiZc2kfyvnYyQ4yBLLljga1taHtHN58o/W/KJkrC+/z/zvZn/IrX3z+AoXv8X7swGhwYriEmBmh6ldxVsNfpa0HPuBbQB/mz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887763; c=relaxed/simple;
	bh=ATKKoMBtvH+x+NnwXS+Q5BPcXq0fntwxaTtd2Uh64EQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Im4Op/AUL18BgMEMISPzVsgtz3XZClK1MuJGCfJpuN4X04c21L8raHui4vg+lsenbW/iqjgF/BiDp2chPXHCUb6r3cqekpj325q2Zutzi/IrvDqaz7qYkUcIuDVWE0Vo1Ohjn16SiVGdKbYIMRzG8rbltmeZlchErPEamoHSJyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qr7pBV4z; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qr7pBV4z"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c315869241fso385612966b.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 03:36:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791887759; cv=none;
        d=google.com; s=arc-20260327;
        b=D61vSJrskDtyVkQooMvqSNclHKy8Ugx2KJ1W7/qj661r1VNF7wMpQsAWz01zS4qYQR
         9XG/n1dqwXOliQ6N+A1UoX8m0TvclIdbCyX3i77vagUUV9GXahXnWXw1SjZuvLRI1rDX
         iHSVoYPMZWiQQKUF+eRppcIuVLZRkTeOYW/xf9//iv9BDFuup1gOaucf6LkbQQBFOMg5
         KDUjHIWUiJPTSDvi65kLtbsdzplmF696Yvj5GMXCsp+Nry3Sbq4U2ebfc0ThPOwDrsJb
         PC5XJl+2liB/GgZUcujmyu9hmKSHc0Lwd15XH8RxyvEnXSp/2qvU14UTatbZBEZLYJjE
         5GfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I5p7oXXlQx4QmfKm1Q6bW1oyoIsdT3apMQtNWEn4ZXo=;
        fh=Lmph/a2P65e/dJVLsCqNl88Yhn6qTTSBcPc1Ap9oCOs=;
        b=fDSjtP7fWh2T7eB83jrfMjnGtZ4JnwhjzYhzsHx4PyB0l71CWBipmGMUsAURpeElDS
         K79Y4zgbOhPAjnSl5kK9ZNxpN/Wn9veew41swOJF+G4NlnQC2FFiYUi+xBhWfRIEQ2JW
         BfHdE5gi4c3s/dFIqPxmQ4nboW9+1t3EiSB4GIZOGt4q3STzo9ug5jPLC5r5kSzIG7DP
         x7kucaJ0xBx8m/S8JOoImkyy6+CyWFDVBlSDeem2/upWWKITsO3qYdIdqdS9WBv4Av5R
         D3mg3gPn1YRji1wfqupiaWnB60Rw+lEClEn9e/pjieNWRBDpwb3SzuG51ObzwksCLRb2
         Q3ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791887759; x=1792492559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I5p7oXXlQx4QmfKm1Q6bW1oyoIsdT3apMQtNWEn4ZXo=;
        b=Qr7pBV4zhwHarFh0X0bLh3QNCgUKbYJ7Nas8wlDHrLY56Kuj4+ZiWvi+LMwCPVDwXl
         BSguCYaAh3Xm18xWVsQMWiflNd2YQKyEZCu2SZhA3XWAhB11Aw5jh2kk8hY7X2CH4TcZ
         KZEQa3EZ4yH7muY+Pfbd+I7xHf/QlyixiM5qkfdv6/yXDD2VnvCE1ZqVI/GwuunORnj1
         W04/AMRt/K5+PIzg9ZjDdTcUoJfWEz/XUP6stMORztZPf1kv1PZRQN1uC+pLhVuLzVnI
         Uvp5Q/yHLGhT07SvA6rre38mrAglovXFrOxPGRBjAiI4cTNDbU2sfKZKN2vgLOS3B+fc
         f/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887759; x=1792492559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I5p7oXXlQx4QmfKm1Q6bW1oyoIsdT3apMQtNWEn4ZXo=;
        b=ZDAWDH7srFddRloOyfG9OsaWyOF8w1Pw6jj3IgBFXLXWXoRy3N6uzrbQO8Ay6Fnsoh
         /J6QTZe+G7/+isMDEojX4c5wJeuut/50ROppgyxr7zXIngmaSWJM5sZJB1kEpJf2rwgE
         /HV/TrYpZHQSPFdaBnrt5fnAOcr/eEDOd6CrAQUsCIft7nT62FdWIbf/etYkapXrGdUb
         AdHadkw9RjP6XInxuQK6nLNcbtG4tC4h6MLmXkSB63XDieEY0OuNV6NbOazzhwzeFBFl
         ylPNp2ZOtG/0XOPPQ+Ij3fnqAEZ5A36q0swyh9P5vryvmTrdLG1WmFDbQfvphfLF6xSU
         /J0w==
X-Forwarded-Encrypted: i=1; AKwUvBwD/tkMoQRORnSeBYNT5nQuWK44zAOleNEr/2njFi7Th5nybWuWmHokSsFomRiSqI0MZbeJ3nZLw6gc@vger.kernel.org
X-Gm-Message-State: AFq9FYIL4bwlUMz+3YsGhVi8QpVZglgA/xPdYypvYAaTNaP/EmUan285
	8vzQAts8EDTvh067NpgHfkjaDCwVeUJ1N9CFeJapxL8YQX57hDzOG1FLKTbs24Z8bnBpwdp349e
	WEmOBaDodcDL51pAX6tgwdUIWvnho1AI=
X-Gm-Gg: AYBFou1KH7fH0bvySTk5Gbw6rh31hliDnz/xXuj3WJ2IFWGmBAjVSEWCSTRQ2Krh7Le
	X37AsZ0SLAz931yLofb7/yK+Gd3GkIBtbEznKnYUrjT0eZvLIIvWI1Gi4ZAQrTNUsq95JyPOWxr
	9Wq30VKQsGScEdG08ChZzX+j3sQAphuQSdkk+LSMLOvM5NHOUYdIkEaa1jrkoJTLoVHJCIj3+TQ
	M0c3rvg8BYDuFXQ/UtffXLVT+cpVzA4hj+Nb0/fKTWrXhZQl/OQrklmoOfuF2nvUK0EqqUGUpxu
	4Fbq+qJXd+9w8/weK3/q08Z1d01jMzE6MPwZFObS3T1KpzQYhsyL4VvUgIX+BCC+Xz+/86mCHnM
	9ISAgNy+YO/NTYuBVLlWGoS1JY0elN/QMbM/vdjbndpwsUIGPnamfYvx6G7Cl/FxIsaC4NoyE4Y
	DBh2dkKWhtBrZ91YcQ4e/FZ47SmD0qgBS69zTaOWuBxrGB0qxR9F4=
X-Received: by 2002:a17:907:7246:b0:c26:19de:9adb with SMTP id
 a640c23a62f3a-c31a9d56575mr1092545066b.26.1791887759359; Tue, 13 Oct 2026
 03:35:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 13 Oct 2026 13:35:22 +0300
X-Gm-Features: AclHuK_etHkgfHNMFVBnkCMnseRcVeyJYO7O0Oj_IyfMyFzvQ7RtNYlt2MPQbFQ
Message-ID: <CAHp75VdaDyfDL=34kOV0u_nHnJ+XXNwJU4=33v_Q8Eq=tHrYng@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] gpio: mxc: misc bug fixes
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 9:03=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> This is a subset focusing on bug fixes, that separated from thread [1]
>
>   1. Fix a race where the chained IRQ handler is installed before the IRQ
>      domain, generic IRQ chip, and port list entry are ready.  An interru=
pt
>      arriving in that window dereferences port->domain while still NULL
>      (mx3 path) or walks an incomplete list (mx2 path).  Move the handler
>      install after all dependencies are set up.
>
>   2. Fix non-atomic read-modify-write on both_edges.  gpio_set_irq_type()
>      can run concurrently for different pins on the same port (different
>      irq descriptors =3D different locks), so the old |=3D/&=3D on a u32 =
is a
>      data race on SMP.  Switch to set_bit()/clear_bit()/test_bit() on
>      unsigned long.
>
>   3. Fix non-atomic read-modify-write on wakeup_pads, same class of bug
>      as both_edges.  Switch to assign_bit() on unsigned long.  Also fix
>      the bit being updated unconditionally even when irq_set_irq_wake()
>      fails.
>
>   4. Fix a race where devm_gpiochip_add_data() makes the chip visible
>      to consumers before the IRQ domain and generic irq chip are set up.
>      A to_irq() call in that window hits a NULL port->domain.  Move
>      gpiochip registration after IRQ setup is complete.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
(no need to resend for that small issue in the commit message in one
of the patches)

> [1] https://lore.kernel.org/linux-gpio/20261011-gpio-mxc-cleanup-v6-0-cb4=
7ce2ad758@nxp.com/T/#m49d6a5a14a64774eda299bb711c8d316681e652b



--=20
With Best Regards,
Andy Shevchenko
