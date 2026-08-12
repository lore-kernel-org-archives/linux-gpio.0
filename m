Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC76A32D43C
	for <linux-gpio@vger.kernel.org>; Wed, 12 Aug 2026 08:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786522382; cv=none; b=WH/dyAfFa6uy5/UzNqQsLAT8FjrVLtMm4IN+5fR9UuIf7VJ2J/tvqu2pvAoq/tEEb3eqtE4g/q/e+g1+kdNgy0V4eBpEofeFMBK+ip8kfkWtyh07BlrYM2ncLKqoWPlfqav+Sy6qRfYXPYk9ypb9xY2c+w3Nsse+9d6wCQkEKH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786522382; c=relaxed/simple;
	bh=WQjLAl3V8AsAVD1St7MrfODPxHHfjmNzzazUkjVys8c=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNjt1+XeYKfuIefovHUaidVo5ZBmSvqb6CU6s4dpwJEiH+GVRGkdbZuNpcCAm9Be/5svdlNx+CHQAXiQ3a3in1pJSQ2PWW9qAsE3eTZR6nxxQCIJFpjdVn82Xq1srLEiZEImyb4+18XVJYrEeWz/0rl4sOYu88/wlivq4jthU50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UZj3TwIQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UZj3TwIQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754CB1F000E9
	for <linux-gpio@vger.kernel.org>; Wed, 12 Aug 2026 08:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786522381;
	bh=Xbd3Qyv4FuHwtV7Sx4ts/I09PBvgbDJ2lzZQ6IWI4LA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=UZj3TwIQ9ICx7Zy7ZaZVJewmbMfLCG4xdfvenmvC2R9WjoVLC0ptCtUSrvBkXKk2n
	 fE0fZrs3HrwY+SKuIyr3kyq0kKN3ptpfDHAEu0CE6VArWjg9txWc8N2JCUPo6A9QOj
	 iE0yjsDzHi98wNNLR7oLIN0TMaS+mR56kta0TfAkdhI+ZfgOP2tz4uweJNbMLgEado
	 WL+10Qy03mA9pEq0Dxa3PYG+U3Jvub+lRBvQE/jwUebRMpIL8Dyb1hTfQMooBoQC3k
	 b3H6Ab+zlx2qLyT7K3Vw2Q+RhN6yl+D2UjB3bY03/z8sDq3lmogHr2hMqlIBbExkH8
	 RVjQGdCYTE8mw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b01cb18515so551479e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 12 Aug 2026 01:13:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqyg3MUQywKe1YnokwqRAe2TSDRbOoX+Fw5+jl371g5Of/xSriKng23kpm0IyirKZW4WRn7taWs7yMH@vger.kernel.org
X-Gm-Message-State: AOJu0YzsnrxUOtrOCBbWouGhU3STWr78SAR4cy5I1jbU5nAr58l+vZ8p
	cqbb+qDy51lN+P68VE+otu3lAlE+RTNYEaU3QcLhPAUr+X1WdoK7POtTya0LltdNcA9Hj6AtYGw
	7lO5LLE7QfzfUQTT5bqEA+f5yMUVjwNXlV4KuvZcjaA==
X-Received: by 2002:a05:6512:3da7:b0:5b4:3ddd:8996 with SMTP id
 2adb3069b0e04-5b44e2ca05cmr510360e87.15.1786522380214; Wed, 12 Aug 2026
 01:13:00 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Aug 2026 03:12:58 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Aug 2026 03:12:58 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260811152552.396791-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811152552.396791-1-sakari.ailus@linux.intel.com>
Date: Wed, 12 Aug 2026 03:12:58 -0500
X-Gmail-Original-Message-ID: <CAMRc=Md6XQF3L=eyi_aHQJnnudrc_-+DdkXBervYSnDUiwqqug@mail.gmail.com>
X-Gm-Features: AUfX_mziFf2r5dBFfDg0C0LnpfUSCpjxD-CstmkHFssDYMbKvGU5TbEewwvGvIM
Message-ID: <CAMRc=Md6XQF3L=eyi_aHQJnnudrc_-+DdkXBervYSnDUiwqqug@mail.gmail.com>
Subject: Re: [RESEND PATCH 1/1] gpio: ljca: Remove Wentong's e-mail address
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lixu Zhang <lixu.zhang@intel.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Aug 2026 17:25:52 +0200, Sakari Ailus
<sakari.ailus@linux.intel.com> said:
> Wentong's e-mail address no longer works, remove it.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/gpio/gpio-ljca.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
> index f32d1d237795..4919f707d33e 100644
> --- a/drivers/gpio/gpio-ljca.c
> +++ b/drivers/gpio/gpio-ljca.c
> @@ -484,7 +484,7 @@ static struct auxiliary_driver ljca_gpio_driver = {
>  };
>  module_auxiliary_driver(ljca_gpio_driver);
>
> -MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
> +MODULE_AUTHOR("Wentong Wu");
>  MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
>  MODULE_AUTHOR("Lixu Zhang <lixu.zhang@intel.com>");
>  MODULE_DESCRIPTION("Intel La Jolla Cove Adapter USB-GPIO driver");
> --
> 2.47.3
>
>

We don't typically remove old email addresses from drivers. Wentong authored
the driver on intel's payroll so credit is due. We remove bouncing emails from
MAINTAINERS because that causes actual problems.

Bart
