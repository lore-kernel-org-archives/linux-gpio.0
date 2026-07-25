Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3232FD681
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 14:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784988669; cv=none; b=Nb/ybscshugjKi/xG1HJUTtkxod6AwHHi0SEY+8xx/ad19p8rbLWPVNod+NJOCTbmSjLx5c/H817VI6hbSgEjD/iSbQES/fI4adQMAbl71h2xlupxbgJjJqCn9reWR14akm6Y9jE/pBlawWFNmx27U2+/cB25wMynpWbi4EE1t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784988669; c=relaxed/simple;
	bh=dT6JaOuYptk+CVWtGNgb2Yj7hBnzgXKuZG08NDtC20g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WmHBZzfonojEsssCu368nOL09TMFgxtcNQXrvSbNDC0/6fqODYIwqDVRclUiS90wYxM7YT0Mmk5J+rePHap+ksiE6+MOT1fyMXZiTCxAP4HhyuYvWWcXsx9or5tPyAsULYqg1Pg6lKbLzZUskY+DNt2lVL38YfvODj2h7EEHI3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c6O6uMhs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c6O6uMhs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD201F00A3D
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 14:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784988668;
	bh=0CCsYyorxHgC+RgKPC5XzggNL5Xu/NkQVsORFchF8Gs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=c6O6uMhsQBDO2zcGmJzLqg+i1CiZmFHfucjX0a9Cz9T944nHG9S0DHFfbkTlwC6ck
	 JCU0yJjuwIiyuI84URC3gouML+bjPuCf4d3ZSBjzaVzuBIINrrNvmrWUtYqGxlao/F
	 Cmp/NsqYKOc5UTOi2qYanxfqSp1xEz+aRrXVkVFOdxDScWSWLUB5EK0isvRJ0tp8xq
	 FO5P9L8axMD2bGT3Fa4nZ/RNGEdAbzbH8H8hpw7n9yQa73G+qDVhYCQCWwcq22RaKQ
	 NvbNuigkQHDN4D0RUx6adhseiRT/2FBqcwaVtJrS0CU3n1R5eRUOui7IN68qusKTMQ
	 BOmzfXBvuRdxQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b14d1f9315so1142935e87.2
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 07:11:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp7WPCcfKkz56zKxD8YIlfbo14e/FVvoJPkGmkbuUmjfgBjGZBSP7CcwCguflq0wLPP2Fp9X0mC7iY5@vger.kernel.org
X-Gm-Message-State: AOJu0YyrIaP2BjTiiPvqxtGBVIJ+aMd6QWrf0yoibH6KJeCGqiIqqZkp
	xbVd0Sp0LeUOuD+IbuagASjFBYtvBVRmFMIJMTdfEuF7bxjRsuXYjYdQeJXRN9avsdwXWG2Q/9l
	uBM5YUIsGkunA+4qPvedvz/22rAkI3Y4=
X-Received: by 2002:a05:6512:3c9f:b0:5b2:a919:f9fb with SMTP id
 2adb3069b0e04-5b2c1b0d8c1mr428337e87.22.1784988667286; Sat, 25 Jul 2026
 07:11:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <amRpvtNAwIQak_9y@gamepc>
In-Reply-To: <amRpvtNAwIQak_9y@gamepc>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 16:10:54 +0200
X-Gmail-Original-Message-ID: <CAD++jLmXdmgWPenz=2VspSZHa4e7bWYJLyDrWDMjaEXHHKBy7Q@mail.gmail.com>
X-Gm-Features: AUfX_myUIPbPLQvr6Hohl55yJmyRkA-hRJvbf1wZFiGwIRqCOuihHcpFROPwjzU
Message-ID: <CAD++jLmXdmgWPenz=2VspSZHa4e7bWYJLyDrWDMjaEXHHKBy7Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: realtek-otto: add pinctrl support
To: Michael Zavertkin <misha.zavertkin@mail.ru>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25, 2026 at 9:46=E2=80=AFAM Michael Zavertkin
<misha.zavertkin@mail.ru> wrote:

> RTL9607C relies on pinctrl to mux SoC pins. Use pinctrl to request pins
> for GPIO
>
> Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>

That's neat!

> +       if (dev_flags & GPIO_PINCTRL) {
> +               gen_gc_flags |=3D GPIO_GENERIC_PINCTRL_BACKEND;
> +       }

Drop the ellipsis {}.

With that fix:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
