Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182230;
	b=MiQfb+AdIepf7QvYVF7jj/Un8NMhoRuEHjB78Us5No8u5ZLV8Ppf8f0VxyHVjjJ1zG/q
	 Cpmjualohe+qzHoItwL3xdXw2QxFVrwz4NXuugXxAR/DV80Dw94OJ1CuVUXuXlguMIA/r
	 xVmLj2dMGccVJC1WFsWmUIqDyAMrrpMPStzed4+mQF2ggx+7lWlGSd40xZOg9wMzxXGAJ
	 wQBTga67VHBSuD59iudIusv3F4BO+7ifQ9ngv0IubVUT0J+LWJK0F5e56KURocatrF/a1
	 Evz7geIgONmSYyyLWcI00WEfDpiP72+YDP05jtPUJcGWvAEoIrcMTAzi0gpg1Jm+ztQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182230;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 Received:Received:From:In-Reply-To:MIME-Version:References:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=SATaLi+jbl+gRXlBtRbEWqdQ0SZBoS5obBjY/oSZJ+E=;
	b=Y4jpAUpOpHUBwTIqXEMchWd0r15E6D2KCUGgNazENUQIDfPE9kxj88YpjOyDEwBebsjU
	 WcVSBaPFAjk8b7Dy8XrUWBp/jKwZt+3rqVkfXeRSOFGhv6Qsh34Tfe06/eHWZy2mM+F4T
	 QNeqAfk8oApcE5xOFckbuHe/Mq0W8R+92NVZR+Ol67btmlLyDxWTvqPnrZ/MpLQI7yXVg
	 PEmHYkveRsaHHEM/3PGbhylZ64HS/V+xhbFiM5514HxyJ0JjdoLEW7m5nNowYPKWZtghs
	 onvoQtY7JK3GFaoAGShbHG8j1lido7h2RY3cl98aniXV72BxISDF5w+hzZ0YUy2ozAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dglPD7ea;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E869606A326
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dglPD7ea
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426991F031E4
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 10:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793182230;
	bh=SATaLi+jbl+gRXlBtRbEWqdQ0SZBoS5obBjY/oSZJ+E=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=dglPD7ea3piCIm5Xw7i5XaCRNNOpsnDK12XKWFiLvO9i41BemcGV695KpwloV8Kp2
	 tYw9GESxVpb+wmfPGJJ/l9rHo10I9MpOgJWqAsI59VUuXGJN8flzfHJxixv6tK5IOR
	 GvUjs61SqpiYAhZlaH4+LSytnPun0p2Ad78smEkBVqfjc1njRPwk/rajTtawDDBWx/
	 kbgMOA8qYJCt6gnca27iyGpNyxYG0pnjyw/aVGr4ucgfC33GNISFutgFej1YyUrQuB
	 cuz8jLUquedMfVJfcR/TFKP/4fCetCNr6R5Onh5NPDZ1KQ9EtY5M3+fJILG1lf+IMY
	 5QtAP3d+a4J1Q==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a595487d43so5824381fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 03:10:30 -0700 (PDT)
X-Gm-Message-State: AFq9FYIIOGliIYFu3Q0vRWBwj3hWZN2CXOqRWurxILs47749AikBAtQe
	iaNLFZ+MFdnVELGcVadbKkoXSTwMbBpm4de45Wgq109hlDfC81GzzuKW+oDFSUGlugdVoiHu5oW
	zVwGa8O/MKp6nYxdqFffr8nubCBoVdiQZaiT8ttVjKQ==
X-Received: by 2002:a05:651c:198e:b0:3a9:9a2e:27fd with SMTP id
 38308e7fff4ca-3ac9cd0eb33mr3727791fa.0.1793182228950; Wed, 28 Oct 2026
 03:10:28 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 05:10:26 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 05:10:26 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261026082041.696626-2-ukleinek@debian.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026082041.696626-2-ukleinek@debian.org>
Date: Wed, 28 Oct 2026 05:10:26 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mespj3wq7kVT8zQpwi8PttGNEF1dZOLb_BNxGi6R1D=Dw@mail.gmail.com>
X-Gm-Features: AclHuK8j2FHBYTzHMcH1FgIaHsMSbjpMdHTjTL7ELK0zb5mGKbIIB2G2YCUZf_4
Message-ID: <CAMRc=Mespj3wq7kVT8zQpwi8PttGNEF1dZOLb_BNxGi6R1D=Dw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: pca953x: Add support for Exar/MaxLinear's
 XRA1200 / XRA1200P
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@debian.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Oct 2026 09:20:40 +0100, "Uwe Kleine-K=C3=B6nig"
<ukleinek@debian.org> said:
> These are documented to be compatible with PCA9534 and PCA9554
> respectively. The difference between XRA1200 and XRA1200P is, that the
> latter has the configurable pull-ups enabled upon power-up.
>
> The chip was initially built by Exar which was bought by MaxLinear in
> 2017 and the parts were rebranded.
>
> Datasheet available at https://www.maxlinear.com/ds/xra1200.pdf.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <ukleinek@debian.org>
> ---
> Changes since (implicit) v1, available at
> https://lore.kernel.org/linux-gpio/20261025154840.657888-2-ukleinek@debia=
n.org:
>
>  - add PCA_INT to i2c_device_id array
>  - use 'exar' as vendor in the of_device_id array as they created the
>    part initially.
>
>  drivers/gpio/gpio-pca953x.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index afec5ec23696..721f17cee89d 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -124,6 +124,8 @@ static const struct i2c_device_id pca953x_id[] =3D {
>  	{ .name =3D "tca9538", .driver_data =3D 8  | PCA953X_TYPE | PCA_INT },
>  	{ .name =3D "tca9539", .driver_data =3D 16 | PCA953X_TYPE | PCA_INT },
>  	{ .name =3D "tca9554", .driver_data =3D 8  | PCA953X_TYPE | PCA_INT },
> +	{ .name =3D "xra1200", .driver_data =3D 8  | PCA953X_TYPE | PCA_INT },
> +	{ .name =3D "xra1200p", .driver_data =3D 8 | PCA953X_TYPE | PCA_INT },
>  	{ .name =3D "xra1202", .driver_data =3D 8  | PCA953X_TYPE },
>
>  	{ .name =3D "tcal6408", .driver_data =3D 8  | PCA953X_TYPE | PCA_LATCH_=
INT },
> @@ -1508,7 +1510,9 @@ static const struct of_device_id pca953x_dt_ids[] =
=3D {
>  	{ .compatible =3D "onnn,pca9654", .data =3D OF_953X( 8, PCA_INT), },
>  	{ .compatible =3D "onnn,pca9655", .data =3D OF_953X(16, PCA_INT), },
>
> -	{ .compatible =3D "exar,xra1202", .data =3D OF_953X( 8, 0), },
> +	{ .compatible =3D "exar,xra1200",  .data =3D OF_953X( 8, PCA_INT), },
> +	{ .compatible =3D "exar,xra1200p", .data =3D OF_953X( 8, PCA_INT), },

These two need a dt binding change as well.

Bart

> +	{ .compatible =3D "exar,xra1202",  .data =3D OF_953X( 8, 0), },
>  	{ }
>  };
>
>
> base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
> --
> 2.47.3
>
>
