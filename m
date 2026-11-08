Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175678;
	b=3VjR5HEhrNTl/MYbjcukd5R5kjZunOVoxIWtG0jYFmuNTrxw2l7k6GJiAnRowXo7bgJQ
	 vwl41qQswBAgEYYgI6TU+iVpU1jOP/Djl5ebTIR1hGD/LAhTmvZcki/OM3mnnKVgIok/w
	 UnqMYPS+A5mCkYoWOFsib3C2CCvNFa/ScK82BhE32VQGt2QD735hP6sZ20NRuYzQk8Wbf
	 z373OEc6+m/FgBxHFuhj/QfdoDWghIno92jnpaK26eE68Xp2W3ibTvpGl2DF9syBiKK7U
	 +saJuWhVGO2vbYQnEMBhAM+Lh3YoQYdmZkDskbLm1VYcOFOzgjKIDqjjO6czES+A+fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175678;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=v0eejaiBFkeUZP6gkE2+qDOnCeE0Ygw6Yg4Ofv8gSs0=;
	b=jRyFVl3jxStU7GiD+YV/dSnMfKnHYh5GKBB3QVS/vujC6AcQ3cRyQEDOXfo/D1qC0lA/
	 Dqs03xbfm6Ztxz4P7BxqHoXz7ZuksbPnzwYKj0FbbUNWZic6kfESYdTqE5CTzzTRlzstc
	 R6ITfHnLqCp1cRaTBjzEhi0sc2DsOx2wSnKrE8EbHbiaWXctKcquGdr1RBCfcZzujfPR2
	 5OjFRaRIPT9z7X7KPCZsEf5yXa+WdbuP/1wm1JYyuvie7d7sgXB+1uS5jP3JCgDKgDuN2
	 mKC/AGZUN0dzHUzLwZSEOHIMZ1HSmy0GuhLT5QrcFaDSd+5rjks9znD7oUrvDm6J2JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01121606A331
	for <linux-gpio@vger.kernel.org>; Sun,  8 Nov 2026 22:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01121606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b5efadd183so113050b3a.1
        for <linux-gpio@vger.kernel.org>; Sun, 08 Nov 2026 14:07:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794175677; x=1794780477;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v0eejaiBFkeUZP6gkE2+qDOnCeE0Ygw6Yg4Ofv8gSs0=;
        b=EQ58DX1soNEmllMdRBsdL7VlbUO2WgPv4kAsYkW3gJH1MXZzc82sNM6PnJ0WdBFwz7
         uq2QDiLcSxrSwelImj0j4N2rg5HX17CLcm/oZfOylywFL/ooQrtI+kuGWpZheuJKYlOe
         ss9/rwV4iQaXqaXYLK1UK4Fgqaxyk0rSquziSKzbN90Z3LxyosSCO/CiSu9epkW7Dclv
         CYvZycZsHsMbkiM0zrAAMGF2Y7r0pyc+pMDgU/myT+wrYIHB0wZhpnki/qm+lFlOEZqm
         yIBDUXLL3omhCYduGTB+MmEsmp+iTXmocQgnDID2HrX6596EY01oLX2/Xx1x/Yjhfhx6
         XGOQ==
X-Forwarded-Encrypted: i=1; AL+hErEBVhCwo2hGzptpJMYQMQDq9smyo3VVMBkGOoujgNsaNRx7SNUt2LfSUBResA94axRLJY/Anczfa1Tk@vger.kernel.org
X-Gm-Message-State: APuU4Z+whDiLNodJTs1goc17tIn7E9j/JDqeha6iNsTz1uiqEFWXHB1N
	2T3HHqIeKSu88p5MtOVOWvqbsLp4GfMyqLLzI7s5LmfCIT2oaGTNcWqG1b0m3AU1
X-Gm-Gg: AYBFou22O3KevMOzMVyFyqDclO03Ps4DA8azjaiIIlSguH+FY0qU/v2Mgt2XdTSVUSS
	gfX8Ge0NzDUmYVBG5Gw4lEGi374y8CI3BQh+Sgz/+j0ZE2nEZoDlHb1/tp7j2YxBLJFzuqjrjR4
	a85x2l2DEf08NkHLMeJhi6281bV/rNlGHFwNJGoOl2iNhe41pp6MteO9FKitnSrDVGsIqH3I2Yd
	tkb5oKm71Q40F5YQXifzxJh57sNnGhyqdqbBCXtfWk4hU88tMiDmsqEyAOq6CBqHCTxUeaC7u1/
	4tfAE+hmctTT5QCpfnHPKQvkhmSy298n28SnQ+DInxAfFFWcByhP9pWPr8kO+NSkjvjBdGPGDXz
	UaEq7tJwXbUpTOSP6Ma+/82OOFAhs6T5LkdhgJoETI3QtJmJznvswtRuOxXS8DdFGHRK2wXg+an
	8MtvHn4p2iZdBg/UK9ZR76OEAbOdYlHM1J8iEN4FhLU9iv/jk+XQDU8jIIMaJiLSAmBNhAAxOJE
	8OkIjxsjTkJgOZWwVPM8IcXfvTnEKR3cWDdZh3kNnX9qxLcnl+YZvr5+KbPWZXp0gsqzaKlnLju
	ljYndggupfMP8/XPxTiZL2KvogXMvq3a6UdxJACM6+hV62zxluU1R9ZeDt28TNQUvNeqlYqJKSo
	qvMzvVVADw+xrrEIm7ifJ3A4V2NRHV/LINKzm+1CjNGA=
X-Received: by 2002:a05:6a21:7786:b0:3dd:a196:ffdb with SMTP id adf61e73a8af0-3eed3c5aaa4mr1517238637.43.1794175677343;
        Sun, 08 Nov 2026 14:07:57 -0800 (PST)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com. [74.125.82.174])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b64a2e7b94sm700233b3a.57.2026.11.08.14.07.55
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 14:07:56 -0800 (PST)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a315ed211so320726eec.0
        for <linux-gpio@vger.kernel.org>; Sun, 08 Nov 2026 14:07:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH3CQvF1L/bJUs726kDCpWBnRlpkTD44g0VfW1Bb+ITzjz0QIidwJA7nyN8GE/MlnZzTxq0lkCWYzn4@vger.kernel.org
X-Received: by 2002:a05:7301:1630:b0:36c:a1bc:6102 with SMTP id
 5a478bee46e88-37250ee43c8mr3901672eec.0.1794175675139; Sun, 08 Nov 2026
 14:07:55 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev>
 <20261104-sf19a2890-pinctrl-v1-2-4bb83afdbacf@telaak.dev> <au4HsW2aMYKyMspF@monoceros>
In-Reply-To: <au4HsW2aMYKyMspF@monoceros>
From: Joseph Telaak <joseph@telaak.dev>
Date: Sun, 8 Nov 2026 17:07:43 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4O=_44w52Ci94wjmbgZfFKp15U1o3t5rodC2C6YB7CnA@mail.gmail.com>
X-Gm-Features: AclHuK-O2KZKYumWb4i3a2AuPWKubDs7etlgwM1RvUJeTI6jva3RbnRyGORGlNc
Message-ID: <CAPY4CJ4O=_44w52Ci94wjmbgZfFKp15U1o3t5rodC2C6YB7CnA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: Add Siflower SF19A2890 pin controller driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Chuanhong Guo <gch981213@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
> good enough to provide of_device_id already. If you insist on full iwyu,
> please use <linux/device-id/of.h> instead.

v2 will include <linux/device-id/of.h> instead.

Thanks for the review.
