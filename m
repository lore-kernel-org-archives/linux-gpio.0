Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198F5208D0
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 21:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783112505; cv=none; b=BYGBn+k86ynedcs/5opwmwyJYMtUf4GPMQpWDHIz5On4Bx8NYYntld5uZvmsVK794g3eDLzs7MO0xmiZD2AAzzAKQagEMfNDr6WU1BZcToMTPmkFL7B+FkWp1+ULFdPWEw7fgR0bEFBVTDWT4SLWHwsFaUWeV4uOiQv8JHuPKmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783112505; c=relaxed/simple;
	bh=/I3bg3qN3biQEkp5jFXGArEYFy+XeZAyLHu6EdMlm/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QEd4VUVNW5bp7kgO5CEtR3icYgRVmXBkj9Vn3/oF0tPHj6TVKz+Ew06GSVedPOiTVWflFqWyOpeCKXVJiwWvceSMMV3PwOqd2hA03snmkRjIvOgZKJQ66nMmMm0O5hk7p3idfBU+rC0tQmKBt0Cmf9nGGpZqxnhiv6m1ScAp0lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=czVTplx4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="czVTplx4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8E91F00A3A
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 21:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783112503;
	bh=/I3bg3qN3biQEkp5jFXGArEYFy+XeZAyLHu6EdMlm/k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=czVTplx4Syop3BJmF6fYxGwNw5MymIuoRPgfm6MJ5f6SAd3YEE4K9kaXGoU8iKcaf
	 yHZJ1mDhXpUeX2bXUDB+N8W3+hcm9W8TlmHkjvUucc0Y1iFR17+PhJCDXhdXQ9/Bqx
	 3thMDmvoEmjUIVOYDN+uwepZVEADYZ7TN1AfiVeE0WWpFi4C4lMCPD4NIjLQvq2fPW
	 n5uXmFtWwLXtoXrrQs1CURsShef1sJrWCkS6KK1/2fqik7RJNvXj+X9U9aNKdEpida
	 ZhxzaYinOEbm1HrjAr+wIQvVEjo6F1FouIPAYJHmmQ54iYytL4ho989ko41SSTLQ26
	 tTfvwQfx7l+FA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aeb8870485so1146950e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 14:01:43 -0700 (PDT)
X-Gm-Message-State: AOJu0YwB3wymsSndRUcahgL5GfK3/LIKjz/Wl9/i9SSxHNUksq5HtBBA
	JX+hvpmhYE/r5A35aKXxbTh2aLUwUAA3HnyI9V5LGLEGfqF6AhOQwA0D2zlM/im5rMh7qrfcsxI
	jMDaXEKPSXQb0DVdSfiMlH1xzPRVaGZk=
X-Received: by 2002:a05:6512:804e:b0:5ae:ba86:cc70 with SMTP id
 2adb3069b0e04-5aed50971a7mr74650e87.16.1783112502638; Fri, 03 Jul 2026
 14:01:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702231838.1175485-1-rosenp@gmail.com>
In-Reply-To: <20260702231838.1175485-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 3 Jul 2026 23:01:29 +0200
X-Gmail-Original-Message-ID: <CAD++jLkY8AiiKyKN8FbKFRGp4i1=k6LuxE3ifcoP_MV6Vf_39Q@mail.gmail.com>
X-Gm-Features: AVVi8CfCjkz2LldvF-g5BVzy5XYbTDbe_5YxXUohRBxS2JiGlZb3rVmVrNHuj6A
Message-ID: <CAD++jLkY8AiiKyKN8FbKFRGp4i1=k6LuxE3ifcoP_MV6Vf_39Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: fix devres LIFO ordering between GPIO chip
 and IRQ domain
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rosen,

nice patch!!

On Fri, Jul 3, 2026 at 1:18=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrote=
:

> During driver removal, devres cleans up in LIFO order. The IRQ domain
> was created and its devm cleanup action registered after
> devm_gpiochip_add_data(), so the domain was destroyed before the GPIO
> chip was deregistered. If gpiod_to_irq() is called on a pin during
> this window, mvebu_gpio_to_irq() passes the freed mvchip->domain to
> irq_create_mapping().
>
> Fix by moving the IRQ domain creation, devm cleanup action registration,
> generic chip allocation, and chip type setup before
> devm_gpiochip_add_data(). This ensures the GPIO chip is torn down
> first (preventing new IRQ mappings), then the IRQ domain is removed,
> and finally mvchip is freed.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Can someone from MVEBU test this on hardware?
From my PoV:

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
