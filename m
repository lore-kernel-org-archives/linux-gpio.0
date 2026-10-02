Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CFF41DDFA
	for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2026 08:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790928591; cv=none; b=p5wUagCQ70IUSRr6cJRSw7s8vfb0HX1YvVFctcDY3tJu/Jq2rHd35ATMC0cEAQ9+rJlfIaUcCOk48lFUcXx3jCSFHb0cbkqh+ZRu29uqnIt4uXUhjzoVabjOeQ3tLUTU9a4bsAXegkHc4OGUbYzUaM2q/skTCxdJZWb7mf2jKfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790928591; c=relaxed/simple;
	bh=DGpTwbDIeBlS7xGbevsnPXJ7r9V5/qe6fW0JwCkuRoQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HMHTYlfp+g8YA7XkXntfk4cj6WxONNlZlyowPy673S0uzKk2oh3cEy1HUPBuatQ0wwILo2yYG+qp7UmnAmTgrS2ZK3WnBNn/x6tMpN9aYhnqkaS0kV1C5FMKtdJ5I3i8/BCi5zzTMpjpHheYiLKUokEkJhb4GxHcARbGg4rdCRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=nlQrpZci; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="nlQrpZci"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffed768deso21546975e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2026 01:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790928586; x=1791533386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyfq5Z39i3Aa9ox1entG/vitb9px1bSDrzF3bMpTbqM=;
        b=nlQrpZciIERMGLnEYKazKcxNj+AfzUsfyuG9eFIsindPMqlnlficfjm5HNNxocxGOY
         wAGucdObo5WGQCzAlz97WJbAHs2P+OPfYsF4y/aXpkdo9xW/H9fD5dNwC7m9mSMWTkce
         1B6BIhgCn628FpWP9dQFAlAjLDChlYAy/w6psUFv/DPquDGVbqZcS+4WaxlFIkLjfK03
         p18rV+K24eteG2OnZvEFFNL0mTGLg2BsffcfcL5HJd0MuD+ySCIRgbJvceZVBpfzW5gQ
         9xygZb/wmhajCIBDLvOn6JEQBSjgok/dHLWQAX7EAyC8HqXidy4o4FGTiKx6d58CoBZi
         +ZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790928586; x=1791533386;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cyfq5Z39i3Aa9ox1entG/vitb9px1bSDrzF3bMpTbqM=;
        b=Pvleh6i1sWqAePmoXuBrZBWH3V/amErlhOm9OhaRQRiOxgSw1a+Q4MdEjA6rZ3SS0A
         mRqxA30fXfAeiznyg0SfLxnkexV23zPnSGxdUp3FSm6Q8y/5uX1Yib7KepI8wJKA00T3
         0a9qXXugze/pinUdNW+fmkRyNwVWg00cTg/s3I9NbPll02fHJm/Y47tjdcgOHifHe/wa
         jHeYrZFJAOum2tWvjTuYUedVp/S2+9uokdNatW8IprnB+vpU8IVNgjv1J3dNhqKNKPSs
         B6agUltCofXXkLr5SOsOOWsgar/Sr8cS3ZnRU/rt7qEJx3tBJZ17heZLdMS0uhavYkSt
         J12A==
X-Forwarded-Encrypted: i=1; AKwUvBy9mZQZ20gDDanuumjOzmEc47i3nr/uL6UWLs7oeafPck9VstXyirNsfAwc/25fY8eNv34bfpuHqA0q@vger.kernel.org
X-Gm-Message-State: AFuF++nLnX+NfdMPWqA3BKIzjw57WmteUTnr5bXZ3EOng1y+eEt8oZi9
	Y91MbBJ9ljhKXnhp7TiAq7y2SCbysRTl9PDfHaxCKlctv5dEVRdv0xY/ET+C0CgrnRw=
X-Gm-Gg: AYBFou3+GkbkkX4eyFxL6S3qtvd8UdfIxBog3sIntt7e1M4noKSbKyWBZ9pzAukuzdx
	oeoCLWCLVflSooNJQUNd7h0DRQNLdLsFNrK5t8ZkH/NIVT03Om1rUZ7zJrlXQ/Ya3LT/cx6R+mk
	BOWey360wTjiRxeI1HE44l8rx6sI1ICt5A86GqrPCSd1zx/TJ87/2R8UnsFSRal7zQevJ8m9CCe
	jxjsmvPbIOATkXqgMT9AWdcjEdEc64xxAmBsxokx60zPW1MB6lIlOmbqj8WKNuvUjCws4F9raAR
	Yctt6vqDAeT0FZytY1hK3gOHDS6+1LYNKRL5IYry2hvvj8ygr7kr2+5YTh0PR2rv6rTop3+9btP
	lzOQNxqaVMBevELPnkee9Yuw+DGXMNDErE8xBaszvCEBwbAJy86IWL8o06iyxS2fiAg5bfwL9Kz
	PSL+YtkIHt2P878BC6D/NSeidtrQANndUasSnjguJSG5HAMQ/uWLk23OfRirjIrF9K4KWo2tndx
	yzNUlY00PkCrzbGixs=
X-Received: by 2002:a05:600c:1e24:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a0275507d7mr31998105e9.11.1790928586168;
        Fri, 02 Oct 2026 01:09:46 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0e1afbc44sm38823805e9.4.2026.10.02.01.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:09:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: zl020895 <zl020895@163.com>, Linus Walleij <linusw@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, longzhao@ambarella.com,
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Ilpo =?utf-8?Q?J=C3=A4rvi?=
 =?utf-8?Q?nen?=
 <ilpo.jarvinen@linux.intel.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Lee Jones
 <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v9 13/15] serial: 8250_dw: add Ambarella CV75 quirks
In-Reply-To: <4405a61f.505.1a0fa675e43.Coremail.zl020895@163.com>
References: <20261001-cv75-v5-v9-0-486cc289a4b8@ambarella.com>
 <20261001-cv75-v5-v9-13-486cc289a4b8@ambarella.com>
 <2026100140-overbite-mundane-fc79@gregkh>
 <CAD++jLnv1Q7ChHuLo=ad9edqhZL8MNaMab8huMAepK_LwqVzGQ@mail.gmail.com>
 <4405a61f.505.1a0fa675e43.Coremail.zl020895@163.com>
Date: Fri, 02 Oct 2026 10:09:44 +0200
Message-ID: <1j1pa834mv.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On ven. 02 oct. 2026 at 10:17, zl020895  <zl020895@163.com> wrote:

> Hi Greg, Linus,
>
> Thanks.
>
> This series follows the new-vendor, new-SoC process and is sent
> as one set, so the new Kconfig symbol and the drivers that use it
> land together.

What Greg and Linus say here is basically what I already suggested on
v6 [1]

Giving the whole context of a bring ups, mixing many trees, might be
nice at the RFC stage but then it makes a lot more difficult.

[1]: https://lore.kernel.org/all/1jld986j7m.fsf@starbuckisacylon.baylibre.c=
om/

>
> If it has to be split, the GPIO patches and the UART patches can
> go out as their own series. The SoC patches and the CV75 clock
> driver should stay in one series: the clock Kconfig depends on
> ARCH_AMBARELLA, which is added by the arm64 patch.
>
> Would that split be acceptable for you?
>

I don't get why clock is any different here. Just state your
dependencies in the cover letter. `b4` can help you there as well.

> Best regards,
> Long Zhao
>
> At 2026-10-02 03:20:51, "Linus Walleij" <linusw@kernel.org> wrote:
>>On Thu, Oct 1, 2026 at 2:52=E2=80=AFPM Greg Kroah-Hartman
>><gregkh@linuxfoundation.org> wrote:
>>> On Thu, Oct 01, 2026 at 08:41:02PM +0800, Long Zhao via B4 Relay wrote:
>>
>>> > From: Long Zhao <longzhao@ambarella.com>
>>> >
>>> > The Ambarella CV75 UART is Ambarella IP, not a Synopsys DesignWare
>>> > licensed block. At the register level it is close enough to DW APB UA=
RT
>>> > that a full custom UART driver is unnecessary: reuse 8250_dw with a
>>> > small platform quirk.
>>> >
>>> > Quirks:
>>> > - keep IER ETOI (bit 5) set for RX timeout behaviour
>>> > - skip set_rate; baud clock is managed outside the UART block
>>> >
>>> > Reviewed-by: Linus Walleij <linusw@kernel.org>
>>> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> > Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
>>> > Signed-off-by: Long Zhao <longzhao@ambarella.com>
>>> > ---
>>> >  drivers/tty/serial/8250/8250_dw.c | 32 +++++++++++++++++++++++++++++=
+++
>>> >  1 file changed, 32 insertions(+)
>>>
>>> When you submit lots of different subsystem patches all in one series,
>>> it's hard, if not impossible, for subsystem maintainers to take them :(
>>
>>In my experience people do this in cases like this it is because they
>>essentially dump out their "bring-up" tree, the thing they have
>>booting on the hardware so they know the pieces work together.
>>
>>Long: can you split it up in topic branches and work on e.g. the
>>serial driver on a separate branch?
>>
>>A better way to test the whole set of patces is to just create a
>>mixdown branch where you merge all the topic branched into
>>one "test" branch, then you boot and test this before sending
>>out each branch separately.
>>
>>Each topic branch can be versioned separately with b4.
>>
>>Yours,
>>Linus Walleij

--=20
Jerome
