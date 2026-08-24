Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30E7442FBE
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 14:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787582973; cv=pass; b=i2fjyvihY3RlYg9mvWMWQdtw4mjRD9ZOJhKvGPRXxlRlVd+7xXLLFKhMx/ArIryXANx0IOm6Q2Mi4iULeO0lj0P/3go1fUZEqU0vwpSESBUmKGLp5/9zjJnTqgA1YJalOE8TFEQJSK4fNZRF/aRnLHAYdRoI9ecbUy7TtQ0hCyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787582973; c=relaxed/simple;
	bh=E3/d87vWO5ii4aa7K+gh9r4RoTEkv/x5JDy+wrx8oY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YqDDixaGCv+4lPvT5I9r5eodvZDjntctrzKivzcqK+RcqMCLeG0zqJKIS8mvJG1qLiccVouBCGzmYTrma6DRMh7m5rKXGLFsvEWdogF7YdrQyNWzY/nz4pXmygrUxl6bp6HbT1JG5Aa17bWGsCVj09Ad6wS0Hgut6Q1iDt7N3e8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LL5WlPwm; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LL5WlPwm"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-669944f60b3so4058742d50.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 07:49:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787582971; cv=none;
        d=google.com; s=arc-20260327;
        b=a6TdHObtmDKY4Bjl+hVB0AAYjkj4OCBf34beaZ6EDRz3moOp/pcNIcrYkPD9BfauBC
         eLhrPbF2GOBEaENIc3bkdQrX7yyGi/39BiK4JwiY4kQLikr299DPAnyi5Mg+XlKb8xQu
         aj5iUls2yXbsIqL0Vu8sFOKqxCWQJk7zECXXiYbfY7mtxUZ9/RL7O7zDSDdUC2CdcvDu
         YgcUk4vbgfZUma+AHYHqMU27UmLOPxWF+77SlVB8c84ZNMli3jZhXYcsGiSQpUCA9i8B
         MfnN0gAzKfFoHKn9o5We7O3mCCmlAt+UEvHrPh9d2zaxjqIzVq/4oHeWncRsCyVGgQ+B
         usSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aKbidJsTiJJCT2Cq/A/O/jOYnv+5GE0MpGeEpOG+gXM=;
        fh=B27zWe35vmfWeDkujD8zCIz0pgNdkFp+6MQ7vmC8et8=;
        b=BARMPUeo/nu9FhaKEYLJof+1W16feGqwl2l1J60evxyVUHWymHC1T0cPKpJRnraYJP
         6RLhE3QC6Exf10KZ2u0vmAo2vwnx63lZoH+ufF8RdS+M7Fep3toBdOn0FUdtvxSajKG0
         jplELPImM0dnXZ8UGNEEvCpXhdgplj6r4x8QK+JCRqwyV4Jfw24fofP9DQoQ5oWZn8tM
         zSsKqsWzOyk5Z7FnrExiQh0c0x2V4JaNlfXI+yWOWbV6ggs8aONqqlIfqVJOPVtkzWdV
         /oYyvqb+F1LSkci+Ftx30Y8BKBglVm6RQe8EcX7Yw7dGxMJNdUtPb4O2o5mEEUsAcfVq
         9Fqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787582971; x=1788187771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aKbidJsTiJJCT2Cq/A/O/jOYnv+5GE0MpGeEpOG+gXM=;
        b=LL5WlPwm+oTyVuxz+cqZ+iizN8J3rmzIs+darBw5Xa+7ECnqCebP55w3veNzpeQkgZ
         xmXGE4Vwp26G9LHyFsuLNFhjFk+aDytdhJ0Epf4quf7Xy+op7kbhatYwp5VqYyJOVgpn
         mmlXqkh/6nIEIlmSsg6QQadwxPodpBmgm6Dw0Nx9C6tsxCCONFxCfvv7pO0c/l01R6i+
         K3Xk+VPvqFGVw9r5+Qk7FDLL6Xm0U7/wP9ZZg7RICq7ATG7WkXMK4NQuba4fbTo3uLRB
         QfQ4s49MkcZ4eFbvXk7hw3EJRzyELx9TAmeaAP3lGbeLQCs1ug0yn8qmGr/msmOjQovt
         74og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787582971; x=1788187771;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aKbidJsTiJJCT2Cq/A/O/jOYnv+5GE0MpGeEpOG+gXM=;
        b=dUlYBXBH4lIKrjBaSvzwyomEx2Y6oqpsvsGh0+Nj4956aNeu5+6dc0VkC1gYmoOi6P
         WX+QDfa33j8MYy3c3R72gKFfCe2182Piwp33cF5tGp7TySwgPMEHYTYSuCvk8q1ExwvY
         N6YiDccM1II23e5k0OWVyoxlpkjudduXnu5JFN3nhE1mavuTm6P30JFyIavL0WCwW5fA
         wHrxWpHyX3XN/ceJa1FMmz7yBanp4BicbGVD54FQemv9UT4rsz1GkreoYCmIrJaC7GDG
         H7hPUTXKrz+iOBLJNSoGUyZlzKQtxD57NdWanYlGxCiezon7L6O7cVusBHbcbrDGruL/
         FxWg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6L+/eOIJG+3Ax8eiIu8pVViVXqoE1KrnGOuIWFEIbBQIzAmfxuUeQ8JY936QDyZ8I3n1hlFGhmjax@vger.kernel.org
X-Gm-Message-State: AFuF++nkfWrO4h5PkotFoUYLFNKF7i2B5eTruY+yODC6Dc8qLe62l3GG
	6kOkT+bcqAVMjFKzKBB68ebaAc5uclZV89w7/YqXVkkWXs7tvgw90jt5lUE9sdWPOC4uoJ09/i2
	DP94OnqTeAYjJdjjBoSc1IJhlmk7TFb0V8ArB
X-Gm-Gg: AR+sD10GccL2yjcc5PoWFI4bMHca65fdAy+/OTiBXR0qtMVNbXm4GeHUmD23fkaP8yY
	DThEMXHszDcw+JlKV8eFfmp5ZDosGXkwo44YlwmRolEKTmpi/qxM71P0bdZhNhb8hNMdSGrZe4x
	U+sX6S3bdYxgdIiiipmdj0Lvf/q1fTwJ3H+pbtH06a5LUFlzTJjwetK2Kkm1C08dozUPqLeqH9R
	TwQqYakYq8dl/nhfDtiBG17twS3IrhiWh/8Q29O+rvv8W9+vPls+gZ6tJYAjQMB9axN0sszZ+qc
	teLitHG4/Y8gVPBjTwlEtOBi+ciANojsv0U5w8vVbux/GNcHmDWuoTYD0zs5jbq72E9Ok4KP5e8
	5bspvfrQsQ9vHUS366igltA0=
X-Received: by 2002:a53:c54b:0:b0:662:89c8:4a62 with SMTP id
 956f58d0204a3-66ce49f2c82mr6745567d50.18.1787582970352; Mon, 24 Aug 2026
 07:49:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718185018.1857536-1-rdunlap@infradead.org>
In-Reply-To: <20260718185018.1857536-1-rdunlap@infradead.org>
From: jim.cromie@gmail.com
Date: Mon, 24 Aug 2026 08:49:04 -0600
X-Gm-Features: AcwNN1XiP_6ehHTvL7UnSyXZQH7kfG8rw5-_cLRwxg2f02b_qSjalFFu4aej9bY
Message-ID: <CAJfuBxxG0L5XOSom0Ncj_rcF9y0HgrLn62k+ikPJmwKJy8VkCQ@mail.gmail.com>
Subject: Re: [PATCH] chardev: GPIO common access methods: repair
 non-kernel-doc comment
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 12:50=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
> Change a "/**" non-kernel-doc comment to a plain C comment "/*"
> to avoid 21 warnings like these:
>
> Warning: ./include/linux/nsc_gpio.h:2 Cannot find identifier on line:
>    nsc_gpio.c
> Warning: ./include/linux/nsc_gpio.h:4 Cannot find identifier on line:
>    National Semiconductor GPIO common access methods.
> Warning: ./include/linux/nsc_gpio.h:6 Cannot find identifier on line:
>    struct nsc_gpio_ops abstracts the low-level access
>
> Fixes: fe3a168a2ce1 ("[PATCH] chardev: GPIO for SCx200 & PC-8736x: add gp=
io-ops vtable")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jim Cromie <jim.cromie@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-gpio@vger.kernel.org
>
>  include/linux/nsc_gpio.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20260717.orig/include/linux/nsc_gpio.h
> +++ linux-next-20260717/include/linux/nsc_gpio.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -/**
> +/*
>     nsc_gpio.c
>
>     National Semiconductor GPIO common access methods.


ACK
