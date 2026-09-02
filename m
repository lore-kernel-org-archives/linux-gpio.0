Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5B03DA7D6
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 17:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369492; cv=none; b=jm9MHf/kj2O4fyHv4i0lLfX5vN6+eWh4hFlXTqyx4DvUJAdLegoCRs88aq+sOt0YmigJ1zkAUsZ4nHvwaELOqc/ZxP7QikjL9CBVpYbQHmAXknSC3lxZVnd3fHNEwuWW61OWeAgYSOa5Q96eOXs8K1N14S9rqTodKvEzVHb+o74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369492; c=relaxed/simple;
	bh=6Tn0OaGLRreTIGbEtttcTbq5pI0t6SsPxE+m00j3r9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hhJ8e4MRxzb++INdD/ZhCGw6c/GKZLC3cAphsWWhbTGfn0sLr3nJ8LpCPAwN5TRnFsxV06M8NUQlkecbm+fF/pqzTMHXE5HHpkG7M8V/u1qQV6tRQzzkG71WM10Vhksgv4Mo2TUJmKK40KT0JRwA7wffYXaSWxQO/Upf2g0tZaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQiC2YgF; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQiC2YgF"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so13793405e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 10:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788369489; x=1788974289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6u2dskLwsFp3RaJUgt1/pKQoZpVju/VbValCvllVzDM=;
        b=sQiC2YgFgEaWhWqjDJnEZw5JlPXTqPt3V2KVYB6+fXZ3J2DuDP2Fv1ryk5YfiSY2Mk
         P+u8zSeH+Yc46/fa8RriSUR5ROSKY0cpZW0XTNmNVuDxQu6MdcHsWov2jqFLoLBPm2cX
         HUx5xi5zkMGLPShVJfjUWDCMYIohFBcFuLPujWcxh3+GocjgL2ooOJJwcuz19gr6uDgs
         A91cllbVqj6Fvkx0vNOU2X7gYFtNE99F9zGxXz9cAmqIooFaEb1rNAfTeiG0OS01CgsK
         OzvCdiKJrXyQJmw0IoPFb1J+w0YNQQmbvu1iIwJ4jeWzdNWw4m2uaEG0//urxuBsh+cU
         1zQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788369489; x=1788974289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6u2dskLwsFp3RaJUgt1/pKQoZpVju/VbValCvllVzDM=;
        b=ki/xNbvZFbeRNz2zHjZpAA/iYboulWhLxlalgR6jycUQPHrSX3HePDfbG/f129mnuv
         59yff4t7YGSedt/pcn45oyG8R19bT3NfHJ9fO84fLMKPz2+as6QuIC58+R3QSbuyxr2R
         pAQNPmsAH45oTBO1Z7oG3mRY4oeVg2g7uWSRyycnrq/dY3nbg8/p486j6ctS7K8JRxTc
         FAqGbzbQFQZtj2xgM4xA3ZZONEc8aD1vwBNZSjHqCkLxulTUBmKGYKZbELWTAdg0Z+gS
         b5t7c2sJbwMelKRYimfIRSGtQNfstJWgcMeZYkqBGn0GVFtQTKNP4QQiwsZlOOMVKtMc
         QR3w==
X-Forwarded-Encrypted: i=1; AHgh+RoWtzJ4/a4+2t3BfNCRanTnEeqRj+Ztzw7NuRuiMStcpgSm/J/5yuxV7JL75GsGxvLJsioyS3R1WdWs@vger.kernel.org
X-Gm-Message-State: AFuF++mPcJxOekgz3qzat8Kk4R0emh4xIdGuoa5TISLFJ+ooLJG5jiGN
	DofqvkD9n9xqNsxC7bfbMCeAFblxgO9FrAcHMvMLRU54i5be9tEStD19
X-Gm-Gg: AR+sD10GtQ9acj/7Q92B46thqlJXM4zvZITGw3morEXliACIA8c2uE/g6jXY4+hlPPB
	PGTexx4lP0fzRRzxvOyh+1ucf2/aTP64gX/FZa/leNFD39C9Z9fSOvDA+XZwoJhrj7h7rkqDu12
	G5639aSRp/XtS4SwuOnbwOnfQERwySTf02pcZZg+jkOxU+8nKRIhbZXXZz63qeqy/5NcuAGWzba
	OnegAkdkUsykvdCOPD1+VNoocak6w3DGDQ/GX37dzU1Zo9Jr/SPamUkrQTa+FCUV43MtAjdrW1Q
	Ee/86bXFDHVrwX2HHoxPb6xTLywDQLGsWxYrjNe/+nS++ilPm1y63C2W8b22m7HCXwq6Gl8zQ6j
	HrWU3cfqJiWPO3UX+idZMrh78QOvB7lCXOnDftpaeLRhNFFnniKpQjw1wg4uWcGsS+Tr30qkbEp
	qowO6RJm0B97rbrCfbkjFn1ExysRGTyESWebwouwJo9aJiX3A+7AbmiKQLBbPpKhZfE156wrkFk
	Fz9
X-Received: by 2002:a05:600c:4f88:b0:499:d366:f572 with SMTP id 5b1f17b1804b1-49ce58388demr95277025e9.10.1788369488491;
        Wed, 02 Sep 2026 10:18:08 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80020sm8076593f8f.10.2026.09.02.10.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:18:07 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Wed,  2 Sep 2026 19:18:06 +0200
Message-ID: <20260902171806.4141524-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902155931.38FCC1F000E9@smtp.kernel.org>
References: <20260902154525.4090276-2-mehmet.fide@gmail.com> <20260902155931.38FCC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> [Severity: High]
> This isn't a bug introduced by this patch, but since you are adding bounds
> checking here, does imx_pinconf_set() also need this verification?
>
> Without validation, a malformed gpio-ranges property in the device tree could
> translate to an invalid pin_id. Since imx_pinconf_set() lacks the
> if (pin_id >= info->npins) check, this unvalidated pin_id could cause an
> out-of-bounds array access in imx_pinconf_set_mmio():
>
> 	const struct imx_pin_reg *pin_reg = &ipctl->pin_regs[pin_id];
>
> Could the same missing bounds check also cause out-of-bounds array accesses to
> ipctl->pin_regs in the GPIO direction callbacks like imx_pmx_gpio_set_direction()
> and vf610_pmx_gpio_set_direction()?

No. Everything that reaches the driver through a gpio range goes through
pinctrl_gpio_request() first, and pin_request() looks the pin up with
pin_desc_get(), which fails for a pin the controller does not have. A bad
gpio-ranges entry therefore fails the GPIO request, and the direction and
config callbacks never see that index.

Which also means the npins check I added in this version is redundant
and its commit message overstates the problem. I can drop it in a v4 or
keep it as a cheap guard, whichever Bartosz and Linus prefer.

> [Severity: High]
> This is another pre-existing issue, but does imx_pinctrl_parse_pin_mmio() also
> lack bounds checking for *pin_id during device tree parsing?
>
> The pin_id is derived algebraically from raw device tree properties:
>
> 	*pin_id = (mux_reg != -1) ? mux_reg / 4 : conf_reg / 4;
> 	pin_reg = &ipctl->pin_regs[*pin_id];
> 	pin->pin = *pin_id;
> 	pin_reg->mux_reg = mux_reg;
> 	pin_reg->conf_reg = conf_reg;
>
> If the parsed *pin_id exceeds info->npins, this uses the unverified index
> directly on the ipctl->pin_regs array, leading to an immediate out-of-bounds
> memory write.
>
> Does imx_pinctrl_parse_pin_scu() have a similar vulnerability when indexing the
> info->pins array with an unverified pin->pin?

Yes, that is the one real hole, and it is where the fsl,pins value is
turned into an index. As said on v2, I will send a separate bounds check
for the parsers after this series.

> [Severity: High]
> This is a pre-existing issue, but can concurrent driver probes cause
> hardware state corruption of the shared input_reg in imx_pmx_set_one_pin_mmio()?
>
> There is an unprotected read-modify-write on shared general-purpose IOMUXC
> registers:
>
> 	val = readl(ipctl->base + pin_mmio->input_reg);
> 	val &= ~mask;
> 	val |= select << shift;
> 	writel(val, ipctl->base + pin_mmio->input_reg);
>
> If two drivers concurrently request pinctrl states that share the same
> general-purpose register, and the pinctrl core calls pinmux_enable_setting()
> locklessly, will these RMW operations race and overwrite each other's
> configurations?

The core does call set_mux without a lock and the driver has none around
that read-modify-write, so in principle yes. This series does not touch
the mux path and I have not seen it on Vybrid, so I leave that one to
the i.MX maintainers.

Mehmet
