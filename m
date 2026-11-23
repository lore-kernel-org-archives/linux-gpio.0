Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435980;
	b=0FdADWyI/6cYZTM2XM0MdO4FvMUce4Ax+yAihuLrANspsfiOl59I7ZcF7nm+mwsZ7Z/l
	 fWMHwxroBSw7OTjFYLmXQCaaKfprTXUwR8N1hIiiGK/zUkOldBGilfxGKAvACmEztmffG
	 LzZ6PXQ8urfo2a35DdZdVwOdq0t09f+lORzQv0so01cwCXv/TDu0lvDFKAphfvuhXcYeu
	 AyET3jp31YDaqovWApbHHfuiUdKxGVUkK6ioBx2EjsYCMPzBlyUAG0q6nxI0h8qopvEHP
	 6pfZrVepxDpGhx2jyQ+gfd+52fgbUHynMwbYyU9toA1NBakJvjEfZ5mxWn/mRniSqaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YXiKSe1b4sqmwhSslNYFvKYiTOVoSzJmWVzJ8m+MYNw=;
	b=l9/Qked+hhuvvk7cCX563joKMvlPvoMmu2A9AvVLDgUDseolD6xBpdFbMhXXtUyzT3AY
	 SmnDxGZ2FJulxd9rMv5s1tU2AcGNspFlbG/S2+3lLYFJVXJMtt99vHXRbZuPb2nazovww
	 BLwMcXV6n8I1XU++jyUw/PyF27U81K8T86RINuo04/tVVD/DXy6c4f5akx78zoEmarSL5
	 YSbx+6xT3bkjB+YTfvP5ckcMeLC94iwKJP2Y+qCUnrYJIa8xUhdKD2h9uLFLQhUEOnLNN
	 vcBObSMNQer54HMqsHvXHRf5FMDDGSGvxt/j4DZ3WcwWeaRp1rl/6Xxw6nvcLRoCNyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WTRBxD68;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DAF606A31E
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 12:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75DAF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WTRBxD68
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f04bea9a93so26603305ad.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 04:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795435975; x=1796040775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXiKSe1b4sqmwhSslNYFvKYiTOVoSzJmWVzJ8m+MYNw=;
        b=WTRBxD68mxmBMUDeAcOF2tKZEqSYLCNUPKR85w6u7MFXIi2cEY8cj7JgvwVfUVamf3
         P3Pzqoy8IB5bJg5Jvw1kPnvb0djMTIY/9w0jM5vY8oNuUqKdI3XLEYS4gpwgxNBfynhg
         s6mqbd87klkVJZHdWFt+1ocI8nSEQWDirNwAIo63O0wD6JTmO06YpbWx5miMMvVj0ZtG
         9O7l4vC0eza5ltf6pB7NAQUiisSQ/gpbfSqbv5jhENm7GSI2lP7+ZygOgxOdLIzN8evb
         GQAzNieO5N6KyvouZSRIDKMLvt//iHVrhPhfu2Szrgk4pGaHElaecKWP9dD0HMS40oKB
         Vd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795435975; x=1796040775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YXiKSe1b4sqmwhSslNYFvKYiTOVoSzJmWVzJ8m+MYNw=;
        b=BeWC84JR09IdSdqRD0xFKJRlVGfYxJdkbNfVCwjmyt+ABWBSULxWkoJElC7fQ0lCNG
         wfMzYpso60fVqVhXdItlu7uYi3V9OPy/qjP4JWlaosAxSI+LceLyW4pAkwnV06m+o2Em
         AYlajU9oE0Eh3cE1mkKejB9WI2csI+VA80E7MHFlrVkocMjUXuC5SdBnbsnRC0bBqmCZ
         SaQ10lN9CnJUmCKEfetI007jeDYYOnLnTBlxPHOgkUDpzEvui775AyYLAkdj7QXVkcc3
         vEnmSPQiHt3am2HtfcWEhYulhKRaS+JT9fxc8b5yDTpv8dmsUIE2En1dYRyN1mynjW2K
         oJig==
X-Forwarded-Encrypted: i=1; AL+hErFgOE0L21LFpb865IBZIFIBkU6KezKtVESqE8vK4XMSFnLiRWlPPXPiboCDJufkVejX9JmaSCzpmtaj@vger.kernel.org
X-Gm-Message-State: APuU4Z9wUxAFtMb2rQRR5rz8egsrJ1ClPOoobFniJwjP4StDKc6a1/Nz
	4aVffcyhZPbURJCQ0gYoeqV1hvu1+zH81DimmZNEnTnteVKBg0i5h4gByxTVN2dIEQ==
X-Gm-Gg: AZFdTZeWxmsllw4tGYyBEOT+eZf7jmyr7AgRvuxrU3ofPJ6OxfQSakebrOPmVQSX3l/
	PgWc8F/sb7dtH4wqlgdmYxLC6hr6kfdy8NGkdHn/u9oceOzsovoqwgvuvfJB50TFP3Pzpf7c6mC
	N525Etr8ATnFOOAIw/fWstM3Ise5bB2fq6Hc/UYfsfIEW4o8HID3TcPapUahPfpgtA2M5/e03R+
	R0SqhOwTaN9q7Bkse9JAXEj2M9+ekR28kOZyQ+nkGs126rYLBcszJhhVcai8IvhuBgY+Gu+2cyl
	d+9opnqCKkN+f48ULJc3OsagNg4hgYfn5ctCnJ7xDYN+jP1VCiFOpMiF9/hESFWFO9kk2m0knCJ
	vFHCiQ9uaR6Us5j4oX7ssheK1JbQhEcGXkTtfETB/bPc3XHConsqVPqGQ/VNH4eIBiMfD3+LyQN
	u/imnqsr2nwnHlFCmd7YO/eErdHkH4QSCKve+VW9hoND72xB99p6vxCCZKiB7JLRVLJ0rEFJCsZ
	MiORzHAHELTfDSl3X+Iq6vr/KF63JJ+wSrBqRAxjHUOv0tJYnCCSMsgbejbOwTFSPMMhL8a966E
	A/zApfws2eDuCyJbO73MB8PHmYShaB8ERxaeU/OCtBlNULc+09DKTrvfzKlAbNy+EdRWOwiUxze
	fiNJB69/bZ+SeZVDmvQ==
X-Received: by 2002:a17:903:1ce:b0:2ed:3ca1:848d with SMTP id d9443c01a7336-2f03f1ea636mr110975425ad.25.1795435974723;
        Mon, 23 Nov 2026 04:12:54 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f099a4d875sm12731675ad.37.2026.11.23.04.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:12:54 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v3 0/2] usb: core: fix failed device driver probes, add pre_probe
Date: Mon, 23 Nov 2026 19:12:49 +0700
Message-ID: <20261123121249.43867-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <329cd215-d824-44be-a1dd-3ebbf5c0803a@leemhuis.info>
References: <cover.1793669297.git.jjc@jclark.com> <329cd215-d824-44be-a1dd-3ebbf5c0803a@leemhuis.info>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 23, 2026 at 12:37:43PM +0100, Thorsten Leemhuis wrote:
> James, Alan, what happened to this? Looks like it feel through the
> cracks after Alan's "This is all starting to sound very complicated and
> fragile.  Isn't there any way to simplify it?" later in the thread,
> which was more than two weeks ago. Or was this regression fixed and I
> just missed it?

It's not fixed yet. After Alan's comment I dropped the pre_probe
approach. v4 instead had onboard_usb_dev call the generic driver's
operations itself, so that it can defer before the hub is configured
(Johan's first suggestion). Alan acked the USB core patch. v5 is the
current version, sent on 2026-11-07:

https://lore.kernel.org/all/cover.1794018128.git.jjc@jclark.com/

My understanding is that patch 2 is waiting for a review from Matthias,
as onboard_usb_dev maintainer.

> Side note: another regression bisected to the above mentioned culprit
> was reported recently:
>
> gpio: shared-proxy: open-drain regulators on ODROID-HC4 fail with -EPERM
> https://lore.kernel.org/all/20261115-hc4-gpio-shared-od-1@iav.lv/
>
> Doesn't look related from a quick look, but well, at the same time I
> wonder if there is some subtle connection.

I don't think they're related.

James
