Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB3229405
	for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2026 08:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941301; cv=none; b=sIyIhUqfAxJM7NBOgKN0pMztZstvsPd//GolVFziEk9hs2hb0Xn1aLnZ2MXNvKpJJvdNYPGe8uur4T2+ERxVJDEbfM3Mil1NoiQa9w/PxbJsCFYwVho4HMX20VFDmnrgFvEMfiALWvFM9dg2XndUHbVRPy7o3plVn4UA0W88jSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941301; c=relaxed/simple;
	bh=sJk1P7W3r94sDQAmQK29QSXw1byQg92FvIaPYKTejbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F6WJ5oMjYzDMN6hcYLufAmiJyeZV2Gn/xmyX38bq3vueJU3Y+WLTlHmKwaz5KLsedeFMWGT/tz2oUGE0ZmO4rtUj7LCd9wVgIIcDQLS3lTVRh/RNhVF4AgLt6svwIXFZqFSlTgxJMPKG9sh/Y4rP1HPvdQRyK7rx3sC+qDiuWbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lljv5Bfg; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lljv5Bfg"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f96c5b722so3917408f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2026 01:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788941298; x=1789546098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJk1P7W3r94sDQAmQK29QSXw1byQg92FvIaPYKTejbo=;
        b=Lljv5BfghPEyAZdBHB7ojjxScB4j14WMegeylWwkxP7lkBcyZse9+AIxKLDVSn3/JH
         2W4G0KyZq2XtfZAyzv/Wl36qCZUiPIU+fXOwyqUPJlR9S3nHA8MhtDQlz2M9euS1WYHd
         xeZiESb+eNDcdLRSzah979Q3Ok6YAydd43ahoESBUqj79lB/L/IRlvT8d8XIIqimG5QX
         9uIRA+tOwa1YL1byuJGZmT5GPVGWkJzP8JQuaPljsHM5U44KGORKCav88fzRlRfE03h+
         WtwgarPJFGD2/SclFwjjgoxcgWocYH6Adw94CH9gUE9pmGfWNUZKIlKtjmZMzii4TMxV
         hBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788941298; x=1789546098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJk1P7W3r94sDQAmQK29QSXw1byQg92FvIaPYKTejbo=;
        b=pLB+aSWOfHyuiSe3sN79EtXxOq3kodB5OBRMKi+/ayaQe+ghEZq/Na91QrpKo04Pnd
         vc1tu+VJewlMll5VezrEzEZX+qV+NySklqOSB8HeHaaU0ABlL2QKJ7d/jpqgm9bLUu2D
         tMHsJzxW6UWcFhs4L2xFpnXULKaVPTdCF8/xXK0oNxZVyPdnStUqbPXCDOiRYgbjdqMs
         Oc8HD+90o6FiS1yALnaQFfRJy3fD1xokL6YooyOnYO/GIGHngYTvFp4bxPE9aJHyWBTC
         0ij7KwmQYPMxbOQsxsgFxFos4q+b+OTNdBRUjLXnJAxGvu41/1MljjOnxi4A57ddgfWm
         Rqxg==
X-Forwarded-Encrypted: i=1; AKwUvBxJz9WvrU3IJif6zr6mwyuBsxLAJq2XDpBCoBEurgWO5lG7BMIFSPLXCWtLntsFMtJvU4dNzpEZfK6Q@vger.kernel.org
X-Gm-Message-State: AFuF++n5T2Udn4Gx1jAsr0gaF93gzRMjJkYA/Mqkfw1bEWb7jk+cUn5u
	VvZu2BuMw77WgKm5QZl/th25QO+ZlAD/6aO+kYpGRfTI/j7IRFIcAwaX
X-Gm-Gg: AYBFou18sY0xAfETqlrZ70zFQbs13fh2+QhoXa8LQ/QlpW4fuXq+N8j86mTp+BOcv67
	EOhbo88Uf1HJY0zmfEcKf6r8vmA2VAYKsf50VhgUJJgRarUJuC69njQOpQkkL/qxIz9LAMLZP73
	BPOcqolbz1W7bjgTehRXcw7hVWT7lyoExEsPGD3ulRcGJFWHG9YySCp/+70rEZWegjB83L04aJh
	alVF3c0iDZjv/NY8zgTTLJnUMsYvoRrzZGnDFD2qIcmiLtHhE9D55LLbZ1+7z0XoVgN0KALGdtg
	q8IEIb8MqL+sHii4/gSGHAd4kE9Qq8eoutSxcJ2KDBx65SH+SDViafGqjgq7VW3BbX2hogMuoFj
	YtgOozApCCtnwfIQwDiIzh97c/bhhh0Jj++jfU0PzmmfoLS6MPKGaiY3HJHXowZAyr1JwLPQDaZ
	Sr31GF+RKtxE6u2aSF8ks9atHfj4d8OQkh1cTzytthMY4ni6dWXfW+vDW1JEX62YPBPzDJTzk5x
	fhz
X-Received: by 2002:a05:600c:3b1f:b0:49c:ee06:9c58 with SMTP id 5b1f17b1804b1-49cf821eff7mr338313485e9.4.1788941297583;
        Wed, 09 Sep 2026 01:08:17 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20db6e76sm46285355e9.3.2026.09.09.01.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:08:16 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: haibo.chen@nxp.com
Cc: brgl@kernel.org,
	linusw@kernel.org,
	aisheng.dong@nxp.com,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	ping.bai@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] gpiolib: add get_config() and gpiochip_generic_get_config()
Date: Wed,  9 Sep 2026 10:08:15 +0200
Message-ID: <20260909080815.2297127-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909063018.sajfn5vjk4y3oyi2@shlinux89>
References: <20260903075940.2089367-3-mehmet.fide@gmail.com> <20260903081432.278721F00A3A@smtp.kernel.org> <20260909063018.sajfn5vjk4y3oyi2@shlinux89>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Hi Haibo,

On Wed, Sep 09, 2026 at 02:30:18PM +0800, Bough Chen wrote:
> > Should the pre-existing setter stub also be updated to return -ENOTSUPP
> > to ensure consistent API behavior?
>
> I think Sashiko is correct, better to aligned here, but in a separate patch.

Agreed. v6 will start with a preparatory patch that makes both
CONFIG_PINCTRL=n stubs, pinctrl_gpio_get_config() and
pinctrl_gpio_set_config(), return -ENOTSUPP. With CONFIG_PINCTRL=y a
chip without pin ranges already gets -ENOTSUPP from
gpiochip_generic_config(), so every caller of that path handles the
value today; the only other users of the stubs, gpio-by-pinctrl and
gpio-aspeed, are pinctrl-backed drivers. I will compile-test a
CONFIG_PINCTRL=n GPIOLIB build with the change.

> If changing the CONFIG_PINCTRL=n stub in include/linux/pinctrl/consumer.h
> to return -ENOTSUPP, then I think you can drop the explicit "#else return
> -ENOTSUPP" in gpiochip_generic_get_config()

Yes, the #else goes away in v6.

Thanks for the review,
Mehmet
