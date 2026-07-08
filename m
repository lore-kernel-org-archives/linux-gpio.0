Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795A4407CC7
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 09:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783502518; cv=pass; b=Q8yPwGiMxBhKolf7QQ367IkX/BDBA0alt+grcYkgnVBF/eQ5aVr9OGjTwjAv0U9lHHjc190RuZSF3RBtxAROacl3czlg4UcojgESvFfa6HVozkZwKL6KMfRLB91bHIHrtDi6M3NhYE9uqfwxNczLbxpNAlGhvhmBAYVgOo3W2y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783502518; c=relaxed/simple;
	bh=FzuO37FheM7KIuzMW3zbeCtTiAbRuDEuW1Sis3sP09c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fs015y0q5fDUkLDKmaWYJVOgNnN/LtfCDSrnI+9ix4pg3jK82N1z0ORWm3sXW5VdFB073+Z9T+7Vr/Mb/uKAjHcAbRikdEIuZLAaWT2IWPVKIXMA+bW5i1SruHjRGhqYb46g4xQk4bTTNwxO0+Kop6loio5LPgl2LatqruNKyz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TznWPk+O; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TznWPk+O"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba3e6so864835a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 02:21:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783502516; cv=none;
        d=google.com; s=arc-20260327;
        b=UvONfEG33zYCzugYcAnnej30rc1jPW3n2R31mj0sYyX9SGKF0txVeD9pV302t3LH+x
         /KsxjB6AUr30KJLHHZeF70hgo5HiosNRAljwwAmW3ymDH67gZmH/ziStkVyQEXRCxAOy
         OyjFf665nb6YA8Xm+sz4A5pSaZ4dlI/ysaIp+XgtM/c2FTGiU105YBqFbZwQUpuvpeTQ
         K4Ou5DLaohbj/u3l5wO8iU30oYcUl8gofpeJOtw5UyCQEOmff+30GbaxuNqFEfWZDvwl
         BN1GPMP8RCUzRv0ll9vHj27kSKKy0hAMklZAls8Bi5bZtRnZm4f2dNySKXuJMTVJ1kQF
         CNKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FzuO37FheM7KIuzMW3zbeCtTiAbRuDEuW1Sis3sP09c=;
        fh=c92RV6FhANWzAnULoz66nI3guj05WV7xJnYXpYLi7vQ=;
        b=YDsixZAb3CjGVW033bxox8wARlxQbR6hMqO1G4hmV00rlv228heKkF8mlJsJotaGFP
         xt/KlKIpLi4cf+eCsKKUZ8vWsNGRX4DByPV3jHMad6yEsphyuK4ZHVI5hF801Pac8TgX
         TMd51CxX3XY3BtrLEgxKLdIxME70lwX7lksV+hmDxWltp00vFZcDwSXtkDQBOPOATL5m
         1LryuvkfC2EmAK7/Lc6Fm9GFzepBpDnvCUWBBoUX9a0+NFyNpAKT6xT/plaw2gpp+Ff4
         vmdG4hsC356eU071Sa6GcLdN+3xNyqgP4giQOEA2nS44PzV3k2hBaAL16WG8oC6LcTYz
         Ks4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783502516; x=1784107316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FzuO37FheM7KIuzMW3zbeCtTiAbRuDEuW1Sis3sP09c=;
        b=TznWPk+OnAN+qCtE52c5KQHBqf7ucFdnqnCOgEucHpoqy0oRR5UhekSd//JcLGU4KK
         wUoO6cs9Tlg8kfCE1RL73beDiHHF7cnDEdIKtrcUMtEIiowTPzK8hrP9M0LYEjywoonN
         k1bADrCDoIo5vPC3zNaiPOBgsXjwLPcyeOqxmBnEN/iP8hYyjd/e0gD1pWJXNB/Gg+r6
         ls5OAbLPuRhqb/JevqrjMcHPPln2Nu/uMOi/XoDJBqkb/z0UmmMqCzx03i0sWC6MNt6O
         w304KPyloXTebIDN3EvylQ6z0taxkzYoW9IysF4zRsm8+ch4TSZVJlds5GHzLfF3F70P
         dc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783502516; x=1784107316;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FzuO37FheM7KIuzMW3zbeCtTiAbRuDEuW1Sis3sP09c=;
        b=YXvleCgxqyVvAr6LKZO1zVmuNmbHr4XomK1FSdRaihlHGPC0gdl+76XAQBjyIjdRHI
         rhaSR8DVpviY+mzrcMJG7i0Jc5Ap0POTLnhkFeHJlVWazlo4qUj20D/nrI3oskVBzYyV
         DIbhHicE8kO1UKteqoC1IyDQudxPtyIu//lX9ey/dEwrMRrP9HVu/P3phHLibnqET4BJ
         Cz1DexQt+RsZZBMZ5fUaC9mDmgGAsMLlYdMJqUZOGurc+GHwPuvf87UZhm4vo6I4tG8N
         HxkutmDxcI1Uk9axCc4Pp6ofRjPMeXtqBJURTER5DjN+tGzUMqD8OlfNk9Px2ZnDXnFC
         hCIA==
X-Forwarded-Encrypted: i=1; AHgh+RowO8E+S/LOKyJa7z3Gm3UxBwn5cZbtuqihzfvU/qvo+2Zml66bTmlBC1LsZEbXp5MvuQLcbB3Ua7nE@vger.kernel.org
X-Gm-Message-State: AOJu0YxCvZM8yzFz3+kIPMIDfz6VPpfzEEmhSE41hDtRBqpFhKmAZXp1
	csgPrQh65sePp4g6kbG4fYYe/s1Cx8NIEP2BP8iD/BQWyYIvhQWemKTfPeiGWv6yD74HcfDjmER
	KVLEyBRvAgsCCh214r8a72Q8HulUhv98=
X-Gm-Gg: AfdE7ckVIJMpI4hGqqashAKev/1px4sEOJ9B10BKTkzaxGOVwaWkLL4AuXI2guzYVS9
	hHZqFy9AN/mSe9t9qQnyRZ7Tzfno+cH29D+ETWRIM3+Af17aDEWvptfniH9jyR8u8ZxsHjmKgh+
	vi+eyzPyQc2TiqPsZ/mqInyPD3PSVVk9htcJaksUlzqtE4/NFc/wUfvRBcNp8+7S7ko2zsBixYc
	d520+jgsmlHWd/coLZ5JPhOJ/Ymhg+XoklA4ws+XM36pvDhW1ByQUT1XYXKYwqAuT/y4iHhZcwz
	yWusA8kxOyk2/RcgMbuVezp3u3YwIoigVQSmbrd4F+JtjEQFCqsF2VTRDO6UJiWO4vA6zrz824u
	KCmTXod8L9qI9VWlJ6bMXp5QILcfGwSu5ZpB0pwe0riIOR/dzuh1KgOcBnQ==
X-Received: by 2002:a17:906:ee8c:b0:c15:ce72:9347 with SMTP id
 a640c23a62f3a-c15ce729415mr77168966b.19.1783502515610; Wed, 08 Jul 2026
 02:21:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-0-cedce0802d3d@gmail.com>
 <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-2-cedce0802d3d@gmail.com>
 <65fef790-0e8d-4c29-bbd6-ed6b9dc65fc3@bootlin.com> <CANYHO6qfRL-5rJevKrYySai5MoWjNm9xvVOkMVAmt8YN-cZPnQ@mail.gmail.com>
 <b2ee8bf9-de42-441a-97fb-2e42ad882b5e@bootlin.com>
In-Reply-To: <b2ee8bf9-de42-441a-97fb-2e42ad882b5e@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 8 Jul 2026 12:21:19 +0300
X-Gm-Features: AVVi8CfpYAZWqojc7S7uxSpjqYNXJkXD2HpFoMg5gwxpiPYmaua6mTEjaw0tCyI
Message-ID: <CAHp75VcGGC8Z5vGN+RQtSA2N+s9ViH-tHi_BjT-_SWPVVoLQxA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pinctrl: upboard: add device id INTC1055 based UP
 boards support
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: GaryWang <is0124@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Daniele Cleri <danielecleri@aaeon.eu>, JunYingLai <junyinglai@aaeon.com.tw>, 
	Louis Chen <louischen@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 10:49=E2=80=AFAM Thomas Richard
<thomas.richard@bootlin.com> wrote:
> On 7/7/26 5:55 PM, GaryWang wrote:
> > On Tue, Jul 7, 2026 at 7:50=E2=80=AFPM Thomas Richard
> > <thomas.richard@bootlin.com> wrote:
> >> On 7/6/26 12:36 PM, Gary Wang wrote:

...

> >> I tested the IOs:
> >> - pwm0 does not work.
> > you have to use our pwm kernel module for pwm test, I'll provide later.
>
> Ack

Can you, folks, elaborate why this is a requirement and what exactly
is not working?

> >> - uart1 partially works: TX is okay, but loopback doesn't work. Signal
> >> is bad when I add a loopback. Looks like pinctrl misconfig on SoC side=
.
> > uart1 tested ok on our side, if you loop TX/RX do not forget to turn of=
f
> > hardware flow control. and we have executed cmd as below to make sure
> > direction is set all right.
> > echo "uart1_grp uart1" >
> > /sys/kernel/debug/pinctrl/upboard-pinctrl/pinmux-select
>
> I did some tests with/without flow control using linux-serial-test tool.

I'm sorry it's not so clear to me, does it mean the serial interface
is (still) not properly working or you have done that pinmux
configuration and everything becomes fine (as Tested-by tag suggests)?

...

> >> - for SPI, MOSI and CLK are okay, but not CS.
> > Do you have enabled spi in BIOS HAT configuration?
> > CS0 should be ok, it's SOC defined, CS1 is optional, users can activate=
 low by
> > himself before read/write, actually all gpio can be manually used as CS=
 pin.
>
> I applied an ACPI overlay. I'll test it again.

I suppose this part is not as critical and I just wonder what the test
results are.

...

> Anyway these are not related to this patch series.
> Thanks for the clarification.
>
> Tested-by: Thomas Richard <thomas.richard@bootlin.com>

So, after all, are they all good to go?

--=20
With Best Regards,
Andy Shevchenko
