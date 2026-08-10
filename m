Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83293B14C3
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 11:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361360; cv=none; b=k4icPIrFOa5ZSePYifCJOhPunLcikGQzMZQyMr9Y+mHlURWgwBfxCchbJbiQ2IGYbCjUGsj7uO8nc2HUsz1Q5M9mCUrAdI6eJBCveAb8+pTz1GlO52OLly+4KLmGfMZUUPhEJjt9od+tJxR1HKppuCl2d4ZdxTfSe/t3rb7Hrhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361360; c=relaxed/simple;
	bh=oOhWgBKFgUcwPoQuJLrT3DWJoab0dSEkHi9RoKP2VVU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=NhF5qG6+29+wwtBG8kh2zNI12JrBTHN04t/hYnGzreJmB4vkyCl3FlBZ1IT1cIpzRjpVS5F6pHTsRO5n9wrVsS+nbheGYaFoSVllFhXE5aqBM+vG//jrZjGozKrHZ266ybJsWZEYSruBswnSfyMKvuIaIL9uIghKBQOYZpZMN7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtHTRiqX; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtHTRiqX"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cecc8a3dbfso866355ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 04:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786361358; x=1786966158; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oOhWgBKFgUcwPoQuJLrT3DWJoab0dSEkHi9RoKP2VVU=;
        b=FtHTRiqXiKsdAbs8w4uiTD0PGdRiMoPrrfB2pUpNh83V228BI8ahI8mhPAqCnCwjzd
         vNFHIOub2scA8XWRc8OPOcAZO+ifnY4RAJ2AdGdl+KRSEOgiggPNztbfn/J0sUSxPfDB
         M9scWEvXPz0xFeis0QOIa2D7QHdPkc17k1IrYxK2cinCLxn9TDnpdoHL4QDS5umYpU2q
         GYZoUe3SRp2wbohzT+1Jn9LM/W+VMlLIph0pMosSZDE67i2baV4iKn4opVpwjD3QSwNu
         3952xgRJTjnr0fzk0sKa5uMHgwDHrKCg8T3zS2YUlzfYK+EshYANsoaHRjxEdTFzBkp4
         rB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786361358; x=1786966158;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOhWgBKFgUcwPoQuJLrT3DWJoab0dSEkHi9RoKP2VVU=;
        b=lfO5evua7l1L2GYkuK8fHLO5y5kawpnAtlC1FewrTk3Oo9YLoSHuQ95bTiSefwkTPW
         kXsCSESxVHzDAi9Ol7vVIk0biZDYKFaH9KQm97VVu+g9GvsLTvLp1MesKHhnBKpsH2We
         gE0AtNh462Qf77l+GDc6+9jZFTzv0y5eS5PlmhldcngEgj+zx58CexMRNVMjS2j7/z/h
         BetdYXqTRA6pwGTZnolsKNCG93nv9M2oGv6gZdUsoJw0oanUcbLbUSWJIvS+PzVKFhN2
         kF8zgP2Jl3I07+S7A3sXCuOeTIvisvGNMeALoBDIaK+DjpnZKRQ4EK5CWTcvMyuyF0zH
         p7KQ==
X-Forwarded-Encrypted: i=1; AHgh+RqT6Z7nWaa/2udoBZKP8AYf3LUD0xB6BM7vNkxSvt5stqltbZOfC78P8JQqKZox4kpMBv+YEkzbldye@vger.kernel.org
X-Gm-Message-State: AOJu0YwN9EB8UeQVsa9RiPNa1Y0d9OsZz5RJowcG3mYctXW5Xi0LHUWQ
	YRr4v9SHGJF+FsIXUQka4LHIpXS2/p1smh8rCzFqZeMx728LT42AE47P
X-Gm-Gg: AR+sD13CtGFhNrJfI0h5pyFybgqWykSWdKQVUuJJo4gF6SBDqcacSS23V8jhg4ihpUl
	Oa5WPCHVDAvYcXHN0lowzUqs58hhaphF+rdAEsMiwfWhBF2ki/DzvSfgNm1kxrvZfgLGNhCjVt3
	fVTC65CILaotHRFKcXud/7i1AHhzzx3Vl+zYixcdYmtR69RANzW1qfipOJOKmh2eE4RQaH69NSK
	04sQk61jDdEd0rfMwa4Ngh5h0l/4MrW1qyos8mXR5QVTy+FTBBUwKRA5bIQ8jFqUtrRoNQK9a89
	wYJNGT0yTxXybCVg1mnb4f8p1CTFB5wc0pvNIU/WavY52rGWnVU6BdvYOL24ntV4aNSmUI/nX5f
	7P9oNebkYVhmFnkxfao1HEsFT7t5eyKLiQRKdx0d0UqEm50PsfJpQkoZonWBTWp3h6atbn+tk8M
	jcram1cdv86/5Q/FWcsFnbqnngAx0uxQ19YogfK7A9wgmH7+g1NmNxLRu7wM3BJhKQXzVxycaHF
	sPB60LqjDU=
X-Received: by 2002:a17:903:2c0c:b0:2cc:d6de:d58e with SMTP id d9443c01a7336-2d0cab4cf8bmr329276335ad.4.1786361358011;
        Mon, 10 Aug 2026 04:29:18 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccd70ecsm34002835ad.20.2026.08.10.04.29.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Aug 2026 04:29:17 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC v6 7/7] mfd: ls2kbmc: Capture the reset event of BMC
 through GPIO
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <CAMRc=Me0DVNYfZJYesvpzTwkVzYZyVzNH+aOAM+DojfV_M9mww@mail.gmail.com>
Date: Mon, 10 Aug 2026 19:28:56 +0800
Cc: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>,
 Xi Ruoyao <xry111@xry111.site>,
 WANG Xuerui <kernel@xen0n.name>,
 Yinbo Zhu <zhuyinbo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 Binbin Zhou <zhoubinbin@loongson.cn>,
 Chong Qiao <qiaochong@loongson.cn>,
 Lee Jones <lee@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Corey Minyard <corey@minyard.net>,
 Linus Walleij <linusw@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <38DD546D-A2DE-40D7-B6A6-0708162EAA55@gmail.com>
References: <20260805-ls2kbmc-mod-v6-0-16ccde412d86@gmail.com>
 <20260805-ls2kbmc-mod-v6-7-16ccde412d86@gmail.com>
 <CAMRc=Me0DVNYfZJYesvpzTwkVzYZyVzNH+aOAM+DojfV_M9mww@mail.gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B48=E6=9C=8810=E6=97=A5 18:14=EF=BC=8CBartosz Golaszewski =
<brgl@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, 4 Aug 2026 21:14:25 +0200, Miao Wang via B4 Relay
> <devnull+shankerwangmiao.gmail.com@kernel.org> said:
>=20
>> + gpio_dev_get_fwnode(gdev), LS2K_BMC_RESET_GPIO, GPIO_ACTIVE_HIGH);
>=20
> TBH this could become a GPIOLIB function as gpio_device_get_fwnode().

I wonder if this function should be a static inline function defined
in gpio/driver.h or a normal function defined in gpiolib.c? I tend
to the former.

Cheers,

Miao Wang


