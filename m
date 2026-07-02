Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8AA409610
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jul 2026 08:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979259; cv=none; b=R3AXd+2HB9j17rPumEvHInRySIP9vBsmjqmMe2NYDz2VLpw5dKtOLX7NXNNGLFKzzMUL+Wl2jWJpvxchWxSMWaC8hcfKZWQvNz5IocoSGxQ2ju8ryjTA9LszhBL7W6aDmxu4I3dj2coBi1jt0eiFsxdFA0qrDi47fJl2+Wu4iS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979259; c=relaxed/simple;
	bh=v5zNFEg+D8ZtpeEyPbGGNU5KeLegUrcxuf7iPsC017Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uwx2y2RWMO0TxAKpq+BpyqfGBWpCTqtVe4m6i/Ayb6CLvFpNaweoHzYw4++BnCJz325DjZezwhGy2TO6W6rTxfPnEail2UdXylFJabygYEU3VH5bVrYzcEurkiB3nhohUM7cetiMCcyAp7k5hhAEXnEF9j7Jp1BTLfyji4EgWZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I0Hg0GC9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I0Hg0GC9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31CD61F00A3E
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jul 2026 08:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782979258;
	bh=v5zNFEg+D8ZtpeEyPbGGNU5KeLegUrcxuf7iPsC017Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=I0Hg0GC9mLILA1x81dAzDZnpnuxMIy1mIHlXC3C0nndWjNFgQy581ZRvefQUQpHba
	 /YSAq65D91CgmIIucDiLXaoSHutryAQJISrU7iQRPqga3khgSt8PFmoSnpqGJhPYVC
	 sBW/4NnKuKPD4iyHcpZ8YHfhQTwF43Nu93THXgvvmAi0s6znKFaL1++HEXwodlAr8E
	 E8mytCSUhSVNSHjiQY1HBe2fPkrY5fG77LdemDVR9L0jESg9Ecatw5b4yK7PZ4oW8R
	 /oOXduoKlk9ZaRI1L4zjNEwJDCqN/VNGfE9dcUeF32OZ93ju1M4ZwT0Tt/AfY3s/wp
	 LLoz9/wSmZMmw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aec201b582so1564328e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jul 2026 01:00:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp5hcqIMUynafxt84vL4uuRAbDxpDbXDX4uYMq0k+5/JGkRSLbOQDjEL+i5qQpQHj4JzFBTu3fY8f/G@vger.kernel.org
X-Gm-Message-State: AOJu0YyVy2HTNoKcUfsuXSOrcT+rl7VCIw8XP5H3eo9qEWfEFVCtNoQk
	ndhLhhUbxP+cQWUS3wgy9FRHU+z1MMfHJurBw9YsQ5zlKXZkPIe0st6V6KRsyUhbimnXoXp/2H7
	Uqv0eXe63ZDWFHSuvOD/qRED419J2jG8=
X-Received: by 2002:a05:6512:8386:b0:5ae:b886:3ddf with SMTP id
 2adb3069b0e04-5aec67a4216mr860841e87.14.1782979256991; Thu, 02 Jul 2026
 01:00:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com> <20260701-gpio-nomadik-silent-v1-5-644d10316cef@bootlin.com>
In-Reply-To: <20260701-gpio-nomadik-silent-v1-5-644d10316cef@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 2 Jul 2026 10:00:44 +0200
X-Gmail-Original-Message-ID: <CAD++jLmmHXBC9ni0pcVoB2HNK+osBzgirxH7vLHZaANmoe-tpQ@mail.gmail.com>
X-Gm-Features: AVVi8CeDzqdb95Trp9mVGCMUsgcjERwSWLH6yqQYBpwrUE23KOmffYp25QhDWhI
Message-ID: <CAD++jLmmHXBC9ni0pcVoB2HNK+osBzgirxH7vLHZaANmoe-tpQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] gpio: nomadik: drop "chip registered" log on probe success
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 6:57=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootli=
n.com> wrote:

> Successful driver probing should be silent. Drop unconditional
> dev_info() call that is done at nmk_gpio_probe() exit.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

I actually don't generally agree, but you are using this driver more than
me now so let's go with your minimalist dmesg style for this driver.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
