Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38343C555C
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927950; cv=none; b=FSDKY1DllrmLvhkwuqv/ep86zZ/qkQMdWdS+wWaj4F7E+BF6ITx91rb5IOPzYzCtowKmAAci20PKYQ98uVhTUyFB6RQjW0mgil/tHnlgwl5wMjeZXBpo2nBTxc0OWBOY/AQUs0aFxMPODHP27SQN0KJRqRe/r8JrWfIXwk2uFWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927950; c=relaxed/simple;
	bh=Lbob2K3Ts2e5sRZZi5UxoNhGx/cdA/AB0mJwiP8BuPQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LMQsDATIcfPA1+acDaVaVxzyOf3lwlJITXOUDQFD1ngQS9Meh2dhDlKdSAhEMl5a7NtgrUXY3/hZJlxgwzflnXze8ChZmCY8S3U85cFmiecmUUy7Etjf7dd9JylUU6GCunyxPWp45rlO0LAuwVGWWxONDWPGg38ew6rzK6L2dFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qte3Vem5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qte3Vem5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 601A91F0089E
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780927948;
	bh=Lbob2K3Ts2e5sRZZi5UxoNhGx/cdA/AB0mJwiP8BuPQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Qte3Vem5qHkCZ/OeU02dUkzYzKXO9Beo3dLTUn+ODVud7suQf+ESdEjtBE+hQrdDr
	 DGYf0WwesCyIPWorZPnPjtS2APp4PnYp+eDN+yXvnnchEZy5vtAmfkVrSQYckLd+Bt
	 +xOrzDSNSME82zsHlMPzsJ95gmdEhiYtb5YGUxYb+UHGun8QLjkhg/JwsG/DPjjKW4
	 BKAd6cDN37/SSuMSLdjHEEWzFpSs/CIXxS7QTfqZ/ZpAnam1nUB3oSv0FSWLafBq8y
	 s12wE7HFmwXkTJ90OiOYfUXqi5Tz5YvBj8rCKiyFzoRHAQgo0oGQexH86m6IciKpBx
	 /PL5r1KagXt8g==
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-137dd3af345so3927544c88.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 07:12:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9EvYvpdZDZldlbj8y2GDmdy7rDmb5BObfZud9YRdEdnprwI2ZvKHDIaglH3BgI8eIHYgk6+Q+wkz5e@vger.kernel.org
X-Gm-Message-State: AOJu0YxNW7p8qWWijDleyWDj0gbr4G7hkk+7smtKW6BI9K3uUYw3JMow
	fyo9A6/8i4Lhu2djDBOtaseotbaYzDtg8aQmGgei5F0joUQpX3+Y0ga63d7KQaxHzvQEL2ztmLJ
	9wf1HRh1jtCLpP7qp+t6A8yNSaYbjkxIG8vcXt6VaBg==
X-Received: by 2002:a05:7022:b99:b0:136:b67e:93e6 with SMTP id
 a92af1059eb24-13806740040mr7144172c88.37.1780927947846; Mon, 08 Jun 2026
 07:12:27 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:12:25 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:12:24 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260602080132.3256239-2-khristineandreea.barbulescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602080132.3256239-1-khristineandreea.barbulescu@oss.nxp.com> <20260602080132.3256239-2-khristineandreea.barbulescu@oss.nxp.com>
Date: Mon, 8 Jun 2026 07:12:24 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc-61ttjn7x7VsVMt1Ph5ROsNZg=1g+DFcnJJsS4dmucg@mail.gmail.com>
X-Gm-Features: AVVi8Cck9OW-nRKCCNdyIfJxZ-U3bKbEAtBgDAOB4cLKxe6r78d2Jkp1R58NAgs
Message-ID: <CAMRc=Mc-61ttjn7x7VsVMt1Ph5ROsNZg=1g+DFcnJJsS4dmucg@mail.gmail.com>
Subject: Re: [PATCH v10 1/6] pinctrl: s32cc: add/fix some comments
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2026 10:01:27 +0200, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> said:
> Add/fix some comments and print statements.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
