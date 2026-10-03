Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FE234027B
	for <linux-gpio@vger.kernel.org>; Sat,  3 Oct 2026 17:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791048982; cv=pass; b=jA4lkkzaA3Mhp3VAcfYNMTj5eSAgZ+1s2e9vdhjm3SH9q8S+hTdgf/ZPKHtgB7WRj/yOZA4mHyihR60YW05VFl+wHvH/z/XNEU1EUb6V7xHZKrjyLHh+kyarPzV7nlnidU2RjOH+Mtbsi+qk8+Xv0nw+PB27U3L2mr/r23eeKeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791048982; c=relaxed/simple;
	bh=AVGS2+zsEMRd39ALRXdLR1/q0pZdvoIhDfXKsnzunTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XfmmDNmIlE4s80+WAcy6gTKCIRzftm4ruHAPnMYrq4F/g7SPIkZ5RlLd6IpkcX01BcABYHyXwY+8zITo012qtufwD4OEGtDjNuUprDrFaYuuU8V58ZHH14D2bWvVlfjxIRqiDUiZILlSEbiYherEa+n9ExyRTBAlpVOdffoSLu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHYYfC0I; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHYYfC0I"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2e36c3478aso94659666b.0
        for <linux-gpio@vger.kernel.org>; Sat, 03 Oct 2026 10:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791048977; cv=none;
        d=google.com; s=arc-20260327;
        b=hbHUhVSFTM2PWucj9Lb5/6DdS9rCSOIY8fmzn6MgIFtOGaQUxwC7XdPv0iy3URJoBv
         ZtcQqkKUBQZrsHCN49B02j7lyLYdJim4IVRoXWTZ5Xw5xee/TPHkqKs5ua+YrXM2Q/mC
         ZZZw6HfUOSTf0e1SMdk1OcjtD9Mrbtb/kP/bsh/EWw9aIxg1oIQbAPNWekACzzdbZKoE
         8+x6Ei2Hzc+9PD9NVQSm5JDCLSYvebpN2Bj1me1dTmb+YJLjGGyw7+uzc47hTxywvlH4
         K7xPc4WVeXH2US4zKeQsM6QcY0L0R2mS1j/44vrk5rAdF/9lx2fST84VcApEysR48VVk
         DMtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z+bCVSyhH79TQYhJfxbH7MyZvPdnkAvvoBzk8H6SCls=;
        fh=I/ev6FhQ9MuCVmD9PfXu1A4lkPzMuO+YHA84wdkDVho=;
        b=jf+VmeN6kdKo6cdkvYTekHBtH2GhTItwSi7PZCQvGMH3UbBpuk+uHM8Qy6hsYqe7vc
         x1ny9yH8dR6GXANYGfpH9W8clvyap5H+RPq0qqQbEdZAFaFhBmxkSSmWXQTM10qt51TU
         qW0f6rfVWFCfKS3gMLAelgY08gDp/Y+oDcD0z/0oCtstchom2Wj4GVXip7Mw8YIE5MT1
         IWvetc49zxF0i3nGUK7jD0nR13qh54Zs2fLg7Om3yxe2FHqfDGzNtAGi9pbkbfQD4frL
         qHGKSRTEoq3uugBYl3Qh8SoaLqUlYzjIr1gmCj3sE24TDlbHcoZCqYAczJ8ln7kJgoCt
         wReA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791048977; x=1791653777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z+bCVSyhH79TQYhJfxbH7MyZvPdnkAvvoBzk8H6SCls=;
        b=eHYYfC0IHx2Yg0EW/8SGOrvYFDQSoqAl2MMo02lXiZ3AxCnieqqLKFx0hBNnYpT+Cc
         +RIEfk4rMC92xtaQC2OZowH0rM41qjW0hYVutk2Bim5FHHVBO9qwiRroDWFUXmplNVKe
         EoNJV2TfTnchc7ko4/EoM0t68yJ4JFdR9bosGbS5PrJmoqjvcSPyEIHIWOC1Ei+7nQJs
         oWyly7TBte5BA/y4nNvx7c0K8gQtpNVW1c/vKG8tO31PyDlxZFltzd17kLIDGeqidt5h
         GrjdOCC12MYvvZfSq7LtKycXTiieQLodj4LA4daxzE0BhjKHTwsQeEa5JFL6JbC4p33f
         RFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791048977; x=1791653777;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+bCVSyhH79TQYhJfxbH7MyZvPdnkAvvoBzk8H6SCls=;
        b=sgRaQC8g7WXFm5cPceJ4p4/hI8Wpr9vbxC+q46Etb0tgIJrhqaKvo5IHI0UV3OTNc+
         x7MuOjyG5Upyppktbuhkw1zjTQYaFVn8tJ0NGruCJSeA/bx3EdXcmMsFb/hQYWbtcyU5
         0zaNzZ7e7Pe4Jr80gTYag1rDSZyejym69OELefH2y+DP6BeUEbeQJDB4ObAeX3i+uoka
         iT9t2b7RK3AaD6dWo+nrx7ywGJJTLs1Pgh/aiQNL8LPHWwcIJUg1ESxjR5AQ8UVPxzSF
         RvuNG0TrJEdlv8O1iDP7dZU3U1FcMUU6uvZpL/Ov2BWUhEbqRA3NoH/pmcO7LE0D+X6O
         eU+Q==
X-Forwarded-Encrypted: i=1; AKwUvByUX4qa4k7TkULF5LrYMh2/bqKe6tuvWFmXI0ZGb38O2E1b/xa4GkmobYkstEJBNzINkaUXIc2W5T+Z@vger.kernel.org
X-Gm-Message-State: AFuF++mokhBdkqu1YtDCSaTrN2WGZ290+WqLL1iJVz1+YMGlvRlnG/17
	ihnltIHiqXVnLy6Xvo1b/11zLeY0DtlQLLt2Qn/gFbHb3xMR793OxtGkwn/lbEHSxfVQqgjpkgM
	QhNJRfJYhaGd7gLRuA6zNfOPnJ4mZXNs=
X-Gm-Gg: AYBFou1qMP1edQ5trOVpdUa1yL7s5Mknw6g3qqWrg8m98RTQ94WHBCCNnfewbeJBrHM
	Z8tLSay/nSHpdq/NskiQ1ZxNH+LNeDbrjk2hNcG1pDBVbZM2iYA3MOR+JRB3bJFb9ZSN72ZIcUd
	NSF+16YHrbLcpR/S1vkxmvbHhhmhrz9VxKNrGU/zShjaQ38u0HobwVg9KyKK5zsn5q0yrRta6kK
	fIzo5yAIElxE8Rn5tDx9sD73s9Z5pMs/3aU3hB0L9jCvn1Ineywi2f4ZQoWrAoGW57kcGBeJvZC
	UoYNUh/lDD+xsoJVCHuUPZRoRQc++2kHOMQ6xTKZobRrFvNCcrMk7KHyUlM79aNemf/V0SCgEQ/
	GtFXuqaRKQc6Vz4DSTZezrR1s7Zyu087ZCTdEY37eGuHKQg4xJTMNfzd/w3+dSZXeofZe7Qw/0t
	DiwbDB1M89LDCc3MuaZluLXpN43yb4URa6rvqPLRjf
X-Received: by 2002:a17:907:7b8c:b0:c2d:fc0b:551a with SMTP id
 a640c23a62f3a-c2e6e7ce8femr227244866b.0.1791048976875; Sat, 03 Oct 2026
 10:36:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-1-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-1-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:35:40 +0300
X-Gm-Features: AclHuK9bpapDMgc469XMoVwaBwPajoR_JzR60Owqy_i8pAhthfGXkoi2ZLHq1Yw
Message-ID: <CAHp75VdWQZSsign6YBM34UAtis=Jj5ENqKcNzkhW4vS=v-bqmw@mail.gmail.com>
Subject: Re: [PATCH 1/9] gpio: mxc: fix race between chained IRQ handler
 install and probe completion
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 3:09=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> mxc_update_irq_chained_handler() is called before the IRQ domain, the
> generic IRQ chip, and the port list entry are set up. If an interrupt
> arrives in that window:
>
>  - mx3_gpio_irq_handler() calls generic_handle_domain_irq() with
>    port->domain still NULL.
>  - mx2_gpio_irq_handler() walks mxc_gpio_ports, but the port has not
>    been added to the list yet.
>
> Additionally, if any of the subsequent probe steps (gpio_generic_chip_ini=
t,
> devm_gpiochip_add_data, irq_domain_create_legacy, or mxc_gpio_init_gc)

We refer to the functions as func(), like you have done above, but here...
(No need to resend just for this.)

> fail, the error paths never unregister the chained handler, leaving a
> dangling handler that points at freed memory.
>
> Move the handler installation after all its dependencies are ready and
> after list_add_tail(), so the handler is never live while the data
> structures it touches are incomplete, and is never installed if probe
> fails.

--=20
With Best Regards,
Andy Shevchenko
