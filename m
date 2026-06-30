Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6B9407CD1
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 12:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782821466; cv=none; b=bMkUK33+lBYrDWqfgoXRjv263ydqhISfqY2XcPBkGufOfjfZs68lrlWXW8GZzEeWaGZNYdbVGS99MCn6q1MYv5q0Fwyi9tLE3qjsrY06Bo662kvEH8Oggcsq8tSsLwZ/73ddnOUOzhetGQ+BWhey2w0zxEPnEFPjld0hujOd/og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782821466; c=relaxed/simple;
	bh=Cxzl1cojQmrA6aDV9s/0/jQ79Qh45YcZIpov10tlQ0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WwY/Vvs+l3N3nhGxVN7o9uDgmC5ov6e1LgTpXEXW+kWe3qxkCBIRg0EJ9L0b492efSqOWfua54Rl+Ug+wOVTk1rPibuJ1OEr52Eek9iYWtFpkibYhe4FLAIFqBh0UCQ0u1UqPtAR+1JjfqozH+ElC4SreOxOhFOcSJxG5v7f6nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L5u7gC15; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L5u7gC15"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B25DF1F00AC4
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 12:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782821464;
	bh=LlKzPg19q9e2Gdbh8JVXe+cxB934h6FFCKt4x5J53+U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=L5u7gC15217FP42jNRkdZlGnyZX2bgEt4eFCQcJ99qR8yfCcWsESGjkGHTG8Mvp37
	 hGSw/oVRSXSEBjniG8GyeVutSuwycJOjXkV5O5rNY6ysM5uK9nsP+GZJqFRUCN7gEi
	 X0555pMw/kbVxRLJqbnWqvmcfSwThLdS/4LyUPTkrErdILChw7313PVmkXahrv/mHB
	 p901xREZMeE1Js4wnFumWyuXj6BuWRMb87RQJ39ESxJTkMydRfBUAHESKeeDlfyZvs
	 ob0gf7e7DnVrLQ9Ymuo10HdHoKfiH7MaSuXQ/DJOysoWKzCtLGtVHdSvRsrjulKwLZ
	 mqX+WzZqXqD1w==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeb89359a3so1962517e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 05:11:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqNOXQTyWfYqj1UL4Mp7njTEwWWxapX0oYTO2D5dtvYBDt+DBltFv0vztGdE8ILncaBfId3NpGp8vsT@vger.kernel.org
X-Gm-Message-State: AOJu0YznkJibfYV05cvkFVODydXfbXugcLuXnW5FVgdkU+U7wvfVkaVT
	ODhOBqCP4Sr+lwD5+9MM3UFV15RH7JRHD8dZXZhx7KPC9ukCEKypj91EJeR8SJWeG6OvlL4KPRv
	XmcOs/mVwQ28XE6nUd9aA6QsHvwpiUPs=
X-Received: by 2002:a05:6512:251:b0:5aa:6aba:76f8 with SMTP id
 2adb3069b0e04-5aebdbbd837mr608304e87.30.1782821463509; Tue, 30 Jun 2026
 05:11:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617220451.15298-1-daniel@dragonzap.com>
In-Reply-To: <20260617220451.15298-1-daniel@dragonzap.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 13:10:51 +0100
X-Gmail-Original-Message-ID: <CAD++jLm3gY=vMdbZ6Ep=9g8RhLu2=cgj64QYi4DZdfXK_wdPsw@mail.gmail.com>
X-Gm-Features: AVVi8CdvBjKnXgZXbX-XFU1uvMDAmDnQyRuTcGalVAa5xmjbxsVhewZ7HUZKW9g
Message-ID: <CAD++jLm3gY=vMdbZ6Ep=9g8RhLu2=cgj64QYi4DZdfXK_wdPsw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: bcm2835: Don't remove an unregistered GPIO chip
To: Daniel McCarthy <daniel@dragonzap.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 11:05=E2=80=AFPM Daniel McCarthy <daniel@dragonzap.=
com> wrote:

> If the devm_pinctrl_register() function fails,
> bcm2835_pinctrl_probe() calls gpiochip_remove()
> before gpiochip_add_data() has registered the GPIO chip.
>
> This means that upon failure the gpio_chip.gpiodev
>  is NULL resulting in a null pointer dereference
> inside the gpiochip_remove() function.
>
> Remove the unnecessary function call to gpiochip_remove().
> No GPIO cleanup is required because the GPIO chip
> has not yet been registered. Without this change there
> is potential for a kernel panic upon registration failure
>
> Fixes: 266423e60ea1 ("pinctrl: bcm2835: Change init order for gpio hogs")
> Signed-off-by: Daniel McCarthy <daniel@dragonzap.com>

Patch applied as nonurgent fix.

Yours,
Linus Walleij
