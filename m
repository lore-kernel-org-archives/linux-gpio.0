Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797173;
	b=JC7XZFT199BI3Hz7XqZhRIpbwZc3fil7Ao9w7zEhi673X1MPHGdh9zxn01fUEpNOdCbU
	 ccyGGp5RA/Wc7A5IVGvkuYXF0O0174WSS541wHN1VARJzyDxHCfyzrp2tWloXlGSOWRLG
	 43QzK5LfWG7KayB5EV8bgzlGfiHnhTEnhYC3desZb+F236hrjo54t5it/Mv+uFfXSib1P
	 fodip5DNcJHPh4aiNUoN6sivKuM9To24R5l66HzbwGDqip0+u3rRgPXgd5evcSckaiUWR
	 EqOs8jE1tUMVEPmffsiFpOQ9vMtDa5jC00qrzAUshqnKLFgGJa2SnLqSLlgPD22nR1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797173;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FXIxVU2ErnALAGekxCaTow6hX1frtF5kYcG5ZZqHi8U=;
	b=deCUVKyNGcjB7cJCdya6DltuVnCyil21Tw7IPVhHa1bt9SomydwhMGVDUDf139difyVk
	 GC7xs5JNUdyuyU1k8rhAknXny/S7YAOSn4oS7zYE3qp4KiJkihyXr1erRsXJyFpXp0g7b
	 ngaXBP+VWZEovA1Ui5hIfI9tlUW/aEGxv45lbFmPC5we/d3CHS6Fxhow1Hws+kn0QY9g1
	 oQnzaqAT7jeIl71fSbK5OYOvRoOy4iAKhOHlB2dFa9nyotudf20dMUYMbhDD+6Jp/cC0z
	 duwXeZSATWC+9aeLYhNfy6cDAfQa8VBtiy7TfbOj/MZ6cqXL9Vyqvh7x8ZcWGoF/Wxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aDFAnskj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634AA606A328
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 12:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aDFAnskj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 115A91F00A02
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 12:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793797173;
	bh=FXIxVU2ErnALAGekxCaTow6hX1frtF5kYcG5ZZqHi8U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aDFAnskjLaH9szPZ+eelP8i0JxzV/ADplIik6LrHEHu3VibxmCnue2v8685Le0+dK
	 cobUa9XuLqBS2tW+SnBCUvh8cQhdHgxXdtvxqY6d481KmL2ng4MFnFV/wR8o0C6o01
	 btC+5MRcc1xptAPJOMRCwpQXGVWkLgyO7aE/qFzQZmJnA/7uvOuTZ5cXFi4TtKRbdN
	 uQpNzORgEbX5APoBw/97Us7h3e9+6hbuS+tn9irYEqJKgjXIEhDnZGwPpRl8fw+BDJ
	 cMQ6mZyfqIT1yNPf27APP/9/R6NH1INYXZdj6jZY+QL5rJzmmIH1EVVn/QwwX7d8pI
	 Ffe0NU/NIRZ6Q==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bcb440d1cbso413954e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 04:59:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxjxtmQ0lIwoa3Ci6GMy7EEwIvsg/n59cWnvMlksXxB8lInCO5Vj54VX81JIvZGiR3Vsqr/B5tTQsWQ@vger.kernel.org
X-Gm-Message-State: APuU4Z+pf2cgDFzAc5x2c2aR5NRWGVDRq04iVkcMgbTsdYfF++yZSFU8
	oZrmPVVszUADX3PWHDrvRcpZTgm5rM+4ka7F7LDHQGHt0jPijLfeFQ97PbKefvJwViKi/100HKO
	zcsVHHccKLqXIm2xSwvCy1M9O1Msorhs=
X-Received: by 2002:a05:6512:104b:b0:5bf:e241:cd4e with SMTP id
 2adb3069b0e04-5bfe241ce90mr4030103e87.13.1793797171870; Wed, 04 Nov 2026
 04:59:31 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021015004.1537738-1-dmitry.torokhov@gmail.com>
In-Reply-To: <20261021015004.1537738-1-dmitry.torokhov@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 13:59:17 +0100
X-Gmail-Original-Message-ID: <CAD++jLkRkeftTeknrSVT9MGqA2Ep7rJ01eW+s2oFw2rj+h5HJg@mail.gmail.com>
X-Gm-Features: AclHuK9FrROF_lbQblFxEWPuulWTuq7jZ-GLjM6cpqXKsEAap45D_vvWiQC8Ya4
Message-ID: <CAD++jLkRkeftTeknrSVT9MGqA2Ep7rJ01eW+s2oFw2rj+h5HJg@mail.gmail.com>
Subject: Re: [PATCH 1/3] Input: soc_button_array - use resources to set up IRQ
 info for gpio-keys
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Andy Shevchenko <andy@kernel.org>, linux-input@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 3:50=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> In preparation for transitioning the driver to use static device
> properties instead of platform data to configure gpio-keys driver,
> switch to using IRQ resources attached to the gpio-keys platform device
> to communicate the IRQ selection.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
