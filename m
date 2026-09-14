Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1477634A78F
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 08:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374615; cv=none; b=J33OAxkN6B0RJq5QxSRjQHckl5TYu0KdYWvjr1wH0pFWH0BI3ss8O5ykfR0dMbUZAD8rnNVcWX9PHSj59fqoTDY1RgCLPp7q3OqSbBQtv9xn5wfMkYMjjWXb1cErXp5XD4wEsuVOPmlSKAI6rTTtpzW8+Xg5fHZJ8f3OCmglOP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374615; c=relaxed/simple;
	bh=BtB7+CNVALHL1cBw/t7zuipwO3nSDX2SfGMp29Go2JQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gW30K7Ku0e2KV5eOE6oIGeGax2fdzOvQlWgfibfQZVUaStXAejDAO5ncqIv/wViGk7HmcvykM7+Dh+usb69sbyqur0P9F2eWwNyvVxLSVTYLJ4uZkaHZZVMOEUCpryUOMbv2pAQGOl3nvtPVbJGzkpeyRVPg8plO1g+z/GqLTW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xm1KGjGu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xm1KGjGu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9443A1F00898
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 08:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789374613;
	bh=BtB7+CNVALHL1cBw/t7zuipwO3nSDX2SfGMp29Go2JQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Xm1KGjGuvhzkkQFou5uy3P7IfpsXtKBGxJlQKkw2tRRzxaOopnmG5nhgl7U281ODU
	 Ay8I7V164UaAJUDJ2f10EcLvIgWE77cXAmaZymbjxSFQ1ZfPcRrSpBTFi4iCq9IWTA
	 lFpFJQzQXDtEsH+oePDx65QRgjzUReIim20BLPjMsp2ygo/Ngcnxkzwlnyk1oubD8W
	 ofwfIebUt2mfjcexofaItoM+0saOyVgyraJmwokRDFHiaNxFGIwE5rx8TKdplhdEG3
	 sKy9UTvFtzY+kV+m3vF0cbMYCwaHt9Wqgc3NgawfmLL30EaBlEHMAhTs7x7lj31FOY
	 ZG8mh9mnIOTqQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1e023so789592e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 01:30:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxxK/1POz1SOOuLhQ7rma2mcKbu+iaySyVVH739tMaryOpHvs6fO1wrbp/9dnT1K429UUS9IFvv/h5A@vger.kernel.org
X-Gm-Message-State: AFuF++k4tx/U58GAdWXC5RQYFiGEmy7cr3VrLdjajoOvMo+hr4uvEdfL
	YrUwuzOhCev/KmE3pgAR77YCBC9kGez+W1MS5TbDJnOPkCw7zW4jvvn06r0nDi5yARriQaw2qQT
	EFkQPnYE2Gcc3vM/ibtFDni3bf4tGmxM=
X-Received: by 2002:a05:6512:b90:b0:5b4:5854:77f2 with SMTP id
 2adb3069b0e04-5b8ae613d00mr362002e87.3.1789374612343; Mon, 14 Sep 2026
 01:30:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824074427.3226457-1-andriy.shevchenko@linux.intel.com> <20260824074427.3226457-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260824074427.3226457-4-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 10:30:00 +0200
X-Gmail-Original-Message-ID: <CAD++jLkykrzxwWzWxJWsDWf8MomXt89GsAFzWV9kT08oPQ_gWA@mail.gmail.com>
X-Gm-Features: AcwNN1VcmtqzjQdF-ZFjxAf-sA_kNQrMzRdHTrQ0dq75GLL5ft5m5c4JgWyJOJA
Message-ID: <CAD++jLkykrzxwWzWxJWsDWf8MomXt89GsAFzWV9kT08oPQ_gWA@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] pinctrl: ma35: Replace open coded fwnode_is_gpiochip()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

sorry for late review :(

On Mon, Aug 24, 2026 at 9:46=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Since GPIOLIB provides a helper, no need to open code it, hence
> replace that piece by fwnode_is_gpiochip().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

I guess this needs to go in with the rest of the patches?

Yours,
Linus Walleij
