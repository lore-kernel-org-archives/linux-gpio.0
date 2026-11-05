Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868753;
	b=mMP6i2/oQIwxOWSrb37ibpL16VeEQ+D3H//jVDftOWVjq5s6XW6YreE9UgiPKarr5uG6
	 T3p9ytYSGie5ITvaCfnPbYUUAWqpVyLoBEDFcyi0Ky9BLdd3fI6rXg87yMiF8crjuitpA
	 lqXaSuzK5DDqG8HWfP47AxfI8JkwzhWW1cFVnrED+FJilvoTnf+ydGs9XSYOIhKtsel33
	 cim9bzP5M5yi/UTQCPiOZdRRPopipPfvIdVUiyKxGmI/EnI3GOCkC7uqu/fAq5ezUUWr+
	 hk9s/0L7ypehPGSVvXMSgcrfHs8FHVoD6KLEkHwyW64HGvrY/+esb7vOGCTYBiusTpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868753;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wJg6LdQRbrPpwYVegnpjyk+7xCRX8N+225QfVMKTWjs=;
	b=hPfT7pptqbH3iD8hzRLzAUej+vJfiTIY5dkAZMPtsawp5YwRoNGg7Rgun4M3z2tuCEdf
	 zuZ2IJbidyhl6NUq6aunw/mMLuXpmsc9sVjNG5ef7xKBv/BhSUQauTEjHVlSZnIDuh5t2
	 QQ1ahD1vvEkU0iNYUkp+Y24EAD1oqQp5b+H8vg5u0SmUbjS5nnLuPH+x5/io6Icba3MJx
	 uWtnVyXq/7juy1tahWChWScrY/+jUI4yHmXYt0AEy05xWW6x2tDgwy50H1vTKUvKpHUpN
	 wUKvn+7Iz3ioE95a4y/4C47guoUT7xK2UB6N9CVc7XJKxLd9rtw+AX1RoEIcJrWUiFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=frIL0MlK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5438C606A31B
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=frIL0MlK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46C21F00919
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868752;
	bh=wJg6LdQRbrPpwYVegnpjyk+7xCRX8N+225QfVMKTWjs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=frIL0MlK4g8G8TGA4q5NqlddOgZo75MtOSEoRTUTiuc5dH7aZOwpbXHyQTa31Gh7e
	 qfPQdPx4nRkqfVyEUws9wEjkER4X2ZQp6w9iGqJW7qg5rL3gtZmfHNi7i3+4Am5zUB
	 XALlvdR1KfZ//scP52Kg7a/gcplFH1vQt8X9d/Wk18PE5AfbGnAK/pF45mjIDJ1sKt
	 vASTV2DgCeXN+iHnCE/3brZPf5w6OTBMszJ0ZpN9oTuHBNfdtTGJSam0WnoK5ct4YJ
	 T2VAyPVKkEe+Ls1LS6kTZ2pvxsbC49VUV2v7X52SpeP+S4/4Venra4inTdmy4dwy26
	 JWu/530A4B3jQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be4c78e8caso1307535e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 00:52:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzhnHpm5YZJsSON85M5B2GtkE+ZDc5JklSgyVUCD4nRgQVGsyUh4BnOKRCD97919SujH7+bewM7Gs4z@vger.kernel.org
X-Gm-Message-State: APuU4Z+UF4kWpa6Pi7kJGUJuwmg1RSWuKB51Ys3jqQCM7vnbBI7OeAFF
	/Y5beq1wWn0+swiQnSUQBB/t2RKPFuuM0RqGQRlYI5tNEKWpToZEkgH+TNr70EvW2xe+NS0Jrvn
	98Kx88UafEc/ydxRJUD/2ICrtS4xs6x0=
X-Received: by 2002:a05:6512:23a0:b0:5bf:e25f:d59c with SMTP id
 2adb3069b0e04-5bfe25fd6dbmr5526210e87.38.1793868751664; Thu, 05 Nov 2026
 00:52:31 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
 <2026102727-data-sequel-ce41@gregkh> <2c0b79c4.1d697.1a1a15126b6.Coremail.xuhx@hust.edu.cn>
In-Reply-To: <2c0b79c4.1d697.1a1a15126b6.Coremail.xuhx@hust.edu.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:52:17 +0100
X-Gmail-Original-Message-ID: <CAD++jLn7MuFe=y7+-y7fxi_WRxXzjM-48GysvuodsHYS-+t00w@mail.gmail.com>
X-Gm-Features: AclHuK_UJAJyOTCPbjPdMC3U5sf5F6cRFzpjTj_JvwiEUnBsDrOH_HYL5di2CoM
Message-ID: <CAD++jLn7MuFe=y7+-y7fxi_WRxXzjM-48GysvuodsHYS-+t00w@mail.gmail.com>
Subject: Re: gpio: gpiolib: final put of the gpio_device happens inside the
 SRCU read critical section on the setup-failure path -- deterministic
 use-after-free read at guard release (unfixed upstream)
To: =?UTF-8?B?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 1:10=E2=80=AFPM =E5=BE=90=E6=99=97=E7=BF=94 <xuhx@hu=
st.edu.cn> wrote:

> On gpiolib's setup-failure path, the guard that protects the
> gpio_device lookup (srcu_read_lock at gpiolib.c:1094) is also held
> while the device is being torn down: gpiochip_setup_devs()'s error
> path drops the last reference (gpiodev_release at :893-906, which
> calls cleanup_srcu_struct at :904 and kfree at :905) while the
> caller's guard is still inside the read critical section -- so the
> guard's own release (srcu_read_unlock) reads ssp->sda out of an
> already freed gpio_device.  In the hog path the refcount can be
> exactly 1 at that point, which is the common case, so this is not
> an exotic window: it is a sequential-ordering violation that fires
> whenever that error path is taken, no concurrency needed.  On a
> stock 7.3 KASAN kernel, replaying gpiolib's exact single-threaded
> statement sequence 1:1 (lock at the :1094 guard point -> the :904
> cleanup -> the :905 kfree -> the guard's unlock) hits
> WARNING: kernel/rcu/srcutree.c:696 at cleanup_srcu_struct (the
> self-held-reader defensive branch: sda and srcu_sup leaked, not
> freed), and the subsequent srcu_read_unlock produces
> BUG: KASAN: slab-use-after-free in __srcu_read_unlock+0x1a reading
> object+8 -- exactly the ssp->sda field of the freed container.  The
> setup-failure path also misses the list_del_rcu() that the success
> path performs, so the destroyed device can remain reachable through
> the global list.  As far as I can tell this is unfixed upstream.
>
> The detailed description:
> * The ordering (Linux 7.3, drivers/gpio/gpiolib.c)
>   The caller takes the lookup guard (srcu_read_lock, :1094), then
>   gpiochip_setup_devs() fails (e.g. cdev/hog registration errors),
>   and the error path drops the final reference;
>   gpiodev_release() runs cleanup_srcu_struct(&gdev->srcu) at :904
>   and kfree(gdev) at :905 -- while the caller is still inside the
>   SRCU read critical section it took at :1094.  When the caller's
>   guard destructs, srcu_read_unlock(&gdev->srcu, idx) touches the
>   freed object (reads ssp->sda at object offset +8).  The hog path
>   leaves refcount=3D=3D1 here as the common case (no other holders
>   yet), so the final put is genuinely final.
>   Secondary: the failure path lacks the list_del_rcu() the success
>   path performs, leaving the freed device linked.
>
> * Evidence (stock 7.3 KASAN; deterministic, single-threaded;
>   reproducer attached)
>   gpiodevsim.c replays gpiolib's own sequence with a kzalloc'd
>   container of the same layout: srcu_read_lock (the :1094 guard) ->
>   cleanup_srcu_struct (the :904 call; hits the srcutree.c:696
>   WARNING -- the library's own "reader still inside" defense
>   triggers, leaking sda/srcu_sup exactly as the source predicts) ->
>   kfree (the :905 call) -> srcu_read_unlock (the guard's
>   destructor):
>     WARNING: kernel/rcu/srcutree.c:696 at cleanup_srcu_struct
>       (leak branch: srcu.sda non-NULL, srcu.srcu_sup non-NULL)
>     BUG: KASAN: slab-use-after-free in __srcu_read_unlock+0x1a
>       Read of size 8, address =3D object+8 =3D=3D the ssp->sda field
>       alloc: insmod kzalloc;  free: the kfree step above
>   One run, no interleaving, no kprobe parking -- the violation is
>   in the ordering itself.

TL;DR, Dostoyevsky commit, make it terse and human-readable,
inline the patch do not send it as an attachment.

Yours,
Linus Walleij
