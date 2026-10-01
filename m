Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D3448F84E
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 11:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855696; cv=none; b=ptFghjYPstlIezuwU8nzOoHzpwaZr/bNLD7zJ2aSmuPQ8MV85uVxzSrUweqv3SrLFRGxGZDzU2BtfidIQm0TGC+pIt1fC94dZhzV2K7L4lyNc+zKdDemfA90ZFk3Nf2TTf860EPdOqwbYz0Rf4uyaPunmmvWOH7dkVPzJZuhXz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855696; c=relaxed/simple;
	bh=L2YbbDdrkfdYTO9VzAQIghPl/rK8+xAMRVPGf2nYFyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XqU7zAGH40kG4F3H6V5CGoNq3T0qRE94W/gyNmpirBJbA9Y323/ve31h3bY2pyg2kNcyi4UCamC6SoLBDS9GXOimvMAtjeYH9GdDHyby9i8h9XVrnBKGIN4dcRZvpqmFf6UnVPS5pPwQ3z8oH400YqXHziA9KzI1hQqukWdXw5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mvVQ3sEX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mvVQ3sEX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575031F0089B
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 11:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790855688;
	bh=pjyzI5rwxIaoECQwhB7XgQl4m694DaznJskJ8ZjOlbo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mvVQ3sEXIJnK5HyTrjuhpQLrnaCp4quFWsZ0TSGvcZo4wgkfvtZlGyOPZ4kaHZ9yG
	 gb/GcOYUfQZwBNiu4M+uhpmW19P8URsq1KzlKJjcJeGrBzGN48Zg9l/iUlPDuQ0xy3
	 lXRQdzHU/0O2TAsX1enSvEhhQlNyhhARkT/X62q0o8+gQMlL1PoYyhMO2u3tP2hBCU
	 EX4o/hJKakY6izPu3Ixm3oIccnysZzLgSpz6Q0R3gKXfr2fFwoTzjUNnZoQ3S2IN+7
	 Zs4A+d+f/gPCgTU6EYCc7TzhPwAy/c6iNUTTs5nwv25Mid1Qx7Rx+nKLLFSCc3TtR8
	 Yx45SE8byalUw==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5baf6f2c3a3so476182e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 04:54:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxgNHRob/4c+lyeOIRNmjCV8K9VoZH7fLUzGk35jlxxlK9zFB/alC2uT+WVwpc4jG+fq6dzmy7CbH0C@vger.kernel.org
X-Gm-Message-State: AFq9FYKJNn74JHXSENdDbBRa7avEnt9lEHFAvISOERC8CdUH+fcIqN+X
	2op4s1vOQ2EkVo8Y1IPqNcDVy/Tnmwm5rBAmUre/wMS7Gt69sJWXc/yjCgZQXo9ipZ+igM4JrvN
	mNDE3QeXtAul0rtSSC20xRDdUvgLRpRY=
X-Received: by 2002:a2e:be06:0:b0:3a7:812b:d10 with SMTP id
 38308e7fff4ca-3a7812b1f0amr11677091fa.4.1790855687038; Thu, 01 Oct 2026
 04:54:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-loongsongpio-v1-0-71de7ebebb76@gmail.com>
 <20260926-loongsongpio-v1-3-71de7ebebb76@gmail.com> <CAD++jLmRWGXBo8UP6RKt+HHCTam0NxaN6F1DK4XAjoQpoNujjg@mail.gmail.com>
 <C6A08AB5-069E-4CC6-8CA0-DEF22F369208@gmail.com>
In-Reply-To: <C6A08AB5-069E-4CC6-8CA0-DEF22F369208@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 13:54:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLmvFi6siLH3Fug2ZsKLK0mfHW6jeC+KWFW-iOD4-Yabbw@mail.gmail.com>
X-Gm-Features: AclHuK_a0L8-Kt9wAWfDOLC2i4J_NqlRf0PIyb00_Bx9lLV_u9L4dHWCw9UtZVE
Message-ID: <CAD++jLmvFi6siLH3Fug2ZsKLK0mfHW6jeC+KWFW-iOD4-Yabbw@mail.gmail.com>
Subject: Re: [PATCH RFC 3/4] gpio: loongson-64bit: Add shared interrupt support
To: Miao Wang <shankerwangmiao@gmail.com>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 10:59=E2=80=AFAM Miao Wang <shankerwangmiao@gmail.co=
m> wrote:

> > Here again some crazy function header.
> >
> > I think some helpers need to be broken out so the code becomes more
> > readable, see what you can do with it to make it easier to follow.
>
> I did notice that the header of these functions are duplicated and are a =
bit long.
> However, multiple of the variables defined here will be used later. It is=
 not
> obtaining B from A, C from B, and D from C and only using D later, so tha=
t we can
> introduce a helper to obtain D from A. The problem here is that C and D w=
ill both
> be used later. What's your idea about the styling here?

Maybe struct loongson_gpio_shared_per_parent_irq_data is an uneccesary
long struct name? It obscures the view. On the other hand it is clear what
it is doing...

I usually use minimalist variable names to make thing less cloudy, it is
probably a personal preference. For example I would do:

> +static int loongson_gpio_shared_irq_set_type(struct irq_data *data, unsi=
gned int type)
> +       struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
> +       struct loongson_gpio_chip *lgpio =3D to_loongson_gpio_chip(chip);
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
> +       unsigned int parent_irq_index =3D lgpio->chip_data->irq_mapping(l=
gpio, hwirq);
> +       struct loongson_gpio_shared_per_parent_irq_data *ppid =3D
> +               &lgpio->shared_irq_data->per_parent_irq_data[parent_irq_i=
ndex];
> +       unsigned int intpol_offset =3D lgpio->chip_data->intpol_offset;
> +       struct irq_data *parent_irq_data =3D ppid->parent_irq_data;
> +       struct irq_chip *parent_irq_chip =3D parent_irq_data->chip;
> +       int ret =3D 0;

static int loongson_gpio_shared_irq_set_type(struct irq_data *d,
unsigned int type)
{
    struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
    struct loongson_gpio_chip *lg =3D to_loongson_gpio_chip(gc);
    irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
    unsigned int parent =3D lgpio->chip_data->irq_mapping(lg, hwirq);
    struct loongson_gpio_shared_per_parent_irq_data *ppid =3D
       &lgpio->shared_irq_data->per_parent_irq_data[parent];
    unsigned int off =3D lgpio->chip_data->intpol_offset;
    struct irq_data *pirqd =3D ppid->parent_irq_data;
    struct irq_chip *pic =3D parent_irq_data->chip;
    int ret =3D 0;

Then I would have already from the beginning (yeah...) used lightweight
struct and member names and it would all be less cluttered.

Admittedly this is a matter of taste. It's not like I would NACK it.

Yours,
Linus Walleij
