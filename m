Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D8A3A7F64
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 06:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331937; cv=none; b=nDtCLE7iAA+Y5ZRQgg+Npsst8O1P1StAFeUx+5Gc9p7NNMOE2TPtPGOmlLOadsHyGSWo5Ilb1W1guBJJCv77MQm2VeIsVZVatg/kCKvU1lou9M/xx2jcvE2gj81hC5/vHHtcO5l8vbiQVqNmvPBa8vXMJJgh7v/XfSfxJDoNbDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331937; c=relaxed/simple;
	bh=lW19me2kn54UPGQZfTKDH2CoL8h6BT9VeZVPGdecB4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n6jfeZNqowcFV9Wj7COT7rzFLULxjNBToPeKArLjD2kYOOk8IMTPgRni3UugTq3kMvy3WPue0Ew4AJk7mvX5QWTMpoxORc3h0l4gdU9qPIC2S87c5pQmWZivJ29RPUBpoyNF1eFMxJq+6Tlutmp6g1WLUhum5GR/OTxsmoIhZt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pla2Nt/Y; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pla2Nt/Y"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so7321825e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 23:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788331920; x=1788936720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lW19me2kn54UPGQZfTKDH2CoL8h6BT9VeZVPGdecB4g=;
        b=Pla2Nt/YQTGAtx4hKCTTd1K4WXpuMj8T0hnSNSC5SkRV/PvbKHUTi7mUIhFOm1Dhfz
         55CcwaCiPUzVtKZpcsqpNBWNTdN+N2CpCL9d4J1wJDBRs1PHjrF5JPa1bwJ2RvUED+iq
         MNKpE+twcbgEZ/Z4i6kLqwEI3lKSCNj/CCnfn9bYuckm6b9PbOq9z2Wob++lFKUFElqj
         spWV/IHnOxN22EE8D6vGWz6jUF4BkwHsvh/tb9WQORBC04nQjEpucWkBXiwiNalm7UY9
         wVNyjCsG3Qu2W3QjA9dxNSQYhx0+Jjq9BpeSyKA+jMUwU+2dJ+DasNqvV12kMcHfpA7C
         7dYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788331920; x=1788936720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lW19me2kn54UPGQZfTKDH2CoL8h6BT9VeZVPGdecB4g=;
        b=q6VU6Lxr/A0pGmylQgAbSkGEk1qUj3ul82HhDr+koPOFbY/AaOeTFdXe4HmQyOPWcC
         V2+rqpXip9rYUTuZvzwExNkKCznNjM/KzDCGS2ynPeQX2/B2LM5Mx5/KHZPRLnaAvB+f
         rc4WNQY/ISkpE7EXpdq6LOCLAzD2D3J+Chn1wHFAo0j2QYSxuLA387oH0yhiAPBBn453
         xz16Rv3chffXXmsHsvNeU12wgspA5P8Aqm07J2TRF86eO7lA0GQGfiHoz8j84XBJNRsI
         fUM7HHt+mmemJz2EB7Wll8QvGGq2rZ2AJDmXiGDxAIbgGEcweCyXlA48o6gRQSIfdXHG
         uRtw==
X-Forwarded-Encrypted: i=1; AHgh+Rqo11hjccfafyy+7DPwVxBx/fAMLb1IU0VhKQOSCBfxCIhdlEA/uW6ON0KtBZ7ID+vvseLBfBo5B5pO@vger.kernel.org
X-Gm-Message-State: AFuF++nv4bD2oX7hymap5/6+AHwrMob5uBv6uYMCv8I5Dvxwl9cG/G8N
	CoItY92oFubg2bVF0pbOmWhWlOw+yiWp+qT0ByVE1dG6SDP1G+Jzag8R
X-Gm-Gg: AR+sD12WJGXcJQQOUjx7cGVfEbC4BYLs2jFOkKlw9VPyVn0iCoUeBipYKbKJBam3lEB
	+MJs0Ll2Y7vZHAIJXwn3r8dSxUnIGqEOGuadl/f4ZhYD/pPrE5snwxRnNGi7FSnmvYu+ywFwn/y
	XIOA5crbI9rpNEDY4k7UwweDwvdCK6dgRgaGjWwLi3BSFOEd/qxHz73GxzpjJci9cf+iUrey7DQ
	fFlkofN5WZxt8EUi1eZV7zgqVAYo5V43WAG0BjwZbXpjY+lTNvUTxVJZceUV3f4jEsrphjtpEBJ
	oJrGiHC5bN95/M6YPRQKhQZ7QDJfyh64sy7ADybOEu2wOpx91a61JRAPIaAZcwUwdFXfsLW7Scf
	UI3KNeaIwDwaNWovvVm/5iN3Ezn37yeSI8NcN7TUwC08LtB/tstzEwMevbpmKpZ4QFPF2zEdgwm
	TuYwPLdtjQQq32zkVYGaif+xvNKQm9ts0NUyX6lAb+ijkzUu8O51VlzLx+kwkAN0rTzQ==
X-Received: by 2002:a05:600c:a0b:b0:49b:910c:7703 with SMTP id 5b1f17b1804b1-49ce5818612mr34637765e9.9.1788331920540;
        Tue, 01 Sep 2026 23:52:00 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdd73f7a4sm124677705e9.12.2026.09.01.23.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:51:59 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: sashiko-bot@kernel.org,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH 1/2] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Wed,  2 Sep 2026 08:51:57 +0200
Message-ID: <20260902065158.3617522-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902063739.A89F01F000E9@smtp.kernel.org>
References: <20260902063739.A89F01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> [Severity: Medium]
> Is it safe to extract a parameter from the incoming *config pointer?
>
> Looking at imx_pinconf_group_dbg_show() in the same file, config is passed
> to imx_pinconf_get() uninitialized:
[...]
> This appears to permanently trap all subsequent loop iterations into falsely
> triggering the generic decoding path instead of returning raw registers.

Correct, the group dump reuses an uninitialized config across the loop
and my decode turns that into a sticky misread. In v2 the debugfs dumps
will read the raw register through their own helper, so they never go
through pin_config_get() and never depend on *config coming in.

> [Severity: High]
> This is a pre-existing issue, but does this correctly handle generic queries
> on SoCs that lack the requested masks?

Also correct. Once the dumps no longer use pin_config_get(), nothing
needs the raw fallback there anymore, so v2 makes the callback answer
only the parameters the SoC declares and return -ENOTSUPP for anything
else, instead of handing raw register bits to a generic caller.

Thanks,
Mehmet
